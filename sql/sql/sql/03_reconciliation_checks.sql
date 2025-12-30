SELECT a.transaction_id, a.ezpass_id, a.transaction_date, a.toll_amount
FROM toll_transactions_system_a a
LEFT JOIN toll_transactions_system_b b
  ON a.transaction_id = b.transaction_id
WHERE b.transaction_id IS NULL;

SELECT b.transaction_id, b.ezpass_id, b.transaction_date, b.toll_amount
FROM toll_transactions_system_b b
LEFT JOIN toll_transactions_system_a a
  ON b.transaction_id = a.transaction_id
WHERE a.transaction_id IS NULL;

SELECT a.transaction_id,
       a.toll_amount AS system_a_amount,
       b.toll_amount AS system_b_amount
FROM toll_transactions_system_a a
JOIN toll_transactions_system_b b
  ON a.transaction_id = b.transaction_id
WHERE a.toll_amount <> b.toll_amount;

SELECT transaction_id, COUNT(*) AS record_count
FROM toll_transactions_system_b
GROUP BY transaction_id
HAVING COUNT(*) > 1;
