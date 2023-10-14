USE rentals;
-- Question 1
-- My partner and I want to come by each of the stores in person and meet the managers. Please send over the managers' names at each store, 
-- with the full address of each property (street address, district, city, and country). 
SELECT staff_id, store_id, first_name, last_name, address, city, country
FROM address AS a
INNER JOIN city AS c
USING (city_id)
INNER JOIN country AS co
USING (country_id)
INNER JOIN store AS s
USING (address_id)
INNER JOIN staff AS st
USING (store_id);

-- Question 2
-- I would like to get a better understanding of all of the inventory that would come along with the business. 
-- Please pull together a list of each inventory item you have stocked, including the store_id number, the inventory_id, 
-- the name of the film, the film's rating, its rental rate and replacement cost
SELECT inventory_id, store_id, title, rating, rental_rate, replacement_cost
FROM inventory i
LEFT JOIN flim_1 f
ON i.film_id = f.film_id;

-- Question 3
-- From the same list of films you just pulled, please roll that data up and provide a summary level overview of your inventory. 
-- We would like to know how many inventory items you have with each rating at each store.

SELECT SUM(inventory_id) AS inventory_items, store_id,rating, title
FROM inventory i
LEFT JOIN flim_1 f
ON i.film_id = f.film_id
GROUP BY store_id, title,rating;

-- Question 4 
-- Similarly, we want to understand how diversified the inventory is in terms of replacement cost. We want to see how big of a hit it would be
-- if a certain category of film became unpopular at a certain store. We would like to see the number of films, 
-- as well as the average replacement cost, and total replacement cost, sliced by store and film category.


SELECT COUNT(inventory_id) AS number_of_films, store_id,name,
ROUND(AVG(replacement_cost),2)AS average_replacement_cost,
ROUND(SUM(replacement_cost),2) AS total_replacement_cost
FROM inventory i
JOIN flim_1 f
ON i.film_id = f.film_id
JOIN film_category c
ON i.film_id = c.film_id
JOIN category ca
ON c.category_id = ca.category_id
GROUP BY store_id,name
ORDER BY SUM(replacement_cost) DESC;

-- Question 5
-- We want to make sure you folks have a good handle on who your customers are. Please provide a list of all customer names, which store they go to, whether or not they are currently active, 
-- and their full addresses (street address, city, and country).
SELECT store_id, first_name, last_name, active, address, district, city, country 
FROM city ci
INNER JOIN customer c 
ON ci.city_id = c.customer_id 
INNER JOIN address a
ON ci.city_id =a.city_id 
INNER JOIN country co
ON ci.country_id =co.country_id;

-- Question 6
-- We would like to understand how much your customers are spending with you and also to know who your most valuable customers are.
--  Please pull together a list of customer names, their total lifetime rentals, and the sum of all payments you have collected from them. 
 -- It would be great to see this ordered on total lifetime value, with the most valuable customers at the top of the list.\
SELECT c.first_name, c.last_name, SUM(p.amount) AS total_lifetime_value, COUNT(r.rental_id) AS total_lifetime_rentals
FROM customer c
INNER JOIN payment p ON c.customer_id = p.customer_id
JOIN rental r ON r.rental_id = p.rental_id
GROUP BY c.first_name, c.last_name
ORDER BY total_lifetime_value DESC;

-- Question  7
-- My partner and I would like to get to know your board of advisors and any current investors. Could you please provide a list of advisor and 
-- investor names in one table? Could you please note whether they are an investor or an advisor, for the investors, 
-- it would be good to include which company they work with.
SELECT
    'advisor' AS Role,
    first_name AS First_Name,
    last_name AS Last_Name,
    NULL AS Company_Name
FROM
    advisor
UNION ALL
SELECT
    'investor' AS Role,
    first_name AS First_Name,
    last_name AS Last_Name,
    company_name AS Company_Name
FROM
    investor;

-- Question 8 
-- We're interested in how well you have covered the most-awarded actors. Of all the actors with three types of awards, 
-- for what % of them do we carry a film? And how about actors with two types of awards? Same questions. 
-- Finally, how about actors with just one award?
SELECT 
first_name,
last_name,
awards,
CASE WHEN awards LIKE 'Emmy, Oscar,%' THEN '3 awards'
WHEN awards IN ('Emmy, Oscar', 'Emmy, Tony', 'Oscar, Tony') THEN '2 awards'
ELSE '1 award'
END AS award_won
FROM award
WHERE awards IS NOT NULL
ORDER BY award_won DESC;
