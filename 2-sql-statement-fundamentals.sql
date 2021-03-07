-- challenge 1
SELECT first_name, last_name, email
FROM customer;

-- challenge 2
SELECT DISTINCT rating
FROM film;

-- challenge 3
SELECT email
FROM customer
WHERE first_name = 'Nancy'
AND last_name = 'Thomas';

-- challenge 4
SELECT description
FROM film
WHERE title = 'Outlaw Hanky';

-- challenge 5
SELECT phone
FROM address
WHERE address = '259 Ipoh Drive' OR address2 = '259 Ipoh Drive';

-- practice
SELECT COUNT(DISTINCT length) -- or SELECT COUNT(DISTINCT(length))
FROM film;

SELECT *
FROM film
LIMIT 5;

-- challenge 6
SELECT customer_id, amount
FROM payment
ORDER BY amount DESC
LIMIT 10;

-- challenge 7
SELECT film_id, title
FROM film
ORDER BY film_id ASC
LIMIT 5;

-- practice
SELECT inventory_id, film_id
FROM inventory
WHERE inventory_id
BETWEEN 3 AND 9;

SELECT *
FROM film
WHERE rating
IN ('G','PG');

SELECT *
FROM film
WHERE rating
NOT IN ('G','PG');

SELECT *
FROM country
WHERE country
LIKE 'Aus%';

SELECT *
FROM country
WHERE country
ILIKE '%IA';

SELECT description
FROM film
WHERE description NOT LIKE '_ %';

-- challenge 8
SELECT COUNT(*)
FROM payment
WHERE amount > 5.00;

-- challenge 9
SELECT COUNT(*)
FROM actor
WHERE first_name LIKE 'P%';
             
-- challenge 10
SELECT COUNT(DISTINCT(district))
FROM address;

-- challenge 11
SELECT DISTINCT(district)
FROM address;

-- challenge 12
SELECT COUNT(*)
FROM film
WHERE rating = 'R'
AND replacement_cost BETWEEN 5 AND 15;

-- challenge 13
SELECT COUNT(*)
FROM film
WHERE title LIKE '%Truman%';

-- practice
SELECT MIN(rental_rate)
FROM film;

SELECT MAX(rental_rate)
FROM film;

SELECT MIN(rental_rate), MAX(rental_rate)
FROM film;

SELECT ROUND(AVG(rental_rate),2)
FROM film;

SELECT SUM(rental_rate)
FROM film;

SELECT release_year, rental_duration, SUM(replacement_cost)
FROM film
GROUP BY release_year, rental_duration
ORDER BY rental_duration ASC;

-- challenge 14
SELECT staff_id, COUNT(payment_id)
FROM payment
WHERE staff_id IN (1,2)
GROUP BY staff_id
ORDER BY staff_id ASC;

-- challenge 15
SELECT rating, ROUND(AVG(replacement_cost), 2)
FROM film
GROUP BY rating
ORDER BY ROUND(AVG(replacement_cost), 2) ASC;

-- challenge 16
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 5;

-- challenge 17
SELECT customer_id, COUNT(payment_id)
FROM payment
GROUP BY customer_id
HAVING COUNT(payment_id) >= 40;

-- challenge 18
SELECT customer_id, SUM(amount)
FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) > 100;

-- assessment 1
SELECT customer_id, SUM(amount)
FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) >= 110;

SELECT COUNT(*)
FROM film
WHERE title LIKE 'J%'

SELECT *
FROM customer
WHERE first_name LIKE 'E%'
AND address_id < 500
ORDER BY customer_id DESC
LIMIT 1;


