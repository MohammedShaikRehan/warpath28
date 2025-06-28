# Day 16 – SQL Joins, Subqueries, and Unions

*This day was about learning to combine, relate, and filter data across multiple tables — the true power of relational databases!*

---

## SECTION 1: INNER JOIN

**Definition:**  
Returns only the records that have matching values in **both** tables.

```sql
SELECT customers.name, orders.order_id, orders.amount
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id;
```

-> Use when you want to pull **only the intersection** of two datasets.

---

## SECTION 2: LEFT JOIN

**Definition:**  
Returns all records from the **left table**, and the matched records from the right table.  
If there's no match, you'll see `NULL`.

```sql
SELECT customers.name, orders.order_id
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id;
```

-> Use when your focus is on all **left table records**, regardless of whether a match exists in the right.

---

## SECTION 3: RIGHT JOIN and FULL OUTER JOIN

**RIGHT JOIN:**  
Returns all records from the **right table**, and matched records from the left.

```sql
SELECT orders.order_id, customers.name
FROM orders
RIGHT JOIN customers
ON orders.customer_id = customers.customer_id;
```

**FULL OUTER JOIN:**  
Returns **all records** when there is a match in **either** table.

```sql
SELECT customers.name, orders.order_id
FROM customers
FULL OUTER JOIN orders
ON customers.customer_id = orders.customer_id;
```

⚠️ SQLite doesn't support `RIGHT JOIN` or `FULL OUTER JOIN` directly — you'll need workarounds like `UNION` or subqueries.

---

## SECTION 4: SELF JOIN

**Definition:**  
A self join is a regular join but the table is joined with itself.

```sql
SELECT A.employee_name AS Employee, B.employee_name AS Manager
FROM employees A
JOIN employees B
ON A.manager_id = B.employee_id;
```

-> Useful in hierarchical data, like employees and managers, categories and subcategories.

---

## SECTION 5: SUBQUERIES (SCALAR & CORRELATED)

**Scalar Subquery:**  
Returns a single value used in filtering or comparison.

```sql
SELECT name, clv
FROM customers
WHERE clv > (SELECT AVG(clv) FROM customers);
```

**Correlated Subquery:**  
Depends on the outer query for its value, runs once **per row**.

```sql
SELECT name
FROM customers c1
WHERE clv > (
  SELECT AVG(clv)
  FROM customers c2
  WHERE c1.region = c2.region
);
```

-> Powerful for row-level comparisons or filters based on dynamic conditions.

---

## SECTION 6: UNION vs UNION ALL

**UNION:**  
Combines rows from two queries and removes duplicates.

```sql
SELECT name FROM customers
UNION
SELECT name FROM leads;
```

**UNION ALL:**  
Same as UNION but **keeps duplicates**.

```sql
SELECT name FROM customers
UNION ALL
SELECT name FROM leads;
```

-> Use UNION when you want distinct rows, UNION ALL when you want everything (faster too!).

---

## Summary of Day 16:

- Mastered how to **combine data across multiple tables**
- Learned to cleanly **filter results using subqueries**
- Used `JOIN`, `UNION`, and `SELECT` as **building blocks** of deep insights
- Understood the difference between **row-level filtering (WHERE)** and **group-level filtering (HAVING)**

---

> "A database is not just storage – it's a brain.  
> The way you ask questions determines the quality of your answers."

🟢 **Ready for Day 17: Window Functions & Ranking Logic!**

