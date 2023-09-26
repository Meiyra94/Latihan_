-- 1. Find movie title that start with the word ‘The’
        SELECT mov_title FROM movie WHERE mov_title LIKE 'The%';

-- 2. Find movies’ title that directed by James Cameron (recommended output: director name, movie title)
        Select m.mov_title, d.dir_fname, d.dir_lname from movie m join movie_direction md on md.mov_id=m.mov_id join director d on d.dir_id = md.dir_id where d.dir_fname = 'James' and d.dir_lname = 'Cameron';

-- 3. List all first name of actor and director (only one column, no redundancy, and sorted alphabetically)
        SELECT act_fname AS all_first_name FROM actor UNION SELECT dir_fname FROM director ORDER BY all_first_name;

-- 4. Find how many Mystery, Drama, and Adventure movies in the movie table (recommended output: genre title, number of movies)
        SELECT g.gen_title, COUNT(m.mov_id) FROM movie m JOIN movie_genres mg on mg.mov_id JOIN genres g ON g.gen_id = mg.gen_id WHERE g.gen_title IN ('Mystery','Drama','Adventure') GROUP BY g.gen_title;
       
        
-- 5. Label the duration with this rule:
        -- mov_time < 100 = short movie
        -- mov_time > 130 = long movie
        -- mov_time between 100 and 130 = normal movie
        -- Then, count the movies of each label
        -- (recommended output: label duration, number of movies)
        SELECT
    CASE
        WHEN mov_time < 100 THEN 'Short movie'
        WHEN mov_time > 130 THEN 'Long movie'
        ELSE 'Normal movie'
    END AS Duration,
    COUNT(*) AS Jml_film
    FROM movie
    GROUP BY Duration;