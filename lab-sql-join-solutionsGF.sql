
-- 1. List the number of films per `category`.

select name, count(title) from category
join film_category using(category_id)
join film using(film_id)
group by name;

-- 2. Display the first and the last names, as well as the address, of each staff member.

select first_name, last_name, address from staff
join address using(address_id);

-- 3. Display the total amount rung up by each staff member in August 2005.

select first_name, last_name, sum(amount) from staff
join payment using(staff_id)
join rental using(rental_id)
where month(rental_date)=8 and year(rental_date)=2005
group by first_name, last_name;

-- 4. List all films and the number of actors who are listed for each film.

select title, count(actor_id) from film
join film_actor using(film_id)
group by title;

-- 5. Using the `payment` and the `customer` tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.

select first_name, last_name, sum(amount) from payment
join customer using(customer_id)
group by first_name, last_name
order by last_name asc;