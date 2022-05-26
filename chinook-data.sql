-- select all from employee
select * from "Employee";

--select all from where lastname is king
select * from "Employee"  where  "LastName"='King';

--select all from where from employee is andrew and reportisto is null
select * from "Employee" where "FirstName"='Andrew' and "ReportsTo" is null;

--select all albums in able and sort in descending order
select * from "Album" order by "Album" desc;

--select all albums and sort them in ascending order
select * from "Album" order by "Album" asc;

--select all from "Genre" 
select * from "Genre";

--insert two records in the genre table
insert into "Genre" ("GenreId","Name") values (26,'Nightcore'),
(27, 'NuMetal');

--insert two new records into "Employee" 
insert into "Employee" ("EmployeeId", "FirstName", "LastName", "Title", "ReportsTo", "BirthDate","HireDate") values (11, 'Naruto', 'Uzumaki', 'IT Staff', '6', '1999-04-12', '2022-03-17'),
(12, 'Sailor', 'Moon', 'It Staff','6', '1986-12-07', '2020-04-12');

--select all from customer table
 select * from "Customer"
 
-- insert into customer table
insert into "Customer"("CustomerId", "FirstName", "LastName", "Company", "Email") values (60, 'Mike', 'Jones', 'Revature', 'mike123@revature.net'), (61, 'John', 'Cena', 'WWE', 'jCena@wwe.com');

--update Aaron Mitchell in customer table to Robert Walter
update  "Customer"  set "FirstName" = 'Robert', "LastName" = 'Walters' where "CustomerId" = 32;

-- update name of artist creedence clearwater revival to ccr
update "Artist" set "Name" = 'CCR' where "ArtistId" = 76;

--select all from "Artist" 
select * from "Artist";

--select all from invoices
select * from "Invoice";

--select all from invoices where billing address is like 'T'
select * from "Invoice" where "BillingAddress" like 'T';

--select all invoices with a total between 15 and 50
select * from "Invoice" where "Total" between 15 and 50;

--select all employees hired between 1st of june and 1st of march
select * from "Employee" where "HireDate" between '2003-06-01' and '2004-03-01';

-- delete a record in customer
alter table "Invoice" drop constraint "FK_InvoiceCustomerId";
alter table "InvoiceLine" drop constraint "FK_InvoiceLineInvoiceId";

alter table "Invoice" add constraint "FK_InvoiceCustomerId" FOREIGN KEY ("CustomerId") REFERENCES "Customer"("CustomerId") on DELETE cascade;
ALTER TABLE "InvoiceLine" ADD CONSTRAINT "FK_InvoiceLineInvoiceId" FOREIGN KEY ("InvoiceId") REFERENCES "Invoice"("InvoiceId") on DELETE cascade;

DELETE FROM "Customer"
WHERE "CustomerId"=32;

--Create a query that leverages a system-defined function to return the current time.
select CURRENT_TIMESTAMP;
select now();

-- create a query that leverages a system-defined function to return the length of a mediatype
select length("Name") from "MediaType";

--create a query that leverages a system defiend function that returns the average invoices
select sum("Total") from "Invoice";

--create a query that returns the most expensive track
select max("UnitPrice") from "Track";

-- create inner join that joins customers and orders and specifies the name and invoice id
select "FirstName", "LastName", "InvoiceId" from "Customer" cus join "Invoice" i on cus."CustomerId" = i."CustomerId";

--create an outer join that joins customer and invoice table specifying the customer full name invoiceid and total
select cus."CustomerId", "FirstName", "LastName", "InvoiceId", "Total" from "Customer" cus full outer join "Invoice" i on cus."CustomerId" = i."CustomerId";

--create a right join that joins album and artitst specifying artist name and title
select "Name", "Title" from "Album" al right join "Artist" ar on al."ArtistId" = ar."ArtistId";

--create a cross join that joins album and artist and sorts by artist name in asc order 
select * from "Album" cross join "Artist" order by "Name" asc;

--Perform a self-join on the employee table, joining on the reports to column.
select * from "Employee" Emp1, "Employee" Emp2 where Emp1."ReportsTo"  = Emp2."EmployeeId"; 


