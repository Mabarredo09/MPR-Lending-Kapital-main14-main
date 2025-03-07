<?php
require_once 'db_connect.php';

header('Content-Type: application/json');

$data = json_decode(file_get_contents('php://input'), true);
$reference_no = $data['reference_no'] ?? '';
$amount = $data['amount'] ?? 0;

try {
    $conn->begin_transaction();

    // Update payment status
    $stmt = $conn->prepare("UPDATE payment SET status = 'paid', paid_amount = ? WHERE reference_no = ?");
    $stmt->bind_param("ds", $amount, $reference_no);
    $stmt->execute();

    // Update loan balance
    $stmt2 = $conn->prepare("UPDATE loan_balance l 
                            JOIN payment p ON l.borrower_id = p.borrower_id 
                            SET l.loan_balance = l.loan_balance - ? 
                            WHERE p.reference_no = ?");
    $stmt2->bind_param("ds", $amount, $reference_no);
    $stmt2->execute();

    $conn->commit();

    echo json_encode([
        'status' => 'success',
        'message' => 'Payment processed successfully'
    ]);

} catch (Exception $e) {
    $conn->rollback();
    echo json_encode([
        'status' => 'error',
        'message' => $e->getMessage()
    ]);
} finally {
    if (isset($stmt))
        $stmt->close();
    if (isset($stmt2))
        $stmt2->close();
    $conn->close();
}
?>