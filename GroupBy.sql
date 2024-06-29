create database interview_practice;
use interview_practice;
create table employees (
employee_id int primary key,
name varchar(50),
department varchar(50),
job_title varchar(50),
salary decimal(10,2),
gender varchar(10)
);

insert into employees(employee_id, name,department,job_title,salary,gender)values
(1,'Shubham','HR', 'Manager',75000,'Male'),
(2,'Sourabh','Finance','Analyst', 65000,'Male'),
(3, 'Anant', 'IT', 'Developer', 80000, 'Male'),
(4, 'Saurabh', 'IT', 'Developer', 78000, 'Male'),
(5, 'Deepti', 'HR', 'Recruiter', 55000, 'Female'),
(6, 'Manoj', 'Finance', 'Manager', 90000, 'Male'),
(7, 'Sri Ram', 'Marketing', 'Executive', 60000, 'Female'),
(8, 'Vishnu', 'Marketing', 'Manager', 85000, 'Female'),
(9, 'Shiva', 'IT', 'Support', 45000, 'Male'),
(10, 'Chirag', 'Finance', 'Analyst', 62000, 'Female');


Create Table Sales(sale_id int primary key,
product_id int,
sales_amount decimal(10,2),
region varchar(50));

insert into Sales (sale_id,product_id,sales_amount,region) values
(1, 101, 500, 'North'),
(2, 102, 1500, 'East'),
(3, 103, 2000, 'West'),
(4, 101, 250, 'North'),
(5, 104, 3000, 'South'),
(6, 105, 1200, 'East'),
(7, 106, 1700, 'West'),
(8, 101, 900, 'South'),
(9, 102, 1100, 'East'),
(10, 103, 1600, 'North');


Create Table orders(
order_id Int Primary Key,
customer_id int,
order_amount decimal(10,2),
status varchar(50),
shipping_method varchar(50)
);

insert into orders(order_id,customer_id,order_amount,status,shipping_method) values
(1, 201, 250, 'Shipped', 'Air'),
(2, 202, 450, 'Pending', 'Ground'),
(3, 203, 300, 'Delivered', 'Air'),
(4, 201, 700, 'Delivered', 'Ground'),
(5, 204, 150, 'Shipped', 'Air'),
(6, 205, 500, 'Cancelled', 'Ground'),
(7, 202, 600, 'Delivered', 'Ground'),
(8, 203, 350, 'Pending', 'Air'),
(9, 201, 400, 'Shipped', 'Ground'),
(10, 204, 750, 'Delivered', 'Air');


create table products(
product_id int Primary key,
name varchar(50),
category varchar(50),
price decimal(10,2)
);


insert into products (product_id,name,category,price)values
(101,'Laptop','Electronics',1200),
(102, 'Smartphone', 'Electronics', 800),
(103, 'Tablet', 'Electronics', 600),
(104, 'Printer', 'Office Supplies', 200),
(105, 'Desk', 'Furniture', 150),
(106, 'Chair', 'Furniture', 100);


Create Table customers(
customer_id int Primary key,
name varchar(50),
country varchar(50)
);

INSERT INTO customers (customer_id, name, country) VALUES
(201, 'Alice', 'USA'),
(202, 'Bob', 'Canada'),
(203, 'Charlie', 'UK'),
(204, 'David', 'Australia'),
(205, 'Eve', 'India');


create table students (
student_id int primary key,
name varchar(50),
grade_level int,
test_score decimal(5,2)
);

INSERT INTO students (student_id, name, grade_level, test_score) VALUES
(1, 'Shubham', 10, 85.5),
(2, 'Sourabh', 11, 78.0),
(3, 'Anant', 10, 92.0),
(4, 'Saurabh', 12, 88.0),
(5, 'Deepti', 11, 74.5),
(6, 'Manoj', 12, 80.0),
(7, 'Sri Ram', 10, 90.5),              
(8, 'Vishnu', 11, 82.0),
(9, 'Shiva', 12, 86.0),
(10, 'Chirag', 10, 95.0);


CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    customer_id INT,
    transaction_amount DECIMAL(10, 2),
    payment_method VARCHAR(50)
);

INSERT INTO transactions (transaction_id, customer_id, transaction_amount, payment_method) VALUES
(1, 201, 250, 'Credit Card'),
(2, 202, 450, 'PayPal'),
(3, 203, 300, 'Credit Card'),
(4, 201, 700, 'Debit Card'),
(5, 204, 150, 'Credit Card'),
(6, 205, 500, 'PayPal'),
(7, 202, 600, 'Credit Card'),
(8, 203, 350, 'Debit Card'),
(9, 201, 400, 'PayPal'),
(10, 204, 750, 'Credit Card');

-- Basic Grouping

-- Q1. Group employees by department and count the number of employees in each department
 Select department, count(*) as employee_count
 from employees
 group by department;
 
 -- Q2. Group customers by country count the number of customers in each country
 select country,count(*) as customer_count
 from customers
 group by country;
 
 -- Q3 Group orders by status and count the number of orders in each status
 select status,count(*)  as order_count
 from orders
 group by status;
 
 -- Q4. Group products by category and count the number of products in each category
 
select category,count(*) as product_count
from products
group by category;

-- Q5 Group employees by job title and count the number of employees in each job title
select job_title,count(*) as emp_in_each_job_title
from employees
group by job_title;

-- Q6 Group Sales by region and count the number of sales in each region
select region,count(*) as count_of_sales
from sales
group by region;

-- Q7 Group students by grade level and count the number of students in each grade
select grade_level,count(*) As student_count
from students
group by grade_level;

-- Q8 Group orders by shipping method and count the number of orders for each shipping method
select shipping_method,count(*) as no_of_orders
from orders
group by shipping_method;

