-- Подсчет маржинальности по регионам в динамике
WITH region_sales AS (
	SELECT "Region", EXTRACT(YEAR FROM order_date) AS year, SUM("Sales") AS total_sales, SUM("Profit") AS total_profit
	FROM samplesuperstore s 
	GROUP BY EXTRACT(YEAR FROM order_date), "Region" 
)
SELECT year AS "Год", "Region" AS "Регион", total_sales AS "Общие продажи", total_profit AS "Общая прибыль",
ROUND((total_profit * 100 / total_sales)::numeric, 2) AS "Маржа"
FROM region_sales
ORDER BY year Ы