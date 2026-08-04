# Maintaining Time-Variant Data

In database design, data isn't always static. Prices change, employees get promoted, and addresses get updated. When historical accuracy is required (like in financial transactions or auditing), we face the challenge of **Time-Variant Data**.

## The "Price History" Problem

Imagine a common retail scenario: You have a `Products` table with a `CurrentPrice` column, and an `Orders` table that links back to those products. 
*   **Day 1:** A customer buys an item for $10.
*   **Day 2:** You change the `CurrentPrice` in the `Products` table to $15.
*   **The Issue:** If you don't design your database properly, querying the customer's historical order will look up the new $15 price, making it appear as though the customer paid more than they actually did. Your sales reports and historical facts will be completely corrupted.

## Design Strategies

There are several ways to solve this, but two common approaches are:

### Solution A: The Snapshot (Denormalization for History)

When a transaction occurs, you copy the value *at that exact moment in time* into the transaction table. 
*   **Implementation:** You add a `PriceAtPurchase` (or `SoldPrice`) column to your `OrderDetails` table. 
*   **Pros:** Very easy to query, extremely fast for reporting, accurately preserves the historical fact of the sale regardless of future product price changes.
*   **Cons:** Introduces minor redundancy, but this is an accepted and standard practice for transactional historical data.

### Solution B: The History Table (Type 2 Slowly Changing Dimension)

You remove the `CurrentPrice` from the `Products` table entirely and move it to a new `ProductPriceHistory` table.
*   **Implementation:** `ProductPriceHistory` contains `ProductID`, `Price`, `StartDate`, and `EndDate`. When a price changes, you update the old price's `EndDate` and insert a new row with a new `StartDate`.
*   **Pros:** Perfect historical tracking of all price changes over time, even for periods where no sales occurred.
*   **Cons:** Makes querying transactions much more complex, as you must join on date ranges (`WHERE OrderDate BETWEEN StartDate AND EndDate`).
