# 📅 **Day 4 – DataFrame Domination II**  
*A Warpath28 checkpoint — cleaning, merging, grouping, and first‑look analysis.*

---

## 🔹 **Section 01 – Detecting & Fixing Missing / Dirty Data**

```python
# Detect NaNs
df.isna().sum()                   # count blanks per column

# Drop columns with > 30 % NaN
df = df.dropna(axis=1, thresh=0.7 * len(df))

# Fill NaNs
df['Age'].fillna(df['Age'].median(), inplace=True)        # median
df['Salary'].fillna(df['Salary'].mean(), inplace=True)    # mean
df.fillna(0, inplace=True)                                # safety net

# Standardise labels & types
df['Country'].replace({'U.S.':'USA', 'UK':'United Kingdom'}, inplace=True)
df['Salary_clean'] = pd.to_numeric(df['Salary'], errors='coerce')
df['Joining Date'] = pd.to_datetime(df['Joining Date'])
```

---

## 🔹 **Section 02 – Converting & Standardising Types**

```python
# String → numeric (bad strings → NaN)
df['MarketValue'] = pd.to_numeric(df['MarketValue'], errors='coerce')

# String casing fixes
df['Club'] = df['Club'].str.title()

# Date calculations
df['Tenure'] = 2025 - df['Joining Date'].dt.year
```

---

## 🔹 **Section 03 – Merging & Joining Multiple Tables**

| Method         | Keeper Rule                         | Sample Code                               |
|----------------|-------------------------------------|-------------------------------------------|
| `pd.concat()`  | Stack tables (axis 0 rows / axis 1 cols) | `pd.concat([df1, df2], axis=0)` |
| `pd.merge()`   | Join on **column key**              | `pd.merge(df1, df2, on='Player', how='outer')` |
| `.join()`      | Join on **index**                   | `df1.join(df2)` |

```python
merged = (
    pd.merge(players, leagues, on='Club', how='left')   # keep all players
    .merge(salaries, on='Player', how='outer')          # add salary info
)
```

---

## 🔹 **Section 04 – GroupBy & Aggregations**

```python
# Total goals per club
club_goals = df.groupby('Club')['Goals'].sum()

# Average salary & player count per league
league_summary = (
    df.groupby('League')
      .agg(AvgSalary=('Salary', 'mean'),
           Players=('Player', 'count'))
      .sort_values('AvgSalary', ascending=False)
)

# Multiple stats in one shot
tier_stats = df.groupby('Tier')['Goals'].agg(['sum', 'mean', 'max'])
```

```python
# Quick bar chart (first visual)
league_goals = df.groupby('League')['Goals'].sum()
league_goals.plot(kind='bar', title='Total Goals per League')
```
## Section 05: Visualizing Data with Matplotlib

Matplotlib is the most popular library for creating static, animated, and interactive visualizations in Python.  
It powers many other libraries like pandas `.plot()`.

### 🛠️ Key Points:

- `df.plot(kind='bar')` uses matplotlib behind the scenes.
- Use `.groupby()` + `.sum()` or `.mean()` to prepare data before plotting.
- Always use `plt.show()` to display the final plot clearly.

### Common Plot Types:
- `kind='bar'` → Vertical bar chart
- `kind='barh'` → Horizontal bar chart
- `kind='line'` → Line graph
- `kind='pie'` → Pie chart (not recommended for comparisons)

### Styling Parameters (used in plots):
- `figsize=(8, 5)` → Controls width & height of the plot.
- `color='skyblue'` → Sets the bar or line color.
- `title='Title'` → Adds a title on top.
- `xlabel`, `ylabel` → Labels for x and y axes.
- `grid(axis='y', linestyle='--', alpha=0.7)` → Adds dashed gridlines with some transparency.

### Explanation:
- `linestyle='--'` → Dashed lines (use `'-'` for solid, `':'` for dotted)
- `alpha=0.7` → Transparency level (1 = solid, 0 = invisible)

> Tip: Use `sort_values()` before plotting to make charts look cleaner.

---

### ✅ **End‑of‑Day Checklist**

- NaN detection & treatment (`isna`, `fillna`, `dropna`)  
- Type conversion & label cleanup (`to_numeric`, `str.replace`)  
- Merging tables (`merge`, `concat`, `join`)  
- Summaries via `groupby` + `agg`  
- First Matplotlib bar chart  

---

### 🎯 **Mini Project Pushed:** `day4_player_stats_dashboard.ipynb`  
*Merged, cleaned, grouped, plotted — see notebook & video for walkthrough (in progress).*

---
