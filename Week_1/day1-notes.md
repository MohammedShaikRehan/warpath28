# Day 1 Notes — NumPy Deep Dive

## Key Concepts & Functions Learned

- "np.max" , "np.min", "np.sum", "np.mean": Basic aggregations  
- "np.argmax": Returns the **flat index** of the maximum element  
- "np.unravel_index(idx, shape)" : Converts a flat index to **row/col** index using " data.shape "

> Eg: "np.unravel_index(9, (3, 4)) → (2, 1)"

- " index[0]+1 ", " index[1]+1 ": Converts 0-based indexing to human-friendly 1-based

- "np.where(temps > 35)" : Finds indices where condition is **True**

- "np.diff(array)" : Finds **consecutive differences** (useful for time series & forecasting)

---

# Observations & Reflections

- Understanding "unravel_index" felt tricky at first — visualizing a grid helped a lot (didnt get cooked).
- I need to practice "np.where" and combine it with slicing .
- Remember: shape-based indexing is key for later forecasting tasks!

---

# Next Steps

- Apply "np.where" on custom dataset  
- Push first ".ipynb" practicing all above
- Summarize today’s learning in GitHub + reflect post-German class
