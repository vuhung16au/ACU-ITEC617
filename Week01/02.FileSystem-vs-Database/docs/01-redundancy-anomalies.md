# Redundancy and Data Anomalies

When we store data in flat files (like a single CSV spreadsheet), we often have to repeat information. For example, if a customer makes multiple orders, we have to write their name, address, and phone number on every single order row. This is called **Data Redundancy**.

Redundancy leads to three major problems, known as **Data Anomalies**:

## 1. Update Anomaly
If "Alice Smith" moves to a new house, we have to find every single order she ever made and update the address on all those rows. If we miss one, our data is inconsistent.

## 2. Delete Anomaly
If "Bob Jones" cancels his only order and we delete that row from our spreadsheet, we completely lose Bob's contact information.

## 3. Insertion Anomaly
If a new customer registers on our website but hasn't bought anything yet, we can't add them to our `orders` spreadsheet because we don't have an order to attach them to.
