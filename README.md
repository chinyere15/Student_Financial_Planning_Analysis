Student Financial Planning Analysis

Overview
This project explores the financial behavior of university students — analyzing how they **earn, spend, and save**. The goal was to discover spending patterns and generate insights for better financial planning among students.

This auto-fictional dataset represents students' financial records over six months, helping to uncover how different factors such as **gender**, **level**, and **residence type** (on/off campus) influence financial habits.

-

Tools Used
| Tool | Purpose |

| Excel | Data cleaning, validation, and quick exploratory analysis |
| SQL | Querying income, expense, and savings trends |
| Python | Data visualization and exploratory analysis |
| Power BI| Interactive dashboard and storytelling |



 Project Structure
Student_Financial_Planning_Analysis/
│
├── Data/                      # Raw and cleaned data files
├── Excel/                     # Data cleaning and pivot tables
├── SQL/                       # SQL queries and insights
├── Python/                    # Notebooks and visualizations
├── PowerBI/                   # Dashboard (.pbix) and theme
├── Reports/                   # Final report (.docx and PDF)
└── README.md                  # This file

---

Key Insights
- Average student income: ₦70,283.51
- Average expenses: ₦39,807.21
- Average savings: ₦30,828.37
- Expense-to-Income ratio:60.71%
- 100-level students** have the highest savings — fewer financial commitments.
- 500-level students** spend more, likely due to project and living costs.
-Females earn slightly more, but males spend slightly more.
Off-campus students spend 17% more than **on-campus** students due to rent, utilities, and transport.


Methodology

Excel
- Cleaned raw data (removed duplicates, errors, and blanks)
- Validated data types and created derived columns:
  - `Total Expenses`
  - `Saving Rate`
  - `Expense-to-Income Ratio`
- Created pivot charts showing **average income** and **savings trends**

SQL
- Verified data structure and performed exploratory queries:
  - Student count: 50
  - Months covered: 6
  - Total records: 300
- Generated insights by:
  - Comparing spending and savings by **gender**, **level**, and **month**
  - Identifying **top 5 spenders**
  - Comparing **on-campus vs off-campus** expenses

Python
- Used `pandas`, `matplotlib`, and `seaborn` for:
  - Monthly trend analysis (line plots)
  - Income vs Expenses comparison (bar charts)
  - Expense breakdown visualization

Power BI
- Created a fully interactive dashboard combining:
  - Income, Expenses, Savings, and Ratios
  - Slicers for **Month**, **Gender**, and **Level**
  - Visual storytelling on how spending behavior changes across groups



  Reflection
Going into this project, my goal was to understand the **financial positions of students** within a university context.

Using this dataset, I learned how students earn and spend — and how their financial behaviors differ across levels, gender, and residence type.  
New students (100-level) typically save more because of fewer financial responsibilities, while final-year students (500-level) tend to spend more due to projects and higher living costs.

This analysis helped me understand how students can improve financial habits through budgeting, expense tracking, and smarter savings plans. It also gave me practical experience in **data cleaning, SQL analysis, Python visualization, and dashboard creation.


 Power BI Dashboard Preview
![Dashboard Screenshot](Images/dashboard_screenshot.png)


 How to Use
1. Clone or download this project folder.
2. Open the Power BI file (`student_financial_dashboard.pbix`).
3. Use slicers to explore by month, gender, or level.
4. Open the Python notebook to view visualizations and calculations.
5. Check the SQL and Excel folders to trace the data analysis process.



 Author
Tope-ojo Ayobami Chinyere  
Information Systems Student | 📊 Data Analyst  
 Connect on [LinkedIn](www.linkedin.com/in/chinyere15)  
 atopojo@gmail.com

