# Sakila-Film-Rental-Modeling-ETL
This repository contains modeling of the Sakila ERD to a star schema using the Kimball approach and performs ETL (Extract, Transform, Load) from the source ERD to the destination star schema to optimize BI queries.

## Repository Structure:
1. Convert Sakila ERD (OLTP) to Star Schema (OLAP): Use the Kimball approach to make it easier and quicker to handle read-only queries, perform analysis, and gain insights.
2. Extraction: Extract data from the Sakila database in SQL Server and perform data quality checks.
3. Transformation: Transform the data from SQL to fit the star schema and calculate measures.
4. Loading: Load the transformed data into the new destination star schema in SQL Server.
5. Answer Business Questions: Use the new star schema to answer business questions and derive insights.

## Tools
- Sql Server Management Studio(SSMS)
- SQL Server Integration Services(SSIS)
- Power BI
## sakila star schema
![image](https://github.com/TmohamedashrafT/Sakila-Film-Rental-Modeling-ETL/blob/main/star%20schema.png)

## power bi dashboard
![image](https://github.com/TmohamedashrafT/Sakila-Film-Rental-Modeling-ETL/blob/main/powerbi%20dashboard.png)

## References
1. https://github.com/ivanceras/sakila/tree/master (Creation and insertion of the database)
