# DAY 15 – SQL FOUNDATIONS: QUERY LIKE AN ANALYST  
*Week 3 begins – From messy tables to crystal-clear insights using SQL*

---

## LEARNING OBJECTIVES

- Understand basic SQL syntax  
- Connect SQLite DB to Jupyter Notebook  
- Perform queries using `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`  
- Group and aggregate with `GROUP BY`, `AVG()`, `COUNT()`  
- Sort data and filter top performers  
- Bridge SQL with Pandas for smooth analysis  

---

## STEP 1: CONNECT TO SQLITE DB IN JUPYTER NOTEBOOK

```python
import sqlite3
import pandas as pd

# Connect to the database (make sure the file is in the same folder)
conn = sqlite3.connect('customers.db')
```

---

## STEP 2: VIEW AVAILABLE TABLES

```python
query = "SELECT name FROM sqlite_master WHERE type='table';"
tables = pd.read_sql_query(query, conn)
print(tables)
```

---

## STEP 3: PREVIEW DATA FROM "CUSTOMERS" TABLE

```python
df = pd.read_sql_query("SELECT * FROM customers LIMIT 10;", conn)
df.head()
```

---

## STEP 4: FILTER – ELITE CUSTOMERS IN THE WEST

```python
query = """
SELECT *
FROM customers
WHERE tier = 'Elite' AND region = 'West' AND clv > 3000;
"""
pd.read_sql_query(query, conn)
```

---

## STEP 5: AVERAGE CLV BY REGION AND TIER

```python
query = """
SELECT region, tier, AVG(clv) AS avg_clv
FROM customers
GROUP BY region, tier
ORDER BY avg_clv DESC;
"""
pd.read_sql_query(query, conn)
```

---

## STEP 6: COUNT CUSTOMERS BY TIER

```python
query = """
SELECT tier, COUNT(*) AS num_customers
FROM customers
GROUP BY tier
ORDER BY num_customers DESC;
"""
pd.read_sql_query(query, conn)
```

---

## STEP 7: TOP 5 MOST VALUABLE CUSTOMERS

```python
query = """
SELECT customer_id, name, clv
FROM customers
ORDER BY clv DESC
LIMIT 5;
"""
pd.read_sql_query(query, conn)
```

---

## STEP 8: REMOVE DUPLICATES (OPTIONAL)

```python
query = """
SELECT DISTINCT email
FROM customers;
"""
pd.read_sql_query(query, conn)
```

---

## 🛠️ SKILLS PRACTICED TODAY

| CONCEPT              | SQL EQUIVALENT                 |
|----------------------|--------------------------------|
| Filter Rows          | `WHERE`                        |
| Select Columns       | `SELECT column1, column2`      |
| Sort Rows            | `ORDER BY column DESC`         |
| Limit Rows           | `LIMIT n`                      |
| Group Data           | `GROUP BY`                     |
| Aggregations         | `COUNT()`, `AVG()`, `MAX()`    |
| Remove Duplicates    | `DISTINCT`                     |

---

## REFLECTIONS – MY POV

> “SQL felt intimidating at first. But line by line, it became readable.  
> Today I realized: analysts don’t memorize queries — they *understand* the logic.  
> I can now filter data, find top customers, and segment by business tiers using just a few lines.”
> Loving SQL as 1-liners can give meaningful insights!

I struggled a bit with setup — but I pushed through it.  
What matters is that I kept going. And I will keep going.

---

## WHAT’S NEXT?

- Learn SQL Joins (Day 16)  
- Merge transaction tables with customer data  
- Start full SQL-based dashboards  
- Use SQL as foundation for Power BI  
