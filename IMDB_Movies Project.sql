use project_movie_database;
-- Can you get all data about movies?
select * from movies;

-- How do you get all data about directors?
select * from directors;

-- Check how many movies are present in IMDB.
select count(original_title) from movies;

-- Find these 3 directors: James Cameron ; Luc Besson ; John Woo
select * from directors where name in('james Cameron','Luc Besson','John Woo');

-- Find all directors with name starting with S.
select * from directors where name like 's%';

-- Count female directors.
select count(*) As Female_director from directors where gender=1;

-- Find the name of the 10th first women directors?
SELECT name FROM directors WHERE gender = 1 ORDER BY id ASC LIMIT 1 OFFSET 9;

-- What are the 3 most popular movies?
select original_title,popularity from movies order by popularity desc limit 3;

-- What are the 3 most bankable movies?
select title,budget from movies order by budget desc limit 3;

-- What is the most awarded average vote since the January 1st, 2000?
SELECT title, vote_average, release_date FROM movies WHERE release_date >= '2000-01-01' ORDER BY vote_average DESC LIMIT 3;

-- Which movie(s) were directed by Brenda Chapman?
SELECT m.title As Movies_Title
FROM movies m
JOIN directors d
ON m.director_id = d.id
WHERE d.name = 'Brenda Chapman';

-- Which director made the most movies?
SELECT d.name AS director_name,
COUNT(m.title) AS movie_count
FROM directors d
JOIN movies m
ON d.id = m.director_id
GROUP BY d.name
ORDER BY movie_count DESC
LIMIT 1;

-- Which director is the most bankable?
SELECT d.name AS director_name,
SUM(m.revenue) AS total_revenue
FROM directors d
JOIN movies m
ON d.id = m.director_id
GROUP BY d.name
ORDER BY total_revenue DESC
LIMIT 1;
