-- Task – Select all records from the Employee table.
select * from "Employee" e ;

-- Task – Select all records from the Employee table where last name is King.
select * from "Employee" e
where e."LastName" = 'King';

-- Task – Select all records from the Employee table where first name is Andrew and REPORTSTO is NULL.
select * from "Employee" e 
where "FirstName" = 'Andrew' and "ReportsTo" is NULL;

-- Task – Select all albums in album table and sort result set in descending order
select * from "Album" a
order by  "AlbumId" desc ;

-- Task – Select first name from Customer and sort result set in ascending order
select "FirstName" from "Customer" c
order by "CustomerId" desc;

-- Task – Insert two new records into Genre table
insert into "Genre" ("GenreId", "Name")
values ('26', 'Gospel Music');

insert into "Genre" ("GenreId", "Name")
values ('27', 'Grunge')

-- Task – Insert two new records into Employee table
insert into "Employee" ("EmployeeId", "LastName", "FirstName", "Title", "ReportsTo", "Country", "Email")
values ('9', 'Thomas', 'Lemuel', 'Web Dev', '3', 'United States', 'lemuel.thomas3@gmail.com');

insert into "Employee" ("EmployeeId", "LastName", "FirstName", "Title", "ReportsTo", "Country", "Email")
values ('10', 'Chris', 'Rock', 'Marketing', '4', 'United States', 'crock2@gmail.com');

-- Task – Insert two new records into Customer table
insert into "Customer" ("CustomerId", "FirstName", "LastName", "Company", "Country", "Email")
values ('60', 'Lemuel', 'Thomas', 'Revature', 'United States', 'lemuel.thomas3@gmail.com');

insert into "Customer" ("CustomerId", "FirstName", "LastName", "Company", "Country", "Email")
values ('61', 'Chris', 'Rock', 'Alphabet', 'United States', 'crock3@gmail.com');

-- Task – Update Aaron Mitchell in Customer table to Robert Walter
update "Customer" 
set "FirstName" = 'Robert', "LastName" = 'Walter'
where "CustomerId" = 32;

-- Task – Update name of artist “Creedence Clearwater Revival” to “CCR”
update "Artist" 
set "Name" = 'CCR'
where "ArtistId" = 76;

-- Task – Select all invoices with a billing address like “T”
select * from "Invoice" i 
where "BillingAddress" like 'T%';

-- Task – Select all invoices that have a total between 15 and 50
select * from "Invoice" i
where "Total" between 15 and 50;

-- Task – Select all employees hired between 1st of June 2003 and 1st of March 2004
select * from "Employee" e
where "HireDate" between '2003-06-01' and '2004-03-01';

-- Task – Delete a record in Customer table where the name is Robert Walter (There may be constraints that rely on this, find out how to resolve them).
delete from "InvoiceLine"
where "InvoiceId" in (
select "InvoiceId"
from "Invoice" 
where "CustomerId" = 32
);
delete from "Invoice" 
where "CustomerId" = 32;

delete from "Customer"
where "FirstName" = 'Robert' and 'LastName' = 'Walter';
-- Task – Create a query that leverages a system-defined function to return the current time.
select current_timestamp;
select now();

-- Task – Create a query that leverages a system-defined function to return the most expensive trackf
select length("Name")
from "MediaType";

-- Task – Create an inner join that joins customers and orders and specifies the name of the customer and the invoiceId.
select 
c."FirstName",
i."InvoiceId"
from "Customer" c 
inner join "Invoice" i
on c."CustomerId" = i."CustomerId";

-- Task – Create an outer join that joins the customer and invoice table, specifying the CustomerId, firstname, last name, invoiceId, and total.
select 
c."CustomerId",
c."FirstName",
c."LastName",
i."InvoiceId",
i."Total"
from "Customer" c
full outer join "Invoice" i
on c."CustomerId" = i."CustomerId";

-- Task – Create a right join that joins album and artist specifying artist name and title.
select
ar."Name",
al."Title"
from "Artist" ar
right join "Album" al
on ar."ArtistId" = al."ArtistId";

-- Task – Create a cross join that joins album and artist and sorts by artist name in ascending order.
select
ar."Name"
from "Artist" ar
cross join "Album" a
order by ar."Name" desc;

-- Task – Perform a self-join on the employee table, joining on the reports to column.
select * from "Employee" e;
select
A."FirstName", A."LastName",
B."FirstName" , B."LastName", 
A."ReportsTo"
from "Employee" A, "Employee" B
where A."EmployeeId" <> B."EmployeeId"
and A."ReportsTo" = B."ReportsTo"
order by A."ReportsTo";
