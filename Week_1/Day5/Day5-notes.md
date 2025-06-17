# 📦 Day 5 – Section 1: Cleaning Dirty Customer Data Like a Pro

## 🧠 What I Did

Today I worked on a raw customer orders dataset. It had missing values, unnecessary columns, and needed prepping for any real analysis. Felt like being hired by a small business to clean up their POS exports. Here's what I focused on:

* Filled in missing values in key columns like `Spend` and `Region`
* Dropped irrelevant columns without breaking the code
* Created a new column `Total_orders` to use later in analysis

---

## 🔧 Code I Wrote

```python
import pandas as pd

# Step 1: Read the raw CSV
df = pd.read_csv("customer_data.csv")

# Step 2: Handle missing values
df['Spend'].fillna(0, inplace=True)
df['Region'].fillna(df['Region'].mode()[0], inplace=True)  # Filling with mode for categorical

# Step 3: Drop irrelevant columns safely
df.drop(columns=['Unnamed: 0', 'Notes'], inplace=True, errors='ignore')

# Step 4: Add total order count column
df['Total_orders'] = df['Order_Amount'] + df['Repeat_Orders']

```
---

## ⚠️ Mistakes I Made
I first tried to use .where() to check repeating purchases like I would in SQL.
```python
# ❌ Wrong
df['Repeat_purchase'] = df.where(['Order_Amount'] == ['Order_Amount'], "Yes")

# ✅ What I should’ve thought about:
# Use logical conditions, `.duplicated()` or direct comparisons instead.
```
#I MADE A MISTAKE HERE! .where() doesn’t work like SQL filtering — it returns rows where condition is False as NaN. I misused it trying to "filter".
---
I also got a KeyError when dropping a column that didn’t exist.

```python
# ❌ Wrong
df.drop(columns=['NotAColumn'])

# ✅ Correct
df.drop(columns=['NotAColumn'], errors='ignore')
```
#I MADE A MISTAKE HERE! Always use errors='ignore' if you're unsure the column exists. It saves your script from crashing.
---
# What I Learned section 1
Always check for nulls using df.isna().sum() before filling.

Use mode() for filling missing categorical data.

inplace=True saves a step but be cautious when chaining.

It's important to drop columns safely in real-world datasets — not every export is clean.

Don’t misuse .where() like SQL. Pandas logic is different.

---

# Section 2: Grouping and Summarizing Insights from Customer Orders

## 🧠 What I Did

Today was about grouping, aggregating, and summarizing the data. This is the part where we convert raw data into actual insights.

I grouped customer orders by region and by day of the week to understand trends. I calculated things like total spend, average orders, and used `.sort_values()` to cleanly present them.

---

## 🔧 Code I Wrote

```python
# Grouping by region and summarizing spend
region_summary = df.groupby('Region')['Spend'].sum()
print(region_summary)

# Grouping by Day and Order Amount, then sorting
weekday_orders = df.groupby('Weekday')['Order_Amount'].sum().sort_values(ascending=False)
print(weekday_orders)

# Assigning to variables for later use
total_spend_by_region = df.groupby('Region')['Spend'].sum()
average_spend_by_region = df.groupby('Region')['Spend'].mean()

```
❗Mistakes I Made
🔸 1. Confusing .agg() vs direct chaining
```
# ❌ I thought I had to use .agg() all the time:
df.groupby('Region').agg({'Spend': 'sum'})

# ✅ But you can also just chain the column:
df.groupby('Region')['Spend'].sum()

```
---

# I MADE A MISTAKE HERE!
I was stuck thinking .agg() is necessary always. Turns out, chaining is faster for single operations. Save .agg() for multiple aggregations.

🔸 2. Forgetting to sort grouped data

```
# ❌ Grouped but didn’t sort – led to unordered messy insights
df.groupby('Weekday')['Order_Amount'].sum()

# ✅ Sorting makes it readable:
df.groupby('Weekday')['Order_Amount'].sum().sort_values(ascending=False)

```
# I MADE A MISTAKE HERE!
Raw groupby output can be chaotic. Sort your groupby summaries to make insights clearer.

---

# What I Learned 2 Section
Grouping with .groupby() helps segment and summarize large datasets quickly.

I can use chaining like df.groupby('Col')['Col2'].sum() without needing .agg() unless I want multiple summaries.

.sort_values() should be used after grouping to make insights easier to spot.

Assigning grouped summaries to variables helps keep code modular and clean.

---

#  Realization
This section helped me understand how analysts pull insights like:

“Which region earns the most?”

“Which days see the most orders?”

It’s not magic — it’s just proper grouping and summarizing with Pandas. Super useful when working with any sales, e-commerce, or performance datasets.

---

# Section 3: Visual Exploration with Seaborn & Matplotlib

## 🧠 What I Did

Today I dove into visualizations using `seaborn` and `matplotlib.pyplot`. I learned how to bring insights to life — not just summarize them in text or tables, but show them through **bar charts**, **line plots**, **box plots**, and even started looking into **heatmaps**.

---

## 🔧 Code I Wrote

