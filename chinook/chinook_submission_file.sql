--Code written by: Kalon Penagraph
--### 2.1 SELECT
--Task – Select all records from the Employee table. 
    select * from "Employee" e ;
--Task – Select all records from the Employee table where last name is King.
    select * from "Employee" e 
    where "LastName" = 'King';
--Task – Select all records from the Employee table where first name is Andrew and REPORTSTO is NULL.
    select * from "Employee" e 
    where "FirstName" = 'Andrew'
    and "ReportsTo" is null;



--### 2.2 ORDER BY
--Task – Select all albums in album table and sort result set in descending order
    select *
    from "Album" a
    order by "Title" desc;

--or

    select *
    from "Album" a
    order by "AlbumId" desc;
 
--Just depends on which field you want to use to sort in descending order.
--Task – Select first name from Customer and sort result set in ascending order
    select "FirstName" 
    from "Customer" c
    order by "FirstName";

--### 2.3 INSERT INTO
--Task – Insert two new records into Genre table
    insert into "Genre" ("GenreId", "Name") values (26, 'Trap'), (27, 'Country');
--Task – Insert two new records into Employee table
    insert into "Employee"  ("EmployeeId", "LastName", "FirstName", "Title", "ReportsTo", "BirthDate", "HireDate", "Address", "City", "State", "Country", "PostalCode", "Phone", "Fax", "Email") 
	values (9 ,'Penagraph', 'Kalon', 'IT Staff', 6, '1997/10/01', '2022/05/09', '100 Apple Drive', 'Dallas', 'Texas', 'United States', '75215', '123-456-7890', '0987', 'kdp131@txstate.edu'),
    (9 ,'Test', 'Test', 'Test', 6, '1997/10/01', '2022/05/09', '101 Learning Avenue', 'Dallas', 'Texas', 'United States', '75215', '123-456-7890', '0987', 'iloverevature@revature.net');
--Task – Insert two new records into Customer table
    insert into "Customer" ("CustomerId", "FirstName", "LastName", "Company", "Address", "City", "State", "Country", "PostalCode", "Phone", "Fax", "Email", "SupportRepId")
    values (60, 'Cust1', 'Cust1', 'Cust1', 'Revature', 'adsa', 'wdsd', 'dfdsfds', 'dfdf', '232432-223', '5343', 'jfdkfj@ksjdfsm.com', 5),
    (61, 'Cust2', 'Cust2', 'Cust2', 'Revature', 'adsa', 'wdsd', 'fdsfds', 'dfdf', '232432-223', '5343', 'jfdkfj@ksjdfsm.com', 3);

--### 2.4 UPDATE
--Task – Update Aaron Mitchell in Customer table to Robert Walter
    update "Customer" 
    set "FirstName" = 'Robert', "LastName" = 'Walter'
    where "CustomerId" = 32;
--Task – Update name of artist “Creedence Clearwater Revival” to “CCR”
    update "Artist" 
    set "Name" = 'CCR'
    where "Name" = 'Creedence Clearwater Revival';
--### 2.5 LIKE
--Task – Select all invoices with a billing address like “T”
    select * from "Invoice" i 
    where "BillingAddress" like 'T%';
--### 2.6 BETWEEN
--Task – Select all invoices that have a total between 15 and 50
    select * from "Invoice" i 
    where "Total" between  15 and 50;
--Task – Select all employees hired between 1st of June 2003 and 1st of March 2004
    select * from "Employee" e 
    where "HireDate" between '2003/06/1' and '2004/03/1'
--### 2.7 DELETE
--Task – Delete a record in Customer table where the name is Robert Walter (There may be constraints that rely on this, find out how to resolve them).
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

--### 3.0 SQL Functions
--In this section you will be using the PostGreSQL system functions, as well as your own functions, to perform various actions against the database

--### 3.1 System Defined Functions
--Task – Create a query that leverages a system-defined function to return the current time.
    select current_time;
--Task – Create a query that leverages a system-defined function to return the length of a mediatype from the mediatype table
    select length("Name") from "MediaType" mt;
--### 3.2 System Defined Aggregate Functions
--Task – Create a query that leverages a system-defined function to return the average total of all invoices
    select avg("Total") from "Invoice" i;
--Task – Create a query that leverages a system-defined function to return the most expensive trackf
    select max("UnitPrice") from "Track" t; 
--### 4.0 JOINS
--In this section you will be working with combining various tables through the use of joins. You will work with outer, inner, right, left, cross, and self joins.

--### 4.1 INNER
--Task – Create an inner join that joins customers and orders and specifies the name of the customer and the invoiceId.
    select c."FirstName",
    c."LastName",
    i."InvoiceId"
    from "Customer" c
    inner join "Invoice" i
    on c."CustomerId" = i."CustomerId"; 
--### 4.2 OUTER
--Task – Create an outer join that joins the customer and invoice table, specifying the CustomerId, firstname, last name, invoiceId, and total.
    select c."CustomerId" ,
    c."FirstName",
    c."LastName" ,
    i."InvoiceId" ,
    i."Total" 
    from "Customer" c 
    full outer join "Invoice" i 
    on c."CustomerId" = i."CustomerId" ;
---### 4.3 RIGHT
--Task – Create a right join that joins album and artist specifying artist name and title.
    select a2."Name", a."Title" 
    from "Album" a 
    right join "Artist" a2 
    on a."ArtistId" = a2."ArtistId";
--### 4.4 CROSS
--Task – Create a cross join that joins album and artist and sorts by artist name in ascending order.
    select * 
    from "Album" a 
    cross join "Artist" a2 
    order by a2."Name"; 
--### 4.5 SELF
--Task – Perform a self-join on the employee table, joining on the reports to column.
    select *
    from "Employee" e, "Employee" e2 
    where e."ReportsTo" = e2."ReportsTo";