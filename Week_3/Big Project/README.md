# Netflix Usage Analysis — Week 3 Project

Welcome to the Week 3 SQL Project! This project uses an SQLite database (`week3_project.db`) to analyze user behavior on a fictional streaming platform using advanced SQL queries.

## Dataset Overview

The dataset contains anonymized user information such as:

- Name, Age, Gender  
- Signup Date, Country, Device  
- Plan Type, Hours Watched  
- Account Status (`Is_Active`)

All queries were executed using **DB Browser for SQLite**, and the database table used was named `movies`.

---

## Objectives

-- Get the list of tables  
SELECT name FROM sqlite_master WHERE type='table';

- Analyze total users, sign-up trends, and churn  
- Discover device preferences and regional distributions  
- Identify power watchers and usage patterns  
- Compare watch hours across genders and plans  

---

Insights Uncovered
---------------------

-> India had the highest number of users, followed by the US and UK.  
-> More users were *cancelled* than active — possible churn issue.  
-> Cancelled users had a *higher average age* compared to active ones.  
-> Mobile was the most used device, followed by Smart TVs and Laptops.  
-> Female users on the *Premium plan* had the highest average watch hours.  
-> December 2023 saw the highest user sign-ups.  
-> Top 10 binge-watchers all had watch hours over *90+ hours*.

---

Skills Applied
-----------------

✅ SQL Aggregations (COUNT, AVG, ROUND)  
✅ GROUP BY & ORDER BY  
✅ STRFTIME() for date manipulation  
✅ Logical Filtering using WHERE  
✅ Ranking with LIMIT  
✅ Data Storytelling with insights

---

Tools Used
-------------

🔹 SQLite  
🔹 DB Browser for SQLite  
🔹 Markdown for Reporting  
🔹 GitHub for Version Control

---

Sample Query Snippet
-----------------------

SELECT country, COUNT(*) AS users  
FROM movies  
GROUP BY country  
ORDER BY users DESC;

---

How to Use
-------------

1. Clone this repo  
2. Open `week3_project.db` using DB Browser for SQLite  
3. Run queries from the `.sql` file or manually from the README  
4. Interpret the output with the insights above  

---

Author
---------

👨‍💻 Mohammed Shaik Rehan  
📘 B.Sc Data Science | 2nd Year  
🌏 Bangalore, India  
🎯 Passionate about Data Analytics, AI, and Visual Storytelling

---

⭐ Final Thoughts
----------------

> “Data without insight is noise. But data with the right questions? That’s value.”

Let’s build stories with SQL. 💥

