SELECT 'System A' AS system, COUNT(*) AS null_ezpass_id
FROM toll_transactions_system_a
WHERE ezpass_id IS NULL;

SELECT 'System B' AS system, COUNT(*) AS null_ezpass_id
FROM toll_transactions_system_b
WHERE ezpass_id IS NULL;

SELECT *
FROM toll_transactions_system_a
WHERE toll_amount <= 0;

SELECT *
FROM toll_transactions_system_b
WHERE toll_amount <= 0;
