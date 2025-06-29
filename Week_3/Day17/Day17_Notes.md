# Day 17 – SQL Window Functions & Ranking Logic

> *Today I focused on **advanced SQL analytics** — diving deep into how to assign rankings, segment data, and extract insights from sorted groups using window functions.*  
> This was one of the most powerful tools I’ve learned so far.

---

## SECTION 1: INTRO TO WINDOW FUNCTIONS

**Concept:**  
Window functions allow me to perform calculations **across a set of rows related to the current row** without collapsing them into one row (like GROUP BY does).

```sql
SELECT name, clv,
       MAX(clv) OVER () AS max_clv
FROM customers;
```

-> This assigns the **maximum CLV value to each row**, without aggregating the rows into one.  
-> t’s like adding a new column that computes something based on the full or partitioned dataset.

---

## SECTION 2: RANK vs DENSE_RANK

### `RANK()`  
Assigns a unique rank **with gaps** for ties.

```sql
SELECT name, clv,
       RANK() OVER (ORDER BY clv DESC) AS clv_rank
FROM customers;
```

### `DENSE_RANK()`  
Assigns rank **without gaps** for ties.

```sql
SELECT name, clv,
       DENSE_RANK() OVER (ORDER BY clv DESC) AS clv_dense_rank
FROM customers;
```

📌 I use these when I want to **order items** but still **retain all rows** — like a leaderboard.

---

## SECTION 3: PARTITION BY

**Concept:**  
I can **group** rows logically using `PARTITION BY` and then apply ranking within each group.

```sql
SELECT name, region, clv,
       RANK() OVER (PARTITION BY region ORDER BY clv DESC) AS region_rank
FROM customers;
```

-> Now each region has its own top CLV ranking!  
-> It’s similar to doing a group-wise `ORDER BY` but I don’t lose row granularity.

---

## SECTION 4: ROW_NUMBER

**Concept:**  
`ROW_NUMBER()` assigns a unique sequential number to each row — even if values are tied.

```sql
SELECT name, region, clv,
       ROW_NUMBER() OVER (PARTITION BY region ORDER BY clv DESC) AS row_num
FROM customers;
```

-> Useful when I want to **uniquely identify the top-N per group**.

Example:  
If I only want the **top customer per region**:

```sql
WITH ranked AS (
  SELECT *,
         ROW_NUMBER() OVER (PARTITION BY region ORDER BY clv DESC) AS rn
  FROM customers
)
SELECT name, region, clv
FROM ranked
WHERE rn = 1;
```

---

## SECTION 5: PERCENT_RANK()

**Concept:**  
Gives the relative rank of each row **as a percentage** (between 0 and 1).

```sql
SELECT name, region, clv,
       PERCENT_RANK() OVER (PARTITION BY region ORDER BY clv DESC) AS pr
FROM customers;
```

-> Helps me understand **how far up the scale** someone is.  
-> The top ranked will be close to `0`, bottom near `1`.

---

## SECTION 6: NTILE()

**Concept:**  
`NTILE(n)` divides the result set into `n` equal **buckets** — like quartiles or deciles.

```sql
SELECT name, region, clv,
       NTILE(4) OVER (PARTITION BY region ORDER BY clv DESC) AS clv_quartile
FROM customers;
```

-> I use this to **segment users into tiers** — e.g., top 25%, next 25%, and so on.  
-> Useful in business scenarios like customer segmentation, revenue banding.

---

## Summary of Day 17

- I finally understood what **window functions** really are — powerful tools that don’t collapse rows.
- Explored `RANK`, `DENSE_RANK`, and `ROW_NUMBER` to assign meaningful positions to each row.
- Used `PARTITION BY` to segment groups and get group-wise rankings.
- Applied `PERCENT_RANK()` to understand percentile positions.
- Learned to bucket data using `NTILE()`.

---

> “Ranking isn't just about numbers. It's about **context** — knowing where each row stands within its environment.”


🎯 Onward to **Day 18: CTEs and Recursive SQL**!
