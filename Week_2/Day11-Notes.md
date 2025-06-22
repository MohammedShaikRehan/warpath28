# 📅 Warpath: Day 11 – Regional CLV Breakdown

##  What I Learned

###  Grouped Aggregations with Multiple Metrics
```python
df.groupby(['Region', 'Gender'])['CLV'].agg(
    Total_Customers='count',
    Average_CLV='mean',
    Min_CLV='min',
    Max_CLV='max'
)
```
> 💡 We can compute multiple summary statistics in one `.agg()` call and reset the index to make the result more readable.

---

###  Pivot Table to Reshape Data
```python
pivot = df.pivot_table(index='Region', columns='Gender', values='CLV', aggfunc='mean')
```
>  Used to reshape data before visualizing. Here, we analyzed average CLV by region and gender.

---

###  Heatmap Visualization
```python
sns.heatmap(pivot, annot=True, cmap='YlGnBu')
plt.title('Average CLV by Region and Gender')
plt.show()
```
>  Great for spotting trends across categories. Annotating helps make the data readable.

---

###  Total CLV by Region (Bar Plot)
```python
region_totals = df.groupby('Region')['CLV'].sum().reset_index()
sns.barplot(data=region_totals, x='Region', y='CLV', palette='viridis')
plt.title('Total CLV per Region')
plt.show()
```
>  Helps identify which regions contribute most to total customer value.

---

## Micro-Challenge
**Questions Answered:**
- Which region has the highest CLV for female customers?
- Which region has the lowest total CLV?
- Which gender has higher CLV in the South?
- What trends are visible in the heatmap?

---

##  Tools & Techniques Practiced
- `groupby()` with multiple aggregations
- `pivot_table()` for matrix-style breakdown
- `sns.heatmap()` and `sns.barplot()` for visual insights
- Data storytelling through region/gender splits

---

##  Reflection
> This day helped me level up my **multi-metric summarization** and **category-wise comparison** skills. I now understand when to use pivot tables vs. groupby, and how to translate those into visuals that tell a story.
> more importantly I am gainging fluency my doing this again and again

