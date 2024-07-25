select sum(total_price) as Total_revenue from pizza_sales;

select sum(total_price)/count (distinct order_id)as avg_order_value from pizza_sales;

select sum(quantity) as total_pizzas_sold from pizza_sales;

select count(distinct order_id) as total_orders from pizza_sales;

SELECT 
    CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS average_quantity_per_order
FROM pizza_sales;

select DATENAME(DW, order_date) as order_day,count(DISTINCT order_id) as Total_orders 
from pizza_sales group by DATENAME(DW, order_date);

select DATENAME(M,order_date) as monthly_order,count(distinct order_id) as total_orders
from pizza_sales group by DATENAME(M,order_date),DATEPART(MM,order_date) ORDER BY DATEPART(MM,order_date);

select distinct pizza_category,cast((sum(total_price)*100.0/(select sum(total_price)from pizza_sales)) as decimal(10,2))as percentage_sales
from pizza_sales group by  pizza_category order by percentage_sales desc;

SELECT 
    pizza_size,cast(sum(total_price)as decimal (10,2)) as Total_price,
   cast((SUM(total_price) * 100.0 / (SELECT SUM(total_price) FROM pizza_sales))as decimal (10,2)) AS percentage_of_total
FROM 
    pizza_sales
GROUP BY 
    pizza_size
	order by Total_price desc;


select pizza_category,sum(quantity) as pizza_sold 
from pizza_sales group by pizza_category;

select top 5 pizza_name,sum(total_price) as revenue, count( distinct order_id) as total_orders
from pizza_sales 
group by pizza_name 
order by revenue desc ;

select top 5 pizza_name,cast(sum(total_price)as decimal(10,2)) as revenue, count( distinct order_id)  as total_orders
from pizza_sales 
group by pizza_name 
order by revenue asc ;

