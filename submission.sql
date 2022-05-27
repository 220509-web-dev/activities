-- 2.1

-- Task – Select all records from the Employee table.
SELECT * FROM "Employee";

-- Task – Select all records from the Employee table where last name is King.
select * from "Employee" where "Employee"."LastName"='King';

-- Task – Select all records from the Employee table where first name is Andrew and REPORTSTO is NULL.
select * from "Employee" where "Employee"."FirstName"='Andrew' and "Employee"."ReportsTo" is null;

-- 2.2

-- Task – Select all albums in album table and sort result set in descending order
select * from "Album" order by "AlbumId" desc;

-- Task – Select first name from Customer and sort result set in ascending order
select "FirstName" from "Customer" order by "CustomerId" asc;
-- 2.3

-- Task – Insert two new records into Genre table
insert into "Genre" ("GenreId" ,"Name")
values 
	(26, 'Hyperpop'),
	(27, 'J-pop');

-- Task – Insert two new records into Employee table
insert into "Employee" ("EmployeeId", "LastName", "FirstName", "Title", "ReportsTo", "BirthDate", "HireDate", "Address", "City", "State", "Country", "PostalCode", "Phone", "Fax", "Email")
values
	(9, 'Smith', 'Joseph', 'IT Staff', 6, to_timestamp('1970-05-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('1990-09-21 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '123 Jackson Street', 'Boston', 'MA', 'United States', '02302', '+1 (857) 284-3443', '+1 (857) 284-3443', 'smith1@gmail.com'),
	(10, 'Smith', 'Kenny', 'IT Staff', 6, to_timestamp('1970-05-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('1990-09-21 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '123 Jackson Street', 'Boston', 'MA', 'United States', '02302', '+1 (617) 847-7472', '+1 (617) 847-7472', 'smith2@gmail.com');
-- Task – Insert two new records into Customer table
insert into "Customer" ("CustomerId", "FirstName", "LastName", "Company", "Address", "City", "State", "Country", "PostalCode", "Phone", "Fax", "Email", "SupportRepId")
values
	(60, 'Bob', 'Lanes', null, null, 'Boston', null, 'United States', null, '+1 (857) 783-8474', null, 'lanes1@gmail.com', 3),
	(61, 'Taylor', 'Lanes', null, null, 'Boston', null, 'United States', null, '+1 (857) 232-9383', null, 'lanes2@gmail.com', 5);

-- 2.4

-- Task – Update Aaron Mitchell in Customer table to Robert Walter
update "Customer"
set "FirstName"='Robert', "LastName"='Walter'
where "CustomerId"=32;

-- Task – Update name of artist “Creedence Clearwater Revival” to “CCR”
update "Artist" 
set "Name"='CCR'
where "ArtistId" = 76;

-- 2.5

-- Task – Select all invoices with a billing address like “T”
select * from "Invoice"
where "BillingAddress" like '%T%';

-- 2.6

-- Task – Select all invoices that have a total between 15 and 50
select * from "Invoice"
where "Total" between 15 and 50;

-- Task – Select all employees hired between 1st of June 2003 and 1st of March 2004
select * from "Employee"
where "HireDate" between '2003-06-01' and '2004-03-01';

-- 2.7

-- Task – Delete a record in Customer table where the name is Robert Walter (There may be constraints that rely on this, find out how to resolve them).
delete from "InvoiceLine" 
where "InvoiceId" in (select "InvoiceId" from "Invoice"
where "CustomerId"=32);

delete from "Invoice" 
where "CustomerId"=32;

delete from "Customer" 
where "CustomerId"=32;

-- 3.1

-- Task – Create a query that leverages a system-defined function to return the current time.
select current_time;

-- Task – Create a query that leverages a system-defined function to return the length of a mediatype from the mediatype table
select length("Name") from "MediaType";

-- 3.2

-- Task – Create a query that leverages a system-defined function to return the average total of all invoices
select avg("Total") from "Invoice";


-- Task – Create a query that leverages a system-defined function to return the most expensive trackf
select max("UnitPrice") from "Track";

-- 4.1

-- Task – Create an inner join that joins customers and orders and specifies the name of the customer and the invoiceId.
select "Customer"."FirstName", "Invoice"."CustomerId" from "Customer"
inner join "Invoice"
on "Customer"."CustomerId" = "Invoice"."CustomerId";

-- 4.2

-- Task – Create an outer join that joins the customer and invoice table, specifying the CustomerId, firstname, last name, invoiceId, and total.
select "Customer"."FirstName", "Customer"."LastName", "Invoice"."Total", "Invoice"."CustomerId", "Invoice"."InvoiceId" from "Customer"
full outer join "Invoice"
on "Customer"."CustomerId" = "Invoice"."CustomerId";

-- 4.3

-- Task – Create a right join that joins album and artist specifying artist name and title.
select "Album"."Title", "Artist"."Name" from "Album"
right join "Artist"
on "Album"."ArtistId" = "Artist"."ArtistId";

-- 4.4

-- Task – Create a cross join that joins album and artist and sorts by artist name in ascending order.
select "Artist"."Name" from "Album"
cross join "Artist"
order by "Artist"."Name" asc;