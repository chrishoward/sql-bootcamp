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

-- practice
SELECT title AS film_name
FROM film;

SELECT SUM(amount) AS revenue
FROM payment;

SELECT *
FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id;

SELECT *
FROM customer
FULL OUTER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE payment.customer_id IS null
OR customer.customer_id IS null;

-- return matching rows only
SELECT *
FROM film
INNER JOIN inventory
ON film.film_id = inventory.film_id;

-- return all rows, matching and non-matching
SELECT *
FROM film
FULL OUTER JOIN inventory
ON film.film_id = inventory.film_id;

-- return non-matching rows only
SELECT *
FROM film
FULL OUTER JOIN inventory
ON film.film_id = inventory.film_id
WHERE film.film_id IS null
OR inventory.inventory_id IS null;

-- return matching rows and film rows that don't have a matching inventory
SELECT *
FROM film
LEFT OUTER JOIN inventory
ON film.film_id = inventory.film_id;

-- return film rows that don't have a matching inventory only
SELECT *
FROM film
LEFT OUTER JOIN inventory
ON film.film_id = inventory.film_id
WHERE inventory.inventory_id IS null;

-- challenge 19
SELECT customer.email, address.district
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE address.district = 'California';

-- challenge 20
SELECT title
FROM film
INNER JOIN film_actor
ON film.film_id = film_actor.film_id
INNER JOIN actor
ON film_actor.actor_id = actor.actor_id
WHERE actor.first_name = 'Nick'
AND actor.last_name = 'Wahlberg';

-- challenge 21
SELECT DISTINCT(TO_CHAR(payment_date, 'MONTH'))
FROM payment;

-- challenge 22
SELECT COUNT(TO_CHAR(payment_date, 'DAY'))
FROM payment
WHERE TO_CHAR(payment_date, 'DAY') LIKE 'MONDAY%';

SELECT COUNT(*)
FROM payment
WHERE EXTRACT(DOW FROM payment_date) = 1;

-- challenge 23
SELECT *
FROM cd.facilities;

-- challenge 24
SELECT name, membercost
FROM cd.facilities;

-- challenge 25
SELECT *
FROM cd.facilities
WHERE membercost > 0;

-- challenge 26
SELECT facid, name, membercost, monthlymaintenance
FROM cd.facilities
WHERE membercost > 0
AND (membercost < monthlymaintenance / 50);

-- challenge 27
SELECT *
FROM cd.facilities
WHERE name LIKE '%Tennis%';

-- challenge 28
SELECT *
FROM cd.facilities
WHERE facid IN (1,5);

-- challenge 29
SELECT memid, surname, firstname, joindate
FROM cd.members
WHERE joindate >= '2012-09-01';

-- challenge 30
SELECT DISTINCT(surname)
FROM cd.members
ORDER BY surname ASC
LIMIT 10;

-- challenge 31
SELECT MAX(joindate)
FROM cd.members;

-- challenge 32
SELECT COUNT(*)
FROM cd.facilities
WHERE guestcost >= 10;

-- challenge 33
SELECT facid, SUM(slots) AS total_slots
FROM cd.bookings
WHERE EXTRACT(MONTH FROM starttime) = 9
AND EXTRACT(YEAR FROM starttime) = 2012
GROUP BY facid
ORDER BY SUM(slots) ASC;

-- challenge 34
SELECT facid, SUM(slots) AS total_slots
FROM cd.bookings
GROUP BY facid
HAVING SUM(slots) > 1000
ORDER BY facid ASC;

-- challenge 35
SELECT starttime, name
FROM cd.bookings AS b
INNER JOIN cd.facilities AS f
ON b.facid = f.facid
WHERE name LIKE '%Tennis Court%'
AND TO_CHAR(starttime, 'YYYY-MM-DD') = '2012-09-21'
ORDER BY starttime ASC;

-- challenge 36
SELECT starttime
FROM cd.bookings AS b
INNER JOIN cd.members AS m
ON b.memid = m.memid
WHERE m.firstname = 'David'
AND m.surname = 'Farrell';

-- practice
CREATE TABLE account(
	user_id SERIAL PRIMARY KEY,
	username VARCHAR(50) UNIQUE NOT NULL,
	password VARCHAR(50) NOT NULL,
	email VARCHAR(250) UNIQUE NOT NULL,
	created_on TIMESTAMP NOT NULL,
	last_login TIMESTAMP 
)

CREATE TABLE job(
	job_id SERIAL PRIMARY KEY,
	job_name VARCHAR(200) UNIQUE NOT NULL
)

CREATE TABLE account_job(
	user_id INTEGER REFERENCES account(user_id),
	job_id INTEGER REFERENCES job(job_id),
	hire_date TIMESTAMP
)

INSERT INTO account(username, password, email, created_on)
VALUES
	('Jose', 'password', 'jose@mail.com', CURRENT_TIMESTAMP);

INSERT INTO job(job_name)
VALUES
	('Astronaut'),
	('President');

INSERT INTO account_job(user_id, job_id, hire_date)
VALUES
	(1, 1, CURRENT_TIMESTAMP);

UPDATE account
SET last_login = CURRENT_TIMESTAMP;

UPDATE account
SET last_login = created_on;

UPDATE account_job
SET hire_date = account.created_on
FROM account
WHERE account_job.user_id = account.user_id;

UPDATE account
SET last_login = CURRENT_TIMESTAMP
RETURNING email, created_on, last_login;

INSERT INTO job(job_name)
VALUES
	('Cowboy');

DELETE FROM job
WHERE job_name = 'Cowboy'
RETURNING job_id, job_name;

