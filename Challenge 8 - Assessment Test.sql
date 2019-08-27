--Assessment Test 1

/*
Return the customer IDs of customers who have spent at least
$110 with the staff member who has an ID of 2.
*/

--Checking Tables
SELECT *
FROM payment
LIMIT 1;

SELECT *
FROM customer
LIMIT 1;

--Solution
SELECT payment.customer_id, first_name, last_name
FROM payment
JOIN customer ON payment.customer_id = customer.customer_id
WHERE staff_id = 2
GROUP BY payment.customer_id, first_name, last_name
HAVING SUM(amount) >= 110

--How many films begin with the letter J?
--Checking Tables
SELECT *
FROM film
LIMIT 1;

--Solution
SELECT COUNT(*)
FROM film
WHERE title LIKE 'J%'; 

/*
What customer has the highest customer ID number whose
name starts with an 'E' and has an address ID lower than 500?
*/
--Solution
SELECT customer_id, first_name, last_name
FROM customer
WHERE first_name LIKE 'E%' AND address_id < 500
ORDER BY customer_id DESC
LIMIT 1;





