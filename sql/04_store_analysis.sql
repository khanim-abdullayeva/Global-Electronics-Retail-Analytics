SELECT 
	sa.*,
	st.Country
FROM
	(SELECT 
		StoreKey,
		SUM(Quantity * "Unit price USD") AS "Total Revenue"
	FROM
		sales_analysis 
	GROUP BY 
		"StoreKey") sa
LEFT JOIN
	stores st
ON
	sa.StoreKey = st.StoreKey
ORDER BY
	"Total Revenue" DESC;
	
-- Total Revenue by Store.


SELECT 
	sa.*,
	st.Country
FROM
	(SELECT
		StoreKey,
		SUM(Quantity * "Gross Profit USD") AS "Total Profit"
	FROM
		sales_analysis 
	GROUP BY 
		"StoreKey") sa
LEFT JOIN
	stores st
ON
	sa.StoreKey = st.StoreKey
ORDER BY
	"Total Profit" DESC;
	
-- Total Profit by Store


