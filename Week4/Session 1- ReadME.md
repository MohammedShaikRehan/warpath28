# Tableau Power Session 1 — Superstore Data Visualization

## 🌐 Live Dashboard
View the interactive dashboard here: [**Click to View on Tableau Public**](https://public.tableau.com/views/Session1SuperstoreDataVisualization/SuperstoreSalesOverviewDashboard?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

---

## Overview
For **Session 1** of my Tableau learning journey, I used Tableau Public’s **Sample – Superstore** dataset to create multiple visualizations and combine them into an **interactive dashboard**.  
The goal was to understand Tableau’s workspace, how to connect data, create charts, use filters, and design a visually appealing dashboard.

---

## Objectives
- Get comfortable with Tableau’s interface.
- Learn to create different chart types using drag-and-drop.
- Apply colors, sizes, labels, and filters to make visuals more insightful.
- Combine charts into a single dashboard for storytelling.

---

## ⚙️ Steps Taken

### **1️⃣ Loading the Dataset**
- Opened Tableau Public.
- Selected the built-in **Sample – Superstore** dataset.
- Clicked **Sheet 1** to start creating visuals.

---

### **2️⃣ Bar Chart: Sales by Category**
- **Category** → Columns
- **Sales** → Rows
- Sorted in descending order.
- **Sales** → Color (darker = higher sales)
- Formatted numbers to Currency.
- Renamed sheet: `"Sales by Category"`.

---

### **3️⃣ Treemap: Profit by Sub-Category**
- **Sub-Category** → Label (Marks Card)
- **Profit** → Size (Marks Card)
- **Profit** → Color (Marks Card)
- Selected **Treemap** from the "Show Me" panel.
- Edited colors → Diverging Red-Green:
  - Green for positive profit.
  - Red for negative profit.
- Renamed sheet: `"Profit Treemap"`.

---

### **4️⃣ Line Chart: Sales Over Time**
- **Order Date** → Columns → expanded to **Month**.
- **Sales** → Rows.
- Marks → changed to **Line**.
- **Category** → Color for separate trend lines.
- Renamed sheet: `"Sales Over Time"`.

---

### **5️⃣ Pie Chart: Sales by Region**
- **Region** → Color.
- **Sales** → Angle.
- **Sales** → Label (show % or values).
- Marks → Pie.
- Renamed sheet: `"Region Sales Pie"`.

---

### **6️⃣ Adding Filters**
- **Ship Mode** → Filters → Show Filter.
- Applied filter to all sheets in the dashboard.

---

### **7️⃣ Building the Dashboard**
- Created a **New Dashboard**.
- Added:
  - Sales by Category
  - Profit Treemap
  - Sales Over Time
  - Region Sales Pie
- Applied filters to all sheets.
- Tiled layout for clean alignment.
- Title: `"Superstore Sales Overview Dashboard"`.

---

## Key Formatting Tweaks
- Adjusted color opacity for maps to make borders visible.
- Used diverging color schemes for clear positive/negative differentiation.
- Formatted labels for clarity and professionalism.

---

## Insights Gained
- **Category-wise Sales:** Technology leads in total sales.
- **Profit Distribution:** Certain sub-categories generate losses despite high sales.
- **Sales Trends:** Seasonal spikes visible in Q4.
- **Regional Share:** The West region dominates sales share.

---

## Deliverables
- `.twbx` Tableau file containing all charts and dashboard.
- Screenshot of the final dashboard(BELOW).

<img width="1675" height="804" alt="image" src="https://github.com/user-attachments/assets/7afde566-1bdb-4b80-a712-d4628cefde68" />


---

## 💭 Reflection
I started with Tableau’s basics and realized it shares a lot of similarity with Excel’s pivot charts but is far more powerful for interactive dashboards. The drag-and-drop workflow, color encoding, and filters make data storytelling fast and intuitive.  
This foundation sets me up to tackle **Session 2**, where I will create a more advanced, real-world dashboard.

---
