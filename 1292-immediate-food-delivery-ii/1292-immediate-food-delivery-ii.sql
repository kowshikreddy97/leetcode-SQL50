# Write your MySQL query statement below
SELECT ROUND((COUNT(CASE WHEN order_date = customer_pref_delivery_date THEN 1 END) / COUNT(*)) * 100 , 2) AS immediate_percentage 
FROM Delivery d1
INNER JOIN (SELECT customer_id, MIN(order_date) AS first_date FROM Delivery GROUP BY customer_id) AS delv2
ON d1.customer_id = delv2.customer_id
WHERE order_date = first_date;
