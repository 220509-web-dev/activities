set search_path to chinook;
--2.1 select 

	--Task – Select all records from the Employee table. 
	select * from "Employee" e ;
	
	--Task – Select all records from the Employee table where last name is King.
	select * from "Employee" e where "LastName" = 'King';
	
	--Task – Select all records from the Employee table where first name is Andrew and REPORTSTO is NULL.
	select * from "Employee" e where "FirstName" = 'Andrew' and "ReportsTo" is null;

--2.2 Order By

	--Task – Select all albums in album table and sort result set in descending order
	select * from "Album" order by "AlbumId" desc;
	
	--Task – Select first name from Customer and sort result set in ascending order
	select "FirstName" from "Customer" c order by "FirstName" asc;
	
--2.3 Insert Into
	--Task – Insert two new records into Genre table
	select * from "Genre" g;
	insert into "Genre" values (26,'LoFi');
	insert into "Genre" values (27, 'Emo');

	--Task – Insert two new records into Employee table
	select * from "Employee" e ;
	
	insert into "Employee" values (9,'McTesterson', 'Test', 'IT Staff', 6, '1980-05-22 00:00:00', '2015-06-12 00:00:00', 
	'12345 Test Drive', 'Richmond', 'VA', 'USA', '23221', '+1 (540) 555-5555', '+1 (804) 555-5555', 'test@chinookcorp.com');
	
	insert into "Employee" values (10, 'John', 'Doe', 'IT Staff', 6, '1967-04-04 00:00:00', '2012-12-24 00:00:00',
	'6789 JD Drive', 'Richmond', 'VA', 'USA', '23220', '+1 (540) 999-9999', '+1 (804) 999-9999', 'DJ@chinookcorp.com');

	--Task – Insert two new records into Customer table
	select * from "Customer";
	insert into "Customer" values (60, 'Test', 'McTesterson', null, '12345 Test Drive', 'Richmond', 'VA', 'USA', '23220', '+1 (804) 999-9999', null, 'test@chinookcorp.com', 3);
	insert into "Customer" values (61, 'John', 'Doe', null, '6789 JD Drive', 'Richmond', 'VA', 'USA', '23221', '+1 (540) 555-5555', null, 'DJ@chinookcorp.com', 4);

--2.4 UPDATE
	--Task – Update Aaron Mitchell in Customer table to Robert Walter
	select * from "Customer";
	update "Customer" set "FirstName" = 'Robert', "LastName" = 'Walter'
	where "CustomerId" = 32;

	--Task – Update name of artist “Creedence Clearwater Revival” to “CCR”
	select * from "Artist" a;
	update "Artist" set "Name" = 'CCR'
	where "ArtistId" = 76;
	
--2.5 Like
	--Task – Select all invoices with a billing address like “T”
	select * from "Invoice" where "BillingAddress" like '%T%';

--2.6 Between
	--Task – Select all invoices that have a total between 15 and 50
	select * from "Invoice" where "Total" between 15 and 50;

	--Task – Select all employees hired between 1st of June 2003 and 1st of March 2004
	select * from "Employee" where "HireDate" between '2003-6-1 00:00:00' and '2004-3-1 00:00:00';
	
--2.7 DELETE
	--Task – Delete a record in Customer table where the name is Robert Walter (There may be constraints that rely on this, find out how to resolve them).
	select * from "Customer" where "FirstName" = 'Robert' and "LastName" = 'Walter';
	select * from "Invoice" where "CustomerId" = 32;
	select * from "InvoiceLine";

	delete from "InvoiceLine" where "InvoiceId" in (select "InvoiceId" from "Invoice" where "CustomerId" = 32);
	delete from "Invoice" where "CustomerId" = 32;
	delete from "Customer" where "FirstName" = 'Robert' and "LastName" = 'Walter';
	
--3.1 System Defined Functions
	--Task – Create a query that leverages a system-defined function to return the current time.
	select now();

	--Task – Create a query that leverages a system-defined function to return the length of a mediatype from the mediatype table
	select * from "MediaType" mt ;
	select length("Name") "Name" from "MediaType" mt;

--3.2 System Defined Aggregate Functions
	--Task – Create a query that leverages a system-defined function to return the average total of all invoices
	select * from "Invoice" i ;
	select avg("Total") from "Invoice" i ;

	--Task – Create a query that leverages a system-defined function to return the most expensive trackf
	select * from "Invoice" i ;
	select max("Total") from "Invoice" i ;

--4.1 INNER
	--Task – Create an inner join that joins customers and orders and specifies the name of the customer and the invoiceId.
	select * from "Customer" c ;
	select * from "Invoice" i ;
	
	select c."FirstName", c."LastName", i."InvoiceId"
	from "Customer" c 
	join "Invoice" i 
	on c."CustomerId" = i."CustomerId";

--4.2 Task – Create an outer join that joins the customer and invoice table, specifying the CustomerId, firstname, last name, invoiceId, and total.
	select * from "Customer" c ;
	select * from "Invoice" i ;

	select c."CustomerId", c."FirstName", c."LastName", i."InvoiceId", i."Total"
	from "Customer" c 
	full outer join "Invoice" i 
	on c."CustomerId" = i."CustomerId";

--4.3 Right
	--Task – Create a right join that joins album and artist specifying artist name and title.
	select * from "Album" a ;
	select * from "Artist" ar ;
	
	select ar."Name", al."Title"
	from "Artist" ar
	right join "Album" al
	on ar."ArtistId" = al."ArtistId"
	order by ar."Name" asc;

--4.4 Cross
	--Task – Create a cross join that joins album and artist and sorts by artist name in ascending order.
	select * from "Album" a ;
	select * from "Artist" a ;
	
	select ar."Name", al."Title"
	from "Artist" ar
	cross join "Album" al 
	order by ar."Name" asc ;

--4.5 Self
	--Task – Perform a self-join on the employee table, joining on the reports to column.
	select * from "Employee" e ;

	select e."FirstName", e."LastName", e."ReportsTo", e2."FirstName", e2."LastName"
	from "Employee" e 
	join "Employee" e2 
	on e2."EmployeeId" = e."ReportsTo";  
	
	