```python
import seaborn as sns
import matplotlib.pyplot as plt

# Barplot: Spend by Customer
sns.barplot(x='Customer', y='Spend', data=df)
plt.title("Customer-Wise Total Spend")
plt.xticks(rotation=45)
plt.show()

# Lineplot: Monthly Spend
sns.lineplot(x='Month', y='Spend', data=df, linestyle='--', alpha=0.7)
plt.title("Monthly Spending Trend")
plt.xticks(rotation=45)
plt.show()

# Boxplot: Spend Distribution by Region
sns.boxplot(x='Region', y='Spend', data=df)
plt.title("Spend Spread by Region")
plt.show()

# Countplot for VIP vs Regular
df['Spend_Status'] = df['Spend'].apply(lambda x: "VIP" if x > 500 else "Regular")
sns.countplot(x='Spend_Status', data=df)
plt.title("VIP vs Regular")
plt.show()

```

❗ Mistakes I Made
🔸 1. I used plt.xtricks() instead of plt.xticks()
```
# ❌ Typo that made plot fail
plt.xtricks(rotation=45)

# ✅ Correct usage
plt.xticks(rotation=45)
#YOU MADE A MISTAKE HERE!
Even small typos in plotting functions can break the whole visualization. Carefully double-check spelling.
```
---

🔸 2. Using wrong syntax in countplot
```
# ❌ Trying to pass multiple labels directly
sns.countplot(x='VIP', 'Regular', y='Spend')

# ✅ Fix: use 'Spend_Status' as categorical column
sns.countplot(x='Spend_Status', data=df)
```
# I MADE A MISTAKE HERE!
countplot expects one x-axis categorical column, not multiple variables.
```
--- 

# What I Learned
Seaborn is easier than I expected. Just sns.function() and pass x=, y=, and data=.

rotation=45 inside xticks is a lifesaver when labels overlap.

Using .apply() to create a new column (like "VIP") adds huge value to visualizations.

Combining df + sns + plt = professional-level storytelling.

---

# Realization
I finally felt like a real analyst. These visuals can go straight into a report, pitch deck, or dashboard. It's not just about writing code — it’s about telling a story with data.

---

### ✅ SECTION 4: Customer Lifetime Value (CLV) & Tiers

```
# Section 4: Calculating CLV and Segmenting Customers

## 🧠 What I Did

In this section, I calculated **Customer Lifetime Value (CLV)** and segmented customers into different tiers like Platinum, Gold, and Regular based on their spend. I also plotted a basic **correlation dashboard** to wrap it all up visually.

---

## 🔧 Code I Wrote

```python
# 1. Calculating CLV
df['CLV'] = df['Spend'] * df['Total_orders']

# 2. Creating customer tiers
df['Tier'] = df['Spend'].apply(lambda x: "Platinum" if x > 500 else "Gold" if x > 300 else "Regular")

# 3. Average spend by tier
tier_avg = df.groupby('Tier')['Spend'].mean()
print(tier_avg)

# 4. Sorting top customers by CLV
df.sort_values('CLV', ascending=False, inplace=True)
print(df.head(5))

# 5. Lineplot to analyze relationship
sns.lineplot(x='Total_orders', y='Spend', data=df, linestyle='--')
plt.title("Orders vs Spend")
plt.show()
```

# Final Dashboard (Optional)
```
fig, axs = plt.subplots(2, 2, figsize=(14, 10))
```

# Top spenders bar chart
```
sns.barplot(x='Customer', y='Spend', data=df.sort_values('Spend', ascending=False).head(5), ax=axs[0, 0])
axs[0, 0].set_title("Top 5 Spenders")
axs[0, 0].tick_params(axis='x', rotation=45)
```
---
# Lineplot for CLV Trend
```
sns.lineplot(x='Total_orders', y='CLV', data=df, ax=axs[0, 1])
axs[0, 1].set_title("CLV vs Orders")
```
---
# Countplot for Tiers
```
sns.countplot(x='Tier', data=df, ax=axs[1, 0])
axs[1, 0].set_title("Customer Tiers")
```
---
# Boxplot for Spend Distribution
```
sns.boxplot(x='Tier', y='Spend', data=df, ax=axs[1, 1])
axs[1, 1].set_title("Spend by Tier")

plt.tight_layout()
plt.show()
```
---
❗ Mistakes I Made
🔸 1. Wrong syntax in lambda tier assignment
```
# ❌ Missing closing bracket
df['Tier'] = df['Spend'].apply(lambda x: "Platinum" if x > 500 else "Gold" if x > 300 else "Regular"

# ✅ Correct
df['Tier'] = df['Spend'].apply(lambda x: "Platinum" if x > 500 else "Gold" if x > 300 else "Regular")
```
# I MADE A MISTAKE HERE!
Lambda functions need clean closing brackets. Python will crash without them.

---
🔸 2. Using sort_values['CLV'] instead of sort_values('CLV')
```
# ❌ Wrong
df.sort_values['CLV', ascending=False, inplace=True]

# ✅ Correct
df.sort_values('CLV', ascending=False, inplace=True)
```
# I MADE A MISTAKE HERE!
Square brackets are for indexing, not for function calls.

---
# What I Learned
CLV is a powerful metric that combines Spend × Total Orders.

Creating customer tiers makes your business analysis feel professional.

Final visual dashboards give a snapshot of multiple things at once.

I now understand how marketers identify “VIPs” and allocate resources.

---
# Realization
Now I can analyze user value, segment customers, and make decisions like a pro. This section really brought everything full circle.

---

### Over-all
Learned that making mistakes is okay — but **not remembering them** makes no progress.  
So I noted them down too!!

