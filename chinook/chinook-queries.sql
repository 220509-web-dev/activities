-- 2.1 SELECT
--Select all records from the Employee table. 
select * from "Employee"; 

--Select all records from the Employee table where last name is King.
select * from "Employee" 
where "LastName" = 'King';

--Select all records from the Employee table where first name is Andrew and REPORTSTO is NULL.
select * from "Employee" 
where "FirstName" = 'Andrew' and "ReportsTo" is null;

-- 2.2 ORDER BY
--Select all albums in album table and sort result set in descending order
select * from "Album"
order by "AlbumId" DESC; 

--Select first name from Customer and sort result set in ascending order
select "FirstName" from "Customer"
order by "FirstName";

--2.3 INSERT INTO
--Insert two new records into Genre table
insert into "Genre" ("GenreId","Name")
values (26,'SOMETHING'),  (27, 'Cool');

--Insert two new records into Employee table
insert into "Employee" ("EmployeeId", "LastName", "FirstName", "City")
values (9, 'Cooremans', 'Zachary', 'Round Rock'), (10, 'Salazar', 'Nadia', 'Round Rock');

--Insert two new records into Customer table
select * from "Customer";
insert into "Customer" ("CustomerId", "FirstName" , "LastName", "Email")
values (60, 'Tim', 'Timmy', 'TimTimmy@revature.com'), (61, 'Bob', 'Marley', 'BobMarley@gmail.com');

--2.4 UPDATE
--Update Aaron Mitchell in Customer table to Robert Walter
update "Customer"
set "FirstName" = 'Robert', "LastName" = 'Walter'
where "CustomerId" = 32;

--Update name of artist �Creedence Clearwater Revival� to �CCR�
update "Artist" 
set "Name" = 'CCR'
where "ArtistId" = 76;

--2.5 LIKE
--Select all invoices with a billing address like �T�
select "BillingAddress"
from "Invoice"
where "BillingAddress" like 'T%';

--2.6 BETWEEN
--Select all invoices that have a total between 15 and 50
select * from "Invoice"
where "Total" between 15 and 50;

--Select all employees hired between 1st of June 2003 and 1st of March 2004
select * from "Employee"
where "HireDate" between '2003-06-01' AND '2004-03-01';

--2.7 DELETE
--Delete a record in Customer table where the name is Robert Walter (There may be constraints that rely on this, find out how to resolve them).
delete from "InvoiceLine" 
where "InvoiceId" in (
	select "InvoiceId"
	from "Invoice" i
	where "CustomerId" = 32
);

delete from "Invoice" 
where "CustomerId" = 32;

delete from "Customer" 
where "FirstName" = 'Robert' and "LastName" = 'Walter';

--3.0 SQL Functions
--In this section you will be using the PostGreSQL system functions, as well as your own functions, to perform various actions against the database

--3.1 System Defined Functions
--Create a query that leverages a system-defined function to return the current time.
select CURRENT_TIMESTAMP;
select now();

-- Create a query that leverages a system-defined function to return the length of a mediatype from the mediatype table
select length("Name") 
from "MediaType";

--3.2 System Defined Aggregate Functions
--Create a query that leverages a system-defined function to return the average total of all invoices
select SUM("Total")
from "Invoice";

--Create a query that leverages a system-defined function to return the most expensive trackf
select max("UnitPrice")
from "Track";

--4.0 JOINS
--In this section you will be working with combining various tables through the use of joins. You will work with outer, inner, right, left, cross, and self joins.

--4.1 INNER
--Create an inner join that joins customers and orders and specifies the name of the customer and the invoiceId.
select "FirstName", "LastName", "InvoiceId" 
from "Customer" c
join "Invoice" i 
on c."CustomerId" = i."CustomerId";

--4.2 OUTER
--Create an outer join that joins the customer and invoice table, specifying the CustomerId, firstname, last name, invoiceId, and total.
select c."CustomerId", "FirstName", "LastName", "InvoiceId", "Total"
from "Customer" c 
full outer join "Invoice" i
on c."CustomerId" = i."CustomerId";

--4.3 RIGHT
--Create a right join that joins album and artist specifying artist name and title.
select "Name", "Title"
from "Album" a
right join "Artist" a2
on a."ArtistId" = a2."ArtistId";

--4.4 CROSS
--Create a cross join that joins album and artist and sorts by artist name in ascending order.
select *
from "Album"
cross join "Artist"
order by "Name";

--4.5 SELF
--Perform a self-join on the employee table, joining on the reports to column.
select * 
from "Employee" E1, "Employee" E2
where E1."ReportsTo"  = E2."EmployeeId"; 
