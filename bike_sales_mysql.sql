SELECT * FROM bike_sales3

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

INSERT INTO bike_sales2
SELECT * FROM bike_sales

/* Changing a data type to date */
ALTER TABLE bike_sales2
MODIFY column Date Date

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

ALTER TABLE bike_sales2
rename column `ï»¿Sales_Order #` to order_id

/* Searching for Duplicates */
WITH cte1 AS (
SELECT *, row_number() OVER 
    (PARTITION BY order_id, 
    Date, 
    Day, 
    Month, 
    Year, 
    Customer_Age, 
    Age_Group, 
    Customer_Gender, 
    Country, 
    State, 
    Product_Category, 
    Sub_Category, 
    Product_Description, 
    Order_Quantity, 
    Unit_Cost, 
    Unit_Price, 
    Profit, 
    Cost, 
    Revenue ORDER BY order_id) AS row_nmbr
FROM bike_sales2
)
SELECT order_id, row_nmbr FROM cte1
WHERE row_nmbr > 1

/* One duplicate was found, check the sum of orders */
WITh cte2 AS (
SELECT order_id, count(*) AS nmbr_order FROM bike_sales2
GROUP BY order_id
)
SELECT sum(nmbr_order) FROm cte2

/* There was a typo in Order_id */
UPDATE bike_sales2
SET order_id = '000261696'
WHERE order_id = '000261695' AND Customer_Gender = 'M'

/* Deleting unknown empty columns */
ALTER TABLE bike_sales2
DROP column `MyUnknownColumn`
DROP column `MyUnknownColumn_[0]`

SELECT DISTINCT product_description FROM bike_sales2
ORDER BY product_description

/* One more typo */
UPDATE bike_sales2
SET month = 'December'
WHERE order_id = '000261711'

UPDATE bike_sales2
SET Country = 'United States'
WHERE Country like '%United%States%'

/* Make sure there are no numerical mistakes */
WITH cte AS (
SELECT order_id, Profit, Unit_price * Order_Quantity - Unit_Cost * Order_Quantity as profit2 from bike_sales3
)
SELECT order_id, profit FROM cte
WHERE profit = profit2

WITH cte AS (
SELECT order_id, Cost, Unit_Cost * Order_Quantity AS cost2 FROM bike_sales3
)
SELECT order_id FROM cte
WHERE cost != cost2

WITH cte AS (
SELECT order_id, Revenue, Unit_price * Order_Quantity AS revenue2 FROM bike_sales3
)
SELECT order_id FROM cte
WHERE revenue != revenue2

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

INSERT INTO bike_sales3
SELECT DISTINCT * FROM bike_sales2

/* One more duplicate check, just to be sure */ 
WITH cte1 AS (
SELECT *, row_number() OVER (PARTITION BY order_id, Date, Day, Month, Year, Customer_Age, Age_Group, Customer_Gender, Country, State, Product_Category, Sub_Category, Product_Description, Order_Quantity, Unit_Cost, Unit_Price, Profit, Cost, Revenue Order by order_id) as row_nmbr
FROM bike_sales3
)
SELECT order_id, row_nmbr FROM cte1
WHERE row_nmbr > 1

WITH cte2 AS (
SELECT order_id, count(*) AS nmbr_order FROM bike_sales3
GROUP BY order_id
)
SELECT sum(nmbr_order) FROM cte2

UPDATE bike_sales3
SET Revenue = '$3,076.00'
WHERE order_id = '000261702'

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
ALTER TABLE bike_sales3
MODIFY column Unit_cost Decimal(10, 2),
MODIFY column Unit_price Decimal(10, 2),
MODIFY column Profit Decimal(10, 2),
MODIFY column Cost Decimal(10, 2),
MODIFY column Revenue Decimal(10, 2)

UPDATE bike_sales3
SET Customer_gender = 'Male'
WHERE customer_gender = 'M'


/* Rolling Total, average Revenue per day */
WITH cte AS (
SELECT Date, round(Sum(Revenue), 1) as revenue_per_day
FROM bike_sales3
GROUP BY Date
)
SELECT Date, 
revenue_per_day,
round(avg(revenue_per_day) OVER (), 1) as avg_revenue_per_day,
sum(revenue_per_day) OVER (ORDER BY DATE ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS rolling_total
FROM cte
ORDER BY date

/* Revenue per Country */
SELECT Country, 
        round(avg(Revenue), 2) AS avg_order_revenue, 
        round(100 * Sum(revenue)/ sum(sum(Revenue)) OVER (), 2) AS revenue_percentage 
FROM bike_sales3
GROUP BY 1
ORDER BY revenue_percentage DESC

/* Revenue by Age Group */
SELECT Age_Group, 
        round(avg(Revenue), 2) AS avg_order_revenue, 
        round(100 * Sum(Revenue)/ sum(sum(Revenue)) OVER (), 2) AS revenue_percentage 
FROM bike_sales3
GROUP BY 1
ORDER BY revenue_percentage desc

/* The most popular product*/ 
SELECT Product_Description, 
Count(Order_Quantity) AS product_ordered
FROM bike_sales3
WHERE Product_Description IS NOT NULL
GROUP BY 1
ORDER BY product_ordered DESC
