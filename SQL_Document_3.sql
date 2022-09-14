--question 1
select customer.first_name, customer.last_name, customer.email,district
from customer 
full join address 
on customer.address_id = address.address_id
where district = 'Texas'

--question 2
select customer.first_name, customer.last_name, customer.email,amount
from customer 
full join payment 
on customer.customer_id = payment.customer_id
where amount >6.99
order by amount asc

--question 3
select store_id, first_name,last_name
from customer
where customer_id in (
	select customer_id
	from payment 
	group by customer_id
	having sum(amount) > 175
	order by sum(amount) desc
)
group by store_id, first_name, last_name

--question 4
select customer.first_name, customer.last_name, customer.email, country 
from customer 
full join address 
on customer.address_id = address.address_id
full join city 
on address.city_id = city.city_id 
full join country 
on city.country_id = country.country_id
where country = 'Nepal'

--queston 5
select first_name,last_name
from staff
where staff_id in (
	select staff_id
	from payment 
	group by staff_id
	order by sum(amount) desc
)
group by first_name, last_name



--question 6
select rating, count(rating)
from film 
group by rating
order by count(rating) desc

--Question 7
SELECT store_id, first_name,last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	having avg(amount)>6.99 and count(amount)>=1
	
)

--queston 8
SELECT store_id, first_name,last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	having avg(amount)=0
	
)