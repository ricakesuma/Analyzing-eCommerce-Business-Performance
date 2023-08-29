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
#### Annual Customer Activity Growth Analysis
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

### Annual Product Category Quality Analysis
![Annual Customer Activity Growth Analysis](https://github.com/ricakesuma/Analyzing-eCommerce-Business-Performance/blob/main/Step%2003/download.png)
#### 1. Total Revenue by Year
- **2016**: The total revenue is approximately 46,654 units, which suggests that this might be the initial phase of the business. The top-selling product category is "Furniture Decor."
  
- **2017**: There is a significant jump in the total revenue to approximately 6.92 million units. The top-selling product category switches to "Bed Bath Table," indicating a change in consumer preferences or successful marketing campaigns.
  
- **2018**: The total revenue further increases to approximately 8.45 million units. "Health Beauty" becomes the top-selling category, possibly suggesting shifts in market trends or successful introduction of new products in this category.

#### 2. Number of Cancelled Orders by Year
- **2016**: There are 26 cancelled orders, and the most frequently cancelled category is "Toys."
  
- **2017**: The number of cancelled orders increases to 265, with "Sports Leisure" being the most cancelled category. This could point to issues related to product quality or delivery in this specific category.
  
- **2018**: Cancelled orders further increase to 334. Interestingly, the "Health Beauty" category is both the top-selling and most cancelled category, suggesting the need for a deeper look into this category.

### Annual Payment Type Usage Analysis
![Annual Customer Activity Growth Analysis](https://github.com/ricakesuma/Analyzing-eCommerce-Business-Performance/blob/main/Step%2004/Picture1.png)
#### 1. Boleto:
- **2016**: There were 63 transactions made using Boleto.
- **2017**: A significant increase to 9,508 transactions, indicating a growing trust or convenience in this payment method.
- **2018**: A slight increase to 10,213 transactions, showing that Boleto maintains its popularity.

#### 2. Credit Card:
- **2016**: There were 258 credit card transactions.
- **2017**: A significant jump to 34,568 transactions, indicating either a surge in customer numbers or a preference shift towards credit cards.
- **2018**: Further increase to 41,969 transactions, solidifying credit cards as the most popular payment method.

#### 3. Debit Card:
- **2016**: Only 2 transactions, indicating extremely low usage.
- **2017**: Increases to 422, but still relatively low compared to other payment methods.
- **2018**: A more substantial increase to 1,105 transactions, but still not as popular as other methods.

#### 4. Not Defined:
- **2016-2018**: Almost no transactions, indicating that this category is rarely or never used.

#### 5. Voucher:
- **2016**: 23 transactions.
- **2017**: Increases to 3,027, showing significant growth.
- **2018**: Slightly decreases to 2,725 transactions, indicating a possible drop in voucher promotions or user interest.

#### Key Takeaways:
- Credit Card is the most popular payment method and shows consistent growth.
- Boleto also shows growth but at a slower pace compared to credit cards.
- Debit Card usage is growing but not as popular as Boleto or Credit Card.
- Voucher usage increased sharply in 2017 but saw a slight decline in 2018.

### Conclusions:

1. **Customer Growth**:
    - The company has been successful in attracting new customers each year, with a significant increase in 2017 and 2018. However, it struggles with customer retention, as there are no repeat orders.
2. **Revenue and Cancellations**:
    - Total revenue has been consistently growing each year, with top categories changing from "Furniture Decor" to "Health Beauty." However, the number of canceled orders is also increasing, suggesting potential issues in certain product categories.
3. **Payment Preferences**:
    - Credit Card payments dominate the market, followed by Boleto. There's an increasing but still minimal usage of Debit Cards. Voucher usage has seen a decline.

### Business Recommendations:

1. **Focus on Customer Retention**:
    - Implement loyalty programs or personalized marketing to encourage repeat purchases. 
2. **Quality Control and Delivery**:
    - Investigate the categories with high cancellations to identify if the issue lies in product quality or delivery services. 
3. **Payment Options**:
    - As Credit Cards are the most popular payment method, consider offering incentives for this payment method to increase conversions.
4. **Product Category Analysis**:
    - Pay attention to the top-selling and most-canceled categories. Stock more from the top-selling categories and investigate issues in the most-canceled ones.
5. **Revise Voucher Strategy**:
    - Given the slight decline in voucher usage, review the voucher strategy to understand whether it’s effectively driving sales or needs modification.
By focusing on these areas, the company can aim to both attract new customers and, more importantly, retain existing ones. This balanced focus will be key to sustainable growth.
