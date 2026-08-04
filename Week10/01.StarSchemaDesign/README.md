# Week 10 - Topic 01: Star Schema Design & Analytical SQL Queries

## Overview
This exercise introduces students to denormalized data modeling using the Star Schema approach, which is commonly used in data warehouses and analytical systems. Students will design a star schema for a retail sales scenario and write analytical SQL queries to derive business insights.

## Learning Objectives
* Understand the concepts of Fact and Dimension tables.
* Design a star schema with 1 fact table and multiple dimension tables.
* Write complex analytical queries using aggregation functions (`SUM`, `AVG`, `COUNT`).
* Compare query performance and complexity between normalized (3NF) and denormalized (star schema) designs.

## Business Scenario
You are designing a data warehouse for a retail chain. The business wants to analyze their sales data across different dimensions to answer questions like:
* "What was the total revenue by product category per quarter?"
* "Which store had the highest sales on weekends?"
* "What's the average order value by customer age group?"

You have been tasked to design a star schema with:
* **1 Fact Table**: `FactSales`
* **4 Dimension Tables**: `DimTime`, `DimProduct`, `DimCustomer`, `DimStore`
