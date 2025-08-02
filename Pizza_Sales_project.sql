select * from pizza_sales

--Total Revenue

select sum(total_price) as "Total_Revenue"
from pizza_sales

--Average Order Value

select sum(total_price) / count(distinct order_id) as "Avg. Order Value"
from pizza_sales

--Total Pizza Sold

select sum(quantity) as "Total Pizza Sold "
from pizza_sales

-- Total Order

select count(distinct order_id) as "total Order"
from pizza_sales

-- Avg.pizza's per Order

select cast(sum(quantity)as decimal (10,2)) / count(distinct order_id) as "avg. pizza's per order"
from pizza_sales


-- Daily Trend For Order

select DATENAME(dw,order_date) as "Order_days", count(distinct order_id ) as "Total order"
from pizza_sales
group by DATENAME(dw,order_date)

-- NOTE -: 'DW' stands for "Day of Week". It is used to extract the weekday number (1 to 7) from a DATE value.


-- Monthly trend for Total Order 

select DATENAME(month, order_date) as "month name", count(distinct order_id ) as "Total order"
from pizza_sales
group by DATENAME(month, order_date)

-- Percenatge of sales by Pizza Category
 
 select pizza_category, cast (sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as decimal (10,2)) as PCT 
 from pizza_sales
 group by pizza_category

-- Percenatge of sales by Pizza Size

select pizza_size, cast (sum(total_price) * 100 / (select sum(total_price) from pizza_sales where month(order_date) = 3) as decimal (10,2)) as PCT 
 from pizza_sales
 where month(order_date) = 3
 group by pizza_size

 -- TOP 5 Best Seller pizza by revenue 

 select top 5 pizza_Name , sum(Total_price) as "Total Revenue" 
 from pizza_sales
 group by pizza_name
 order by [Total Revenue] DESC

 -- Bottom 5 Best Seller pizza by revenue

  select top 5 pizza_Name , sum(Total_price) as "Total Revenue" 
 from pizza_sales
 group by pizza_name
 order by [Total Revenue] ASC

  -- TOP 5 Best Seller pizza by Quantity

 select top 5 pizza_Name , sum(quantity) as "Total Quantity" 
	from pizza_sales
	group by pizza_name
	order by [Total Quantity] DESC

 -- Bottom 5 Best Seller pizza by Quantity

 select top 5 pizza_Name , sum(quantity) as "Total Quantity" 
	from pizza_sales
	group by pizza_name
	order by [Total Quantity] ASC

 -- TOP 5 Best Seller pizza by Order

 select top 5 pizza_Name , Count(distinct order_id) as "Total orders" 
	from pizza_sales
	group by pizza_name
	order by [Total orders] DESC

-- Bottom 5 Best Seller pizza by Order

 select top 5 pizza_Name , Count(distinct order_id) as "Total orders" 
	from pizza_sales
	group by pizza_name
	order by [Total orders] ASC
