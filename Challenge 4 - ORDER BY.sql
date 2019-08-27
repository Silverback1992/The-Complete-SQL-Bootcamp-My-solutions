--Challenge 4

--Checking the structure of table
SELECT *
FROM payment
LIMIT 1;

SELECT *
FROM film
LIMIT 1;

--Solution for #1
SELECT customer_id,amount
FROM payment
ORDER BY amount DESC
LIMIT 10;

--Solution for #2
SELECT title,film_id
FROM film
ORDER BY film_id
LIMIT 5;