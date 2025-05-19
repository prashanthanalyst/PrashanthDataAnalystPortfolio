Question 1:
--Task: Create a list of all the different (distinct) replacement costs of the films.
select distinct replacement_cost from films
--Question: What's the lowest replacement cost?
select  min(replacement_cost) from film
--Answer: 9.99

/Question 2:
/*Task: Write a query that gives an overview of how many films have replacements costs 
in the following cost ranges low: 9.99 - 19.99 medium: 20.00 - 24.99 high: 25.00 - 29.99
*/
select case when replacement_cost between 9.99 and 19.99 then 'low'
when replacement_cost between 20.00 and 24.99 then 'medium'
when replacement_cost between 25.00  and 29.99 then 'high' end as Cost_range, count(*)
from film where case when replacement_cost between 9.99 and 19.99 then 'low'
when replacement_cost between 20.00 and 24.99 then 'medium'
when replacement_cost between 25.00  and 29.99 then 'high' end ='low' group by Cost_range

--Question: How many films have a replacement cost in the "low" group?
select case when replacement_cost between 9.99 and 19.99 then 'low'
when replacement_cost between 20.00 and 24.99 then 'medium'
when replacement_cost between 25.00  and 29.99 then 'high' end as Cost_range, count(*)
from film where case when replacement_cost between 9.99 and 19.99 then 'low'
when replacement_cost between 20.00 and 24.99 then 'medium'
when replacement_cost between 25.00  and 29.99 then 'high' end ='low' group by Cost_range
--Answer: 514

Question 3
/*Task: Create a list of the film titles including their title, length, and category name 
ordered descendingly by length. Filter the results to only the movies
in the category 'Drama' or 'Sports'.*/
select title, length, cc.name  from film f inner join film_category c on 
f.film_id= c.film_id join category cc on cc.category_id= c.category_id where cc.name = 'Drama' or cc.name ='Sports'
group by title, length, cc.name order by length desc

--Question: In which category is the longest film and how long is it?
select cc.name , max(length)  from film f inner join film_category c on 
f.film_id= c.film_id join category cc on cc.category_id= c.category_id where cc.name = 'Drama' or cc.name ='Sports'
group by title, cc.name order by max(length) desc limit 1

Question 4:
--Task: Create an overview of how many movies (titles) there are in each category (name).
select c.name, count(*) from film f join film_category fc on f.film_id=fc.film_id join category c
on fc.category_id = c.category_id group by c.name

--Question: Which category (name) is the most common among the films?
select c.name, count(*) from film f join film_category fc on f.film_id=fc.film_id join category c
on fc.category_id = c.category_id group by c.name order by count(*) desc limit 1
Answer: Sports with 74 titles

Question 5:
--Task: Create an overview of the actors' first and last names and in how many movies they appear in.*/
select first_name, last_name, count(*) from actor a join film_actor fa on a.actor_id=fa.actor_id join film f
on f.film_id=fa.film_id group by first_name, last_name

--Question: Which actor is part of most movies??
select first_name, last_name, count(*) from actor a join film_actor fa on a.actor_id=fa.actor_id join film f
on f.film_id=fa.film_id group by first_name, last_name order by count(*) desc limit 1
Answer: Susan Davis with 54 movies

Question 6:
--Task: Create an overview of the addresses that are not associated to any customer.
select * from address a left join customer c on a.address_id= c.address_id where customer_id is null

--Question: How many addresses are that?
select count(*) from address a left join customer c on a.address_id= c.address_id where customer_id is null
Answer: 4

Question 7:
--Task: Create the overview of the sales  to determine the from which city (we are interested in the city in which the customer lives, not where the store id) most sales occur.
select city.city, sum(amount) from payment p join customer c on p.customer_id=c.customer_id 
join address a on c.address_id= a.address_id join city  on city.city_id = a.city_id group by city.city order by sum(amount) desc

--Question: What city is that and how much is the amount?
select city.city, sum(amount) from payment p join customer c on p.customer_id=c.customer_id 
join address a on c.address_id= a.address_id join city  on city.city_id = a.city_id group by city.city order by sum(amount) desc limit 1
Answer: Cape Coral with a total amount of 221.55

Question 8:
--Task: Create an overview of the revenue (sum of amount) grouped by a column in the format "country, city".
select country ||','|| city as Country_city, sum(amount) from payment p join customer c on p.customer_id= c.customer_id
join address a  on a.address_id=c.address_id join city on city.city_id=a.city_id join country on
country.country_id=city.country_id group by Country_city order by sum(amount) desc

--Question: Which country, city has the least sales?
select country ||','|| city as Country_city, sum(amount) from payment p join customer c on p.customer_id= c.customer_id
join address a  on a.address_id=c.address_id join city on city.city_id=a.city_id join country on
country.country_id=city.country_id group by Country_city order by sum(amount) asc limit 1
--Answer: United States, Tallahassee with a total amount of 50.85.

Question 9:
--Task: Create a list with the average of the sales amount each staff_id has per customer.
select staff_id, avg(total) from (select staff_id, customer_id, sum(amount) as total from payment  
group by staff_id,customer_id order by customer_id) as subquery group by staff_id

