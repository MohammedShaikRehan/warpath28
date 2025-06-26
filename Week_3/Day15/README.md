 # 📅 Day 15 – SQL Foundations Unlocked 
## 💡 Focus: Today marked the beginning of my SQL journey. 
I learned how to: 
- Connect Jupyter Notebook with a `.db` database using `ipython-sql` 
- Write SQL queries like `SELECT`, `WHERE`, `ORDER BY`, and `LIMIT` 
- Extract specific records with conditions 
- Sort and filter customer data 

---
## Example Query: 
```sql 
-- Top 5 Elite customers from the West region with CLV over 3000 SELECT name, region, tier, clv 
FROM customers WHERE tier = 'Elite' AND region = 'West' AND clv > 3000 ORDER BY clv DESC LIMIT 5; 
``` 
## Reflection: No big project today — but learning SQL felt like unlocking a new weapon. 
Simple syntax, yet powerful logic. I'm ready to build dashboards with it in the coming days.
