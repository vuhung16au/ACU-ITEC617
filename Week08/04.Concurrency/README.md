# Week 8 Topic 4: Concurrency Control: Multi-Session Simulation

## Overview
This example demonstrates the challenges of concurrent transactions in a multi-user database environment. You will open multiple query windows (sessions) to simulate different users interacting with the database simultaneously and observe phenomena like lost updates, dirty reads, and locking behavior.

## Practice Activities
- **Lost Update Scenario:** Open 2 query windows, both read the same row, both update it based on old values, and observe which update "wins".
- **Dirty Read Scenario:** Use `SET TRANSACTION ISOLATION LEVEL` to experiment. (Note: PostgreSQL prevents Dirty Reads even in `READ UNCOMMITTED`, but we will simulate the isolation levels concept).
- **Locking Demonstration:** Start a transaction in Session 1 and update a row (don't commit). Try to update the same row in Session 2 and observe the blocking/waiting behavior.
- **Deadlock Simulation**: Create a scenario where Session 1 waits on Session 2, and Session 2 waits on Session 1, triggering PostgreSQL's deadlock detector.

## Skills Covered
- Understanding Locks and Blocking
- Transaction Isolation Levels (`READ COMMITTED`, `REPEATABLE READ`, `SERIALIZABLE`)
- Detecting Deadlocks
- Recognizing real-world concurrency problems
