/*
 * customer_analysis.sql
 * Customer spend ranking and simple lifetime value: top spenders by revenue,
 * then all customers with order count and total revenue. Use with data loaded from
 * data/processed/online_retail_clean.csv (includes revenue) into online_retail.
 */

--Top Customers:
select CustomerID,sum(revenue) as total_spent
from online_retail
group by CustomerID
order by total_spent desc
limit 10;

--Customer Lifetime Value:
select CustomerID,count(distinct InvoiceNo) as orders,sum(revenue) as lifetime_value
from online_retail
group by CustomerID
order by lifetime_value desc;
