# Write your MySQL query statement below

WITH user_h_rating AS (
    SELECT u.name, COUNT(m.rating) AS ratings_count
    FROM MovieRating m
    INNER JOIN Users u
    USING(user_id)
    GROUP BY m.user_id, u.name
    ORDER BY ratings_count DESC, u.name ASC
    LIMIT 1
),

highest_average AS (
    SELECT mv.title, AVG(m.rating) AS avg_rating
    FROM MovieRating m
    INNER JOIN Movies mv
    USING(movie_id)
    WHERE EXTRACT(month from created_at) = 2
            AND EXTRACT(year from created_at) = 2020
    GROUP BY m.movie_id
    ORDER BY avg_rating DESC, mv.title ASC
    LIMIT 1
)

SELECT name AS results
FROM user_h_rating
UNION ALL
SELECT title
FROM highest_average;