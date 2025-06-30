# Day 18 – SQL: CASE, NULL Handling, and CASE-based Sorting

> *Today I tackled the heart of SQL conditional logic, controlling flow using CASE, handling NULLs like a pro, and sorting data based on business rules. This day felt like building intelligence directly into my queries.*

---

## SECTION 1: The CASE Statement 

**Concept:**  
The `CASE` statement lets me apply **if-else** style logic directly inside SQL queries.

```sql
SELECT name, clv,
  CASE
    WHEN clv >= 5000 THEN 'High Value'
    WHEN clv >= 3000 THEN 'Medium Value'
    ELSE 'Low Value'
  END AS clv_category
FROM customers;
```

♠ This helped me **bucket** data based on numeric thresholds.  
♠ Great for transforming raw data into meaningful labels.

---

## SECTION 2: CASE inside SELECT and ORDER BY 

### Use CASE to label categories:

```sql
SELECT name, region,
  CASE
    WHEN region = 'North' THEN 'Primary Zone'
    WHEN region = 'West' THEN 'Secondary Zone'
    ELSE 'Other Zone'
  END AS zone_label
FROM customers;
```

### Use CASE to custom sort:

```sql
SELECT name, clv
FROM customers
ORDER BY 
  CASE 
    WHEN clv >= 5000 THEN 1
    WHEN clv >= 3000 THEN 2
    ELSE 3
  END;
```

--> Default SQL sort is ascending, so **lower numbers = higher priority**.

---

## SECTION 3: Combined CASE with ORDER BY 

> Sorting based on business logic using CASE inside ORDER BY.

```sql
SELECT name, clv,
  CASE
    WHEN clv >= 5000 THEN 'Top Tier'
    WHEN clv >= 3000 THEN 'Mid Tier'
    ELSE 'Low Tier'
  END AS tier
FROM customers
ORDER BY 
  CASE
    WHEN clv >= 5000 THEN 1
    WHEN clv >= 3000 THEN 2
    ELSE 3
  END;
```

--> I didn’t need to use DESC because the mapping (1,2,3) ensured the order was meaningful.

---

## SECTION 4: NULL Handling – IFNULL, COALESCE, and CASE 

### IFNULL()

```sql
SELECT name, IFNULL(email, 'No Email') AS email_status
FROM customers;
```

### COALESCE()

```sql
SELECT name, COALESCE(phone, alternate_phone, 'No Phone') AS contact_number
FROM customers;
```

### Using CASE to handle NULLs:

```sql
SELECT name,
  CASE 
    WHEN clv IS NULL THEN 'Unknown CLV'
    WHEN clv >= 5000 THEN 'High'
    ELSE 'Regular'
  END AS clv_status
FROM customers;
```

--> NULLs can ruin logic & aggregations if not handled properly.

---

## Summary of Day 18

- Mastered `CASE` for conditional logic & dynamic labeling  
- Used `CASE` inside `ORDER BY` for custom business logic sorting  
- Handled NULLs using `IFNULL`, `COALESCE`, and `CASE`  
- Understood why **NULLs must be treated explicitly**

---

> “SQL logic is where raw data transforms into **business intelligence.** You can’t control what’s in your database, but you can control what your queries return.”

🟢 **Ready for Day 19: Data Aggregation Deep Dive & Window Frame Definitions**

