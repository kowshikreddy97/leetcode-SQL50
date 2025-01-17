# Write your MySQL query statement below
SELECT product_name, SUM(unit) AS unit
FROM Products
JOIN Orders
USING (product_id)
WHERE EXTRACT(month FROM order_date) = 2
        AND EXTRACT(year FROM order_date) = 2020
GROUP BY product_id
HAVING SUM(unit) >= 100;