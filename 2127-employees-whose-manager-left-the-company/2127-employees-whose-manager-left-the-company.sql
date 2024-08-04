# Write your MySQL query statement below
SELECT employee_id
FROM Employees e
WHERE salary < 30000
    AND manager_id IS NOT NULL
    AND (SELECT employee_id FROM Employees WHERE employee_id = e.manager_id) IS NULL
ORDER BY employee_id ASC;