---Create a  database 
CREATE DATABASE  walmartsales
USE walmartsales;
-- table creation 
CREATE TABLE sales(
  invoice_id VARCHAR (30) NOT NULL PRIMARY KEY,
  branch VARCHAR(10) NOT NULL,
  city VARCHAR(30) NOT NULL,
  customer_type VARCHAR(30) NOT NULL,
  gender VARCHAR(20) NOT NULL,
  product_line VARCHAR(100) NOT NULL,
  unit_price DECIMAL(10, 2) NOT NULL,
  quantity INT NOT NULL,
  VAT FLOAT(6, 4) NOT NULL,
  total DECIMAL(10, 2) NOT NULL,
  date DATE NOT NULL,
  time TIME NOT NULL,
  payment VARCHAR(30) NOT NULL,
  cogs DECIMAL(10,2) NOT NULL,
  gross_margin FLOAT(11, 9),
  gross_income DECIMAL(12, 4),
  rating FLOAT(2, 1)
  );
  ----------new column time_of_day ------
  ALTER TABLE walmartsales.sales 
  ADD time_of_day VARCHAR(15) NOT NULL;

  ----- value addition in the coloumn---
UPDATE walmartsales.sales
SET time_of_day = (CASE 
    WHEN time BETWEEN '00:00:00' AND '11:59:59' THEN 'Morning'
    WHEN time BETWEEN '12:00:00' AND '15:59:59' THEN 'Afternoon'
    ELSE 'Evening' 
    END);

    ---- new coloumn dayname ----
  ALTER TABLE walmartsales.sales 
  ADD day_name VARCHAR(15) NOT NULL;
  
  ---- value addition in new coloumn----
  UPDATE walmartsales.sales
  SET day_name = dayname(date)
  
   ----new column monthname  ----
  ALTER TABLE walmartsales.sales 
  ADD month_name VARCHAR(15) NOT NULL;
  
  ---- value addition in new coloumn----
UPDATE walmartsales.sales
SET month_name = monthname(date); 
---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------
-------------------------------------------------------------generic question --------------------------
            -----QUETSION ONE-------
SELECT DISTINCT  city FROM walmartsales.sales; 
             ----QUESTION two-----
SELECT DISTINCT branch, city FROM  walmartsales.sales;

--------------------------------------PRODUCT QUESTION---------------------
           ----QUESTION ONE (How many unique product lines does the data have)----
SELECT COUNT( Distinct product_line) AS unique_product_line from walmartsales.sales

           ----QUESTION TWO  (MOST COMMON PAYMENT METHOD)----
SELECT payment, count(payment) as Payment_count FROM  walmartsales.sales
GROUP BY   payment
ORDER BY payment_count desc;

		     ----QUESTION THREE( most selling product line)----
SELECT product_line,count(Product_line) AS product_count FROM walmartsales.sales
GROUP BY product_line
ORDER BY product_count DESC;

		     ----QUESTION FOUR (total revenue by month)----
SELECT month_name, SUM(total) as revenue FROM walmartsales.sales
GROUP BY month_name
ORDER BY revenue DESC;

	         ----QUESTION FIVE ( month had the largest COGS)----
SELECT month_name, SUM(cogs) as COGS FROM walmartsales.sales
GROUP BY month_name
ORDER BY cogs DESC;

	        ----QUESTION SIX(product line had the largest revenue)----
SELECT product_line,SUM(total) as revenue FROM walmartsales.sales
GROUP BY product_line
ORDER BY revenue DESC;

             ----QUESTION SEVEN (city with the largest revenue)----
SELECT city,SUM(total) as revenue FROM walmartsales.sales
GROUP BY city
ORDER BY revenue DESC;

		  ----QUESTION EIGHT(product line had the largest VAT)----
SELECT product_line,AVG(vat) as vat FROM walmartsales.sales
GROUP BY product_line
ORDER BY  vat DESC;

         ----QUESTION NINE(Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales)----
