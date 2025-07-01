# Day 19 – Mastering CTEs (Common Table Expressions)

> *Today was about writing cleaner, modular SQL using CTEs — especially useful for breaking complex queries into simple, reusable steps.*

---

## SECTION 1: What is a CTE?

**Concept:**  
A CTE (Common Table Expression) is a **temporary result set** I define with a `WITH` clause, which can be **referred to in the main query**.

```sql
WITH top_customers AS (
  SELECT name, clv
  FROM customers
  WHERE clv > 4000
)
SELECT *
FROM top_customers;
```

-> CTE behaves like a virtual table.  
-> It improves readability and can be reused multiple times **within the same query**.

---

## SECTION 2: Creating and Using Basic CTEs

**Concept:**  
I can **use multiple CTEs** for layered logic and make the final query cleaner.

```sql
WITH top_regions AS (
  SELECT region, AVG(clv) AS avg_clv
  FROM customers
  GROUP BY region
),
rich_customers AS (
  SELECT name, region, clv
  FROM customers
  WHERE clv > 5000
)
SELECT r.name, r.region, t.avg_clv
FROM rich_customers r
JOIN top_regions t
ON r.region = t.region;
```

-> I used 2 CTEs here: one for aggregating (`top_regions`) and one for filtering (`rich_customers`) — then **joined them**.

---

## SECTION 3: CTEs with Joins and Aggregations

**Concept:**  
CTEs can be used to **clean up joins, grouping, and filtering logic**.

```sql
WITH order_totals AS (
  SELECT customer_id, SUM(amount) AS total_spent
  FROM orders
  GROUP BY customer_id
)
SELECT c.name, o.total_spent
FROM customers c
JOIN order_totals o
ON c.customer_id = o.customer_id;
```

-> I grouped the `orders` table first in a CTE.  
-> Then joined with `customers` to get a cleaner result.

---

## SECTION 4: Nested & Chained CTEs

**Concept:**  
I can stack CTEs to build logic step-by-step.

```sql
WITH high_clv AS (
  SELECT * FROM customers WHERE clv > 5000
),
ranked_customers AS (
  SELECT name, clv,
         RANK() OVER (ORDER BY clv DESC) AS rank
  FROM high_clv
)
SELECT *
FROM ranked_customers
WHERE rank <= 3;
```

-> I filtered in one step (`high_clv`), ranked in another (`ranked_customers`), and queried the top 3 in the final output.

---

## SECTION 5: Recursive CTEs (Intro)

**Concept:**  
Recursive CTEs allow me to perform **repeated operations** like loops.

```sql
WITH RECURSIVE counter(n) AS (
  SELECT 1
  UNION ALL
  SELECT n + 1 FROM counter WHERE n < 5
)
SELECT * FROM counter;
```

-> It starts with 1  
-> Then adds 1 until 5  
-> Recursion has a base case (`SELECT 1`) and a loop (`SELECT n+1 WHERE n<5`)

---

## SECTION 6: Best Practices and When to Use CTEs

**Concept:**  
CTEs make my queries **cleaner**, **modular**, and **easier to debug**.

### Use CTEs when:

- My query has complex nested subqueries  
- I need to **reuse logic** in a single SQL query  
- I'm working with **multi-step aggregations or joins**

### Avoid CTEs when:

- Query is too simple (adds clutter)  
- DB engine doesn’t optimize them (SQLite may struggle sometimes)  
- Performance matters more than readability

💡 **Tips**:
- Always give **meaningful names** to CTEs (`top_sales`, `active_users`)  
- Keep CTE logic small and focused  
- Debug by commenting out final SELECTs and testing CTEs individually

---

## Summary of Day 19:

- I Learned to **modularize queries** using CTEs  
- Used **multiple CTEs together** for cleaner logic  
- Applied **CTEs in JOINs, aggregates, rankings**  
- Understood **recursive logic** with `WITH RECURSIVE`  
- Practiced **real-world best practices** for SQL readability

---

> Think of CTEs as reusable LEGO blocks — I’m building complex SQL one brick at a time!

🟢 Up next: **Day 20 – CASE Statements & Conditional Logic!**
