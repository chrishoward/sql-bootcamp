// challenge 1
SELECT first_name, last_name, email
FROM customer;

// challenge 2
SELECT DISTINCT rating
FROM film;

// challenge 3
SELECT email
FROM customer
WHERE first_name = 'Nancy'
AND last_name = 'Thomas'

// challenge 4
SELECT description
FROM film
WHERE title = 'Outlaw Hanky';

// challenge 5
SELECT phone
FROM address
WHERE address = '259 Ipoh Drive' OR address2 = '259 Ipoh Drive';

// practice
SELECT COUNT(DISTINCT length)
FROM film;

// practice
SELECT *
FROM film
LIMIT 5;

// challenge 6
SELECT customer_id, amount
FROM payment
ORDER BY amount DESC
LIMIT 10;

// challenge 7
SELECT film_id, title
FROM film
ORDER BY film_id ASC
LIMIT 5;

