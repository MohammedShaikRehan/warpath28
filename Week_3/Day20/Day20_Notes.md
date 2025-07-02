# Day 20 – Advanced Aggregations & Business Metrics in SQL

> *Today I leveled up as a data analyst — diving deep into smart aggregations, conditional logic, and learning to extract real-world business insights straight from SQL queries.*

---

## SECTION 1: Advanced Aggregations

SQL provides powerful built-in aggregation functions. Today, I focused on:

```sql
-- Count total customers
SELECT COUNT(*) FROM customers;

-- Count unique regions
SELECT COUNT(DISTINCT region) FROM customers;

-- Calculate average CLV (Customer Lifetime Value)
SELECT AVG(clv) FROM customers;

-- Find highest and lowest CLV
SELECT MAX(clv), MIN(clv) FROM customers;

-- Sum of all orders
SELECT SUM(amount) FROM orders;
```

--> *I have to remember that COUNT(DISTINCT ) is super useful for unique value counts!*

---

## SECTION 2: GROUP BY with Multiple Columns

Instead of grouping by just one column, I grouped by combinations:

```sql
-- Total CLV per Region and Tier
SELECT region, tier, SUM(clv) AS total_clv
FROM customers
GROUP BY region, tier;
```

--> This gave me a breakdown of total CLV per region-tier combo.  
--> Helps identify how top-tier customers are distributed geographically.

---

## SECTION 3: Aggregations with CASE WHEN

This section unlocked the power of **conditional aggregation** using `CASE WHEN`.

```sql
-- Count how many Elite customers are there
SELECT COUNT(CASE WHEN tier = 'Elite' THEN 1 END) AS elite_count
FROM customers;

-- Total orders above 1000
SELECT SUM(CASE WHEN amount > 1000 THEN amount ELSE 0 END) AS high_value_orders
FROM orders;
```

--> *I learned that CASE statements let me apply conditions inside aggregations like SUM and COUNT.*

---

## SECTION 4: ROLLUP, CUBE, GROUPING SETS (Not in SQLite)

While SQLite doesn’t support these directly, it’s important to understand them for enterprise-level databases:

```sql
-- Not supported in SQLite, but here’s what it would look like
SELECT region, tier, SUM(clv)
FROM customers
GROUP BY ROLLUP (region, tier);
```

--> *ROLLUP gives me totals and subtotals.*  
--> *CUBE gives all possible combinations.*  
--> *GROUPING SETS lets me choose specific combinations to aggregate on.*

---

## SECTION 5: Business KPIs in SQL

This is where SQL becomes a storytelling tool for the business:

```sql
-- Total revenue
SELECT SUM(amount) AS total_revenue FROM orders;

-- Top 5 regions by CLV
SELECT region, SUM(clv) AS total_clv
FROM customers
GROUP BY region
ORDER BY total_clv DESC
LIMIT 5;

-- Repeat rate (customers with more than 1 order)
SELECT COUNT(*) * 1.0 / (SELECT COUNT(*) FROM customers) AS repeat_rate
FROM (
  SELECT customer_id
  FROM orders
  GROUP BY customer_id
  HAVING COUNT(*) > 1
) AS repeat_customers;

-- Average order value per region
SELECT region, AVG(amount) AS avg_order_value
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY region;
```

--> These queries helped me calculate **real business metrics** like revenue, repeat rate, and customer value.

---

## Summary of Day 20

- Used `SUM()`, `AVG()`, `COUNT(DISTINCT)` for analytics
- Grouped by **multiple columns** to find segment-level insights
- Mastered `CASE WHEN` inside aggregation for conditional stats
- Understood advanced grouping (ROLLUP/CUBE) even if not in SQLite
- Simulated **KPI dashboards** using SQL — just like a real analyst!

---

> *Anyone can write a query, but only a few can write a query that answers the business question.*

🟢 **Onward to Day 21: SQL Reporting & Presentation!**

