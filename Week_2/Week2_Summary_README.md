# Warpath28: Week 2 Recap – Mastering Grouping, Cleaning, and Storytelling
🔥 Days 7–13 Complete | Recapped on Day 14  
*Relentless pace. Ruthless clarity. This is the next level of data thinking.*

---

## Projects Built -> Topics & Mini-Projects Covered

### 🟡 Day 7: Loyalty Tiers & Heatmap Visuals
**Description:**  
Used pivot tables to compare Customer Lifetime Value (CLV) across Tiers and Genders. Visualized it using heatmaps with annotations and clear formatting.

**Skills Covered:**
- `pd.pivot_table()` for multi-level summaries
- `sns.heatmap()` with `annot=True`, formatting `fmt='g'`, `cmap`
- Dashboard-like visual storytelling

---

### 🟡 Day 8: CrossTab Insights & Grid-Level Aggregation
[Uploded on Github]->[Day8 Project!](Week_2/Day8/Day8_Customer_Value_Dashboard.ipynb)

**Description:**  
Explored `pd.crosstab()` to calculate mean CLV by Tier and Gender. Compared it with pivot tables. Created count heatmaps for customer distributions.

**Skills Covered:**
- `pd.crosstab()` with `values`, `aggfunc`, `normalize`
- Heatmap visualizations of customer count
- Grid-level comparison of spending patterns

---

### 🟡 Day 9: Count Aggregation & Visualization
**Description:**  
Grouped and visualized count of customers per Region/Gender. Compared groupby with pivot and crosstab, and made observations around missing values.

**Skills Covered:**
- `groupby().size().unstack()`
- Handling missing heatmap data
- Smart use of `.fillna(0)` and Seaborn plot styling

---

### 🟡 Day 10: Mega Mini Project – Region x Gender Spending
[Uploded on Github]->[Day10 Project!](Week_2/Day10/Day10_Customer_Segmentation.ipynb)

**Description:**  
Merged gender and region insights. Built CLV heatmaps and barplots per gender/region. Focused on value-based segmentation.

**Skills Covered:**
- Aggregation with `.groupby()`
- Heatmap: `sns.heatmap()`
- Segmentation of customer base using thresholds

---

### 🟡 Day 11: Distribution Analysis with `.value_counts()` and `normalize`
**Description:**  
Analyzed spending distribution across Regions and Genders. Learned how to calculate proportions using `value_counts(normalize=True)`.

**Skills Covered:**
- `Series.value_counts(normalize=True)`
- Region x Gender distribution barplots
- Labeling insights in visuals

---

### 🟡 Day 12: Multi-table Joins – Transactions + Customers
[Uploded on Github]->[Day12 Project!](Week_2/Day12/Day12_Merged_Insights.ipynb)

**Description:**  
Learned how to use `merge()` with `how=left`, `how=inner`. Extracted customer insights from multi-table setups. Built visuals from real business-like data.

**Skills Covered:**
- Joining multiple tables using `merge()`
- Aggregating total/avg spend per Region & Gender
- Visual storytelling with `sns.barplot()` & `sns.countplot()`

---

### 🟡 Day 13: Deep Cleaning & String Transformations
**Description:**  
Extracted email providers using `.str.split()`, `.str[1]`. Cleaned noisy data using `.str.strip()`, mapped providers with readable names.

**Skills Covered:**
- `.str.split()`, `.str.get()`, `.str.strip()`
- Mapping raw categories using `.map()`
- Column cleanup, dictionary remapping

---

## Core Skills Unlocked This Week

✅ `groupby()`, `.agg()` for advanced aggregation  
✅ `pivot_table()` vs `crosstab()` — when to use what  
✅ Heatmaps, barplots, countplots — Seaborn mastery  
✅ String processing with `.str.split()`, `.str.strip()`  
✅ Multi-table joins with `merge()`  
✅ Cleaning real-world messy data  
✅ Categorizing data with `pd.cut()`, `.map()`, `.apply()`

---

## What I Learned (My POV)

> "Week 2 wasn’t about learning syntax. It was about seeing datasets like a detective.  
> Every time I grouped, I asked *why*. Every time I plotted, I asked *who will read this*.  
> Cleaning strings, fixing garbage values, merging tables — all of it made me think like an analyst, not a coder."

Mistakes? Many. But that's how I remember - by debugging what broke.  
I don’t fear messy data anymore - I welcome it.

---

## Thought Process & Reflections

This week made me realize:  
Anyone can run `groupby()` — but only an analyst can turn it into an insight.

I learned the power of storytelling through visuals,  
how to communicate customer trends, and  
how to clean garbage data into gold.

The graphs felt easier. The thinking felt deeper.  
That’s growth.

---
## Side Quest: The FreeCodeCamp Grind

--> I ventured on a side quest which I have been doing since Week 1 & 2 — tackling **FreeCodeCamp’s Data Analysis Course**  which is also included in my warpath.

--> While this meant I posted fewer daily GitHub projects during Week 2, I was sharpening my skills through additional real-world challenges — from time series breakdowns to multi-variable bar charts.

--> The focus this week wasn’t just *more* projects — it was *better understanding*. My pace slowed a bit, but the clarity and confidence I gained were worth it.

--> Updates for FreeCodeCamp like projects and certificate will be uploaded day-wise soon!

I’m still here. Still showing up. Still building.

---
## What’s Next – Week 3 Incoming...

✅ SQL joins, filters, subqueries  
✅ Project: Full customer segmentation  
✅ Dashboard polishing and export  
✅ Portfolio storytelling: crafting business insights  
✅ LinkedIn + Resume ready project

🧠 *"The first two weeks taught me how to work. Now comes the week that makes me unstoppable."*

Week 2 ✅  
Week 3 — we **go elite**.  
— Rehan 

