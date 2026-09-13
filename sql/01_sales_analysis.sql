
DROP TABLE IF EXISTS sales_analysis;

CREATE TEMP TABLE sales_analysis AS
SELECT 
	s.*, 
	CAST(REPLACE(REPLACE("Unit Price USD", "$",""), ",","") AS DECIMAL) AS "Unit Price USD",
	CAST(REPLACE(REPLACE("Unit Cost USD", "$",""), ",","") AS DECIMAL) AS "Unit Cost USD",
	CAST(REPLACE(REPLACE("Unit Price USD", "$",""), ",","") - REPLACE(REPLACE("Unit Cost USD", "$",""), ",","") AS DECIMAL) AS "Gross Profit USD",
	p.Category,
	p."Product Name",
	p."Unit Price USD",
	p."Unit Cost USD"
FROM 
	sales s
LEFT JOIN 
	products p
ON s.ProductKey = p.ProductKey


SELECT 
	SUM(Quantity * "Unit Price USD") AS "Total Revenue"
FROM 
	sales_analysis

-- Total Revenue : $55,755,479.59 


SELECT 
	SUM("Gross Profit USD") AS "Total Profit"
FROM 
	sales_analysis

-- Total Profit: $10,332,899.86	
	
	
	
SELECT 
	Category, 
	SUM(Quantity * "Unit Price USD") AS "Total Revenue"
FROM 
	sales_analysis
GROUP BY 
	Category
ORDER BY 
	"Total Revenue" DESC

/*
 The product category that generated the highest revenue was 
 Computers, with $19,301,595.46 in total
*/


SELECT 
	ROUND((SUM("Gross Profit USD")/ SUM("Quantity" * "Unit Price USD"))*100,2)
AS 
	"Overall Profit Margin"
FROM
	sales_analysis

-- Overall Profit Margin: 18.53%



SELECT 
	"Order Number",
	Category,
	"Product Name",
	Quantity * "Gross Profit USD" AS "Total Profit USD"
FROM 
	sales_analysis
ORDER BY 
	"Total Profit USD" DESC
LIMIT 10
	
/* 
The order number that generated the highest profit was 433005 with 21397.7$ total profit 
and the category of this product was Home Apliances
*/




SELECT 
	Category, 
	SUM(Quantity * "Gross Profit USD") AS "Total Profit USD"
FROM 
	sales_analysis
GROUP BY 
	Category
ORDER BY 
	"Total Profit USD" DESC
	
/* 
The product category which generated the highest profit was Computers,
with 11,277,447.9$ in total
*/



SELECT 
	Category, 
	SUBSTR("Order Date",-4) AS Year, 
	SUM(Quantity * "Gross Profit USD") AS "Total Profit USD"
FROM 
	sales_analysis
GROUP BY 
	Category, Year
ORDER BY 
	Year ASC, "Total Profit USD" ASC

-- Analysis of total profit by year and category




CREATE TEMP TABLE order_summary AS 
    SELECT 
        "Order Number",
        COUNT(*) AS "Total Line Items",
        SUM(Quantity * "Gross Profit USD") AS "Total Profit USD"
    FROM sales_analysis
    GROUP BY "Order Number"


SELECT * FROM order_summary
ORDER BY "Total Line Item" DESC

-- Summarizes each order by total line items and total profit



SELECT 
    "Total Line Items",
    COUNT(*) AS "Order Count",
    ROUND(AVG("Total Profit USD"),2) AS "Average Profit USD",
    ROUND(MAX("Total Profit USD"),2) AS "Max Profit USD",
    ROUND(MIN("Total Profit USD"),2) AS "Min Profit USD"
FROM 
	order_summary
GROUP BY 
	"Total Line Items"
ORDER BY 
	"Total Line Items" DESC;

-- Orders with 7 line items have the highest average profit.




SELECT 
	Category, 
	ROUND(SUM(Quantity * ("Unit Price USD" - "Unit Cost USD"))/ SUM(Quantity * "Unit Price USD") *100,2) 
AS 
	"Profit Margin by Category"
FROM 
	sales_analysis
GROUP BY 
	Category

-- Profit Margin by Category = Total Profit / Total Revenue × 100 




SELECT 
    Category,
    SUM(Quantity) AS "Total Quantity",
    SUM(Quantity * "Unit Price USD") AS "Total Revenue"
FROM 
	sales_analysis
GROUP BY 
	Category
ORDER BY 
	"Total Revenue" DESC;

/*
Revenue was not directly proportional to quantity sold.
Some categories generated relatively high revenue despite having lower sales volume,
suggesting higher average selling prices per unit.
*/




WITH order_sales AS (
    SELECT
        "Order Number",
        SUM(Quantity * "Unit Price USD") AS "Order Revenue"
    FROM 
		sales_analysis
    GROUP BY 
		"Order Number"
)

SELECT 
    ROUND(AVG("Order Revenue"),2) 
AS 
	"Average Order Value"
FROM 
	order_sales;

-- Calculates the average revenue generated per order




