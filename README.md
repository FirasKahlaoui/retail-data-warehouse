# Data Warehouse Project

![DataWarehouse Star Schema](https://github.com/FirasKahlaoui/retail-data-warehouse/blob/master/DataWarehouse%20Schema/DataWarehouse%20StarSchema%20White.png)

## Data Warehouse Project with SQL Server

This project demonstrates the construction of a fully functional Data Warehouse using SQL Server 2022 and Visual Studio 2022. It includes:

- **Database Design**: Creation of dimension tables and a fact table for a retail sales scenario.
- **ETL Processes**: Implementation of ETL pipelines to load and transform data from staging tables into the final schema.
- **Data Generation**: Python scripts to generate synthetic datasets for testing.
- **KPI Analysis**: SQL queries to calculate key metrics, such as total sales, top-selling products, and revenue by region.

The repository includes SQL scripts, Python scripts for data generation, and documentation on setting up and running the project.

## Project Structure

```
- **.gitignore**: Configuration file to specify files and directories to be ignored by Git.
- **DataWarehouse/**: Main directory containing the SQL Server project files.
    - **bin/Debug/**: Build output directory for debug configuration.
    - **DataWarehouse.dbmdl**: Database model file.
    - **DataWarehouse.jfm**: JSON file for project metadata.
    - **DataWarehouse.sln**: Visual Studio solution file.
    - **DataWarehouse.sqlproj**: SQL Server project file.
    - **DataWarehouse.sqlproj.user**: User-specific project settings.
- **python_scripts/**: Directory containing Python scripts for data generation.
- **results/**: Directory containing the KPIs results.
- **Scripts/**: Directory containing SQL scripts.
- **tunisian_data/**: Directory containing Tunisian-specific data.
- **DataWarehouse Schema/**: Directory containing schema diagrams.
- **README.md**: Project documentation file.
```
