# Analyzing eCommerce Business Performance

### Introduction

Analyzing eCommerce Business Performance with SQL. In this Mini Project, a member of the Data Analytics team in an eCommerce company is tasked. This company is one of the largest marketplaces in South America connecting micro-business actors with their customers. As a member of the Data Analytics team, there is the responsibility to analyze three aspects related to the company's business performance. These three aspects include customer growth, product quality, and payment type. The provided data will be processed to create a business performance report on these three aspects.

### Step-by-step Analysis

1. Create a new database along with its tables for the prepared data.
2. Import CSV data into the database.
3. Create an entity relationship between tables, based on the schema in the file "Data Relationship.png". Then export the Entity Relationship Diagram (ERD) as an image.
   
![Data Relationship](https://github.com/ricakesuma/Analyzing-eCommerce-Business-Performance/blob/main/Step%2001/datarelationship.pgerd.png)

4. Display the average number of monthly active customers (monthly active user) for each year
5. Display the number of new customers for each year.
6. Display the number of customers who made purchases more than once (repeat order) for each year.
7. Display the average number of orders made by customers for each year.
8. Combine the three metrics that have been successfully displayed into one table view.
9. Create a table containing the total revenue information for each year.
10. Create a table that contains the total number of canceled orders for each year.
11. Create a table containing the names of product categories that generated the highest total revenue for each year.
12. Create a table containing the names of product categories with the highest number of canceled orders for each year.
13. Combine the gathered information into a single table view.
14. Display the all-time usage count of each payment type, sorted from the most favored.
Display detailed information on the usage count of each payment type for each year.

### Interpretation
![Annual Customer Activity Growth Analysis](https://github.com/ricakesuma/Analyzing-eCommerce-Business-Performance/blob/main/Step%2002/download%20(2).png)

#### 1. Number of New Customers
- **Year 2016:** There are 329 new customers, indicating that this might be the initial year of business or an early phase for the company.
- **Year 2017:** There's a significant increase in the number of new customers, reaching 45,101. This could indicate the success of various marketing initiatives or new products that successfully attract customer interest.
- **Year 2018:** The increase in new customers continues, with 54,011 new customers, showing that the company has been successful in maintaining or even increasing its attractiveness to new customers.

#### 2. Number of Repeat Customers
- **Year 2016-2018:** The value is zero for all years, meaning no customers have come back to make more than one purchase. This could be a sign that the current customer retention strategy is either ineffective or non-existent.

#### 3. Average Number of Orders per Customer
- **Year 2016-2018:** The average number of orders per customer is 1.0 for each year, indicating that the majority of customers only make one transaction. This is consistent with the number of repeat customers being zero, indicating a need to focus on customer retention.

Overall, the graphic shows that the company has been successful in attracting new customers but has not been successful in retaining existing ones. This is a signal for the company to start or deepen its customer retention strategy.

![Annual Customer Activity Growth Analysis](https://github.com/ricakesuma/Analyzing-eCommerce-Business-Performance/blob/main/Step%2003/download.png)
#### 1. Total Revenue by Year
- **2016**: The total revenue is approximately 46,654 units, which suggests that this might be the initial phase of the business. The top-selling product category is "Furniture Decor."
  
- **2017**: There is a significant jump in the total revenue to approximately 6.92 million units. The top-selling product category switches to "Bed Bath Table," indicating a change in consumer preferences or successful marketing campaigns.
  
- **2018**: The total revenue further increases to approximately 8.45 million units. "Health Beauty" becomes the top-selling category, possibly suggesting shifts in market trends or successful introduction of new products in this category.

#### 2. Number of Cancelled Orders by Year
- **2016**: There are 26 cancelled orders, and the most frequently cancelled category is "Toys."
  
- **2017**: The number of cancelled orders increases to 265, with "Sports Leisure" being the most cancelled category. This could point to issues related to product quality or delivery in this specific category.
  
- **2018**: Cancelled orders further increase to 334. Interestingly, the "Health Beauty" category is both the top-selling and most cancelled category, suggesting the need for a deeper look into this category.
