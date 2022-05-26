--Task _ Select All records from the employee table. 


-- 2.1 SELECT

select * from "Employee";

-- Task - Select All records from the Employee table where the last name is King.
select * from "Employee" where "LastName" = 'King';
-- Task - Select All records from the Employee table where first name is Andrew and Reportsto is null.
select * from "Employee" where "FirstName" = 'Andrew' and "Employee"."ReportsTo" is null;

-- 2.2 ORDER BY 

-- Task-Select all ablums table and sort result set in desceding order. 
select * from "Album" order by "Album"."Title" desc;
--Task-Select firstname from customer and sort result set in ascending order. 
select "FirstName" from "Customer" order by "CustomerId" asc;

--2.3 INSERT INTO 

--Task-Insert two new records into Genre table 
select * from "Genre";

--Task-Insert two new records into Employee table.

-- Task-Insert two new records in Customer table. 



