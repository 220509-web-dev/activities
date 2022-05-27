### 2.1 SELECT
Task – Select all records from the Employee table. 
select * from "Employee"  ;

Task – Select all records from the Employee table where last name is King.
select * from "Employee"  where "LastName" = 'king';

Task – Select all records from the Employee table where first name is Andrew and REPORTSTO is NULL.
select * from "Employee"  where "FirstName"  = 'andrew'  and "ReportsTo" is null;

### 2.2 ORDER BY
Task – Select all albums in album table and sort result set in descending order
select * from "Album" order by "AlbumId" desc ;

Task – Select first name from Customer and sort result set in ascending order
select * from "Customer" order by "FirstName" asc ;

### 2.3 INSERT INTO
Task – Insert two new records into Genre table
insert into "Genre" ("GenreId", "Name") values (26, 'Afrobeats'), (27, 'Afropop') ;

Task – Insert two new records into Employee table
insert into "Employee" ("EmployeeId", "LastName", "FirstName", "Title", "ReportsTo", "BirthDate", "HireDate", "Address", "City", "State", "Country", "PostalCode", "Phone", "Fax", "Email") 
values (9, 'jones', 'peter', 'IT Staff', 6, to_timestamp('1980-08-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('1995-02-21 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '2167 Watershed Lane', 'Edmonton', 'AB', 'Canada', 'T2P 5G3', '+1 (403)323-4565', '+1 (403) 332-6758','petre@chinookcorp.com'),
 (10, 'erastus', 'figglebottom', 'IT Staff', 6, to_timestamp('1989-03-07 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('1999-12-21 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '5541 drinkwater Place', 'Edmonton', 'AB', 'Canada', 'T2P 5G3', '+1 (402)523-6265', '+1 (401) 315-6798','erastus@chinookcorp.com') ;

Task – Insert two new records into Customer table
 insert into "Customer" ("CustomerId", "FirstName", "LastName", "Company", "Address", "City", "State", "Country", "PostalCode", "Phone", "Fax", "Email", "SupportRepId")
values
	(60, 'Mark', 'Patois', null, null, 'Atlanta', null, 'United States', null, '+1 (404) 234-6574', null, 'patois@gmail.com', 3),
	(61, 'John', 'Paul', null, null, 'Atlanta', null, 'United States', null, '+1 (404) 762-7783', null, 'paul@gmail.com', 5);

### 2.4 UPDATE
Task – Update Aaron Mitchell in Customer table to Robert Walter
update "Customer" 
set "FirstName" = 'Robert', "LastName" = 'Walter'
where "CustomerId" = 32

Task – Update name of artist “Creedence Clearwater Revival” to “CCR”
update "Artist" 
set "Name"='CCR'
where "ArtistId" = 76;

### 2.5 LIKE
Task – Select all invoices with a billing address like “T”
select * from "Invoice"
where "BillingAddress" like '%T%';

### 2.6 BETWEEN
Task – Select all invoices that have a total between 15 and 50
select * from "Invoice"
where "Total" between 15 and 50;

Task – Select all employees hired between 1st of June 2003 and 1st of March 2004
select * from "Employee"
where "HireDate" between '2003-06-01' and '2004-03-01';


### 2.7 DELETE
Task – Delete a record in Customer table where the name is Robert Walter (There may be constraints that rely on this, find out how to resolve them).
delete from "InvoiceLine" 
where "InvoiceId" in (select "InvoiceId" from "Invoice"
where "CustomerId"=32);

delete from "Invoice" 
where "CustomerId"=32;

delete from "Customer" 
where "CustomerId"=32;

### 3.0 SQL Functions
In this section you will be using the PostGreSQL system functions, as well as your own functions, to perform various actions against the database

### 3.1 System Defined Functions
Task – Create a query that leverages a system-defined function to return the current time.
select now ();

Task – Create a query that leverages a system-defined function to return the length of a mediatype from the mediatype table
select length("Name") from "MediaType";

### 3.2 System Defined Aggregate Functions
Task – Create a query that leverages a system-defined function to return the average total of all invoices
select avg("Total")  from "Invoice" ;

Task – Create a query that leverages a system-defined function to return the most expensive trackf
select max("UnitPrice")  from "Track";

### 4.0 JOINS
In this section you will be working with combining various tables through the use of joins. You will work with outer, inner, right, left, cross, and self joins.

### 4.1 INNER
Task – Create an inner join that joins customers and orders and specifies the name of the customer and the invoiceId.
select "Customer"."FirstName","Customer"."LastName" , "Invoice"."CustomerId" from "Customer"
inner join "Invoice"
on "Customer"."CustomerId" = "Invoice"."CustomerId";

### 4.2 OUTER
Task – Create an outer join that joins the customer and invoice table, specifying the CustomerId, firstname, last name, invoiceId, and total.
select "Customer"."CustomerId" , "Customer"."FirstName" ,"Customer"."LastName" , "Invoice"."InvoiceId", "Invoice"."Total" from "Customer"
full outer join "Invoice"
on "Customer"."CustomerId" = "Invoice"."CustomerId";

### 4.3 RIGHT
Task – Create a right join that joins album and artist specifying artist name and title.
select "Artist"."Name", "Album"."Title" from "Album"
right join "Artist"
on "Album"."ArtistId" = "Artist"."ArtistId";

### 4.4 CROSS
Task – Create a cross join that joins album and artist and sorts by artist name in ascending order.
select * from "Artist" 
cross join "Album" 
order by "Name" asc ;

### 4.5 SELF
Task – Perform a self-join on the employee table, joining on the reports to column.
select 
e."FirstName", e."LastName",e."ReportsTo", 
m."FirstName", m."LastName"   
from "Employee" e
inner join "Employee" m
on m."EmployeeId" = e."ReportsTo";