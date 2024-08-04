# Write your MySQL query statement below
SELECT s.product_id, year AS first_year, quantity, price
FROM Sales s
INNER JOIN (SELECT product_id, MIN(Year) AS min_year FROM Sales GROUP BY product_id) sale2
ON s.product_id = sale2.product_id
    AND year = min_year;
