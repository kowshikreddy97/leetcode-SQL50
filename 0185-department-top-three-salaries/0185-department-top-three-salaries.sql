# Write your MySQL query statement below
WITH top_3_salaries AS (
        SELECT e.name AS Employee, salary AS Salary, departmentId, d.name AS Department,
        DENSE_RANK() OVER(PARTITION BY departmentId
                            ORDER BY salary DESC) AS uniq_results
        FROM Employee e
        INNER JOIN Department d
        ON e.departmentId = d.id
)

SELECT Department, Employee, Salary
FROM top_3_salaries
WHERE uniq_results <= 3