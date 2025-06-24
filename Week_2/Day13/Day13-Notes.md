## Day 13 – Email Domain Analyzer (Bonus Challenge)

Today’s challenge focused on mastering `.str` operations, data cleaning, and domain-level segmentation.

---

### Dataset Used
We simulated a dataset with customer emails and CLV values.

```python
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# Sample Data
data = {
    'CustomerID': range(1, 11),
    'Email': [
        'alice@gmail.com ', 'bob@yahoo.com', 'charlie@outlook.com',
        'diana@GMAIL.com', 'edward@yahoo.COM', 'frank@protonmail.com ',
        'grace@outlook.COM', 'henry@gmail.com', 'irene@yahoo.com ', 'jack@gmail.COM'
    ],
    'CLV': [520, 340, 700, 800, 310, 420, 670, 510, 660, 560]
}

df = pd.DataFrame(data)
```

---

### Step 1: Clean and Extract Domain

```python
# Strip whitespaces and make emails lowercase
df['Email'] = df['Email'].str.strip().str.lower()

# Extract domain name
df['Domain'] = df['Email'].str.split('@').str[1]
```

---

### Step 2: Most Common Domains

```python
print(df['Domain'].value_counts())
```

---

### Step 3: Average CLV per Domain

```python
avg_clv = df.groupby('Domain')['CLV'].mean().sort_values(ascending=False)
print(avg_clv)
```

---

### Step 4: Visualize Top 5 Domains by Customer Count

```python
top_domains = df['Domain'].value_counts().head(5)

sns.barplot(x=top_domains.index, y=top_domains.values)
plt.title("Top 5 Email Domains by Customer Count")
plt.xlabel("Email Domain")
plt.ylabel("Customer Count")
plt.show()
```

---

### 🏆 Step 5: Add Tier & Analyze High-Tier % by Domain

```python
# Add Tier column
df['Tier'] = df['CLV'].apply(lambda x: 'High' if x > 600 else 'Mid' if x > 400 else 'Low')

# Count of high-tier by domain
high_tier_pct = (
    df[df['Tier'] == 'High']
    .groupby('Domain')
    .size()
    .div(df.groupby('Domain').size())
    .sort_values(ascending=False)
)

print(high_tier_pct)
```

---

## Key Skills Covered

- Data cleaning with `.str.strip()`, `.str.lower()`, `.split()`
- Grouping & Aggregating
- Barplot visualization with `sns.barplot()`
- Derived column creation using `.apply()`
- Domain-level segmentation & analysis

---

### 🧠 Reflections

> Today I learned how messy string-based columns (like emails) can be, and how powerful `.str` methods are in cleaning and transforming that data.  
> Adding domain-based segmentation helped unlock deeper customer insights, and the high-tier analysis by domain was 🔥.  

**Remember:**  
> "Cleaning, segmenting, visualizing — it’s not just about coding. It’s about unlocking insight."

---

