# Write your MySQL query statement     
SELECT id, (CASE 
                WHEN mod(id, 2) != 0
                    THEN LEAD(student, 1, student) OVER(ORDER BY id)
                WHEN mod(id,2) = 0
                    THEN LAG(student) OVER(ORDER BY id) END) AS student
FROM seat
ORDER BY id