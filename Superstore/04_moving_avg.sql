-- Сглажживание продаж через скользящее среднее (3мес.)
WITH sales_month AS (
SELECT TO_CHAR(order_date, 'YYYY-MM') AS order_month,
SUM("Sales") AS monthly_sales 
FROM samplesuperstore s 
GROUP BY TO_CHAR(order_date, 'YYYY-MM')
)
SELECT order_month, monthly_sales, 
AVG(monthly_sales) OVER(ORDER BY order_month ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg_3m
FROM sales_month
ORDER BY order_month 