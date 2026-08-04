# Theory: Date, String, and Numeric Functions

- **Date Functions:** Used to extract parts of a date, calculate intervals, or get the current date. For example, `CURRENT_DATE`, `EXTRACT(YEAR FROM date)`, `EXTRACT(MONTH FROM date)`. (Note: In PostgreSQL, `AGE(date)` is commonly used for tenure).
- **String Functions:** Used to manipulate text strings. Common functions include `CONCAT()` to join strings, and `UPPER()` or `LOWER()` to change case.
- **Numeric Functions:** Used for mathematical operations. `ROUND()` is commonly used to limit the number of decimal places for financial calculations.
- **Computed Columns:** Columns derived from calculations on other columns, often returned in a `SELECT` statement to create new, on-the-fly information.
