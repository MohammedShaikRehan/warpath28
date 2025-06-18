## Section 01: Pandas Core Concepts

### 🤔 What is Pandas?
**Pandas** is a powerful Python library built on top of **NumPy** that makes working with **tabular data** (think: rows and columns) super simple.

If **Excel + Python had a baby**, it would be called **Pandas** 🍼🐍  
We use it for:
- Cleaning data  
- Analyzing patterns  
- Manipulating tables

---

### 🧠 What is a `Series`?
- A **Series** is like a **single column** in Excel.
- It’s **1D** — a one-dimensional array with labels (indexes) for each value.

Think: A list with labels  
Example: `pd.Series([1, 2, 3])`

---

### 🧠 What is a `DataFrame`?
- A **DataFrame** is like a **full table** — made of **multiple Series** (columns).
- It’s **2D**: rows × columns.
- Each column is a Series; rows are labeled by an index, columns by their names.

Think: A dictionary of Series = a table

---

### Mini Challenge: Create a DataFrame (to remember with ease)

**Goal:** Create a DataFrame using `pd.Series` for each column.

```python
import pandas as pd

data = pd.DataFrame({ 
    'City': pd.Series(['Delhi', 'Mumbai', 'Bangalore']),
    'Temp (°C)': pd.Series([42, 39, 34]),
    'Humidity (%)': pd.Series([25, 45, 60])
})

print(data)
```
---
## Section 02: Indexing, Filtering & Transformations

---

### 📌 Accessing Data with `.loc[]` and `.iloc[]`

- `.loc[]` → Access **rows by label** (like `'Messi'`)
- `.iloc[]` → Access **rows by index position** (like `0`, `1`, `2`)

```python
df.loc['Messi']     # Gets the row with label 'Messi'
df.iloc[0]          # Gets the first row by position
```

**Tip(dont forget ever!):** we can set your own index to make `.loc[]` even more powerful:

```python
df.set_index('Player', inplace=True) #inplace is to perma del it btw
df.loc['Mbappe']    # Works only if 'Player' is set as index(like messi better)
```

- To bring back the default numeric index:

```python
df.reset_index(inplace=True)
```

---

### Describing Data

```python
df.describe()       # Get summary statistics (mean, std, min, max, etc.)
```

---

### Sorting Values

```python
df.sort_values(by='Goals', ascending=False)   # Sort by 'Goals' in descending order
df.sort_values(by='Goals', ascending=True)    # Sort by 'Goals' in ascending order
```

---

### 🤡 Boolean Filtering (Like SQL WHERE)

- Filter rows using a condition:

```python
df[df['Goals'] > 500]         # Rows where 'Goals' > 500
df[df['Retired'] == False]    # Non-retired players
```

---

### Using `.apply()` — Row-wise logic

- AddING a new column using logic with `lambda`: #basically a short loop but super cool

```python
df['Tier'] = df['Goals'].apply(lambda x: 'Legend' if x > 700 else 'Active')
```

---

### Using `.map()` — Fast mapping using dictionaries

- Example: Map clubs to their leagues

```python
club_to_league = {
    'Al Nassr': 'Saudi Pro League',
    'PSG': 'Ligue 1',
    'Man City': 'Premier League'
}

df['League'] = df['clubs'].map(club_to_league)
```

⚠️ If a value is not found in the dictionary, `.map()` returns `NaN` for that row.

---

### Dropping Columns (Be careful!--messed up so many times)

```python
df.drop('Assists', axis=1)                     # ❌ Won’t change df unless:
df.drop('Assists', axis=1, inplace=True)       # ✅ Modifies df directly
df = df.drop('Assists', axis=1)                # ✅ Reassigns to df
```

---

### Setting and Resetting Index

```python
df.set_index('Player', inplace=True)   # Set 'Player' as the new index
df.reset_index(inplace=True)           # Reset back to numeric index
```

---

## End of Day Recap

- `.loc[]` vs `.iloc[]`
- `.describe()`, `.sort_values()`
- Boolean filtering using conditions
- Creating new columns with `.apply()` and `.map()`
- Dropping columns safely
- Setting & resetting index like a pro

---
