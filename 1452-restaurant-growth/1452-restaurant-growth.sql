# Write your MySQL query statement below
WITH time_diff AS (
        SELECT customer_id, visited_on,
                SUM(amount) AS total_amount,
                MIN(visited_on) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS min_date
        FROM Customer
        GROUP BY visited_on
),

updated AS(
SELECT t.customer_id, t.visited_on,
           SUM(t.total_amount) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount,
           ROUND(AVG(t.total_amount) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW), 2) AS average_amount
FROM Customer c
INNER JOIN time_diff t
ON t.customer_id = c.customer_id AND t.visited_on = c.visited_on)

SELECT u.visited_on, u.amount, u.average_amount
FROM updated u
INNER JOIN time_diff t
ON t.customer_id = u.customer_id AND t.visited_on = u.visited_on
WHERE DATEDIFF(u.visited_on, t.min_date) = 6

