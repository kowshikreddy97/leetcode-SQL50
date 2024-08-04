# Write your MySQL query statement below
SELECT A1.machine_id, 
        ROUND(AVG(A2.timestamp - A1.timestamp), 3) As processing_time
FROM Activity A1
INNER JOIN (SELECT * 
            FROM Activity 
            WHERE activity_type = 'end' ) AS A2
ON A1.machine_id = A2.machine_id 
    AND A1.process_id = A2.process_id 
    AND A1.activity_type != A2.activity_type
GROUP BY A1.machine_id;
