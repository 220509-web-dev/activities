
-- 2.1 SELECT
-- Task – Select all records from the Employee table.
SELECT * FROM "Employee";
-- Task – Select all records from the Employee table where last name is King.
select * from "Employee" where "LastName" = 'King';
-- Task – Select all records from the Employee table where first name is Andrew and REPORTSTO is NULL.
select * from "Employee" where "FirstName" = 'Andrew' and "ReportsTo" is null;

-- 2.2 ORDER BY
-- Task – Select all albums in album table and sort result set in descending order
select * from "Album" order by "AlbumId" desc;
--Task – Select first name from Customer and sort result set in ascending order
select * from "Album" order by "AlbumId" asc;

-- 2.3 INSERT INTO
-- Task – Insert two new records into Genre table
select * from "Genre";
insert into "Genre" ("GenreId","Name")
values (26,'Hot'), (27, 'Banger');
--Task – Insert two new records into Employee table
insert into "Employee" ("EmployeeId","LastName","FirstName")
values (9,'Almustafa','James'), (10,'Melissa','James');
-- Task – Insert two new records into Customer table
select * from "Customer";
insert into "Customer" ("CustomerId","FirstName","LastName","Email")
values (60,'Al','James','aljames@revature.net'), (61,'Mel','James','meljames@revature.net');

-- 2.4 UPDATE
-- Task – Update Aaron Mitchell in Customer table to Robert Walter
select * from "Artist";
update "Customer" set "FirstName" = 'Robert', "LastName" = 'Walter'where "CustomerId" = 32;
-- Task – Update name of artist “Creedence Clearwater Revival” to “CCR”
update "Artist" set "Name" = 'CCR' where "ArtistId" = 76;

-- 2.5 LIKE 
-- Task – Select all invoices with a billing address like “T”
select * from "Invoice";
select "BillingAddress" from "Invoice" where "BillingAddress" like 'T%';

-- 2.6 BETWEEN
-- Task – Select all invoices that have a total between 15 and 50
select * from "Invoice";
select * from "Invoice" where "Total" between 15 and 50;
-- Task – Select all employees hired between 1st of June 2003 and 1st of March 2004
select * from "Employee";
select * from "Employee" where "HireDate" between '2003-06-01' and '2004-03-01';

-- 2.7 DELETE
-- Task – Delete a record in Customer table where the name is Robert Walter (There may be constraints that rely on this, find out how to resolve them).
select * from "Customer";

-- 3.1 System Defined Functions

-- 3.2 System Defined Aggregate Functions


-- 4.1 INNER
-- Task – Create an inner join that joins customers and orders and specifies the name of the customer and the invoiceId.

-- 4.2 OUTER
-- Task – Create an outer join that joins the customer and invoice table, specifying the CustomerId, firstname, last name, invoiceId, and total.

-- 4.3 RIGHT
-- Task – Create a right join that joins album and artist specifying artist name and title.

-- 4.4 CROSS
-- Task – Create a cross join that joins album and artist and sorts by artist name in ascending order.

-- 4.5 SELF
-- Task – Perform a self-join on the employee table, joining on the reports to column.


