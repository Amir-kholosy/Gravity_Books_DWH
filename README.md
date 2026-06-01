# Gravity Books Data Warehouse

## Overview

Gravity Books Data Warehouse is an end-to-end Business Intelligence and Data Warehousing project built using Microsoft SQL Server technologies. The project transforms transactional bookstore data into a dimensional data warehouse that supports analytical reporting, multidimensional analysis, and business decision-making.

The solution implements a Star Schema with Slowly Changing Dimensions (SCD Type 2), ETL workflows using SQL Server Integration Services (SSIS), and OLAP cubes using SQL Server Analysis Services (SSAS).

---

## Business Objectives

The project enables business users to:

* Analyze book sales performance.
* Monitor customer purchasing behavior.
* Track shipping costs and order fulfillment.
* Evaluate sales trends across time periods.
* Perform multidimensional analysis through OLAP cubes.
* Generate aggregated business reports for management.

---

## Technology Stack

* Microsoft SQL Server
* SQL Server Integration Services (SSIS)
* SQL Server Analysis Services (SSAS)
* SQL Server Management Studio (SSMS)
* T-SQL
* Data Warehouse Modeling
* Star Schema Design
* OLAP Cubes
* MDX Queries

---

## Data Warehouse Architecture

The solution follows a dimensional modeling approach using a Star Schema.

### Fact Tables

#### Sales Fact

Stores transactional sales measures and references dimension tables.

Measures:

* Sales Price

Foreign Keys:

* Customer_SK_FK
* Address_SK_FK
* Book_SK_FK
* Date_SK_FK

#### Order Shipping Fact

Stores shipping-related metrics and order fulfillment information.

Measures:

* Shipping Cost

Foreign Keys:

* Customer_SK_FK
* Date_SK_FK
* Shipping_Method_SK_FK
* Order_Status_SK_FK

---

## Dimension Tables

### Customer Dimension

Contains customer profile information.

Attributes:

* Customer Name
* Email
* Customer Business Key
* SCD Type 2 Tracking Columns

### Book Dimension

Contains book metadata.

Attributes:

* Title
* ISBN
* Publisher
* Language
* Number of Pages
* Publication Date

### Author Dimension

Contains author information.

### Address Dimension

Contains geographical information.

Attributes:

* Street
* City
* County

### Date Dimension

Supports time-based analytics.

Attributes:

* Day
* Month
* Quarter
* Year
* Day of Week

### Shipping Method Dimension

Contains available shipping methods.

### Order Status Dimension

Contains order status values.

---

## Bridge Table

### Book Author Bridge

A bridge table is implemented to handle the many-to-many relationship between books and authors.

Relationship:

Book ↔ Book_Author_Bridge ↔ Author

---

## ETL Process (SSIS)

The ETL pipeline was developed using SQL Server Integration Services (SSIS).

### Extraction

Data is extracted from the Gravity Books transactional database.

### Transformation

Transformations include:

* Data cleansing
* Data validation
* Surrogate key generation
* Business key mapping
* Slowly Changing Dimension (Type 2) handling
* Lookup transformations
* Data quality checks

### Loading

Data is loaded into:

* Dimension tables
* Bridge table
* Fact tables

Load sequence:

1. Date Dimension
2. Customer Dimension
3. Address Dimension
4. Author Dimension
5. Book Dimension
6. Bridge Table
7. Fact Tables

---

## Slowly Changing Dimensions (SCD Type 2)

Historical tracking is implemented using:

* st_date
* end_date
* is_current
* SSC

This allows the warehouse to preserve historical changes while maintaining current records.

---

## OLAP Cube (SSAS)

An OLAP cube was developed using SQL Server Analysis Services.

### Available Analysis Dimensions

* Customer
* Book
* Author
* Address
* Date
* Shipping Method
* Order Status

### Measures

* Total Sales
* Shipping Cost

### Analytical Capabilities

Users can:

* Drill Down
* Roll Up
* Slice
* Dice
* Pivot Analysis

---

## MDX Reporting

The cube supports MDX queries for advanced multidimensional analysis.

Example business questions:

* Which books generate the highest revenue?
* What are the monthly sales trends?
* Which customers contribute the most sales?
* How do shipping costs vary across order statuses?
* Which authors drive the highest revenue?

---

## Repository Structure

```text
Gravity_Books_DWH/
│
├── SQL/
│   └── SQL_OLAP_Creation.sql
│
├── SSIS/
│   └── Gravity_Books_SSIS_Final/
│
├── SSAS/
│   └── SSAS_Gravity_Books_Final/
│
├── Model/
│   └── Gravity_Books_model.drawio.png
│
├── Screenshots/
│
└── README.md
```

---

## Data Model

The project implements a Star Schema consisting of:

* 2 Fact Tables
* 7 Dimension Tables
* 1 Bridge Table

The model supports scalable analytical workloads and multidimensional reporting.

---

## Key Skills Demonstrated

* Data Warehousing
* Dimensional Modeling
* Star Schema Design
* ETL Development
* SSIS
* SSAS
* OLAP Cubes
* MDX
* T-SQL
* Business Intelligence
* Slowly Changing Dimensions (SCD Type 2)
* Data Integration
* Data Analytics

---

## Author

Amir Kholosy

Data Engineer | Business Intelligence Developer

LinkedIn: Add your LinkedIn profile link here
GitHub: https://github.com/Amir-kholosy
