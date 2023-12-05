   
 -- 1. Display all available tables in the Sakila database.1. Display all available tables in the Sakila database.   
SELECT table_name
FROM information_schema.tables
WHERE table_type='BASE TABLE'
AND table_schema = 'sakila';

-- 2. Retrieve all the data from the tables `actor`, `film` and `customer`.
USE sakila;
SELECT * FROM actor;
SELECT * FROM film;
SELECT * FROM customer;

-- 3. Retrieve the following columns from their respective tables:
-- 	- 3.1 Titles of all films from the `film` table
SELECT title FROM film;

-- 	- 3.2 List of languages used in films, with the column aliased as `language` from the `language` table
SELECT name AS language FROM language;

-- 	- 3.3 List of first names of all employees from the `staff` table
SELECT first_name AS 'First Name' FROM staff;

-- 4. Retrieve unique release years.
SELECT DISTINCT(release_year) FROM film; 

-- 5. Counting records for database insights:
-- 	- 5.1 Determine the number of stores that the company has.
SELECT count(DISTINCT(store_id)) AS 'Number of Stores' FROM store;

-- 	- 5.2 Determine the number of employees that the company has.
SELECT count(DISTINCT(staff_id)) AS 'Number of employees' FROM staff;

-- 	- 5.3 Determine how many films are available for rent and how many have been rented.
SELECT count(DISTINCT(film_id)) AS 'Films available for rent' FROM inventory;
SELECT count(rental_id) AS 'Amount of rentals' FROM rental;

-- 	- 5.4 Determine the number of distinct last names of the actors in the database.
SELECT count(DISTINCT(last_name)) AS 'Amount of unique last names' FROM actor;

-- 6. Retrieve the 10 longest films.
SELECT title, length FROM film
ORDER BY length DESC
LIMIT 10;

-- 7.  Use filtering techniques in order to:
-- 	- 7.1 Retrieve all actors with the first name "SCARLETT".
SELECT actor_id, first_name, last_name FROM actor
WHERE first_name = 'SCARLETT';

-- 	BONUS: 
-- 	- 7.2 Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes. 
-- 		- *Hint: use `LIKE` operator. [More information here.](https://www.w3schools.com/sql/sql_like.asp)*
SELECT title, length FROM film
WHERE title LIKE '%ARMAGEDDON%' AND length > 100;

SELECT title, length FROM film
WHERE title regexp('ARMAGEDDON') AND length > 100;

-- 	- 7.3 Determine the number of films that include Behind the Scenes content
SELECT DISTINCT(special_features) FROM film;  -- > checking if there are any other key-words for Behind the Scenes
SELECT count(DISTINCT(title)) FROM film
WHERE special_features LIKE '%Behind the Scenes%';