# Write your MySQL query statement below
SELECT pr.product_id, IFNULL(ROUND(SUM(price * units)/ (SELECT SUM(units) FROM UnitsSold WHERE pr.product_id = product_id), 2),0) AS average_price
FROM Prices pr
LEFT JOIN UnitsSold us
ON pr.product_id = us.product_id
WHERE purchase_date BETWEEN start_date AND end_date OR purchase_date IS NULL
GROUP BY pr.product_id;