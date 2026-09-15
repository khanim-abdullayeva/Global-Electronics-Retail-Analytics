SELECT 
	o.*, 
	c.Name,
	c.Gender,
	c.Country
FROM
	(SELECT
		CustomerKey,
		COUNT("Order Number") AS "Number of Orders"
	FROM 
		sales_analysis
	GROUP BY
		CustomerKey
	ORDER BY
		"Number of Orders" DESC) o
LEFT JOIN 
	 customers c
ON
	o.CustomerKey = c.CustomerKey
LIMIT 10;
	
-- Top 10 customers who had the highest number of orders




SELECT 
	o.*,
	s."Product Name",
	s.Category,
	c.Name,
	c.Gender,
	c.Country
FROM 
	(SELECT 
		CustomerKey,
		COUNT(DISTINCT "Order Number") AS "Number of Orders",
		SUM(Quantity * "Gross Profit USD") AS "Total Revenue"
	FROM 
		sales_analysis
	GROUP BY
		CustomerKey
	ORDER BY
		"Total Revenue" DESC) o
LEFT JOIN
	customers c
ON o.CustomerKey = c.CustomerKey
LEFT JOIN sales_analysis s
ON c.CustomerKey = s.CustomerKey
LIMIT 10;
	
	
-- Top 10 customers with the highest total revenue



SELECT 
	ROUND(SUM(Quantity * "Unit price USD")/COUNT(DISTINCT CustomerKey),2) AS "Average Revenue per Customer"
FROM 
	sales_analysis
ORDER BY
	"Average Revenue per Customer";
	
-- Average revenue per customer


