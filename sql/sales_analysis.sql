/*
 * sales_analysis.sql
 * Product and geography sales metrics: top units sold, top revenue by product,
 * and total revenue by country. Load data/processed/online_retail_clean.csv (or add
 * a revenue column) into table online_retail; this repo’s processed file already includes revenue.
 */

--Top 10 Selling Products:
select Description,sum(Quantity) as total_sold
from online_retail
group by Description
order by total_sold desc
limit 10;

--Highest Revenue Products:
select Description, sum(revenue) as total_revenue
from online_retail
group by Description
order by total_revenue desc
limit 10;

-- Revenue by Country:
select Country,sum(revenue) as total_revenue
from online_retail
group by Country
order by total_revenue desc;
