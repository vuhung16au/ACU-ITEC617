# Week 07, Topic 02: E-Commerce Product Query Workshop

## Overview
This workshop provides a pre-populated `Products` table for you to practice writing SQL `SELECT` queries for real-world scenarios.

## Learning Objectives
*   Use `SELECT` to retrieve specific columns.
*   Filter results using `WHERE` (including ranges and `LIKE`).
*   Sort results using `ORDER BY`.
*   Create computed columns (e.g., calculating taxes).
*   Use column `ALIASES`.
*   Handle `NULL` values.

## Workshop Scenarios (Challenge)
Write queries for the following scenarios in your Query Tool:
1.  Find all products under $50.
2.  List products containing "Laptop" in the name, sorted by price descending.
3.  Calculate and display: `ProductName`, `BasePrice`, `TaxAmount` (10%), `TotalPrice`.
4.  Find products between $100 and $500 in the "Electronics" category.
5.  Use `LIKE` to find all products starting with "Sam".
6.  Find products where `StockQuantity IS NULL` or equals 0.
