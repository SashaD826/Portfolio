select * from bike_sales3

/* Creating a new table, so I always have raw, original, unchanged data */
CREATE TABLE `bike_sales2` (
  `ï»¿Sales_Order #` text,
  `Date` text,
  `Day` int DEFAULT NULL,
  `Month` text,
  `Year` int DEFAULT NULL,
  `Customer_Age` int DEFAULT NULL,
  `Age_Group` text,
  `Customer_Gender` text,
  `Country` text,
  `State` text,
  `Product_Category` text,
  `Sub_Category` text,
  `Product_Description` text,
  `Order_Quantity` int DEFAULT NULL,
  `Unit_Cost` text,
  `Unit_Price` text,
  `Profit` text,
  `Cost` text,
  `Revenue` text,
  `MyUnknownColumn` text,
  `MyUnknownColumn_[0]` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into bike_sales2
select * from bike_sales

/* Changing a data type to date */
Alter table bike_sales2
modify column Date Date

/* Updating missing values */
UPDATE bike_sales2
SET Unit_price = '$769.00'
WHERE order_id = '000261702' 

UPDATE bike_sales2
SET Revenue = '$769.00'
WHERE order_id = '000261702' 

UPDATE bike_sales2
SET Unit_cost = '$1,252.00', Cost = '$2,504.00'
WHERE order_id = '000261699'

Alter table bike_sales2
rename column `ï»¿Sales_Order #` to order_id

/* Searching for Duplicates */
with cte1 as (
select *, row_number() over (partition by order_id, Date, Day, Month, Year, Customer_Age, Age_Group, Customer_Gender, Country, State, Product_Category, Sub_Category, Product_Description, Order_Quantity, Unit_Cost, Unit_Price, Profit, Cost, Revenue Order by order_id) as row_nmbr
from bike_sales2
)
select order_id, row_nmbr from cte1
where row_nmbr > 1

/* One duplicate was found, check the sum of orders */
with cte2 as (
Select order_id, count(*) as nmbr_order from bike_sales2
group by order_id
)
select sum(nmbr_order) from cte2

/* There was a typo in Order_id */
UPDATE bike_sales2
SET order_id = '000261696'
WHERE order_id = '000261695' and Customer_Gender = 'M'

/* Deleting unknown empty columns */
Alter table bike_sales2
drop column `MyUnknownColumn`
drop column `MyUnknownColumn_[0]`

Select distinct product_description from bike_sales2
order by product_description

/* One more typo */
UPDATE bike_sales2
SET month = 'December'
WHERE order_id = '000261711'

UPDATE bike_sales2
SET Country = 'United States'
WHERE Country like '%United%States%'

/* Make sure there are no numerical mistakes */
with cte as (
select order_id, Profit, Unit_price * Order_Quantity - Unit_Cost * Order_Quantity as profit2 from bike_sales3
)
select order_id, profit from cte
where profit = profit2

with cte as (
select order_id, Cost, Unit_Cost * Order_Quantity as cost2 from bike_sales3
)
select order_id from cte
where cost != cost2

with cte as (
select order_id, Revenue, Unit_price * Order_Quantity as revenue2 from bike_sales3
)
select order_id from cte
where revenue != revenue2

/* Creating a new table to get rid of the duplicate row */
CREATE TABLE `bike_sales3` (
  `order_id` text,
  `Date` date DEFAULT NULL,
  `Day` int DEFAULT NULL,
  `Month` text,
  `Year` int DEFAULT NULL,
  `Customer_Age` int DEFAULT NULL,
  `Age_Group` text,
  `Customer_Gender` text,
  `Country` text,
  `State` text,
  `Product_Category` text,
  `Sub_Category` text,
  `Product_Description` text,
  `Order_Quantity` int DEFAULT NULL,
  `Unit_Cost` text,
  `Unit_Price` text,
  `Profit` text,
  `Cost` text,
  `Revenue` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into bike_sales3
select distinct * from bike_sales2

/* One more duplicate check, just to be sure */ 
with cte1 as (
select *, row_number() over (partition by order_id, Date, Day, Month, Year, Customer_Age, Age_Group, Customer_Gender, Country, State, Product_Category, Sub_Category, Product_Description, Order_Quantity, Unit_Cost, Unit_Price, Profit, Cost, Revenue Order by order_id) as row_nmbr
from bike_sales3
)
select order_id, row_nmbr from cte1
where row_nmbr > 1

with cte2 as (
Select order_id, count(*) as nmbr_order from bike_sales3
group by order_id
)
select sum(nmbr_order) from cte2

Update bike_sales3
set Revenue = '$3,076.00'
where order_id = '000261702'

/* Deleting unnecessary dollar symbol, so I can change data type to decimal */
UPDATE bike_sales3
SET Unit_Cost = REPLACE(Unit_Cost, '$', ''),
Unit_Price = REPLACE(Unit_Price, '$', ''),
Profit = REPLACE(Profit, '$', ''),
Cost = REPLACE(Cost, '$', ''),
Revenue = REPLACE(Revenue, '$', '')

/* Get rid of commas, so data change will be possible */
UPDATE bike_sales3
SET Unit_cost = REPLACE(Unit_cost, ',', ''),
Unit_price = REPLACE(Unit_price, ',', ''),
Profit = REPLACE(Profit, ',', ''),
Cost = REPLACE(Cost, ',', ''),
Revenue = REPLACE(Revenue, ',', '')

/* Changing the data type */        
Alter table bike_sales3
modify column Unit_cost Decimal(10, 2),
modify column Unit_price Decimal(10, 2),
modify column Profit Decimal(10, 2),
modify column Cost Decimal(10, 2),
modify column Revenue Decimal(10, 2)

Update bike_sales3
set Customer_gender = 'Male'
where customer_gender = 'M'


/* Rolling Total, average Revenue per day */
with cte as (
Select Date, round(Sum(Revenue), 1) as revenue_per_day
from bike_sales3
group by Date
)
select Date, 
revenue_per_day,
round(avg(revenue_per_day) over (), 1) as avg_revenue_per_day,
sum(revenue_per_day) over (order by date rows between unbounded preceding and current row) AS rolling_total
from cte
order by date

/* Revenue per Country */
Select Country, round(avg(Revenue), 2) as avg_order_revenue, round(100 * Sum(revenue)/ sum(sum(Revenue)) over (), 2) as revenue_percentage from bike_sales3
Group by Country
Order by revenue_percentage desc

/* Revenue by Age Group */
Select Age_Group, round(avg(Revenue), 2) as avg_order_revenue, round(100 * Sum(Revenue)/ sum(sum(Revenue)) over (), 2) as revenue_percentage from bike_sales3
Group by Age_Group
Order by revenue_percentage desc

/* The most popular product*/ 
Select Product_Description, 
Count(Order_Quantity) as product_ordered
from bike_sales3
Where Product_Description is not null
Group by Product_Description
Order by product_ordered desc
