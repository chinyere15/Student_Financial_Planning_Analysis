import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

df = pd.read_excel(r"C:\Users\optex\Desktop\ALL OF BAMBAM PROJECTS\Student_Financial_Planning_Dataset.xlsx")

df.head()
df.info()
df.describe()

numeric_cols = ["Income","Feeding","Transport","Rent","Utilities","Entertainment","Other_Expenses"]
df[numeric_cols] = df[numeric_cols].apply(pd.to_numeric, errors='coerce')

df["Total_Expenses"] = df[["Feeding","Transport","Rent","Utilities","Entertainment","Other_Expenses"]].sum(axis=1)
df["Savings"] = df["Income"] - df["Total_Expenses"]
df["Expense_to_Income_Ratio"] = (df["Total_Expenses"] / df["Income"]).round(2)

df.head()
df.describe()
#@Average Income, Expenses, and Savings by Level
by_level = df.groupby("School_Level")[["Income","Total_Expenses","Savings","Expense_to_Income_Ratio"]].mean().round(2)
by_level

#Average by Gender
by_gender = df.groupby("Gender")[["Income","Total_Expenses","Savings","Expense_to_Income_Ratio"]].mean().round(2)
by_gender

#Monthly Trend
by_month = df.groupby("Month")[["Income","Total_Expenses","Savings"]].mean().round(2)
by_month

#Income vs Expenses by Level
plt.figure(figsize=(8,5))
sns.barplot(x=by_level.index, y=by_level["Income"], color="skyblue", label="Income")
sns.barplot(x=by_level.index, y=by_level["Total_Expenses"], color="salmon", label="Expenses")
plt.title("Average Income vs Expenses by School Level")
plt.legend()
plt.show()

#Monthly Trends
plt.figure(figsize=(8,5))
plt.plot(by_month.index, by_month["Income"], marker='o', label="Income")
plt.plot(by_month.index, by_month["Total_Expenses"], marker='o', label="Expenses")
plt.plot(by_month.index, by_month["Savings"], marker='o', label="Savings")
plt.title("Monthly Financial Trend")
plt.xlabel("Month")
plt.ylabel("Amount (₦)")
plt.legend()
plt.show()

#expense breakdown
expense_means = df[["Feeding","Transport","Rent","Utilities","Entertainment","Other_Expenses"]].mean().sort_values()
plt.figure(figsize=(7,5))
expense_means.plot(kind='bar', color='teal')
plt.title("Average Expense Breakdown")
plt.ylabel("Average Amount (₦)")
plt.show()

avg_income = df["Income"].mean()
avg_expenses = df["Total_Expenses"].mean()
avg_savings = df["Savings"].mean()
avg_ratio = df["Expense_to_Income_Ratio"].mean()

print(f"💡 Average monthly income: ₦{avg_income:,.2f}")
print(f"💡 Average monthly expenses: ₦{avg_expenses:,.2f}")
print(f"💡 Average monthly savings: ₦{avg_savings:,.2f}")
print(f"💡 Average expense-to-income ratio: {avg_ratio*100:.1f}%")

avg_income = df["Income"].mean()
avg_expenses = df["Total_Expenses"].mean()
avg_savings = df["Savings"].mean()
avg_ratio = df["Expense_to_Income_Ratio"].mean()

#💡Average monthly income: ₦70,283.51
#💡 Average monthly expenses: ₦39,827.21
#💡 Average monthly savings: ₦30,456.30
#💡 Average expense-to-income ratio: 60.8%

df.to_csv("Student_Financial_Planning_Cleaned2.csv", index=False)
