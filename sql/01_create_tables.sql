
CREATE TABLE toll_transactions_system_a (
    transaction_id INTEGER PRIMARY KEY,
    ezpass_id TEXT NOT NULL,
    transaction_date DATE NOT NULL,
    toll_amount DECIMAL(5,2) NOT NULL,
    location TEXT NOT NULL
);


CREATE TABLE toll_transactions_system_b (
    transaction_id INTEGER,
    ezpass_id TEXT,
    transaction_date DATE,
    toll_amount DECIMAL(5,2),
    settlement_status TEXT,
    PRIMARY KEY (transaction_id)
);
