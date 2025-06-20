# Day 9 – Two-Way Grouping, Pivot Tables & Heatmap Insights

Today was a light but foundational day. I worked on understanding how to group data using **two categorical dimensions**, convert that into a **pivot table**, and visualize the result with a **heatmap**.

---

## 🧩 Section 1 – Two-Way Grouping with `groupby()`

### What I Did

Grouped the dataset using both `Region` and `Gender`, then calculated the average `Spend`.

```python
df.groupby(['Region', 'Gender'])['Spend'].mean()
```

This gave a **multi-index Series**, which can be useful but is hard to visualize. So, I learned how to take this concept further using pivot tables.

---

## 🧩 Section 2 – Pivot Tables for Better Layout

### What I Did

Created a pivot table that displayed average `CLV` across both `Tier` (rows) and `Gender` (columns):

```python
pd.pivot_table(
    data=df,
    index='Tier',
    columns='Gender',
    values='CLV',
    aggfunc='mean'
)
```

### Why It Matters

- Easier to **read**
- Can be **visualized** directly
- Great for **cross-analysis** in dashboards

---

## 🧩 Section 3 – Heatmap from Pivot

### What I Did

Used `sns.heatmap()` to visualize the pivot table from above:

```python
import seaborn as sns
import matplotlib.pyplot as plt

pivot = pd.pivot_table(
    data=df,
    index='Tier',
    columns='Gender',
    values='CLV',
    aggfunc='mean'
)

sns.heatmap(pivot, annot=True, cmap='coolwarm', fmt='.0f')
plt.title("Average CLV by Tier and Gender")
plt.show()
```

### What I Observed

- Heatmaps make **insights obvious**
- Annot=True helps us **read exact values**
- fmt='.0f' makes numbers cleaner (avoids scientific notation like 2.3e+03)

---

## 🧠 Questions I Can Answer Now

- How to group by two categories and compute insights
- What’s the difference between `groupby()` and `pivot_table()`
- When and how to use a heatmap for comparisons

---

## 🪞 Reflections

No mini-project today, but that’s okay. I still delivered:
- A clean heatmap
- A pivot table insight
- An understanding of two-way grouping

These tools are **dashboard gold**. They will return in Week 3 when I build full-blown reporting systems.

---

## Was Today a Good Day?

Yes, because even though the task felt small — I now understand how to **break down and cross-analyze** my data in multiple ways.

Some days you build dashboards.
Some days you master the tools behind them.

Today was the latter.

– Rehan 
