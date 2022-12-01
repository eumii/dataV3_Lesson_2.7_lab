USE sakila;

# 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.

select* from film;
select * from category;
select * from film_category;

SELECT COUNT(fc.film_id) AS "num_of films", c.name AS "categories"
FROM film_category fc
JOIN category c
USING(category_id)
GROUP BY c.category_id;

#2. Display the total amount rung up by each staff member in August of 2005. (revenues from each staff member)

select* from staff;
select* from payment;

SELECT sum(p.amount) AS "total rung up", s.first_name AS "staff"
FROM payment p
JOIN staff s
USING(staff_id)
WHERE p.payment_date BETWEEN "2005-08-01" AND "2005-08-31"
GROUP BY s.staff_id;

#other solution

SELECT staff.*, SUM(payment.amount) AS "total rung up"
FROM staff 
JOIN payment 
ON staff.staff_id = payment.staff_id
WHERE YEAR(payment.payment_date) = 2005 AND MONTH(payment.payment_date) = 8
GROUP BY staff.staff_id;


# 3. Which actor has appeared in the most films?

SELECT actor.*, count(actor.actor_id) AS num_of_movies
FROM actor 
JOIN film_actor
USING(actor_id)
# GROUP BY num_of_movies;
group by actor.actor_id
ORDER BY num_of_movies DESC
LIMIT 1;


# 4. Most active customer (the customer that has rented the most number of films)

SELECT customer.*, count(payment.customer_id) AS num_of_rents, sum(payment.amount) AS amount_paid
FROM payment
JOIN customer
USING(customer_id)
group by customer.customer_id
ORDER BY num_of_rents DESC
LIMIT 1;

# 5. Display the first and last names, as well as the address, of each staff member.

Select address2 From address;
Select address From address;


SELECT staff.first_name, staff.last_name, address.address
FROM staff
JOIN address
USING(address_id);

# 6. List each film and the number of actors who are listed for that film.

SELECT COUNT(film_actor.actor_id) AS nums_of_actors, film.title 
FROM film
JOIN film_actor
USING(film_id)
GROUP BY film.title
ORDER BY nums_of_actors DESC;

SELECT * from film
where tilte like "%cincinatti";

# 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

SELECT customer.*, SUM(payment.amount) AS amount_paid
FROM payment
JOIN customer
using(customer_id)
GROUP BY (customer.last_name)
ORDER by customer.last_name ASC;



