--Challenge 3

--Checking the structure of table
SELECT *
FROM customer
LIMIT 1;

SELECT *
FROM film
LIMIT 1;

SELECT *
FROM address
LIMIT 1;

--Solution for #1
SELECT email
FROM customer
WHERE first_name = 'Nancy' AND last_name = 'Thomas';

--Solution for #2
SELECT description
FROM film
WHERE title = 'Outlaw Hanky';

--Solution for #3
SELECT phone
FROM address
WHERE address = '259 Ipoh Drive';