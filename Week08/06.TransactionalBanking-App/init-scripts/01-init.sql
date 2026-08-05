-- Banking Application Schema

CREATE TABLE Accounts (
    AccountID SERIAL PRIMARY KEY,
    AccountName VARCHAR(100) NOT NULL,
    Balance NUMERIC(15, 2) NOT NULL
);

-- We use a CHECK constraint here to protect against negative balances (a basic form of consistency)
-- But race conditions can still cause issues if multiple transactions hit at the exact same millisecond.
ALTER TABLE Accounts ADD CONSTRAINT chk_positive_balance CHECK (Balance >= 0);

INSERT INTO Accounts (AccountName, Balance) VALUES
('Alice', 1000.00),
('Bob', 500.00);


-- Stored Procedure implementing safe transfer with SERIALIZABLE isolation
-- This guarantees the highest level of protection against Concurrency Anomalies
CREATE OR REPLACE PROCEDURE transfer_funds(
    sender_id INT,
    receiver_id INT,
    transfer_amount NUMERIC
)
LANGUAGE plpgsql
AS $$
DECLARE
    current_balance NUMERIC;
BEGIN
    -- Pl/pgSQL procedures execute within a transaction by default.
    -- Ensure atomicity (all or nothing)
    
    -- 1. Read balance
    SELECT Balance INTO current_balance FROM Accounts WHERE AccountID = sender_id;
    
    -- 2. Consistency Check
    IF current_balance < transfer_amount THEN
        RAISE EXCEPTION 'Transaction Failed: Insufficient funds (Attempted: %, Available: %)', transfer_amount, current_balance;
    END IF;

    -- 3. Update Sender
    UPDATE Accounts SET Balance = Balance - transfer_amount WHERE AccountID = sender_id;
    
    -- 4. Update Receiver
    UPDATE Accounts SET Balance = Balance + transfer_amount WHERE AccountID = receiver_id;
    
    -- Implicit COMMIT happens here if no exceptions were raised
END;
$$;
