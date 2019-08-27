--General Challenge 1

--How many payment transactions were greater than $5.00?
--Checking table
SELECT *
FROM payment
LIMIT 1;

--Solution
SELECT COUNT(amount)
FROM payment
WHERE amount > 5.00;

--How many actors have a first name that starts with the letter P?
--Checking table
SELECT *
FROM actor
LIMIT 1;

--Solution
SELECT COUNT(*)
FROM actor
WHERE first_name LIKE 'P%';

--How many unique districts are our customers from?
--Checking table
SELECT *
FROM address
LIMIT 1;

--Solution
SELECT COUNT(DISTINCT district)
From address;

--Retrieve the list of names for those distinct districs from the previous question.
--Solution
SELECT DISTINCT district
FROM address
ORDER BY district;

--How many films have a rating of R and a replacement cost between $5 and $15?
--Checking table
SELECT *
FROM film
LIMIT 1;

--Solution
SELECT COUNT(*)
FROM film
WHERE rating = 'R' AND replacement_cost BETWEEN 5 AND 15;

--How many films have the word Truman somewhere in the title?
--Solution
SELECT COUNT(*)
FROM film
WHERE title LIKE '%Truman%';