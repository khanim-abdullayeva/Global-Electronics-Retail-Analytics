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