--Question: Which staff_id makes on average more revenue per customer?
select staff_id, avg(total) from (select staff_id, customer_id, sum(amount) as total from payment  
group by staff_id,customer_id order by customer_id) as subquery group by staff_id limit 1
--Answer: staff_id 2 with an average revenue of 56.64 per customer.

Question 10:
--Task: Create a query that shows average daily revenue of all Sundays.
select round(avg(total),2) from(select Date(payment_date), extract(dow from payment_date), 
sum(amount) as total  from payment where extract(dow from payment_date) = 0 
group by Date(payment_date), extract(dow from payment_date)) as sub 

--Question: What is the daily average revenue of all Sundays?
select round(avg(total),2) from(select Date(payment_date), extract(dow from payment_date), 
sum(amount) as total  from payment where extract(dow from payment_date) = 0 
group by Date(payment_date), extract(dow from payment_date)) as sub 
Answer: 1410.65

Question 11:
--Task: Create a list of movies - with their length and their replacement cost - that are longer than the average length in each replacement cost group.
select title, length, replacement_cost from film f1 where length > 
(select avg(length) from film f2 where f1.replacement_cost=f2.replacement_cost)
group by title, length, replacement_cost

--Question: Which two movies are the shortest on that list and how long are they?
select title, length from film f1 where length > 
(select avg(length) from film f2 where f1.replacement_cost=f2.replacement_cost)
group by title, length, replacement_cost order by length asc limit 2
--Answer: CELEBRITY HORN and SEATTLE EXPECTATIONS with 110 minutes.

Question 12:
--Task: Create a list that shows the "average customer lifetime value" grouped by the different districts.
select district, avg(total) from (select district, c.customer_id, sum(amount) 
as total from payment p join customer c on c.customer_id=p.customer_id
join address a on a.address_id = c.address_id  group by c.customer_id, district) as subquery group by district order by district
select * from address desc

Example:
/*If there are two customers in "District 1" where one customer has a total (lifetime) spent of $1000 and the second
customer has a total spent of $2000 then the "average customer lifetime spent" in this district is $1500.
So, first, you need to calculate the total per customer and then the average of these totals per district.*/
--Question: Which district has the highest average customer lifetime value?
select district, avg(total) from (select district, c.customer_id, sum(amount) 
as total from payment p join customer c on c.customer_id=p.customer_id
join address a on a.address_id = c.address_id  group by c.customer_id, district) as 
subquery group by district order by avg(total) desc limit 1
--Answer: Saint-Denis with an average customer lifetime value of 216.54.

Question 13:

/*Task: Create a list that shows all payments including the payment_id, amount, and the 
film category (name) plus the total amount that was made in this category.
Order the results ascendingly by the category (name) and as second order criterion by the payment_id ascendingly.*/
select payment_id, amount, name, (select sum(amount) from payment p1 left join rental r
on r.rental_id= p1.rental_id left join inventory i  on i.inventory_id = r.inventory_id
left join film f on f.film_id = i.film_id left join film_category
fc on fc.film_id=f.film_id left join category c2 on
c2.category_id =fc.category_id where c1.name=c2.name) from payment p left join rental
r on r.rental_id= p.rental_id left join inventory i  on i.inventory_id = r.inventory_id
left join film f on f.film_id = i.film_id left join film_category fc 
on fc.film_id=f.film_id left join category c1 on
c1.category_id =fc.category_id

--Question: What is the total revenue of the category 'Action'?
select sum(amount) from payment p1 left join rental r 
on r.rental_id= p1.rental_id left join inventory i  on i.inventory_id = r.inventory_id
left join film f on f.film_id = i.film_id left join film_category fc
on fc.film_id=f.film_id left join category c2 on
c2.category_id =fc.category_id where name='Action'
--Answer: Total revenue in the category 'Action' is 4375.85 

question 14:
--Task: Create a list with the top overall revenue of a film title (sum of amount per title) for each category (name).
select f.title, name,  (select sum(amount) from payment p1 left join rental r
on r.rental_id= p1.rental_id left join inventory i  on i.inventory_id = r.inventory_id
left join film f on f.film_id = i.film_id left join film_category fc
on fc.film_id=f.film_id left join category c2 on
c2.category_id =fc.category_id where c1.name=c2.name) from payment p
left join rental r on r.rental_id= p.rental_id left join inventory i  on i.inventory_id = r.inventory_id
left join film f on f.film_id = i.film_id left join film_category fc
on fc.film_id=f.film_id left join category c1 on
c1.category_id =fc.category_id
select * from film

--Question: Which is the top-performing film in the animation category?
select name, total_amount from (select f.title, name, sum(amount) total_amount, rank() over(order by sum(amount) desc) as rank from payment p
left join rental r on r.rental_id= p.rental_id left join inventory i  on i.inventory_id = r.inventory_id
left join film f on f.film_id = i.film_id left join film_category fc
on fc.film_id=f.film_id left join category c1 on 
c1.category_id =fc.category_id where name='Animation' group by f.title, name) a where rank=1
--Answer: DOGMA FAMILY with 178.70.

