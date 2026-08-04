# Week 10 - Topic 04: Power BI Dashboard Creation

## Overview
In this exercise, you will step into the role of a Business Intelligence Analyst. You will connect **Power BI Desktop** directly to your local SQL Data Warehouse, build a semantic data model with relationships, write DAX measures, and create interactive visualizations.

## Learning Objectives
* Connect Power BI Desktop to a PostgreSQL database.
* Import Fact and Dimension tables and define relationships (1-to-Many).
* Write **DAX (Data Analysis Expressions)** measures.
* Build an interactive dashboard with various visualizations (Line Charts, Bar Charts, Maps).
* Understand how data modeling in the warehouse directly impacts reporting.

## Business Scenario
The executive team needs a daily dashboard to track company performance. They want to see:
1. **Sales trends over time** (Are we growing month-over-month?).
2. **Top 10 products by revenue** (What are our best-sellers?).
3. **Sales by region** (Geographic performance mapping).

You have been provided with a pre-populated Data Warehouse (Star Schema). Your job is to connect Power BI to it and deliver the dashboard.

## Required Software
* **Power BI Desktop**: You can download this for free from the Microsoft Store (Windows only) or the Power BI website. 
*(Note: If you are on a Mac, you can use Power BI Service in the browser if you have a pro account, or run Windows via Parallels/Bootcamp. Alternatively, Tableau Public can be used for the exact same concepts!).*

## Key DAX Measures
When you load your data, you will need to create explicitly defined measures rather than relying on implicit aggregations. For example:
```dax
Total Revenue = SUM(FactSales[SalesAmount])
```
```dax
Total Items Sold = SUM(FactSales[Quantity])
```
