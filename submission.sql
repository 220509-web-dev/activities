--Task – Select all records from the Employee table.
select * from "Employee";

--Task – Select all records from the Employee table where last name is King.
select * from "Employee" where "LastName" = 'King';

--Task – Select all records from the Employee table where first name is Andrew and REPORTSTO is NULL.
select * from "Employee" where "FirstName" = 'Andrew' and "ReportsTo" is null;

--Task – Select all albums in album table and sort result set in descending order
select * from "Album" order by "AlbumId" desc;

--Task – Select first name from Customer and sort result set in ascending order
select * from "Album" order by "AlbumId";

--Task – Insert two new records into Genre table
insert into "Genre" ("GenreId", "Name") values (26, 'slappop'), (27, 'slaprock');

--Task – Insert two new records into Employee table
insert into "Employee" ("EmployeeId", "LastName", "FirstName") values (9, 'Peterson', 'Amy'), (10, 'Anderson', 'Sim');

--Task – Insert two new records into Customer table
insert into "Customer" ("CustomerId", "FirstName", "LastName", "Email") values (60, 'Peterson', 'Amy', 'AP@hotmail.com'), (61, 'Anderson', 'Sim', 'SM@AOL.com');

--Task – Update Aaron Mitchell in Customer table to Robert Walter
update "Customer" set "FirstName" = 'Rorbert', "LastName" = 'Walter' where "CustomerId" = 32;

--Task – Update name of artist “Creedence Clearwater Revival” to “CCR”
update "Artist" set "Name" = 'CCR' where "Name" = 'Creedence Clearwater Revival';

--Task – Select all invoices with a billing address like “T”
select * from "Invoice" where "BillingAddress" like 'T%';

--Task – Select all invoices that have a total between 15 and 50

--Task – Select all employees hired between 1st of June 2003 and 1st of March 2004

--Task – Delete a record in Customer table where the name is Robert Walter (There may be constraints that rely on this, find out how to resolve them).

--Task – Create a query that leverages a system-defined function to return the current time.

--Task – Create a query that leverages a system-defined function to return the length of a mediatype from the mediatype table

--Task – Create a query that leverages a system-defined function to return the average total of all invoices

--Task – Create a query that leverages a system-defined function to return the most expensive trackf

--Task – Create an inner join that joins customers and orders and specifies the name of the customer and the invoiceId.

--Task – Create an outer join that joins the customer and invoice table, specifying the CustomerId, firstname, last name, invoiceId, and total.

--Task – Create a right join that joins album and artist specifying artist name and title.

--Task – Create a cross join that joins album and artist and sorts by artist name in ascending order.

--Task – Perform a self-join on the employee table, joining on the reports to column.









