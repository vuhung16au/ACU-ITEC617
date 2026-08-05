import psycopg2
import sys
import time

DB_CONFIG = {
    'dbname': 'itec617',
    'user': 'user',
    'password': 'password',
    'host': 'localhost',
    'port': '5432'
}

def get_connection():
    try:
        return psycopg2.connect(**DB_CONFIG)
    except Exception as e:
        print(f"Failed to connect to database: {e}")
        print("Did you remember to run 'make up' to start the PostgreSQL container?")
        sys.exit(1)

def print_balances():
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("SELECT AccountID, AccountName, Balance FROM Accounts ORDER BY AccountID;")
    print("\n--- Current Account Balances ---")
    for row in cur.fetchall():
        print(f"ID {row[0]} | {row[1]}: ${row[2]}")
    print("--------------------------------\n")
    conn.close()

def unsafe_transfer(sender, receiver, amount):
    """
    Simulates an unsafe transfer without a transaction.
    If the system crashes or encounters an error halfway, 
    money is deducted from the sender but never reaches the receiver (Lost Update / Partial Failure).
    """
    print(f"\n[UNSAFE] Attempting to transfer ${amount} from {sender} to {receiver}...")
    
    conn = get_connection()
    # By default, psycopg2 runs in autocommit=False unless configured. 
    # To simulate two completely separate updates failing midway, we set autocommit=True
    conn.autocommit = True 
    cur = conn.cursor()
    
    try:
        # Step 1: Deduct from sender
        print(f"  -> Deducting ${amount} from {sender}...")
        cur.execute("UPDATE Accounts SET Balance = Balance - %s WHERE AccountID = %s;", (amount, sender))
        
        # Simulate a crash or delay
        print("  -> System processing... (simulating an unexpected error)")
        time.sleep(1)
        
        # Force a failure (Simulated Database Crash)
        raise Exception("CRITICAL FAILURE: Power loss to database server!")
        
        # Step 2: Add to receiver (This will never execute in this test!)
        cur.execute("UPDATE Accounts SET Balance = Balance + %s WHERE AccountID = %s;", (amount, receiver))
        print("  -> Transfer successful.")
        
    except Exception as e:
        print(f"  -> ERROR during unsafe transfer: {e}")
    finally:
        conn.close()

def safe_transfer_transaction(sender, receiver, amount):
    """
    Simulates a safe transfer using explicit BEGIN, COMMIT, and ROLLBACK blocks.
    Ensures Atomicity (All-or-Nothing).
    """
    print(f"\n[SAFE - APP LEVEL] Attempting to transfer ${amount} from {sender} to {receiver} using transactions...")
    conn = get_connection()
    cur = conn.cursor()
    
    try:
        # Step 1: Deduct from sender
        print(f"  -> Deducting ${amount} from {sender}...")
        cur.execute("UPDATE Accounts SET Balance = Balance - %s WHERE AccountID = %s;", (amount, sender))
        
        # Simulate a crash or delay
        print("  -> System processing... (simulating an unexpected error)")
        time.sleep(1)
        
        # Force a failure
        raise Exception("CRITICAL FAILURE: Power loss to database server!")
        
        # Step 2: Add to receiver
        cur.execute("UPDATE Accounts SET Balance = Balance + %s WHERE AccountID = %s;", (amount, receiver))
        
        conn.commit()
        print("  -> Transfer successful.")
    except Exception as e:
        print(f"  -> ERROR during safe transfer: {e}")
        print("  -> Triggering ROLLBACK... restoring original balances.")
        conn.rollback()  # UNDO the deduction!
    finally:
        conn.close()

def safe_transfer_stored_procedure(sender, receiver, amount):
    """
    Delegates the transfer entirely to the database engine via a stored procedure.
    This guarantees Atomicity and consistency without round-trips to the app layer.
    """
    print(f"\n[SAFE - DB LEVEL] Attempting to transfer ${amount} from {sender} to {receiver} via Stored Procedure...")
    conn = get_connection()
    cur = conn.cursor()
    
    try:
        print("  -> Calling database procedure 'transfer_funds'...")
        cur.execute("CALL transfer_funds(%s, %s, %s);", (sender, receiver, amount))
        conn.commit()
        print("  -> Transfer successful.")
    except Exception as e:
        print(f"  -> DB ERROR: {e}")
        conn.rollback()
    finally:
        conn.close()

def main():
    print("Welcome to the Transactional Banking App Simulator!")
    print_balances()
    
    while True:
        print("Choose a simulation:")
        print("1) Run UNSAFE Transfer (Partial Failure Demo)")
        print("2) Run SAFE Transfer (App-level Transaction + Rollback Demo)")
        print("3) Run SAFE Transfer (Stored Procedure Demo)")
        print("4) Exit")
        choice = input("> ")
        
        if choice == '1':
            unsafe_transfer(1, 2, 100.00) # Alice to Bob
            print_balances()
        elif choice == '2':
            safe_transfer_transaction(1, 2, 100.00)
            print_balances()
        elif choice == '3':
            # This one won't crash intentionally, it shows success
            safe_transfer_stored_procedure(1, 2, 100.00)
            print_balances()
        elif choice == '4':
            print("Goodbye!")
            break
        else:
            print("Invalid choice.\n")

if __name__ == '__main__':
    main()
