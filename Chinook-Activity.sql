-- Task � Select all records from the Employee table.

select * from "Employee";

-- Task � Select all records from the Employee table where last name is King.

select * from "Employee" 
where "LastName" = 'King';

-- Task � Select all records from the Employee table where first name is Andrew and REPORTSTO is NULL.

select * from "Employee"
where "FirstName" = 'Andrew' and "ReportsTo" is null;

-- Task � Select all albums in album table and sort result set in descending order

select * from "Album"
order by "AlbumId" desc;

-- Task � Select first name from Customer and sort result set in ascending order

select "Customer"."FirstName" 
from "Customer"
order by "FirstName" asc;

-- Task � Insert two new records into Genre table

insert into "Genre" ("GenreId", "Name") VALUES (26, 'Soft'), (27, 'VERY HARD');

-- Task � Insert two new records into Employee table

insert into "Employee" ("EmployeeId", "LastName", "FirstName", "Title", "BirthDate", "HireDate", "Address", "City", "State", "Country", "PostalCode", "Phone", "Fax", "Email") 
values (9, 'Jeremy', 'Bushay', 'THE GOD', '2003/5/18', '2022/5/09', 'Some 123 addres', 'Charlotte', 'NC', 'United States', '28278', '+1 (704) 328-2423', '+1 (704) 328-2423', 'JeremyBushay@gmail.com'),
(10, 'Dummy', 'Bot', 'ROBO', '0001/1/01', '2000/5/23', 'Everywhere', 'Computer', 'NY', 'United States', '23530', '+1 (704) 999-9999', '+1 (704) 999-999', 'Robo@gmail.com');

-- Task � Insert two new records into Customer table

insert into "Customer" ("CustomerId", "FirstName", "LastName", "Company", "Address", "City", "State", "Country", "PostalCode", "Phone", "Fax", "Email", "SupportRepId") 
values (60, 'Jeremy', 'Bushay', 'Revature', 'Some 123 addres', 'Charlotte', 'NC', 'United States', '28278', '+1 (704) 328-2423', '+1 (704) 328-2423', 'JeremyBushay@gmail.com', 3),
(61, 'Dummy', 'Bot', 'Revature', 'Everywhere', 'Computer', 'NC', 'United States', '23530', '+1 (704) 999-9999', '+1 (704) 999-9999', 'Robo@gmail.com', 3);

-- Task � Update Aaron Mitchell in Customer table to Robert Walter

update "Customer"
set "FirstName" = 'Robert', "LastName" = 'Walter'
where "FirstName" = 'Aaron' and "LastName" = 'Mitchell';

-- Task � Update name of artist �Creedence Clearwater Revival� to �CCR�

update "Artist" 
set "Name" = 'CCR'
where "Name" = 'Creedence Clearwater Revival';

-- Task � Select all invoices with a billing address like �T�

select * from "Invoice"
where "BillingAddress" like 'T%';

-- Task � Select all invoices that have a total between 15 and 50

select * from "Invoice"
where "Total" >= 15 and "Total" <= 50;

-- Task � Select all employees hired between 1st of June 2003 and 1st of March 2004

SELECT * 
from "Employee" e 
WHERE e."HireDate" >= '2003-06-01' and e."HireDate" <= '2004-03-01';

-- Task � Delete a record in Customer table where the name is Robert Walter (There may be constraints that rely on this, find out how to resolve them).

delete from "InvoiceLine"
where "InvoiceId" in (
select "InvoiceId"
from "Invoice" 
where "CustomerId" = 32
);

delete from "Invoice" 
where "CustomerId" = 32;

delete from "Customer" 
where "CustomerId" = 32;

-- Task - Create a query that leverages a system-defined function to return the current time.

select current_time;

-- Task � Create a query that leverages a system-defined function to return the length of a mediatype from the mediatype table

select length("Name") from "MediaType" mt;

-- Task � Create a query that leverages a system-defined function to return the average total of all invoices

select avg("Total") from "Invoice" i ;

-- Task � Create a query that leverages a system-defined function to return the most expensive trackf

select max("Total") from "Invoice" i ;

-- Task � Create an inner join that joins customers and orders and specifies the name of the customer and the invoiceId.

select c."FirstName",
c."LastName",
i."InvoiceId" 
from "Customer" c 
inner join "Invoice" i 
on c."CustomerId" = i."CustomerId" ;

-- Task � Create an outer join that joins the customer and invoice table, specifying the CustomerId, firstname, last name, invoiceId, and total.

select c."FirstName",
c."LastName",
i."InvoiceId",
i."Total" 
from "Invoice" i 
full outer join "Customer" c
on c."CustomerId" = i."CustomerId" ; 

-- Task � Create a right join that joins album and artist specifying artist name and title.

select ar."Name",
al."Title"
from "Artist" ar
right join "Album" al
on ar."ArtistId" = al."ArtistId";

-- Task � Create a cross join that joins album and artist and sorts by artist name in ascending order.

select ar."Name"
from "Artist" ar
cross join "Album" a
order by ar."Name" desc;

-- Task � Perform a self-join on the employee table, joining on the reports to column.

select * from "Employee" e;
select A."FirstName", 
A."LastName",
B."FirstName" , 
B."LastName", 
A."ReportsTo"
from "Employee" A, "Employee" B
where A."EmployeeId" <> B."EmployeeId"
and A."ReportsTo" = B."ReportsTo"
order by A."ReportsTo";