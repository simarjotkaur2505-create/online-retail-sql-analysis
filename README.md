# Online Retail SQL Analysis

This project analyzes an online retail dataset to understand customer behavior, product performance, and sales trends using SQL.

## Data flow

1. **Raw data** — Download [Online Retail Dataset on Kaggle](https://www.kaggle.com/datasets/ulrikthygepedersen/online-retail-dataset?select=online_retail.csv) and place the CSV under `data/raw/` (ignored by git; folder is kept via `.gitkeep`).
2. **Processing** — Clean and enrich the raw extract (remove bad rows, derive metrics such as `revenue`). The **final artifact** checked into this repo is `data/processed/online_retail_clean.csv` (semicolon-separated, includes a `revenue` column).
3. **Analysis** — Load the processed CSV into MySQL and run the scripts in `sql/`.

## Project structure

```
├── data/
│   ├── raw/                      # Optional local copy of Kaggle CSV (not committed)
│   └── processed/
│       └── online_retail_clean.csv   # Final cleaned dataset after all processing
├── sql/
│   ├── data_cleaning.sql         # In-DB cleaning for raw Kaggle loads only
│   ├── sales_analysis.sql
│   └── customer_analysis.sql
├── LICENSE
└── README.md
```

| Path | Description |
|------|-------------|
| `data/processed/online_retail_clean.csv` | Final output after processing raw Kaggle data; use this for the analysis queries |
| `sql/data_cleaning.sql` | Deletes rows with null `CustomerID`, non-positive `Quantity`, or non-positive `UnitPrice` on a **raw** load |
| `sql/sales_analysis.sql` | Top products by units sold, top products by revenue, revenue by country |
| `sql/customer_analysis.sql` | Top customers by spend; per-customer order count and lifetime revenue |

## Load processed data into MySQL

Create a table that matches the CSV columns, then load from the repo root (adjust path if your client cwd differs):

```sql
LOAD DATA LOCAL INFILE 'data/processed/online_retail_clean.csv'
INTO TABLE online_retail
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
```

Enable `local_infile` on the server and client if required. Column types and any date parsing should match your `CREATE TABLE` definition.

## Tools

- MySQL
- SQL

## Data cleaning (raw pipeline)

`sql/data_cleaning.sql` removes:

- Rows with null `CustomerID`
- Invalid transactions (non-positive quantity)
- Rows with non-positive `UnitPrice`

## Analysis

- Top selling products
- Revenue by country
- Highest revenue products
- Customer behavior analysis

## Key insights

- Most revenue comes from the United Kingdom.
- A small group of customers accounts for a large share of revenue.
