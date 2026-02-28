--Выбор 5 категорий с наибольшими продажами за 2017 год
WITH category_sale AS (
SELECT s."Sub-Category", SUM("Sales") AS category_sales
FROM samplesuperstore s
WHERE EXTRACT(YEAR FROM order_date) = 2017
GROUP BY "Sub-Category"
),
rank_cats AS (
SELECT "Sub-Category", category_sales, 
RANK() OVER(ORDER BY category_sales) AS rank
FROM category_sale 
)
SELECT "Sub-Category" AS "Категория", category_sales AS "Продажи", rank AS "Ранг"
FROM rank_cats
WHERE rank <= 5
ORDER BY rank;