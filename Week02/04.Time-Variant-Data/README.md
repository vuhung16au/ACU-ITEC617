# Week 2 - Topic 4: Time-Variant Data (The "Price History" Problem)

## Overview
This activity focuses on Design Strategies for maintaining Time-Variant Data, specifically handling values that change over time without breaking historical records.

## The Setup
Consider a common retail problem: You have a `Products` table with a `CurrentPrice` column, and an `Orders` table. If a customer buys an item today for $10, and you change the `CurrentPrice` to $15 tomorrow, what happens to the historical order data? 

If your design just joins the `Orders` back to the `Products` table, the historical order incorrectly updates, making it look like the customer paid $15. This corrupts financial reporting.

## The Hands-on Task
Students are presented with two design solutions to this problem:

*   **Solution A (The Snapshot):** When inserting a new row into the `OrderDetails` table, copy the exact price at that specific moment into a `PriceAtPurchase` column. This preserves the historical fact.
*   **Solution B (The History Table):** Remove `CurrentPrice` from the `Products` table. Create a new `ProductPriceHistory` table with `ProductID`, `Price`, `StartDate`, and `EndDate`.

**Implementation Task:**
Have students write the SQL to create **Solution A** (creating `Products`, `Orders`, and `OrderDetails`), and then write a test `INSERT` statement to show how they would capture the price at the moment of sale.

The provided `init-scripts/01-init.sql` file contains a reference implementation for Solution A.
