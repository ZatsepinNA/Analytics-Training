--  Подсчет доли каждого сегмента в общих продажах за год
WITH sales AS (
	SELECT EXTRACT(YEAR FROM order_date) AS year,
	"Segment", SUM("Sales") AS total_sales
	FROM samplesuperstore s 
	GROUP BY EXTRACT(YEAR FROM order_date), "Segment"
),
grouped_sales AS (
	SELECT year, "Segment",
	total_sales,
	SUM(total_sales) OVER (PARTITION BY year) AS year_sales
	FROM sales
)
SELECT year AS "Год", "Segment" AS "Сегмент",
total_sales AS "Продажи за год",
ROUND((total_sales * 100.0 / year_sales)::numeric, 2) AS "Процент продаж сегмента"
FROM grouped_sales
ORDER BY year, "Segment"