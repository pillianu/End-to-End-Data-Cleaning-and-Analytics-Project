# End-to-End Data Lifecycle Project (SQL, Excel & Power BI)

## 📌 Project Overview
This project demonstrates an end-to-end data analytics lifecycle focusing on **Data Exploration, Data Cleaning, and Data Analysis/Visualization** across three major tools: MS Excel, MySQL, and Power BI. The goal was to take a messy, unformatted raw sales dataset and transform it into a trusted, interactive business intelligence dashboard.

---

## 🔍 Phase 1: Data Exploration (Auditing the Data)
Before applying functions, I audited the raw dataset to detect data entry issues and structural errors:
- Tracked overall record volume using row counts.
- Isolated duplicate primary transaction keys.
- Discovered multiple mixed-case text inconsistencies across categorical data attributes.
- Located missing data slots marked as `null` configurations.

---

## 🛠️ Phase 2: Data Cleaning (Achieving Data Integrity)
To prevent skewed analysis metrics, I implemented structured cleanup procedures:
- **In MS Excel:** Utilized `=TRIM(PROPER())` to standardize text fields and remove erratic spacing. Applied the native 'Remove Duplicates' tool to eliminate duplicate entry rows.
- **In MySQL:** Executed standardizing `UPDATE` operations and handled redundancy securely using staging structures.
- **In Power Query (Power BI):** Enabled visual profiling (Column Quality) to trace errors. Overwrote database null markers with uniform text placeholders.

---

## 📈 Phase 3: Data Analysis & Visual Dashboards
Once the data pipeline was pristine, I extracted business intelligence metrics:
- Developed **Pivot Tables** in Excel to calculate subtotal revenues by product category.
- Formulated an advanced **DAX Measure** in Power BI using a row-by-row `SUMX` iterator blended with `COALESCE` to handle missing fields cleanly.
- Constructed an interactive **Visual Dashboard** containing KPI Summary Cards, Clustered Bar Charts, and Slicers to enable live query-on-demand filtering.

---

## 💻 Tech Stack Used
- **Spreadsheet Analytics:** Microsoft Excel (Advanced Formulas, Pivot Tables)
- **Database Engine:** MySQL Workbench (Data Manipulation Language, Window Functions)
- **Business Intelligence:** Power BI Desktop (Power Query Engine, DAX Expressions)
