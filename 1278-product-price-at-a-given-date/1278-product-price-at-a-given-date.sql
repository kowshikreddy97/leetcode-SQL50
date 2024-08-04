# Write your MySQL query statement below
WITH latest_date AS (
            SELECT product_id, MAX(change_date) AS lastmodified_date
            FROM Products
            WHERE change_date <= '2019-08-16'
            GROUP BY product_id
)

SELECT DISTINCT p.product_id, 
        (CASE WHEN 
                l.lastmodified_date IS NOT NULL
                THEN new_price
            ELSE 10
            END) AS price
FROM Products p
LEFT JOIN latest_date l
ON l.product_id = p.product_id
WHERE p.change_date = l.lastmodified_date OR lastmodified_date IS NULL