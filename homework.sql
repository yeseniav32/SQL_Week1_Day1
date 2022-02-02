--Question 1:
--How many actors are there with the last name ‘Wahlberg’? 
--Answer: 2
SELECT last_name, COUNT(last_name)
FROM actor
WHERE last_name LIKE 'Wahlberg'
GROUP BY last_name;

--Question 2:
--How many payments were made between $3.99 and $5.99?
--Answer: 5607
SELECT amount, COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND  5.99
GROUP BY ROLLUP(amount)

--Question 3:
--What film does the store have the most of? (search in inventory) 
--Answer: There are 72 films with the most inventory
SELECT film_id, COUNT(film_id)
FROM inventory
GROUP BY film_id
ORDER BY COUNT(film_id) DESC;

--Question 4:
--How many customers have the last name ‘William’? 
--Answer: None
SELECT first_name, last_name
FROM customer
WHERE last_name LIKE 'William'

--Question 5:
--What store employee (get the id) sold the most rentals?
--Answer: staff 1
SELECT staff_id, district, COUNT (DISTINCT rental_id)
FROM rental
GROUP BY staff_id;

--Question 6:
-- How many different district names are there? 
--Answer:
SELECT city_id, COUNT(DISTINCT district)
FROM address
GROUP BY ROLLUP(city_id)

--Question 7:
-- What film has the most actors in it? (use film_actor table and get film_id) 8. From store_id 1, 
--Answer: film 508
SELECT film_id, COUNT(actor_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(actor_id) DESC;

--Question 8:
--How many customers have a last name ending with ‘es’? (use customer table) 
--Answer: 13
SELECT COUNT(last_name)
FROM customer
WHERE last_name LIKE '%es' AND store_id = '1'

--Question 9:
-- How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250) 
--Answer: 1,257
SELECT amount, COUNT(amount)
FROM payment
WHERE customer_id BETWEEN 380 AND  430 
GROUP BY ROLLUP(amount)
HAVING COUNT(rental_id) > 250;

--Question 10:
-- Within the film table, how many rating categories are there? And what rating has the most  movies total?
--Answer: 5 rating categories, rating with the most movies is PG-13
SELECT rating, COUNT(title)
FROM FILM
GROUP BY rating
ORDER BY COUNT(title) DESC;