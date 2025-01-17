# Write your MySQL query statement below
WITH more_reviews AS (
    SELECT name, COUNT(movie_id) as movies_count
    FROM Users 
    JOIN MovieRating
    USING (user_id)
    GROUP BY user_id
    ORDER BY movies_count DESC, name ASC
    LIMIT 1
),

highest_average AS (
    SELECT movie_id, title, AVG(rating) AS avg_rating
    FROM MovieRating
    JOIN Movies
    USING (movie_id)
    WHERE EXTRACT(month FROM created_at) = 2
            AND EXTRACT(year FROM created_at) = 2020
    GROUP BY movie_id
    ORDER BY avg_rating DESC, title ASC
    LIMIT 1
)

SELECT name AS results
FROM more_reviews
UNION ALL
SELECT title
FROM highest_average;