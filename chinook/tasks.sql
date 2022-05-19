-- pgAdmin

/* 2.1 SELECT */

-- Select all records from the Employee table
select * from chinook."Employee"; 	
set search_path to chinook; select * from "Employee";
-- both commands work

-- Select records from the Employee table where the LastName field is 'King'
select * from chinook."Employee" e
where e."LastName"='King';
-- Only 1 record found

-- Widen the search
select * from chinook."Employee" e
where lower(e."LastName") like '%king%';

-- Select all records from the Employee table where first name is Andrew and REPORTSTO is NULL.

-- How many records have a NULL value in the ReportsTo field?
select * from chinook."Employee" e
where e."ReportsTo" is null;
-- 1 record

-- Better refine the search anyways
select * from chinook."Employee" e
where e."ReportsTo" is null 
and
e."FirstName" = 'Andrew';

/* 2.2 ORDER BY */

-- Select all albums in album table and sort result set in descending order

-- Peek at the Album table
select * from chinook."Album"
limit 10;

-- Sort by the Title field
select * from chinook."Album" al
order by al."Title" desc;

-- Peek at the Customer table
select * from chinook."Customer"
limit 10;

-- Select first name from Customer and sort result set in ascending order
select * from chinook."Customer" cu
order by cu."FirstName" asc;

/* 2.3 INSERT INTO */

-- Peek at the Genre table
select * from chinook."Genre" ge
order by ge."GenreId" desc
limit 10;
-- new records must start PK increment at 26

--Insert two new records into Genre table
insert into chinook."Genre" ("GenreId","Name")
values (26,'Lecture Recordings'),(27,'Computer Fan Whirling');

-- Insert two new records into Employee table
select * from chinook."Employee" order by "EmployeeId" desc; 	
-- PK increment ends at 8

insert into chinook."Employee"
values
(9,'John','Doe','IT Staff',1,'2022-05-18 00:00:00','2022-05-19 00:00:00','1 Ave way','Cityberg','TX','USA','78250','+1 (999) 999-9999', '+1 (111) 999-9999', 'unmonitored@no-reply.org')
;
insert into chinook."Employee"
values
(10,'Jane','Doe','IT Staff',1,'2022-05-18 00:00:00','2022-05-19 00:00:00','1 Ave way','Cityberg','TX','USA','78250','+1 (999) 999-9999', '+1 (111) 999-9999', 'unmonitored@no-reply.org')
;

-- Peek at the Customer table
select * from chinook."Customer"
order by "CustomerId" desc
limit 10;
--Ends at 59

-- Insert two new records into Customer table
insert into chinook."Customer"
values
(60,'First','Last',null,'1 Lane Way','Cityville',null,'USA',null,'+1 (999) 123 4567',null,'unmonitored@no-reply.org',4);
insert into chinook."Customer"
values
(61,'Firstfirst','Lastlast',null,'1 Lane Way','Cityville',null,'USA',null,'+1 (999) 123 4567',null,'unmonitored@no-reply.org',4);


/* 2.4 UPDATE */

-- Find the required record
select * from chinook."Customer"
where "FirstName" like '%aron%';

-- Update Aaron Mitchell in Customer table to Robert Walter
update chinook."Customer"
set "FirstName" = 'Robert', "LastName" = 'Walter'
where "CustomerId" = 32;

-- Confirm update
select * from chinook."Customer"
where "CustomerId" = 32;


-- Peek at the Artist table
select * from chinook."Artist"
limit 10;

-- Find the required record
select * from chinook."Artist"
where "Name" like '%learwater%';
-- 1 record
-- "ArtistId" = 76

--Update name of artist “Creedence Clearwater Revival” to “CCR”
update chinook."Artist"
set "Name" = 'CCR'
where "ArtistId" = 76;

-- Confirm update
select * from chinook."Artist"
where "ArtistId" = 76;


/* 2.5 LIKE */

-- Peek at the Invoice table
select * from chinook."Invoice"
limit 10;

-- Select all invoices with a billing address like “T”
select * from chinook."Invoice"
where "BillingAddress" like '%T%'; -- T anywhere in the field
-- 21 records returned

/* 2.6 BETWEEN */
-- Select all invoices that have a total between 15 and 50
select * from chinook."Invoice"
where "Total" between 15 and 50; -- >= 15 and <= 50

-- Peek at the Employee table
select * from chinook."Employee"
limit 10;
-- timestamp field is used, so no parsing required

-- Select all employees hired between 1st of June 2003 and 1st of March 2004
select * from chinook."Employee"
where "HireDate" between '2003-01-06' and '2004-01-03'; -- auto timestamp parsing

/* 2.7 DELETE */
-- Delete a record in Customer table where the name is Robert Walter 
-- (There may be constraints that rely on this, find out how to resolve them).

-- Peek at the Invoice table
select * from chinook."Invoice"
limit 10;

-- Attempt to delete
/*
delete from chinook."Customer"
where "FirstName" = 'Robert' and "LastName" = 'Walter';
-- error
-- Key (CustomerId)=(32) is still referenced from table "Invoice".
*/

-- Manual cascade delete 
/*
delete from chinook."Invoice"
where "CustomerId" = 32; 
-- error
-- Key (InvoiceId)=(50) is still referenced from table "InvoiceLine".
*/

select "InvoiceId" from chinook."Invoice"
where "CustomerId" = 32; -- found earlier
-- 50, 61, 116, 245, 268, 290, 342

