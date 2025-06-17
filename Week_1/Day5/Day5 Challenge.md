# 📊 Day 05 – Customer Insights Mini Project

## 🧠 What I Built
This mini project focuses on customer spending behavior, order frequency, and tier segmentation. I explored a dataset containing `Customer`, `Spend`, and `Total Orders` and derived meaningful insights like:

- Who are the top spenders?
- Which customers place repeat orders?
- What's the calculated Customer Lifetime Value (CLV)?
- How can I segment customers into Regular, Gold, and Platinum tiers?

---

## 🛠️ Key Concepts Applied
- Data aggregation using `.groupby()`
- Feature creation with `.apply()` and lambda functions
- Sorting & filtering for cleaner outputs
- Visualizations with **Matplotlib** and **Seaborn**
  - Bar plots
  - Line plots
  - Box plots
  - Dashboard layout with `plt.subplots()`

---

## 💡 Interesting Code Highlights

```python
# Creating a new CLV column
df['CLV'] = df['Spend'] * df['Total_orders']

# Tiering logic using apply + lambda
df['Tier'] = df['Spend'].apply(lambda x: 'Platinum' if x > 500 else 'Gold' if x > 300 else 'Regular')

# Visualizing insights
sns.barplot(x='Customer', y='Spend', data=df)
```

---

## ❗ Mistakes I Made & Fixed
"Today, the things I did wrong taught me more than the things I got right."

Forgot to sort grouped data → Resulted in confusing order of insights
-> Fixed with sort_values()

Misused .groupby[] instead of .groupby().agg()
-> Fixed it by understanding function chaining properly

Tried using Seaborn plots without installing the package 😭
-> Got it Fixed with !pip install seaborn

## What I Learned

-> A good customer dataset can tell powerful stories.

-> Creating calculated columns like CLV can help businesses identify top-value customers.

-> Visualizations make data come alive and offer strategic insights.

-> Mistakes help me slow down and pay attention to detail—which matters in real-world projects.

## Final Thoughts
Yes, it was hard. But I pushed through.
Day 5, done!
