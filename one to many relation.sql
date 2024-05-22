CREATE TABLE customers(
	id INT AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL
);


CREATE TABLE orders(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(id)
);


INSERT INTO customers (first_name, last_name, email) 
VALUES ('Shubham', 'Kulkarni', 'shubham@gmail.com'),
       ('sourabh', 'Kulkarni', 'Souru@gmail,com'),
       ('Deepti', 'Kulkarni', 'deepti@gmail.com'),
       ('Anant', 'kulkarni','KUlkarnianant@gmail.com'),
       ('Ramesh', 'Tanni', 'Ramesh@gmail.com');

INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);       

/*customers by spending high to low order */
/*send them loyality programs,etc*/

SELECT first_name, last_name,SUM(amount) AS total_spending
FROM customers
JOIN orders ON customers.id = orders.customer_id
GROUP BY customers.id
ORDER BY total_spending DESC;

/* customers who haven't spent anything or ordered anything yet */
/*we can send out discount cupons.. etc*/
select first_name,last_name,amount
from customers
left join orders on customers.id = orders.customer_id
where orders.customer_id is NULL;


/*-----------------------------------------------------------*/

/* __________________________________________________________*/

create TABLE students(
id int auto_increment primary key,
first_name varchar(150)
);

create table papers(
title varchar(150) NOT NULL,
grade int not null,
student_id int,
foreign key(student_id) references students(id) 
);


INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

/*-------------------------------------------------------*/
SELECT first_name,title,grade
from students
join papers ON students.id = papers.student_id
ORDER BY grade DESC;

/*______________________________________________________*/

select first_name,title,grade
from students
left join papers ON students.id = papers.student_id;

/*-----------------------------------------------------*/

SELECT 
    first_name, IFNULL(title, 'MISSING'), IFNULL(grade, 0)
FROM
    students
        LEFT JOIN
    papers ON students.id = papers.student_id;
/*----------------------------------------------------*/
SELECT 
    first_name, IFNULL(AVG(grade), 0) AS average
FROM
    students
        LEFT JOIN
    papers ON students.id = papers.student_id
GROUP BY students.id
ORDER BY average DESC;
/*______________________________________________________*/

SELECT 
    first_name,
    IFNULL(AVG(grade), 0) AS average,
    CASE
        WHEN AVG(grade) >= 75 THEN 'PASSING'
        WHEN AVG(grade) IS NULL THEN 'FAILING'
        ELSE 'FAILING'
    END AS passing_status
FROM
    students
        LEFT JOIN
    papers ON students.id = papers.student_id
GROUP BY students.id
ORDER BY average DESC;



















