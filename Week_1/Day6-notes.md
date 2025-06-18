# 📘 Day 6 – Cleaning, Categorizing, and Plotting (with moments of truth)

---

## Section 1: 🧹 Cleaning Numeric Data with `.apply()`

Today, I revisited `.apply()` — honestly, a function that turns us from passive users into actual thinkers. Here's what we did:

- Cleaned the `Age` column using `.apply()` and a custom function.
- The goal was to:
  - Remove 'unknown', '--', blanks
  - Keep only numeric parts
  - Convert to integers or set as `np.nan` if not usable

### My function looked like this:

```python
def clean_age(val):
    val = str(val).lower()
    if 'unknown' in val or val.strip() in ['--', '']:
        return np.nan
    val = ''.join([c for c in val if c.isdigit()])
    return int(val) if val else np.nan

df['Age'] = df['Age'].apply(clean_age)
```
## What I Learned:
.apply() + custom function = full control over data.

I was finally able to handle all edge cases — even people who typed age like “23 years old”.

#I MADE A MISTAKE HERE!
Initially, I thought using .replace() was enough… but that won’t help when values are inconsistent. .apply() with a good function is way more scalable like for row wise absolute control.

---

## Section 2: 🧼 Cleaning Categorical Data (Gender, Region etc.)
This one was messy — some people typed 'f', others wrote 'Female ', and a few typed 'FeMaLe'. Cleaning all that manually would be madness.

I built this cleaner:
```
def clean_gender(val):
    val = str(val).lower().strip()
    if 'f' in val:
        return 'female'
    elif 'm' in val:
        return 'male'
    else:
        return np.nan

df['Gender'] = df['Gender'].apply(clean_gender)
```
I also fixed the Region column using .replace() but noted that it's not enough when people type weird stuff like "Est" for "East".

---

## Section 3: Categorizing Ages into Groups using pd.cut()
-> I finally understood how to group numeric data using bins.

```
df['Age_Group'] = pd.cut(df['Age'], bins=[0, 18, 35, 60, 100],
                         labels=['Teen', 'Young Adult', 'Adult', 'Senior'])

```

## 🔥 Lessons:
-> `pd.cut()` is perfect for converting continuous data into labels.

-> It helps us analyze behavior by age group.

-> we must have CLEAN data before you apply cut() – or the bins will go crazy.

---

## Section 4: Visualizing Relationships (Barplots, Heatmaps)

-> I finally touched base with Seaborn again.

I used:

`sns.heatmap(df[['CLV', 'Orders']].corr(), annot=True, cmap='coolwarm')`
Also tried:

`sns.barplot(x='Region', y='Spend', data=df)`

---

🧠 What I Noticed:
-> Heatmaps are 🔥 for correlation. The brighter the cell, the stronger the relationship.

-> Barplots are cleaner than pie charts when comparing across categories.

-> I finally got why .show() is needed — otherwise, Jupyter just skips the plot sometimes. (you were executing so many times without show wondering what you did wrong)

---

## Grilling Questions I Can Answer Now:
-> Why use .apply() vs .replace()?

-> When should you use pd.cut()?

-> How to handle garbage text values in numeric columns?

-> When to use barplot vs heatmap?

-> How to make logic reusable using functions?

## Final Thoughts:
Today felt repetitive at first — like I was going over old stuff. But when I started writing my own functions and fixing real messes in the data, it clicked. I felt like I wasn’t just coding, but understanding the “why” behind each line.

Was it a good day? Yeah. A bit draining, but the kind of draining that makes you smarter. I felt proud of the custom logic I wrote and how I debugged weird cases.

-Rehan

