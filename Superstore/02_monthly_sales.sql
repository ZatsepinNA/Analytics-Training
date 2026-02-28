-- Подсчет изменения процента продаж по отношению к предыдущему месяцу

SELECT order_month, monthly_sales, prev_month_sales,
CASE WHEN prev_month_sales IS NULL THEN NULL ELSE (monthly_sales - prev_month_sales) * 100 / prev_month_sales END AS ptc,
"Segment"
FROM (
	SELECT order_month,
	monthly_sales,
	LAG(monthly_sales) OVER (PARTITION BY "Segment" ORDER BY order_month) AS prev_month_sales,
	"Segment"
	FROM (
		SELECT TO_CHAR(order_date, 'YYYY-MM') AS order_month,
		SUM("Sales") AS monthly_sales,
		"Segment"
		FROM samplesuperstore s  
		GROUP BY order_month, "Segment"
		ORDER BY order_month
		) AS sub_sub
	) AS sub_data