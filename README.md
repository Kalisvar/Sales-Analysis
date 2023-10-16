**WALAMRTSALES ANALYSIS**

**ABOUT THE PROJECT :**

The goal of this project is to examine Walmart Sales data to comprehend top-performing branches and items, sales trends for various products, and consumer behaviour.

**DATA :**

The dataset was obtained from the Kaggle. This dataset contains sales transactions from three different branches of Walmart, located in Mandalay, Yangon, and Naypyitaw. The data contains 17 columns and 1000 rows.

| Column                  | Description                             | Data Type      |
| :---------------------- | :-------------------------------------- | :------------- |
| invoice_id              | Invoice of the sales made               | VARCHAR(30)    |
| branch                  | Branch at which sales were made         | VARCHAR(10)    |
| city                    | The location of the branch              | VARCHAR(30)    |
| customer_type           | The type of the customer                | VARCHAR(30)    |
| gender                  | Gender of the customer making purchase  | VARCHAR(20)    |
| product_line            | Product line of the product solf        | VARCHAR(100)   |
| unit_price              | The price of each product               | DECIMAL(10, 2) |
| quantity                | The amount of the product sold          | INT            |
| VAT                 | The amount of tax on the purchase           | FLOAT(6, 4)    |
| total                   | The total cost of the purchase          | DECIMAL(10, 2) |
| date                    | The date on which the purchase was made | DATE           |
| time                    | The time at which the purchase was made | TIMESTAMP      |
| payment_method          | The total amount paid                   | VARCHAR(30)    |
| cogs                    | Cost Of Goods sold                      | DECIMAL(10, 2) |
| gross_margin_percentage | Gross margin percentage                 | FLOAT(11, 9)   |
| gross_income            | Gross Income                            | DECIMAL(10, 2) |
| rating                  | Rating                                  | FLOAT(2, 1)    |



**METHOD USED:**

**DATA cleaning :**

In this initial step, data is inspected to ensure that NULL values and missing values are identified, and data replacement techniques are applied to replace any missing or NULL values.

- Build the database.
- Created the table and inserted the csv file into the database table.

To provide insight into sales in the morning, afternoon, and evening, add a new column called time\_of\_day. The question of when most sales are made during the day will be helped by this.

Create a new column called day\_name that holds the extracted days of the week (Mon, Tue, Wed, Thur, Fri) that the provided transaction occurred on. This will provide insight into the busiest day of the week for each branch.

Create a new column called month\_name that holds the extracted months of the year (Jan, Feb, Mar) on which the specified transaction occurred. Identify the month of the year with the most sales and profits.

**EXPLORATORY DATA ANALYSIS :**

It is done to answer the business questions and aims of this project.

**CONCLUSION:**

**BUSINESS QUESTION :**

**GENRIC QUESTION:**

1. How many unique cities does the data have?
2. In which city is each branch?

**PRODUCT QUESTIONS:**

1. How many unique product lines does the data have?
2. What is the most common payment method?
3. What is the most selling product line?
4. What is the total revenue by month?
5. What month had the largest COGS?
6. What product line had the largest revenue?
7. What is the city with the largest revenue?
8. What product line had the largest VAT?
9. Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
10. Which branch sold more products than average product sold?
11. What is the most common product line by gender?
12. What is the average rating of each product line?

**SALES QUESTION:**

1. Number of sales made in each time of the day per weekday
2. Which of the customer types brings the most revenue?
3. Which city has the largest tax percent/ VAT ( **Value Added Tax** )?
4. Which customer type pays the most in VAT?

**CUSTOMER QUESTION:**

1. How many unique customer types does the data have?
2. How many unique payment methods does the data have?
3. What is the most common customer type?
4. Which customer type buys the most?
5. What is the gender of most of the customers?
6. What is the gender distribution per branch?
7. Which time of the day do customers give most ratings?
8. Which time of the day do customers give most ratings per branch?
9. Which day fo the week has the best avg ratings?
10. Which day of the week has the best average ratings per branch?
