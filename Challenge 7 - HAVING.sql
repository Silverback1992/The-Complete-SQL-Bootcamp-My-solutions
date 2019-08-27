--Challenge 7 - HAVING

/*
We want to know what customers are eligible for our platinum credit card.
The requirements are that the customer has at least a total of 40 transaction payments.
*/
--Checking Table
SELECT *
FROM customer
LIMIT 1;

SELECT *
FROM payment
LIMIT 1;

--Solution
SELECT payment.customer_id, first_name, last_name, email, COUNT(amount)
FROM payment
JOIN customer ON payment.customer_id = customer.customer_id
GROUP BY payment.customer_id, first_name, last_name, email
HAVING COUNT(amount) >= 40;

--When grouped by rating, what movie ratings have an average rental duration of more than 5 days?
--Checking Table
SELECT *
FROM film
LIMIT 1;

--Solution
SELECT rating, ROUND(AVG(rental_duration),2)
FROM film
GROUP BY rating
HAVING AVG(rental_duration) > 5;