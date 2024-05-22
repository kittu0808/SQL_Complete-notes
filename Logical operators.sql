-- select all books Not published in 2017
Select * from books
where released_year not in (2017);

Select title from books 
where released_year != 2017;

-- select all birthdays between 1990 and 1992
select name,birthdate
from people
where year(birthdate)not between 1990 and 1992;

-- select books with titles that don't start with "W"
select * FROM books
where title not like 'W%';

-- select books released after the year 2000
select * From books
where released_year > 2000;


-- RESULT:1*
select 99>1;

-- SELECT books written by Dave eggers,published after the year 2010
SELECT * from books
where author_fnaame = 'Dave'
and author_lname = 'Eggers'
AND released_year > 2010;


-- And equals &&
SELECT * from books
where author_fnaame = 'Dave'
&& author_lname = 'Eggers'
&& released_year > 2010;

-- OR equals ||?
select * from books
where author_lname = 'Eggers'||
released_year > 2010 ;



/*Select all books written by...
Carver
Lahiri
Smith*/
select * from books
where author_lname in ('carver','lahiri','smith');

Select * from books
where author_lname = 'carver' or author_lname = 'Lahiri' or author_lname = 'Smith';

SELECT 
    *
FROM
    books
WHERE
    released_year NOT IN (2000 , 2002,
        2004,
        2006,
        2008,
        2010,
        2012,
        2014,
        2016);

-- I want books released after 2000 and year is even number
SELECT * from books
Where released_year > 2000
AND released_year %2 = 0;



SELECT title,released_year,
case
when released_year >= 2000 then 'Modern Lit'
else '20 th century'
End AS 'GENre'
FROM books;


SELECT title,stock_quantity,
case
WHEN stock_quantity > 100 then '***'
when stock_quantity >= 50 AND stock_quantity <= 100 then '**'
else'*'
END AS STOCK
FROM books;

-- OR --
SELECT title,stock_quantity,
case 
when stock_quantity between 0 AND 50 then '*'
when stock_quantity between 51 and 100 then '**'
else'***'
end AS STOCK
FROM books;

-- OR -- 
SELECT title,stock_quantity,
case
when stock_quantity <= 50 THEN '*'
when stock_quantity <= 100 then '**'
ELSE '***'
END AS Stock
from books;

-- Result : 0 (False)
SELECT 10 != 10;

-- Result: 1 (True)
SELECT 15 > 14 && 99 - 5 <= 94;

-- Result: 1 (True)
SELECT 1 IN (5,3) || 9 BETWEEN 8 AND 10;


/*Select All Books Written Before 1980 (non inclusive)*/
SELECT * FROM books
WHERE released_year < 1980;


/*Select All Books Written By Eggers Or Chabon*/
SELECT * FROM books
WHERE author_lname IN ('Eggers', 'Chabon');


/*Select All Books Written By Lahiri, Published after 2000*/
SELECT * FROM books
WHERE author_lname = 'Lahiri' AND released_year > 2000;

/*Select All Books Written By Lahiri, Published after 2000*/
SELECT * FROM books
WHERE author_lname = 'Lahiri' && released_year > 2000;


/*Select All books with page counts between 100 and 200*/
SELECT * FROM books
WHERE pages BETWEEN 100 AND 200;


/*Select all books where author_lname  starts with a 'C' or an 'S''*/
SELECT * FROM books
WHERE author_lname LIKE 'C%' OR author_lname LIKE 'S%';

-- OR
/*Select all books where author_lname  starts with a 'C' or an 'S''*/
SELECT * FROM books
WHERE SUBSTR(author_lname,1,1) IN ('C','S');


