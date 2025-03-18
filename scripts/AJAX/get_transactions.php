<?php

require_once 'db_connect.php';

$type = $_GET['type'] ?? 'all';
$borrowerId = $_GET['borrowerId'] ?? null;

if (!$borrowerId) {
    echo json_encode(['status' => 'error', 'message' => 'Borrower ID is required']);
    exit;
}

$response = ['status' => 'success', 'data' => []];

try {
    switch ($type) {
        case 'loan':
            $sql = "SELECT
            l.reference_no,
            l.repayment_date,
            l.customer_type,
            l.loan_amount,
            l.interest_rate,
            l.term_months,
            l.remarks,
            l.loan_date,
            pf.promissory_file_path,
            lb.loan_balance
            FROM loan l LEFT JOIN loan_balance lb ON l.reference_no = lb.loan_reference_no
            LEFT JOIN promissory_files pf ON l.promissory_id = pf.id WHERE l.borrower_id = ? ORDER BY loan_date DESC";
            break;
        case 'payment':
            $sql = "SELECT * FROM payment WHERE borrower_id = ? ORDER BY created_at DESC";
            break;
        case 'grocery':
            $sql = "SELECT * FROM grocery WHERE borrower_id = ? ORDER BY grocery_date DESC";
            break;
        default:
            $sql = "SELECT t.created_at,
                        t.reference_no,
                        t.transaction_type,
                        l.repayment_date,
                        l.loan_amount,
                        l.interest_rate,
                        l.term_months,
                        pf.promissory_file_path,
                        l.remarks
                        FROM transactions t LEFT JOIN loan l ON t.reference_no = l.reference_no LEFT JOIN promissory_files pf ON l.promissory_id = pf.id WHERE t.borrower_id = ? ORDER BY created_at ASC";
    }

    $stmt = $conn->prepare($sql);
    $stmt->bind_param('i', $borrowerId);
    $stmt->execute();
    $result = $stmt->get_result();

    $response['data'] = $result->fetch_all(MYSQLI_ASSOC);

} catch (Exception $e) {
    $response = ['status' => 'error', 'message' => $e->getMessage()];
}

echo json_encode($response);