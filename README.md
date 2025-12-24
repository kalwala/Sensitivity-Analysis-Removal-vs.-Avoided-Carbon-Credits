# Interactive Sensitivity Analysis (Carbon Credits & Revenue)

👉 **Click below to open the interactive visualization**  
*(Plotly-based, hover-enabled, fully interactive)*

🔗 **[Open Interactive Sensitivity Analysis](https://kalwala.github.io/REPO_NAME/sensitivity_analysis.html)**

---

## What this visualization shows
- Sensitivity of **total project revenue** to:
  - Avoided emission credit price ($/tCO₂)
  - Removal credit price ($/tCO₂)
- Based on a **5-year carbon project scenario**
- Includes:
  - Avoided-only credit years
  - Avoided + removal credit years
  - Net revenue after fixed project costs
  - Per-farmer benefit estimates (₹)

---

## Technical Overview
This repository implements a **scenario-based sensitivity framework** using R and Plotly:

- Credit volumes:
  - Avoided credits: 18,949.3 tCO₂
  - Removal credits: 52,110.7 tCO₂
- Project scale: 16,000 ha
- Time horizon: 2025–2029
- Cost structure: fixed 5-year implementation cost
- Outputs:
  - Interactive heatmaps (hover-enabled)
  - Revenue, net revenue, and farmer-level benefit surfaces

---

## How the interactive file was created
The interactive HTML was generated using:
- `plotly`
- `htmlwidgets::saveWidget(selfcontained = TRUE)`

See:
- `sensitivity.R` – full reproducible code :contentReference[oaicite:1]{index=1}
- `sensitivity_analysis.html` – interactive output

---

## How to reproduce
```r
source("sensitivity.R")
