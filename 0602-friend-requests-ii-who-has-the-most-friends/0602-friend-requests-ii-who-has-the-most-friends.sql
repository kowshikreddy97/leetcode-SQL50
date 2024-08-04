# Write your MySQL query statement below
WITH requesters_list AS (
    SELECT requester_id, COUNT(accepter_id) AS req_count
    FROM RequestAccepted
    GROUP BY requester_id
    UNION ALL
    SELECT accepter_id, COUNT(requester_id) AS accp_count
    FROM RequestAccepted
    GROUP BY accepter_id 
)

SELECT requester_id AS id, SUM(req_count) AS num
FROM requesters_list
GROUP BY requester_id
ORDER BY num DESC
LIMIT 1;