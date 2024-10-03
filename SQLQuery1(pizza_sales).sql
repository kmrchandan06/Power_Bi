Select * from pizza_sales

1. Total Revenue:

Select sum(total_price) Toal_Revenue from pizza_sales

2. Average Order Value

Select Sum(total_price) / Count(Distinct order_id) Average_Order_Value from pizza_sales

3. Total Pizzas Sold

Select Sum(quantity) Total_Pizza_Sold from pizza_sales

4. Total Orders

Select Count(Distinct order_id) Total_order from pizza_sales

5. Average Pizzas Per Order

Select Cast(Cast(Sum(quantity) AS Decimal (10,2)) / Cast(Count(Distinct order_id) AS Decimal(10,2)) As Decimal(10,2)) Average_Pizzas_per_Order fROM pizza_sales


B. Daily Trend for Total Orders

Select DATENAME(DW,order_date) Order_Day, Count(Distinct order_id) Total_Orders from pizza_sales
Group By DATENAME(DW,order_date)

C. Monthly Trend for Orders

Select DATENAME(Month,order_date) Order_Month, Count(Distinct order_id) Total_Orders from pizza_sales
Group By DATENAME(Month,order_date)

D. % of Sales by Pizza Category

Select pizza_category, Cast(Sum(total_price)*100 / (Select Sum(total_price)  from pizza_sales) AS Decimal(10,2)) Percentage_Pizza_Category from pizza_sales
Group By pizza_category

E. % of Sales by Pizza Size

Select pizza_size, Cast(Sum(total_price)*100 / (Select Sum(total_price) from pizza_sales) As Decimal(10,2)) Percentage_Pizza_Size from pizza_sales
Group By pizza_size

F. Total Pizzas Sold by Pizza Category

Select pizza_category, Sum(quantity) Total_Pizza_by_Category From pizza_sales
Group By pizza_category

G. Top 5 Pizzas by Revenue

Select Top 5 pizza_name, Cast(Sum(total_price) AS Decimal(10,2)) Total_Revenue from pizza_sales
Group By pizza_name
order by Sum(total_price) desc

H. Bottom 5 Pizzas by Revenue

Select Top 5 pizza_name, Cast(Sum(total_price) AS Decimal(10,2)) Total_Revenue from pizza_sales
Group By pizza_name
order by Sum(total_price) Asc;

I. Top 5 Pizzas by Quantity

create view dat1 as select Top 5 pizza_name, Sum(quantity) Total_Quantity from pizza_sales
Group By pizza_name
Order By Sum(quantity) Asc;

J. Bottom 5 Pizzas by Quantity

Select Top 5 pizza_name, Sum(quantity) Total_Quantity from pizza_sales
Group By pizza_name
Order By Sum(quantity) Asc;

K. Top 5 Pizzas by Total Orders

Select Top 5 pizza_name, Count(DISTINCT order_id) Total_Orders from pizza_sales
Group By pizza_name
Order By Total_Orders Desc

L. Bottom 5 Pizzas by Total Orders

Select Top 5 pizza_name, Count(DISTINCT order_id) Total_Orders from pizza_sales
Group By pizza_name
Order By Total_Orders Asc;

K. Top 5 Pizzas by Total Orders With Classic Category

Select Top 5 pizza_name, Count(DISTINCT order_id) Total_Orders from pizza_sales
Where pizza_category = 'Classic'
Group By pizza_name
Order By Total_Orders Desc








