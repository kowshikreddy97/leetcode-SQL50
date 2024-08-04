# Write your MySQL query statement below
SELECT 
    e.employee_id, 
    e.name, 
    COUNT(e2.employee_id) AS reports_count, 
    ROUND(AVG(e2.age),0) AS average_age
FROM Employees e
INNER JOIN Employees e2
    ON e2.reports_to = e.employee_id
Group by e.employee_id, e.name
ORDER BY e.employee_id;