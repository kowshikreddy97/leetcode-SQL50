# Write your MySQL query statement below
SELECT q1.person_name
FROM Queue q1
INNER JOIN (SELECT person_id,
            SUM(weight) OVER(ORDER BY turn) AS Total_weight
            FROM Queue) AS Que2
USING(person_id)
WHERE Total_weight <=1000
ORDER BY Que2.Total_weight DESC
LIMIT 1;