-- Рассчет накопительной суммы проодажи по месяцам
SELECT order_month, monthly_sales, SUM(monthly_sales) OVER (ORDER BY order_month) AS cumulative_sales
FROM (
SELECT TO_CHAR("order_date", 'YYYY-MM') AS order_month, 
SUM("Sales") AS monthly_sales
FROM samplesuperstore 
GROUP BY order_month
) AS sub_data
ORDER BY order_month


