# Mini Project: Advanced SQL Analysis on Unified Dataset

> This mini project combines concepts from:
- **Day 18**: Subqueries & Set Operations  
- **Day 19**: CTEs, Nested CTEs, Hierarchical Queries  
- **Day 20**: CASE, EXISTS, and Conditional Filtering  

---

## 📁 Dataset Used: `unified_data.db`

This single dataset combines relevant data fields needed to perform all advanced queries in one place.  
The table used is: `unified_data`

### Columns include:
- `customer_id`  
- `name`  
- `region`  
- `clv`  
- `order_id`  
- `order_amount`  
- `employee_id`  
- `manager_id`  
- `position`  
- `lead_score`

---

## Project Objectives

1. **High-Value Customers**  
   Identify customers whose `clv` (Customer Lifetime Value) is higher than the **regional average**.

2. **Top Regional Customers with CTEs**  
   Use **CTEs** to filter and rank customers by CLV **within their region**.

3. **Manager-Employee Relationships**  
   Build a **hierarchical query** using a self-join to identify managers and their direct reports.

4. **Lead Classification with CASE**  
   Categorize leads into segments like `'High'`, `'Medium'`, `'Low'` based on their lead score.

5. **Using EXISTS**  
   Filter customers who have made at least one order using the **EXISTS** keyword.

---

## SQL Features Demonstrated

- Scalar & Correlated **Subqueries**
- **Common Table Expressions (CTEs)**
- **Nested CTEs**
- **Hierarchical Joins** using `SELF JOIN`
- **CASE WHEN** logic for conditional columns
- **EXISTS** clause for efficient filtering
- **Set Operations**: UNION / INTERSECT (covered but not emphasized in this project)

---

## Sample Query Snippet

```sql
-- Example: Customers with CLV greater than regional average
SELECT name, region, clv
FROM unified_data c1
WHERE clv > (
  SELECT AVG(clv)
  FROM unified_data c2
  WHERE c1.region = c2.region
);
```

---

## Project Status

✅ Completed using SQLite  
✅ Uploaded to GitHub  
✅ Queries tested and debugged

---

## Reflections

This project made me realize how powerful SQL becomes when combining concepts like subqueries, CTEs, and CASE logic. Writing layered queries made the code more **modular**, **debuggable**, and **easy to reuse**.  

---

> SQL isn't just a query language. It's how you make your data speak.
> Rehan

