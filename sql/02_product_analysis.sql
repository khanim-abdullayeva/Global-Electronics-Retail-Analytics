SELECT 
    "Product Name",
    SUM(Quantity * "Unit Price USD") AS "Total Revenue"
FROM 
	sales_analysis
GROUP BY 
	"Product Name"
ORDER BY 
	"Total Revenue" DESC
LIMIT 10;


-- Top 10 products by revenue




SELECT 
    "Product Name",
    SUM(Quantity * ("Unit Price USD" - "Unit Cost USD")) AS "Total Profit"
FROM 
	sales_analysis
GROUP BY 
	"Product Name"
ORDER BY 
	"Total Profit" DESC
LIMIT 10;

-- The top 10 products accounted for a significant share of total profit.




SELECT 
	"Product Name",
	Category,
	SUM(Quantity * ("Unit Price USD" - "Unit Cost USD")) AS "Total Profit"
FROM
	sales_analysis
GROUP BY 
	"Product Name", Category
ORDER BY
	"Total Profit" DESC;

/*
 The product that generated the highest profit was "WWI Desktop PC2.33 X2330 Black"
 whose category is "Computers"
 */
 
 
 
SELECT 
	"Product Name",
	SUM(Quantity) AS "Quantity sold"
FROM
	sales_analysis
GROUP BY 
	"Product Name"
ORDER BY 
	"Quantity sold" DESC;

 -- Products by quantity sold
 