# Write your MySQL query statement below
SELECT ROUND(COUNT(DISTINCT a1.player_id)/ (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM Activity a1
INNER JOIN (SELECT player_id, MIN(event_date) AS e_date FROM Activity GROUP BY player_id) AS a2
ON a2.player_id = a1.player_id
   AND a1.event_date <> a2.e_date
WHERE DATEDIFF(a1.event_date, a2.e_date) = 1;