-- Q9 Group employees by gender and count the number of employees of each gender
select gender,count(*) as no_of_employees
from employees
group by gender;

-- Q10 Group transactions by payment method and count the number of transactions for each payment method
select payment_method,count(*) as transaction_count
from transactions
group by payment_method;



-- AGGREGATION Functions

-- Q1 Group sales Data by Product and calculate the total sales amount for each Product
select product_id, sum(sales_amount) as total_sales
from sales
group by product_id;

-- Q2 Group employees by department and calculate the average salary for each department

select department,avg(salary) as Average_salary
from employees
group by department;

-- Q3 Group orders by customer and calculate the total order amount for each customer
select customer_id, sum(order_amount) as total_order_amount
from orders
group by customer_id;

-- Q4 Group products by category  and calculate the average of price for each category
select category, avg(price) as Avg_price
from products
group by category;

-- Q5 Group employees by job title and calculate the maximum salary for each job title.
select job_title, max(salary) as max_salary
from employees
group by job_title;

-- Q6 Group sales by region and calculate the total sales amount for each region
select region, sum(sales_amount) as total_sales
from sales
group by region;

-- Q7 Group students by grade level and calculate the average test score for each grade
select grade_level,avg(test_score) as avg_score
from students
group by grade_level; 

-- Q8 Group orders by shipping method and calculate the total shipping cost for each method
select shipping_method,sum(order_amount) as total_shipping_cost
from orders
group by shipping_method;

-- Q9 Group employees by gender and calculate the average salary for each gender
select gender, avg(salary) as avg_salary
from employees
group by gender;

-- Q10 Group tansactions by payment method and calculate the total transaction amount for each method
select payment_method, sum(transaction_amount) As total_transaction_amount
from transactions
group by payment_method;


-- MULTIPLE AGGREGATIONS

-- Q1. Group  customer orders by customer ID and calculate both the total and average order amounts for each customer
Select customer_id, sum(order_amount) as total_order_amount,avg(order_amount) AS average_order_amount
from orders
group by customer_id;

-- Q2 Group sales by product and calculate both the total sales amount and the average sales amount for each product
select product_id, sum(sales_amount) as total_sales_amount,avg(sales_amount) as avg_sales_amount
from sales
group by product_id;
  
  
-- Q3 Group employees by department and calculate both the total salary and the average salary for each department
select department, sum(salary) As total_salary, Avg(salary) As Avg_salary
from employees
group by department;

-- Q4 Group Products by category and calculate both the total price and the average price for each category
select category,sum(price) as Total_price,avg(price) as Avg_price
from products
group by category;

-- Q5 Group sales by region and calculate both the total sales amount and the number of sales for each region.
Select region, sum(sales_amount),count(*) As sales_count
from sales
group by region;

-- Q6 Group students by grade level and calculate both the total test score and the average test score for each grade
select grade_level,sum(test_score) as total_score, Avg(test_score) as avg_score
from students
group by grade_level; 

-- Q7 Group orders by shipping method and calculate both the total shipping cost and the average shipping cost for each method
select shipping_method, sum(order_amount)as total_shipping_cost,avg(order_amount) as Avg_shipping_cost
from orders
group by shipping_method;

-- Q8 Group employees by job title and calculate both the maximum and minimum salary for each job_title
Select job_title,max(salary) As max_salary ,min(salary) as min_salary
from employees
group by job_title;

-- Q9 Group transactions by payment method and calculate both the total transaction amount and the averaage transaction amount for each method
Select payment_method,sum(transaction_amount) as total_transaction_amount,avg(transaction_amount) avg_transaction_amount
from transactions
group by payment_method;

-- Q10 Group Orders by customer and calculate both the total order amount and the number of orders for each customer
select customer_id, sum(order_amount) As total_order_amount, avg(order_amount) As average_order_amount
from orders
group by customer_id;


-- HAVING CLAUSE

-- Q1 Group Products by category and display only those categories that have more than 2 products
Select category,count(*) AS product_count
from products
group by category
having product_count > 2;

-- Q2 Group employees by department and display only those departments with an average salary greater than $50,000
select department, avg(salary) as average_salary
from employees
group by  department
having average_salary >50000;

-- Q3 Group orders by customer and display only those customers who have placed more than 2 orders
select customer_id,count(*) As order_count
from orders
group by customer_id
Having order_count > 2;

-- Q4 Group sales by product and display only those products with total sales amount greater than $1,000

select product_id,sum(sales_amount) as total_sales
From sales
group by product_id
Having total_sales > 1000;

-- Q5 Group employees by job title and display only those job titles with a maximum salary greater than $100,000

select job_title,max(salary) as max_salary
from employees
group by job_title
Having max_salary >  10000;

-- Q6  Group sales by region and Display only those regions with total sales amount greater than $50,000
SELECT region, sum(sales_amount) as total_sales
from sales
group by region
having total_sales > 1000;

-- Q7 Group students by grade level and display only those grade levels with an average test score greater than 80
select grade_level, avg(test_score) AS average_score
FROM students
group by grade_level
having average_score > 80;

-- Q8 Group orders by shipping method and display only those shipping methods with total shipping cost greater than $1000.
select shipping_method,sum(order_amount) as total_shipping_cost
from orders
group by shipping_method
having total_shipping_cost > 1000;

-- Q9 Group employees by gender and display only those genders with an average salary greater than $60,000
select gender,avg(salary) AS average_salary
from employees
group by gender
having average_salary > 60000;

-- Q10 Group transactions by payment method and display only those payment methods with total transaction amount greater than $5,000
select payment_method,sum(transaction_amount) as total_transaction_Amount
from transactions
group by payment_method
having total_transaction_amount > 1000;  
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
  





















