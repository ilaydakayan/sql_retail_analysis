# Retail Sales Analysis – SQL Project

## Project Overview
This project analyses retail transaction data using SQL with the goal of uncovering **actionable business insights**, rather than producing purely descriptive statistics.  
The focus is on understanding **when customers shop, what drives revenue, and which customers represent untapped growth potential**.

The analysis is designed to reflect how a data analyst would support **commercial decision-making**, such as staffing optimisation, category strategy, and customer value growth.

---

## Dataset Description
The dataset contains retail transaction records with the following key attributes:
- Transaction date and time  
- Customer information (ID, gender, age)  
- Product category  
- Quantity sold  
- Revenue and cost metrics  

Each row represents a single transaction.

---

## Data Preparation & Cleaning
Before analysis, the dataset was validated to ensure data quality and consistency.

Key steps:
- Verified total number of transactions
- Checked for missing values in critical fields
- Removed records containing NULL values
- Confirmed uniqueness of transaction IDs

After cleaning, the dataset contains **1,987 valid transactions** with no duplicate transaction IDs.

---

## Business Questions & Analysis

### Business Question 1  
**When do customers shop the most, and which hours generate the highest revenue?**

**Purpose:**  
Identify peak shopping hours to optimise staffing levels, store operations, and time-based promotions.

**Key Insight:**  
- Transaction volume and revenue peak in the **evening hours (17:00–22:00)**  
- The highest revenue is generated around **19:00–21:00**, indicating strong after-work shopping behaviour  

**Business Implication:**  
Staffing, inventory availability, and promotional campaigns should be prioritised during evening hours to maximise revenue impact.

---

### Business Question 2  
**Which product categories generate the highest total revenue?**

**Purpose:**  
Understand which categories are the primary revenue drivers.

**Key Insight:**  
- **Electronics** generates the highest total sales revenue  
- **Clothing** follows closely  
- **Beauty** contributes the least revenue among the three categories  

**Business Implication:**  
Electronics should be prioritised for growth and retention strategies, while Clothing and Beauty present opportunities for targeted uplift initiatives.

---

### Business Question 3  
**Who are the top-spending customers?**

**Purpose:**  
Identify high-value customers for retention and loyalty strategies.

**Key Insight:**  
- A small number of customers contribute disproportionately to total revenue  
- These customers represent a critical segment for personalised offers and long-term retention  

**Business Implication:**  
High-spending customers should be targeted with loyalty programs and exclusive incentives to reduce churn risk.

---

### Business Question 4  
**Which customers show high engagement but relatively low average spend? (High-potential customers)**

**Purpose:**  
Identify customers with strong purchase frequency but untapped revenue potential.

**Approach:**  
Customers with **10 or more transactions** were analysed based on their:
- Purchase frequency
- Total spend
- Average spend per transaction

**Key Insight:**  
- **Electronics** has the highest number of high-potential customers  
- These customers shop frequently but spend less per transaction compared to top spenders  
- Clothing and Beauty also show smaller but meaningful high-potential segments  

**Business Implication:**  
This segment represents the **most realistic revenue growth opportunity**, as increasing basket size is typically more cost-effective than acquiring new customers.  
Potential strategies include:
- Upselling premium products  
- Product bundles  
- Targeted cross-sell recommendations  

---

### Business Question 5  
**How is customer purchase behaviour distributed across transaction frequency?**

**Purpose:**  
Understand whether revenue depends on many occasional buyers or a smaller group of frequent customers.

**Key Insight:**  
- Most customers make relatively few transactions  
- A smaller group of frequent customers drives a large share of total transactions  

**Business Implication:**  
Revenue stability depends heavily on repeat customers, reinforcing the importance of retention and engagement strategies.

---

## Key Takeaways
- Evening hours are the most valuable time window for both volume and revenue  
- Electronics is the strongest revenue-driving category  
- A clear segment of **high-potential customers** exists across categories  
- Revenue growth opportunities lie more in **increasing customer value** than in customer acquisition  

---

## Conclusion
This project demonstrates how SQL can be used not only for data exploration, but for **business-oriented analysis** that supports strategic decision-making.  
By shifting focus from descriptive metrics to customer behaviour and revenue potential, the analysis highlights how data can directly inform commercial actions.

---

## Tools Used
- PostgreSQL  
- SQL (aggregation, window functions, subqueries)  
- pgAdmin  