select * from chinook."InvoiceLine"
where "InvoiceId" in (
select "InvoiceId" from chinook."Invoice"
where "CustomerId" = 32
)
order by "InvoiceId"; 

delete from chinook."InvoiceLine"
where "InvoiceId" in (
select "InvoiceId" from chinook."Invoice"
where "CustomerId" = 32
);
-- Worked

delete from chinook."Invoice"
where "CustomerId" = 32; 
-- Finally worked this time

delete from chinook."Customer"
where "FirstName" = 'Robert' and "LastName" = 'Walter';
-- Task complete


/* 3.0 SQL Functions 
In this section you will be using the PostGreSQL system functions, 
as well as your own functions, to perform various actions against the database
*/

/* 3.1 System Defined Functions */
-- Create a query that leverages a system-defined function to return the current time.
select now();
-- https://www.postgresqltutorial.com/postgresql-date-functions/postgresql-now/

-- Peek at the MediaType table
select * from chinook."MediaType"
limit 10;

-- Create a query that leverages a system-defined function to return the length 
-- of a mediatype from the mediatype table
/*
select length("Name") 'Length', "Name" 
from chinook."MediaType";
-- error
-- type "length" does not exist
*/
select length("Name"), "Name"
from chinook."MediaType";
-- Apparently, using an aliase doesn't work with LENGTH


/* 3.2 System Defined Aggregate Functions */

-- Peek at the Invoice table
select * from chinook."Invoice"
limit 10;

-- Create a query that leverages a system-defined function to return the average total of all invoices
select avg("Total") 
from chinook."Invoice";

-- Create a query that leverages a system-defined function to return the most expensive trackf
select *
from chinook."Invoice" 
where "Total" = (
select max("Total") from chinook."Invoice");
-- or
select *
from chinook."Invoice" 
order by "Total" desc
limit 1;

/* 4.0 JOINS
In this section you will be working with combining various tables through the use of joins. 
You will work with outer, inner, right, left, cross, and self joins.
*/

/* 4.1 INNER */

-- Peek at the Customer table
select * from chinook."Customer"
limit 10;

-- Peek at the Invoice table
select * from chinook."Invoice"
limit 10;

-- Create an inner join that joins customers and orders and specifies the name 
-- of the customer and the invoiceId.
select cu."FirstName", cu."LastName", i."InvoiceId"
from chinook."Customer" cu inner join chinook."Invoice" i
on cu."CustomerId" = i."CustomerId";

/* 4.2 OUTER */
-- Create an outer join that joins the customer and invoice table, 
-- specifying the CustomerId, firstname, last name, invoiceId, and total.
select 
cu."CustomerId", 
cu."FirstName", 
cu."LastName", 
i."InvoiceId",
i."Total"
from chinook."Customer" cu 
full outer join chinook."Invoice" i
on cu."CustomerId" = i."CustomerId";

-- How many records is that? 
select count(*)
from chinook."Customer" cu 
full outer join chinook."Invoice" i
on cu."CustomerId" = i."CustomerId";
-- 407 records

select count(*)
from chinook."Customer";
-- 60 customers

select count(*)
from chinook."Invoice";
-- 405 invoices

-- Hmm, so 2 customers have no invoices?
select 
cu."CustomerId", 
cu."FirstName", 
cu."LastName", 
i."InvoiceId",
i."Total"
from chinook."Customer" cu 
full outer join chinook."Invoice" i
on cu."CustomerId" = i."CustomerId"
where i."InvoiceId" is null;
-- 2 customers without invoices

/* 4.3 RIGHT */

-- Peek at the Album table
select * from chinook."Album"
limit 10;
-- AlbumId, Title, ArtistId

-- Peek at the Artist table
select * from chinook."Artist"
limit 10;
-- ArtistId, Name

-- Create a right join that joins album and artist specifying artist name and title.
select art."Name", al."Title"
from chinook."Artist" art 
right join chinook."Album" al
on art."ArtistId" = al."ArtistId";
-- Every Album displayed with its artist
-- artists with no albums not displayed

-- Get Artists with no Album, using above query
select * from chinook."Artist"
where "Name" not in (
select art."Name"
from chinook."Artist" art 
right join chinook."Album" al
on art."ArtistId" = al."ArtistId"
);
-- Snow Patrol, ArtistId 172, is listed

select * from chinook."Album"
where "ArtistId" = 172;
-- Nothing returned!


/* 4.4 CROSS */
-- Create a cross join that joins album and artist and sorts by artist name in ascending order.
select art."Name", al."Title"
from chinook."Artist" art 
cross join chinook."Album" al
order by art."Name";
-- everything paired with everything... 

select count(*)
from chinook."Artist"
cross join chinook."Album";
-- only 95,425 rows

select(
(select count(*) from chinook."Artist"),
(select count(*) from chinook."Album"),
(select count(*) from chinook."Artist")*(select count(*) from chinook."Album"));
-- 275, 347, 95425
-- the math checks out: 95425 = 275*347

/* 4.5 SELF */

-- Peek at the Employee table
select * from chinook."Employee"
limit 10;

-- Perform a self-join on the employee table, joining on the reports to column.
select *
from chinook."Employee" e
inner join chinook."Employee" ee
on e."ReportsTo"=ee."ReportsTo";
-- Person in left half of columns reports to the person in the right half