SELECT  DISTINCT Product_line , CASE WHEN quantity > AVG(quantity) THEN "GOOD" ELSE "BAD" END AS product_line_sales from walmartsales.sales
GROUP BY product_line,quantity;

          ---- QUESTION TEN (branch sold more products than average product sold)----
SELECT branch, SUM(quantity) AS qty FROM walmartsales.sales
GROUP BY branch;
HAVING SUM(quantity) > (SELECT AVG(quantity) FROM walmartsales.sales)

		   ----QUESTION TEN (most common product line by gender)----
SELECT gender,Product_line,count(gender) as total_count FROM walmartsales.sales
GROUP BY gender,product_line
ORDER BY total_count DESC;

          ---- QUESTION ELEVEN(average rating of each product line)----
SELECT product_line,ROUND(AVG(rating),2) AS average_rating from walmartsales.sales
GROUP BY product_line
ORDER BY average_rating DESC;

------------------------------------------------------------------------------------------------------------------------
-------------------SALES ------------------------
           ----QUESTION ONE (Number of sales made in each time of the day per weekday)----
SELECT day_name, time_of_day , COUNT(quantity) AS qty FROM  walmartsales.sales
GROUP BY time_of_day,day_name
ORDER BY day_name,time_of_day;

		   ----QUESTION TWO (Which of the customer types brings the most revenue)----
SELECT customer_type , sum(total) AS revenue FROM walmartsales.sales
GROUP BY customer_type
ORDER BY revenue DESC;

            ----QUESTION THREE(Which city has the largest tax percent/ VAT (Value Added Tax))----
SELECT city,SUM(VAT) AS vat_per FROM walmartsales.sales
GROUP BY city
ORDER BY vat_per DESC;

		   ----QUESTION FOUR(Which customer type pays the most in VAT)----
SELECT customer_type , sum(vat) as vat FROM walmartsales.sales
GROUP BY customer_type
ORDER BY vat DESC;

----------------------------------------------------------------------------
-------------------------------------CUSTOMER-----------------------------------------------

			----QUESTION ONE(unique customer types does the data have)----
SELECT count( DISTINCT customer_type) as count_unique_customer FROM walmartsales.sales;

            ----QUESTION TWO(unique payment methods does the data have)----
SELECT COUNT(DISTINCT payment) as count_of_payment FROM walmartsales.sales;

			---- QUESTION THREE(most common customer type)----
SELECT customer_type , COUNT(product_line)  as count FROM walmartsales.sales
GROUP BY customer_type
ORDER BY count DESC;

		     ----QUESTION FIVE(customer type buys the most)----
SELECT customer_type , count(*) as count FROM walmartsales.sales
GROUP BY customer_type;

             ----QUESTION SIX(What is the gender of most of the customers)----
SELECT gender, count(*) AS count FROM walmartsales.sales
GROUP BY gender
ORDER BY count DESC;

            ----QUESTION SEVEN(What is the gender distribution per branch)----
SELECT gender , branch , COUNT(*) AS cnt FROM walmartsales.sales
GROUP BY gender ,branch
ORDER BY cnt DESC;
 
			----QUESTION EIGHT(time of the day do customers give most ratings)----
 SELECT time_of_day, count(rating) as rating_count  FROM walmartsales.sales
 GROUP BY time_of_day
 ORDER BY rating_count DESC;
 
            ----QUESTION NINE(time of the day do customers give most ratings per branch)----
  SELECT branch,time_of_day, count(rating) as rating_count  FROM walmartsales.sales
 GROUP BY branch,time_of_day
 ORDER BY rating_count DESC;

            ----QUESTION TEN (day fo the week has the best avg ratings)----
SELECT day_name,avg(rating) as avg_rating FROM walmartsales.sales
GROUP BY day_name
ORDER BY avg_rating DESC;

		    ----QUESTION ELEVEN(day of the week has the best average ratings per branch)----
SELECT branch,day_name,avg(rating) as avg_rating FROM walmartsales.sales
GROUP BY day_name,branch
ORDER BY avg_rating DESC;






 
  
  
  
  

  
