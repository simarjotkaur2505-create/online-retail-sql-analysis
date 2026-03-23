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
