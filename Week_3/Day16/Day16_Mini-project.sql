--> Day 16 – SQL Joins, Subqueries, and Unions

--> *Today we unleashed the full power of relational databases — by learning how to connect multiple tables using JOINs, filter using subqueries, and merge results using UNIONs.*

---

-- SECTION 1: INNER JOIN

--> ** Concept:**  
--> `INNER JOIN` returns only rows with matching keys in both tables.

SELECT customers.name, orders.order_id, orders.amount
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id;


--Use when you want the **intersection** of two tables.  
--No match = row is dropped.

---

/* SECTION 2: LEFT JOIN

**Concept:**  
`LEFT JOIN` returns all rows from the left table, and matched rows from the right table. If no match → `NULL`.
*/

SELECT customers.name, orders.order_id
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id;


-- Use when you want **all left table entries** regardless of match.  
-- Great for identifying missing or unmatched records.

---

/* SECTION 3: RIGHT JOIN & FULL OUTER JOIN

RIGHT JOIN:
*/

SELECT orders.order_id, customers.name
FROM orders
RIGHT JOIN customers
ON orders.customer_id = customers.customer_id;


--- FULL OUTER JOIN:

SELECT customers.name, orders.order_id
FROM customers
FULL OUTER JOIN orders
ON customers.customer_id = orders.customer_id;


--- To emulate them, you can use **`UNION` + `LEFT JOIN`/`RIGHT JOIN` tricks** or **subqueries**.

---

--> SECTION 4: SELF JOIN

--> **Concept:**  
-- A table joins with itself to compare rows in the same dataset.


SELECT A.employee_name AS Employee, B.employee_name AS Manager
FROM employees A
JOIN employees B
ON A.manager_id = B.employee_id;


-- Use when working with **hierarchies** like org charts, categories, etc.

---

/* SECTION 5: SUBQUERIES (Scalar and Correlated)

--> Scalar Subquery:
Returns **a single value**.
*/

SELECT name, clv
FROM customers
WHERE clv > (SELECT AVG(clv) FROM customers);


-- Correlated Subquery:
-- Refers to **outer query row values**.


SELECT name, region, clv
FROM customers c1
WHERE clv > (
  SELECT AVG(clv)
  FROM customers c2
  WHERE c1.region = c2.region
);


-- Correlated subqueries run **per row**.  
-- Scalar subqueries run **once**.

---

--> SECTION 6: UNION vs UNION ALL

-- `UNION`
-- Combines rows and removes duplicates.


SELECT name FROM customers
UNION
SELECT name FROM leads;

--> `UNION ALL`
-- Combines rows **and keeps duplicates**.


SELECT name FROM customers
UNION ALL
SELECT name FROM leads;


--`UNION` = DISTINCT results.  
--`UNION ALL` = ALL results (faster!).

---

--> Summary of Day 16

-- Mastered combining tables using **JOINs**
-- Learned filtering with **scalar and correlated subqueries**
-- Merged results using **UNION** and **UNION ALL**
-- Gained insight into when to use INNER, LEFT, SELF joins effectively
-- Understood **hierarchical structures** and filtering logic

---

