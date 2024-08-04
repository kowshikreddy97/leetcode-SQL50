# Write your MySQL query statement below
WITH greater_than_one_tivs AS (
    SELECT tiv_2015
    FROM Insurance 
    GROUP BY tiv_2015
    HAVING COUNT(pid) > 1
),

finding_unique_locations AS (
    SELECT tiv_2016
    FROM Insurance i
    WHERE tiv_2015 IN (SELECT tiv_2015 FROM greater_than_one_tivs)
          AND (lat,lon) NOT IN (SELECT lat, lon FROM Insurance WHERE pid != i.pid)
)

SELECT ROUND(SUM(tiv_2016),2) AS tiv_2016
FROM finding_unique_locations;