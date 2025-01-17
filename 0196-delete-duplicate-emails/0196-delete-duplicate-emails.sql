# Write your MySQL query statement below
WITH min_id AS(
    SELECT MIN(id) AS first_id, email
    FROM Person
    GROUP BY email
)

DELETE FROM Person
WHERE id NOT IN (SELECT first_id FROM min_id);