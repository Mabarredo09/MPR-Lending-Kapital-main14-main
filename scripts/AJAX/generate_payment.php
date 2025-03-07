<?php
// filepath: /c:/xampp/htdocs/MPR-Lending-Kapital-main14-main/scripts/AJAX/generate_payment.php
require_once 'db_connect.php';

// Function to calculate monthly payment (fixed payment formula)
function calculateMonthlyPayment($loanAmount, $interestRate, $termMonths)
{
    $monthlyInterestRate = $interestRate / 100 / 12;
    return $loanAmount * ($monthlyInterestRate / (1 - pow(1 + $monthlyInterestRate, -$termMonths)));
}

try {
    $conn->begin_transaction();

    // Select active loans
    $stmt = $conn->prepare("SELECT id, loan_amount, borrower_id, interest_rate, term_months, loan_date FROM loan WHERE loan_amount > 0");
    $stmt->execute();
    $result = $stmt->get_result();

    while ($loan = $result->fetch_assoc()) {
        $loanId = $loan['id'];
        $loanAmount = $loan['loan_amount'];
        $interestRate = $loan['interest_rate'];
        $termMonths = $loan['term_months'];
        $borrowerId = $loan['borrower_id'];
        $loanDate = $loan['loan_date'];

        // Get the latest payment date for this loan
        $stmtLastPayment = $conn->prepare("SELECT payment_date FROM payment WHERE borrower_id = ? ORDER BY payment_date DESC LIMIT 1");
        $stmtLastPayment->bind_param("i", $borrowerId);
        $stmtLastPayment->execute();
        $lastPaymentResult = $stmtLastPayment->get_result();

        if ($lastPaymentResult->num_rows > 0) {
            // If there's a previous payment, calculate next date from the last payment date
            $lastPayment = $lastPaymentResult->fetch_assoc();
            $nextPaymentDate = date('Y-m-d', strtotime('+1 month', strtotime($lastPayment['payment_date'])));
        } else {
            // If no previous payment, calculate from loan date
            $nextPaymentDate = date('Y-m-d', strtotime('+1 month', strtotime($loanDate)));
        }
        $stmtLastPayment->close();

        // Check if a payment is already generated and pending for the next payment date
        $stmtCheckPayment = $conn->prepare("SELECT id, payment_date FROM payment WHERE borrower_id = ? AND payment_date = ? AND status = 'pending'");
        $stmtCheckPayment->bind_param("is", $borrowerId, $nextPaymentDate);
        $stmtCheckPayment->execute();
        $resultCheckPayment = $stmtCheckPayment->get_result();

        if ($resultCheckPayment->num_rows > 0) {
            // Payment is already pending, skip to the next loan
            continue;
        } else {
            // Check if the payment is overdue
            if (strtotime($nextPaymentDate) < strtotime(date("Y-m-d"))) {
                // Payment is overdue, set the interest rate to 10%
                $interestRate = 10;

                $stmtUpdateInterestRate = $conn->prepare("UPDATE loan SET interest_rate = ? WHERE id = ?");
                $stmtUpdateInterestRate->bind_param("ii", $interestRate, $loanId);
                $stmtUpdateInterestRate->execute();
                $stmtUpdateInterestRate->close();
            }

            // Calculate monthly payment
            $monthlyPayment = calculateMonthlyPayment($loanAmount, $interestRate, $termMonths);

            // Generate reference number
            $referenceNo = "PMT-" . strtoupper(substr(uniqid(), -6));

            // Calculate principal and interest amounts (using the amortization function)
            $amortization = calculateAmortization($loanAmount, $interestRate, $termMonths, $nextPaymentDate);
            $principalAmount = $amortization[0]['principal_amount']; // Get principal from first month
            $interestAmount = $amortization[0]['interest_amount'];   // Get interest from first month

            // Insert payment record
            $stmt2 = $conn->prepare("INSERT INTO payment ( payment_date, payment_amount, reference_no,borrower_id, remarks, status ) VALUES ( ?, ?, ?, ?,?,'pending')");
            $paymentType = "Auto-Generated";
            $remarks = "pending";
            $stmt2->bind_param("sssis", $nextPaymentDate, $monthlyPayment, $referenceNo, $borrowerId, $remarks);
            $stmt2->execute();

            // Check if loan schedule exists for the current month
            $stmtCheck = $conn->prepare("SELECT id FROM loan_schedules WHERE loan_id = ? AND due_date = ?");
            $stmtCheck->bind_param("is", $loanId, $nextPaymentDate);
            $stmtCheck->execute();
            $resultCheck = $stmtCheck->get_result();

            if ($resultCheck->num_rows > 0) {
                // Schedule exists, update it
                $scheduleId = $resultCheck->fetch_assoc()['id'];
                $stmt4 = $conn->prepare("UPDATE loan_schedules SET principal_amount = ?, interest_amount = ?, total_amount = ? WHERE id = ? AND status = 'pending'");
                $stmt4->bind_param("dddi", $principalAmount, $interestAmount, $monthlyPayment, $scheduleId);
                $stmt4->execute();
            } else {
                // Schedule doesn't exist, insert it
                $stmt4 = $conn->prepare("INSERT INTO loan_schedules (loan_id, due_date, principal_amount, interest_amount, total_amount) VALUES (?, ?, ?, ?, ?)");
                $stmt4->bind_param("isddd", $loanId, $nextPaymentDate, $principalAmount, $interestAmount, $monthlyPayment);
                $stmt4->execute();
            }

            // Update loan balance (reduce by principal amount)
            $newBalance = max(0, $loanAmount - $principalAmount);
            $stmt3 = $conn->prepare("UPDATE loan SET loan_amount = ?, term_months = ? WHERE id = ?");
            $newTermMonths = $termMonths - 1; // Reduce term_months by 1
            $stmt3->bind_param("dii", $newBalance, $newTermMonths, $loanId);
            $stmt3->execute();

            // Update the loan schedule
            $schedules = calculateAmortization($loanAmount, $interestRate, $termMonths, $nextPaymentDate);

            foreach ($schedules as $schedule) {
                // Check if loan schedule exists for the current month
                $stmtCheck = $conn->prepare("SELECT id FROM loan_schedules WHERE loan_id = ? AND due_date = ?");
                $stmtCheck->bind_param("is", $loanId, $schedule['due_date']);
                $stmtCheck->execute();
                $resultCheck = $stmtCheck->get_result();

                if ($resultCheck->num_rows > 0) {
                    // Schedule exists, update it
                    $scheduleId = $resultCheck->fetch_assoc()['id'];
                    $stmt4 = $conn->prepare("UPDATE loan_schedules SET principal_amount = ?, interest_amount = ?, total_amount = ? WHERE id = ?");
                    $stmt4->bind_param("dddi", $schedule['principal_amount'], $schedule['interest_amount'], $schedule['total_amount'], $scheduleId);
                    $stmt4->execute();
                } else {
                    // Schedule doesn't exist, insert it
                    $stmt4 = $conn->prepare("INSERT INTO loan_schedules (loan_id, due_date, principal_amount, interest_amount, total_amount) VALUES (?, ?, ?, ?, ?)");
                    $stmt4->bind_param("isddd", $loanId, $schedule['due_date'], $schedule['principal_amount'], $schedule['interest_amount'], $schedule['total_amount']);
                    $stmt4->execute();
                }
            }

            // Log the payment generation (optional)
            error_log("Payment generated for loan ID: " . $loanId . ", Amount: " . $monthlyPayment);
        }
    }

    $conn->commit();
    echo "Payments generated successfully!";

} catch (Exception $e) {
    $conn->rollback();
    echo "Error: " . $e->getMessage();
} finally {
    if (isset($stmt))
        $stmt->close();
    if (isset($stmt2))
        $stmt2->close();
    if (isset($stmt3))
        $stmt3->close();
    if (isset($stmt4))
        $stmt4->close();
    if (isset($stmtCheck))
        $stmtCheck->close();
    if (isset($stmtCheckPayment))
        $stmtCheckPayment->close();
    $conn->close();
}

function calculateAmortization($loanAmount, $interestRate, $termMonths, $paymentDate)
{
    $monthlyInterestRate = $interestRate / 100 / 12;
    $monthlyPayment = $loanAmount * ($monthlyInterestRate / (1 - pow(1 + $monthlyInterestRate, -$termMonths)));

    $balance = $loanAmount;
    $schedules = [];

    for ($i = 1; $i <= $termMonths; $i++) {
        $interestAmount = $balance * $monthlyInterestRate;
        $principalAmount = $monthlyPayment - $interestAmount;

        $balance -= $principalAmount;

        $dueDate = date('Y-m-d', strtotime("+$i months", strtotime($paymentDate)));

        $schedules[] = [
            'due_date' => $dueDate,
            'principal_amount' => $principalAmount,
            'interest_amount' => $interestAmount,
            'total_amount' => $monthlyPayment,
        ];
    }

    return $schedules;
}
?>