# Global Electronics Retail Sales & Customer Analytics

## Project Overview

This project analyzes sales, product, customer, and store data from a global electronics retailer to identify revenue and profitability trends, product performance, customer behavior, and store-level performance.

The project covers the complete data analytics workflow, including data exploration and preparation, SQL analysis, and interactive dashboard development in Power BI.

## Dataset

The project uses the Global Electronics Retailer dataset from Maven Analytics.

The dataset contains information about:

- Sales transactions
- Products
- Customers
- Stores
- Exchange rates
- Data dictionary

## Tools & Technologies

- Python
- Polars
- Jupyter Notebook
- SQL
- SQLite
- Power BI
- DAX
- Power Query
- Git & GitHub

## Project Workflow

1. Data Exploration & Preparation
2. SQL Analysis
3. Power BI Dashboard
4. Business Insights

---

## 1. Data Exploration & Preparation

The initial data exploration was performed using Python and Polars.

The analysis included:

- Dataset structure and dimensions
- Data types
- Missing-value analysis
- Duplicate checks
- Basic data exploration
- Date column conversion
- Column name standardization
- Initial relationship exploration between tables

### Data Quality

The Sales table contains 62,884 records and no duplicate rows.

The `Delivery Date` column contains a high proportion of missing values. Since there was no reliable source in the available dataset to infer these dates, the missing values were retained rather than artificially filled.

The Stores table contains one missing value in `Square Meters` for the online store, which is structurally expected because an online store does not have a physical store area.

The Products, Customers, and Exchange Rates tables contain no missing or duplicate records.

---

## 2. SQL Analysis

SQL was used to analyze sales performance across different business dimensions.

The analysis is organized into separate SQL files:

### Sales Analysis
`01_sales_analysis.sql`

Includes:

- Total Revenue
- Total Profit
- Overall Profit Margin
- Revenue by Category
- Profit by Category
- Profit Margin by Category
- Revenue and Quantity by Category
- Profit by Year and Category
- Average Order Value
- Order-level analysis

### Product Analysis
`02_product_analysis.sql`

Includes:

- Top Products by Revenue
- Top Products by Profit
- Product performance analysis

### Customer Analysis
`03_customer_analysis.sql`

Includes:

- Top Customers by Revenue
- Customer order activity
- Customer-level sales analysis

### Store Analysis
`04_store_analysis.sql`

Includes:

- Revenue by Store
- Profit by Store
- Revenue by Country

---

## 3. Power BI Dashboard

An interactive Power BI dashboard was developed to visualize the main findings from the analysis.

The dashboard focuses on:

- Revenue performance
- Profit performance
- Profit margin
- Quantity sold
- Category performance
- Revenue and profit trends
- Store performance
- Business-level comparisons

Interactive filters allow users to explore the data by relevant dimensions such as year and category.

### Dashboard Preview

![Power BI Dashboard](screenshots/dashboard.png)

---

## Key Findings

- Total revenue generated was **$43.21M**.
- **Computers** generated the highest total revenue, with approximately **$16.08M**.
- **Computers** also generated the highest total profit, with approximately **$11.28M**.
- The analysis showed that revenue was not directly proportional to quantity sold, indicating differences in average selling prices across categories.
- Average Order Value was calculated at the order level to evaluate the average revenue generated per order.
- Store and customer analyses were performed to identify differences in business performance across locations and customers.

---

## Project Structure

```text
Global-Electronics-Retail-Analytics/
│
├── dashboard/
│   └── e_commerce_dashboard.pbix
│
├── data/
│   ├── database/
│   │   ├── ecommerce.db
│   │   └── ecommerce.sqbpro
│   │
│   └── raw/
│       ├── Customers.csv
│       ├── Data_Dictionary.csv
│       ├── Exchange_Rates.csv
│       ├── Products.csv
│       ├── Sales.csv
│       └── Stores.csv
│
├── notebooks/
│   └── 01_data_exploration.ipynb
│
├── screenshots/
│   └── dashboard.png
│
├── sql/
│   ├── 01_sales_analysis.sql
│   ├── 02_product_analysis.sql
│   ├── 03_customer_analysis.sql
│   └── 04_store_analysis.sql
│
├── .gitignore
├── README.md
└── requirements.txt


## Skills Demonstrated

· Data Cleaning & Preparation
· Exploratory Data Analysis
· SQL Data Analysis
· Aggregation & Grouping
· CTEs
· Business Metrics
· Revenue & Profitability Analysis
· Customer Analysis
· Store Analysis
· Power BI Dashboard Development
· DAX
· Power Query
· Data Visualization
· Git & GitHub


## Future Improvements

· Customer segmentation
· Customer lifetime value analysis
· More detailed store performance analysis
· Advanced time-series analysis
· Additional business KPIs
· More advanced Power BI measures and insights