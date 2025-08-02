# 📅 Week 3 Recap – SQL & Project-Based Learning

## Overview

Week 3 was a deep dive into **SQL mastery** and applying it in a **real-world project** scenario. The week followed a structured learning approach through themed daily tasks, concluding with a major project on Netflix Usage Analysis. Here's a complete summary of what was covered, learned, and built.

---

## 📆 Daily Breakdown

### 🧠 Day 16 – Data Filtering & Boolean Logic

- Practiced **`WHERE` clauses**, **`AND` / `OR` / `NOT`** conditions.
- Filtered based on text, numbers, and null values.
- Example:
  ```sql
  SELECT * FROM users WHERE country = 'USA' AND is_active = TRUE;
  ```

---

### 🧠 Day 17 – Aggregation, Grouping & Aliases

- Mastered **`GROUP BY`**, **`COUNT()`**, **`SUM()`**, **`AVG()`**, and **`AS` aliases**.
- Learned how to calculate **totals**, **averages**, and **group-wise summaries**.
- Example:
  ```sql
  SELECT country, COUNT(*) AS total_users FROM users GROUP BY country;
  ```

---

### 🧠 Day 18 – Sorting & Limiting Results

- Learned to use **`ORDER BY`** for sorting results.
- Applied **`LIMIT`** and **`OFFSET`** for pagination.
- Combined sorting with aggregation for ranked outputs.
- Example:
  ```sql
  SELECT name, hours_watched FROM users ORDER BY hours_watched DESC LIMIT 10;
  ```

---

### 🧠 Day 19 – Case Statements & Data Transformation

- Practiced using **`CASE`** to build **conditional columns**.
- Created meaningful insights like categorizing users by watch time.
- Example:
  ```sql
  SELECT name,
         CASE
           WHEN hours_watched > 20 THEN 'Power User'
           ELSE 'Casual Viewer'
         END AS user_type
  FROM users;
  ```

---

### 🧠 Day 20 – Joins & Combining Tables

- Explored **`INNER JOIN`**, **`LEFT JOIN`**, and **`RIGHT JOIN`**.
- Combined user data with other tables (like plans) to enhance insights.
- Example:
  ```sql
  SELECT users.name, plans.price
  FROM users
  JOIN plans ON users.plan_type = plans.type;
  ```

---

## Big Project Day – Netflix Usage Analysis

- **Project Goal**: Simulate an analytics report for a Netflix-style platform using SQL.
- **Tasks Completed**:
  - Cleaned and explored a synthetic dataset of 1,000+ users.
  - Identified:
    - Top countries by user count
    - Gender-based insights
    - Most-used devices
    - Top binge-watchers
    - Most popular plans
    - Active vs. inactive users
    - Average watch time per country
    - Categorized users using CASE logic

- **Final Deliverable**: A SQL-powered insights summary + basic visualizations.

> 🔍 This project simulated real data analysis and sharpened practical SQL skills with impactful results.

---

## Skills Gained This Week

- ✅ Advanced SQL Filtering
- ✅ Aggregation, Sorting & Aliasing
- ✅ Conditional Logic with CASE
- ✅ Joins & Realistic Data Merging
- ✅ Storytelling through SQL results
- ✅ Project Readiness & Documentation

---

## 🧠 Reflection

This week was all about building **data intuition**. From technical skills like joins and grouping to applying insights in a real-world context, this week was a leap in understanding **how analysts think and deliver value using SQL.**

---

## What's Next?

Moving forward, I'll be:
- Practicing multi-table joins in real scenarios
- Learning subqueries and window functions
- Building interactive dashboards using SQL results

---

> 💼 **This week made me feel more job-ready than ever before. The project especially gave me confidence to explain SQL insights in interviews and GitHub portfolios.**

