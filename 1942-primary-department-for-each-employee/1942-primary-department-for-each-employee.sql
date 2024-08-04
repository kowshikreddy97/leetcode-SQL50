# Write your MySQL query statement below
SELECT employee_id, department_id
FROM Employee e
WHERE (primary_flag = 'N' AND (SELECT COUNT(department_id) FROM Employee WHERE employee_id = e.employee_id) = 1) 
    OR primary_flag = 'Y';