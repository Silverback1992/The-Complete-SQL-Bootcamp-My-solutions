--Challenge 6 - GROUP BY

/*
We have two staff members with Staff IDs 1 and 2.
We want to give a bonus to the staff member that handled the most payments.
How many payments did each staff member handle?
How much was the total amount processed by each staff member?
*/
--Checking Table
SELECT *
FROM staff;

SELECT *
FROM payment
LIMIT 5;

--Solution
SELECT payment.staff_id, first_name, last_name, COUNT(amount), SUM(amount)
FROM payment
JOIN staff ON payment.staff_id = staff.staff_id
GROUP BY payment.staff_id, first_name, last_name
ORDER BY payment.staff_id;

/*
Corporate headquarters is auditing our store!
They want to know the average replacement cost of movies by rating.
*/

--Checking Table
SELECT *
FROM film
LIMIT 1;

--Solution
SELECT rating, ROUND(AVG(replacement_cost),2)
FROM film
GROUP BY rating;

--We want to send coupons to the 5 customers who have spent the most amount of money.
--Checking Table
SELECT *
FROM customer
LIMIT 1;

SELECT *
FROM payment
LIMIT 1;

--Solution
SELECT payment.customer_id, first_name, last_name, email, SUM(amount)
FROM payment
JOIN customer ON payment.customer_id = customer.customer_id
GROUP BY payment.customer_id, first_name, last_name, email
ORDER BY SUM(amount) DESC
LIMIT 5;


















