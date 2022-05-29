set search_path to chinook;

--Task – Select all records from the Employee table.

select * from "Employee";

--Task – Select all records from the Employee table where last name is King.

select * from "Employee" where "LastName" = 'King';

--Task – Select all records from the Employee table where first name is Andrew and REPORTSTO is NULL.

select * from "Employee" where "FirstName" = 'Andrew' and ReportsTo is null;

--Task – Select all albums in album table and sort result set in descending order

select * from "Album" order by "AlbumId" desc;

--Task – Select first name from Customer and sort result set in ascending order

select "FirstName" from "Customer" order by asc;

--Task – Insert two new records into Genre table
INSERT INTO "Genre" ("GenreId", "Name") VALUES 
(26, N'Afrobeats'), (27, N'Classical');

--Task – Insert two new records into Employee table
insert into "Employee" ("EmployeeId", "LastName", "FirstName", "Title", "Reportsto", "BirthDate", "HireDate", "Address", "City", "State", "Country", "PostalCode", "Phone", "Fax", "Email")
values (1, 'Test', 'TestA', 'Cashier', 'Supervisor', 01/01/01, 05/25/2022, '111 A street', 'Las Vegas', 'NV', 'USA', 00000, 5555555, 'test@test.com'),
(2, 'Testo', 'Test', 'Supervisor', 'Manager', 02/02/02, 05/25/2022, '333 B Street', 'Las Vegas', 'NV', 'USA', 00000, 5555555, 'tester3@test.com' );

--Task – Insert two new records into Customer table
insert into "Customer" ("CustomerId", "FirstName", "LastName", "Company", "Address", "City", "State", "Country", "PostalCode", "Phone", "Fax", "Email", "SupportRepId")
values (1, 'TestL', 'Tester', 'TestCo', '888 J Blvd', 'Salt Lake City', 'Utah', 11111, 2220000, 2220001, 'test@testco.com'),
(2, 'TestZ', 'Testu', 'TestLLC', '002 S St', 'Seattle', 'Utah', 55555, 3383838, 3383839, 'tests@testllc.net');

--Task – Update Aaron Mitchell in Customer table to Robert Walter

Update "Customer"
Set "FirstName" = 'Robert' and "LastName" = 'Walter'
Where "CustomerId" = 32;

--Task – Update name of artist “Creedence Clearwater Revival” to “CCR”
Update "Artist"
Set "Name" = 'CCR' 
Where "ArtistId" = 76;

--Task – Select all invoices with a billing address like “T”
Select * from "Invoice" where "BillingAddress" like '%t%';

--Task – Select all invoices that have a total between 15 and 50

select * from "invoice" where "total" between 15 and 2020;

--Task – Delete a record in Customer table where the name is Robert Walter (There may be constraints that rely on this, find out how to resolve them).

delete * from "Customer" where "CustomerId" = 32;

--Task – Select all employees hired between 1st of June 2003 and 1st of March 2004

Select * from "Employee" where "HireDate" between 2003/06/01 and 2004/03/01;

--Task – Create a query that leverages a system-defined function to return the current time.

Select Current_Timestamp;

--Task – Create a query that leverages a system-defined function to return the length of a mediatype from the mediatype table
Select Length ("Mediatype") as LengthofName
From "Mediatype";

--Task – Create a query that leverages a system-defined function to return the most expensive trackf
Select max ("UnitPrice") from "Track";

--Task – Create a query that leverages a system-defined function to return the average total of all invoices
select avg ("total") from "Invoice";

--Task – Create an inner join that joins customers and orders and specifies the name of the customer and the invoiceId.
SELECT "Customer"."CustomerName", "Invoice"."InvoiceId"
From "Customer"
Inner Join "Invoice"
On "Customer.CustomerId", "Invoice.CustomerId";

--task – Create an outer join that joins the customer and invoice table, specifying the CustomerId, firstname, last name, invoiceId, and total.
--Task – Create a right join that joins album and artist specifying artist name and title