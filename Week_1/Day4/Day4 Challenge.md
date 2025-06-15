# ⚽ Football Club Analyzer | Day 4

Welcome to **Day 4** of my Data Analysis Journey — where I explored the power of data cleaning, merging datasets, grouping, and visualizing football player stats using **pandas** and **matplotlib**.

---

## 📌 What This Project Covers

- Cleaning missing values using `fillna()` with **mean**, **median**, and **custom values**
- Merging two datasets using different `join` types like **left** and **outer**
- Aggregating data using `.groupby()` and `.agg()` to get insights on **Goals**, **Assists**, and **Salaries**
- Creating custom tiers like `"Legend"`, `"Star"`, `"Rising"` based on performance
- Visualizing top player contributions using `matplotlib`

---

## 📂 Files Included

- `day04_football_club_analyzer.ipynb` – Jupyter Notebook with full code and analysis
- `day04_notes.md` – Detailed markdown notes for all concepts covered
- `README.md` – You're here :)

---
> **This was the most hands-on, real-world style challenge so far.**  
> I felt like a true data wrangler cleaning, merging, and analyzing player data like a sports analyst.
> _Can’t wait to get into visual dashboards and much more next!_ 🗣️ 

---

## 🚀 Sample Code Snippets

```python
# Filling missing Age values with median
df['Age'].fillna(df['Age'].median(), inplace=True)

# Merging player and league info
merged = pd.merge(players, leagues, on='Club', how='left')

# Creating Tier column
merged['Tier'] = merged['Goals'].apply(lambda x: 'Legend' if x >= 700 else 'Star' if x >= 300 else 'Rising')

# Visualizing Total Contribution
merged['Total_Contribution'] = merged['Goals'] + merged['Assists']
merged.sort_values(by='Total_Contribution', ascending=False)[['Player', 'Total_Contribution']].plot(
    kind='barh', figsize=(10,5), color='orange', edgecolor='black')
