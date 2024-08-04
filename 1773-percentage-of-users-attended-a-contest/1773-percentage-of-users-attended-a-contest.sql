# Write your MySQL query statement below
SELECT contest_id, ROUND((COUNT(Register.user_id)/(SELECT COUNT(*) FROM Users))*100, 2) AS percentage
FROM Users
INNER JOIN Register
ON Users.user_id = Register.user_id
GROUP BY contest_id
ORDER BY percentage DESC, contest_id ASC;