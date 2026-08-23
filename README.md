# Retail-Sales-ETL-SQL-Analytics-Pipeline
An end-to-end data engineering and analytics project that transforms raw retail transaction data into a structured PostgreSQL analytical database using Python ETL and SQL-based business analysis.

---

## Project Overview

The project processes the **Sample Superstore Sales Dataset** and demonstrates a complete data workflow:

Raw CSV Dataset
|
↓
Python ETL Pipeline
(Cleaning + Transformation)
|
↓
Star Schema Database
|
↓
PostgreSQL SQL Analytics
|
↓
Business Insights
---

## Technology Stack

- Python
- Pandas
- Jupyter Notebook
- PostgreSQL
- SQL
- Git/GitHub

---

## ETL Pipeline

The Python ETL pipeline performs:

- Data loading from raw CSV
- Data quality checking
- Duplicate removal
- Date transformation
- Dimension table creation
- Fact table creation
- Data validation
- Exporting PostgreSQL-ready tables

The raw transaction dataset is transformed into a dimensional data warehouse model.

---

## Database Design

The project follows a **Star Schema** design consisting of:

### Dimension Tables

- `dim_customer`
    - Customer information
    - Segment details

- `dim_product`
    - Product information
    - Category and sub-category

- `dim_location`
    - Geographic information

- `dim_date`
    - Time-based attributes for analysis


### Fact Table

- `fact_sales`

Contains transactional measures:

- Sales
- Quantity
- Discount
- Profit

The grain of the fact table is:

> One row represents one product transaction within an order.

---

## Entity Relationship Diagram

![Retail Sales Star Schema](images/retail_sales_star_schema.png)

---

## SQL Analysis

The SQL layer performs business analytics using:

- Joins
- Aggregations
- GROUP BY
- CTEs
- Window functions
- Ranking analysis

Example analysis:

- Total sales and profit
- Monthly sales trends
- Revenue by category
- Regional performance
- Top customers
- Top products
- Profit margin analysis

---

## Project Structure

Retail-Sales-ETL-SQL-Pipeline/

│
├── Retail_ETL_Pipeline.ipynb
│
├── sql/
│ ├── 01_create_schema.sql
│ ├── 02_load_data.sql
│ ├── 03_validate_database.sql
│ └── 04_business_analysis.sql
│
├── data/
│ └── Sample-Superstore.csv
│
├── images/
│ └── retail_sales_star_schema.png
│
└── requirements.txt


---

## Key Outcomes

This project demonstrates practical skills in:

- ETL pipeline development
- Data cleaning and transformation
- Relational database design
- Star schema modelling
- PostgreSQL implementation
- Business-focused SQL analytics

---

## Dataset

Dataset:
**Sample Superstore Sales Dataset**
