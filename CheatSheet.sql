/*
SELECT statements are used to fetch data from a database. 
Every query will begin with SELECT.
And all the columns can be selected by using * as shown below,
*/

SELECT * 
FROM table_1;

/*
A particular column from the table can be selected with
*/

SELECT column_1, column2
FROM table_1;

/*
WHERE is a clause that indicates you want to filter the result set to 
include only rows where the following condition is True.
*/

SELECT column_1, column2
FROM table_1
WHERE condition;

/*
DISTINCT is a function that removes duplicate values from the result set.
*/

SELECT DISTINCT column_1
FROM table_1
WHERE condition;

/*
ORDER BY is a clause that indicates you want to sort the result set 
by a particular column either alphabetically or numerically. 
The default order of arrangement is ascending and to get that, 
you can simply drop the keyword DESC from the below query.
*/

SELECT column_1, column2
FROM table_1
ORDER BY column_1 DESC;-- The default order is ascending, the keyword DESC in ORDER BY stands for descending

/*
The OFFSET argument is used to identify the starting
point to return rows from a result set. 
Basically, it excludes the first set of records.
*/

SELECT column_name(s)
FROM table_name
WHERE condition
ORDER BY column_name
OFFSET rows_to_skip ROWS;

/*
To set conditions in the GROUP BY clause, use the keyword HAVING
*/

SELECT column_1, aggregate(column_2)
FROM table_1
GROUP BY column_1;
HAVING condition;


/*
Querying From Multiple Tables 
These queries are used to pull the data from multiple tables by joining them together. 
Therefore, these queries involve joins as given below,
*/

/*
It returns the data from the rows in the tables that match the inner join criteria
*/

SELECT column_1, column2
FROM table_1
INNER JOIN table_2 ON condition;

/*
This join returns all the rows of the table on the left side of the join and
matches rows for the table on the right side of the join. For the rows for which 
there is no matching row on the right side, the result set will contain null.
*/

SELECT column_1, column2
FROM table_1
LEFT JOIN table_2 ON condition;


/*
RIGHT JOIN is similar to LEFT JOIN. This join returns all the rows of the 
table on the right side of the join and matching rows for the table on the 
left side of the join. For the rows for which 
there is no matching row on the left side, the result set will contain null
*/

SELECT column_1, column2
FROM table_1
RIGHT JOIN table_2 ON condition;

/*
An outer join will combine rows from different tables even 
if the join condition is not met. Every row in the left table is 
returned in the result set, and if the join condition is not met, 
then NULL values are used to fill in the columns from the right table.
*/

SELECT column_1, column2
FROM table_1
FULL OUTER JOIN table_2 ON condition;

/*
Cross-Join operation in SQL is used to combine multiple tables together into a single table.
*/

SELECT column_1, column2
FROM table_1
CROSS JOIN table_2;


/*
Using SQL Operators 
These queries use mathematical and logical operators to extract data based on a condition as shown below.
*/

/*
The UNION operator is used to combine the results of two or more SELECT queries into a single result set.
*/

SELECT column_1, column2
FROM table_1
UNION ALL
SELECT column_1, column2
FROM table_2


/*
Return the intersection of two queries
*/

SELECT column_1, column2
FROM table_1
INTERSECT
SELECT column_1, column2
FROM table_2

/*
Subtract a result set from another result set
*/

SELECT column_1, column2
FROM table_1
MINUS
SELECT column_1, column2
FROM table_2

/*
Query rows between two values: low and hight.
*/

SELECT column_1, column2
FROM table_1
WHERE  column_1 BETWEEN low AND high;

/*
Managing tables 
These queries are used to perform operations for managing the 
tables such as create, update, delete, and many more as shown below.
*/

/*
Create a new table with three columns: column_1, column_2, column_3
CREATE TABLE creates a new table in the database. 
It allows you to specify the name of the table and the name of each column in the table.
*/

CREATE TABLE table_1 (
     column_1 INT PRIMARY KEY,
     column_2 VARCHAR NOT NULL,
     column_3 INT DEFAULT 0
);


/*
Delete the table from the database
*/
DROP TABLE table_1 ;

/*
Remove all data in a table
TRUNCATE TABLE removes all data entries from a table in a database but
 keeps the table and structure in place. Similar to DELETE.
*/
TRUNCATE TABLE table_1;

/*
Using SQL constraints 
These queries are used to specify rules for the data in a table.
Constraints limit the type of data that can go into a table. 
This ensures the accuracy and reliability of 
the data in the table. This includes statements as below,
*/

/*
Set column_1 and column_2 as a primary key
The PRIMARY KEY constraint uniquely identifies each record in a table.
*/

CREATE TABLE table_1(
    column_1 INT, column_2 INT, column_3 VARCHAR,
    PRIMARY KEY (column_1,column_2)
);

/*
Set column — column_2 — as a foreign key
A foreign key (FK) is a column or combination of columns that 
is used to establish and enforce a 
relationship between the data in two tables.
*/

CREATE TABLE table_1(
    column_1 INT PRIMARY KEY,  
    column_2 INT,
    FOREIGN KEY (column_2) REFERENCES table_2(column_2)
);

/*
Set values in column — column_2 — not NULL
The NOT NULL constraint specifies that the column does not accept NULL values.
*/
CREATE TABLE t(
     column_1 INT PRIMARY KEY,
     column_2 VARCHAR NOT NULL
);

/*
Modifying Data ✔️
These queries are used to deal with already present tables. \
This includes operations such as inserting, changing, and deleting values as shown below,
*/

/*
Insert one row into a table
*/

INSERT INTO table_1(column_list)
VALUES(value_list);

/*
Insert multiple rows into a table
*/
INSERT INTO table_1(column_list)
VALUES (value_list), 
       (value_list);
    
/*
Update the new value in the column — column_1 — for all rows
*/

UPDATE table_1
SET column_1 = new_value;

/*
Delete all data in a table
*/

DELETE FROM table_1;

/*
Managing Views ✔️
A VIEW in SQL Server is like a virtual table that contains data from one or multiple tables. 
It does not hold any data and does not exist physically in the database. 
These queries are used to perform operations to manage views as shown below,
*/

/*
Create a recursive view
*/
CREATE RECURSIVE VIEW view_1 
AS
select-statement -- anchor part
UNION ALL
select-statement; -- recursive part

/*
Create a temporary view
*/

CREATE TEMPORARY VIEW view_1
AS
SELECT column_1, column_2
FROM table_1;

/*
Create a new view that consists of column_1 and column_2
*/

CREATE VIEW view_1(column_1,column_2) 
AS
SELECT column_1, column_2
FROM table_1;

/*
Create a new view with the check option
*/

CREATE VIEW view_1(column_1,column_2) 
AS
SELECT column_1, column_2
FROM table_1;
WITH [CASCADED | LOCAL] CHECK OPTION;