use sales;
-- Count of customers by type
SELECT customer_type, COUNT(*) AS total_customers
FROM customers
GROUP BY customer_type;

-- Total number of unique customers who made purchases
SELECT COUNT(DISTINCT customer_code) AS active_customers
FROM transactions;

-- Top 5 customers by total sales amount
SELECT c.customer_code, c.custmer_name, SUM(t.sales_amount) AS total_spent
FROM transactions t
JOIN customers c ON t.customer_code = c.customer_code
GROUP BY c.customer_code, c.custmer_name
ORDER BY total_spent DESC
LIMIT 5;
-- Monthly revenue by market in 2020
SELECT d.month_name, m.markets_name, SUM(t.sales_amount) AS total_revenue
FROM transactions t
JOIN date d ON t.order_date = d.date
JOIN markets m ON t.market_code = m.markets_code
WHERE d.year = 2020
GROUP BY d.month_name, m.markets_name
ORDER BY d.month_name, total_revenue DESC;





SELECT * FROM sales.transactions;
--  Show all customer records

SELECT * FROM customers;

--  Show total number of customers

    SELECT count(*) FROM customers;

--  Show transactions for Chennai market (market code for chennai is Mark001

    SELECT * FROM sales.transactions where market_code='Mark001';

--  Show distrinct product codes that were sold in chennai

   SELECT distinct product_code FROM sales.transactions where market_code='Mark001';

-- Show transactions where currency is US dollars

  SELECT * from sales.transactions where currency="USD";

--  Show transactions in 2020 join by date table

    SELECT sales.transactions.*, sales.date.* FROM sales.transactions INNER JOIN date ON sales.transactions.order_date=sales.date.date where sales.date.year=2020;

--  Show total revenue in year 2020,

    SELECT SUM(transactions.sales_amount) FROM transactions INNER JOIN date ON transactions.order_date=date.date where date.year=2020 and transactions.currency="INR\r" or transactions.currency="USD\r";
	
--  Show total revenue in year 2020, January Month,

    SELECT SUM(transactions.sales_amount) FROM transactions INNER JOIN date ON transactions.order_date=date.date where date.year=2020 and date.month_name="January" and (transactions.currency="INR\r" or transactions.currency="USD\r");

--  Show total revenue in year 2020 in Chennai

    SELECT SUM(transactions.sales_amount) FROM transactions INNER JOIN date ON transactions.order_date=date.date where date.year=2020
and transactions.market_code="Mark001";
