USE sakila;
-- 1a show table
SELECT * FROM actor;
SELECT first_name, last_name FROM actor;

-- 1b use alter to add column
SELECT CONCAT(first_name, ' ', last_name) AS 'Actor Name' FROM actor;
-- INSERT INTO Actor_Names SELECT concat(FIRST_NAME, LAST_NAME);
-- INSERT INTO actor(Actor Name) VALUES CONCAT(first_name, last_name);
 
-- 2a query
SELECT * FROM actor WHERE first_name = "Joe";
-- 2b query
SELECT * FROM actor WHERE last_name LIKE "Gen%";
-- 2c query
SELECT * FROM actor WHERE last_name LIKE "Li%";
-- use alter table to rearrange columns

-- 3a add
ALTER TABLE `sakila`.`actor` 
ADD COLUMN `Description` BLOB(25) NULL AFTER `Actor Name`; 
-- 3a delete
ALTER TABLE `sakila`.`actor` 
DROP COLUMN `Description`;

-- 4a count
SELECT last_name, COUNT(*) AS 'count' FROM actor GROUP BY last_name;
-- 4b count

-- 4c correct name
UPDATE actor SET first_name ='Harpo' WHERE (first_name ='Groucho');
-- 4c correct name
UPDATE actor SET first_name ='Groucho' WHERE (first_name ='Harpo');

-- 5a find address table
SHOW TABLES;
-- if no table, use create table

-- 6a join
SELECT staff.first_name, staff.last_name, address.address
FROM staff
JOIN address ON
staff.address_id = address.address_id;
-- 6b join
SELECT staff.first_name, staff.last_name, SUM(payment.amount) AS TOTAL
FROM staff
INNER JOIN payment ON staff.staff_id = payment.staff_id
-- 6c join film
SELECT f.title, COUNT(a.actor_id) AS 'Number of Actors'
  FROM film f
  INNER join film_actor a 
  ON (f.film_id = a.film_id)
  GROUP BY f.title;
  SELECT title, COUNT(inventory_id) AS 'Number of copies'
  FROM film
  INNER JOIN inventory
  USING (film_id)
  WHERE title = 'Hunchback Impossible';
  -- 6d 
SELECT title, COUNT(inventory_id) AS 'Number of copies'
  FROM film
  INNER JOIN inventory
  USING (film_id)
  WHERE title = 'Hunchback Impossible';
  -- 6e join
  SELECT c.last_name, c.first_name, SUM(p.amount) AS 'Total Amount Paid'
FROM customer c
INNER JOIN payment p 
ON (c.customer_id = p.customer_id)
GROUP BY c.last_name
ORDER BY c.last_name;
  