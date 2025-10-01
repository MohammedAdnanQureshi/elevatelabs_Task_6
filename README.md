# elevatelabs_Task_6
Objective: Analyze monthly revenue and order volume.


📌 Project Overview

Objective – Analyzed an online sales dataset in MySQL to understand revenue patterns, order volumes, and monthly sales performance.

Data Preparation – Cleaned the raw CSV and built a structured online_sales table with key fields: order_id, order_date, product_id, quantity, unit_price, and a calculated amount.

Data Loading – Imported the dataset into MySQL using LOAD DATA INFILE for efficient bulk upload.

Revenue Calculation – Computed amount as quantity × unit_price to capture actual sales value per transaction line.

Trend Analysis – Extracted YEAR() and MONTH() from order_date and aggregated revenue and unique orders per month.

Insights – Identified top-performing months by sorting total revenue, and explored sales seasonality and order patterns.

SQL Queries Used – Included scripts for database creation, table setup, monthly aggregation, and ranking of best revenue months.
