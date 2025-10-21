select *
from [Student Financial Planning Project]..student_financial_planning

--select top 20
select top 20 *
from student_financial_planning

--confirming row counts and distinct students
SELECT 
    COUNT(*) AS total_rows,
    COUNT(DISTINCT Student_ID) AS distinct_students,
    COUNT(DISTINCT Month) AS distinct_months
FROM student_financial_planning
--correct number of rows

--checking for null values
SELECT
  SUM(CASE WHEN Income IS NULL THEN 1 ELSE 0 END) AS null_income,
  SUM(CASE WHEN Total_Expenses IS NULL THEN 1 ELSE 0 END) AS null_total_expenses,
  SUM(CASE WHEN Savings IS NULL THEN 1 ELSE 0 END) AS null_savings
FROM student_financial_planning
--no  null values

--CHECK COLUMN TYPE AND COLUMN LENGTHS
SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'student_financial_planning'

--checking calculated column
SELECT TOP 10
    Student_ID, Month,
    Feeding + Transport + Rent + Utilities + Entertainment + Other_Expenses AS calc_total,
    Total_Expenses,
    ROUND(Total_Expenses - (Feeding + Transport + Rent + Utilities + Entertainment + Other_Expenses), 2) AS difference
FROM student_financial_planning
WHERE ABS(Total_Expenses - (Feeding + Transport + Rent + Utilities + Entertainment + Other_Expenses)) > 0.01;
 
--created a expense_to income ratio
    ALTER TABLE student_financial_planning
ADD Expense_to_Income_Ratio FLOAT;

update student_financial_planning
SET Expense_to_Income_Ratio =
    ROUND(Total_Expenses / NULLIF(Income, 0), 3);

    SELECT TOP 10
    Student_ID,
    Income,
    Total_Expenses,
    Expense_to_Income_Ratio
FROM student_financial_planning;

--checking financial
SELECT 
    ROUND(AVG(Income), 2) AS avg_income,
    ROUND(AVG(Total_Expenses), 2) AS avg_expenses,
    ROUND(AVG(Savings), 2) AS avg_savings,
    ROUND(AVG(Expense_to_Income_Ratio) * 100, 2) AS avg_expense_ratio_percent
FROM student_financial_planning

--which level spends the most
SELECT 
    School_Level,
    ROUND(AVG(Income), 2) AS avg_income,
    ROUND(AVG(Total_Expenses), 2) AS avg_expenses,
    ROUND(AVG(Savings), 2) AS avg_savings,
    ROUND(AVG(Expense_to_Income_Ratio) * 100, 2) AS avg_expense_ratio_percent
FROM student_financial_planning
GROUP BY School_Level
ORDER BY School_Level


--what gender spends the most
SELECT 
    Gender,
    ROUND(AVG(Income), 2) AS avg_income,
    ROUND(AVG(Total_Expenses), 2) AS avg_expenses,
    ROUND(AVG(Expense_to_Income_Ratio) * 100, 2) AS avg_expense_ratio_percent
FROM student_financial_planning
GROUP BY Gender

--monthly trends
SELECT 
    Month,
    ROUND(AVG(Income), 2) AS avg_income,
    ROUND(AVG(Total_Expenses), 2) AS avg_expenses,
    ROUND(AVG(Savings), 2) AS avg_savings,
    ROUND(AVG(Expense_to_Income_Ratio) * 100, 2) AS avg_expense_ratio_percent
FROM student_financial_planning
GROUP BY Month
ORDER BY 
    CASE 
        WHEN Month = 'Jan' THEN 1
        WHEN Month = 'Feb' THEN 2
        WHEN Month = 'Mar' THEN 3
        WHEN Month = 'Apr' THEN 4
        WHEN Month = 'May' THEN 5
        WHEN Month = 'Jun' THEN 6
        WHEN Month = 'Jul' THEN 7
        WHEN Month = 'Aug' THEN 8
        WHEN Month = 'Sep' THEN 9
        WHEN Month = 'Oct' THEN 10
        WHEN Month = 'Nov' THEN 11
        WHEN Month = 'Dec' THEN 12
    END
    --added all the months incase of update to the table

--top 5 highest spenders
SELECT TOP 5
    Student_ID,
    School_Level,
    Gender,
    ROUND(AVG(Total_Expenses), 2) AS avg_expenses
FROM student_financial_planning
GROUP BY Student_ID, School_Level, Gender
ORDER BY avg_expenses DESC

--who spends more off-campus or on-campus
SELECT 
    CASE WHEN Rent = 0 THEN 'On-Campus' ELSE 'Off-Campus' END AS accommodation_type,
    ROUND(AVG(Total_Expenses), 2) AS avg_expenses,
    ROUND(AVG(Savings), 2) AS avg_savings
FROM student_financial_planning
GROUP BY CASE WHEN Rent = 0 THEN 'On-Campus' ELSE 'Off-Campus' END

--expense breakdown
SELECT
    ROUND(AVG(Feeding), 2) AS avg_feeding,
    ROUND(AVG(Transport), 2) AS avg_transport,
    ROUND(AVG(Rent), 2) AS avg_rent,
    ROUND(AVG(Utilities), 2) AS avg_utilities,
    ROUND(AVG(Entertainment), 2) AS avg_entertainment,
    ROUND(AVG(Other_Expenses), 2) AS avg_other
FROM student_financial_planning

--create views for power bi
CREATE OR ALTER VIEW vw_summary_by_level AS
SELECT 
    School_Level,
    ROUND(AVG(Income), 2) AS avg_income,
    ROUND(AVG(Total_Expenses), 2) AS avg_expenses,
    ROUND(AVG(Savings), 2) AS avg_savings,
    ROUND(AVG(Expense_to_Income_Ratio) * 100, 2) AS avg_expense_ratio_percent
FROM student_financial_planning
GROUP BY School_Level

CREATE OR ALTER VIEW vw_summary_by_gender AS
SELECT 
    Gender,
    ROUND(AVG(Income), 2) AS Avg_Income,
    ROUND(AVG(Total_Expenses), 2) AS Avg_Expenses,
    ROUND(AVG(Savings), 2) AS Avg_Savings,
    ROUND(AVG(Expense_to_Income_Ratio) * 100, 2) AS Avg_Expense_Ratio_Percent
FROM student_financial_planning
GROUP BY Gender;

SELECT name 
FROM sys.views
WHERE name LIKE 'vw_%';

CREATE OR ALTER VIEW vw_expense_by_category AS
SELECT
    ROUND(AVG(Feeding), 2) AS Avg_Feeding,
    ROUND(AVG(Transport), 2) AS Avg_Transport,
    ROUND(AVG(Rent), 2) AS Avg_Rent,
    ROUND(AVG(Utilities), 2) AS Avg_Utilities,
    ROUND(AVG(Entertainment), 2) AS Avg_Entertainment,
    ROUND(AVG(Other_Expenses), 2) AS Avg_Other_Expenses
FROM student_financial_planning

