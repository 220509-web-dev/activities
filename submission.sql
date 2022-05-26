--Task � Select all records from the Employee table.
SELECT * FROM "Employee";

--Task � Select all records from the Employee table where last name is King.
select * from "Employee" where "LastName" = 'King';

--Task � Select all records from the Employee table where first name is Andrew and REPORTSTO is NULL.
select * from "Employee" where "FirstName" = 'Andrew' and "ReportsTo" is null;

--Task � Select all albums in album table and sort result set in descending order
select * from "Album" order by "Title" desc;

--Task � Select first name from Customer and sort result set in ascending order
select "FirstName" from "Customer" order by "FirstName";

--Task � Insert two new records into Genre table
select * from "Genre";
insert into "Genre" ("GenreId" , "Name") values (26, 'Reggaeton'), (27, 'Old School/Classic HipHop');

--Task � Insert two new records into Employee table
select * from "Employee";
insert into "Employee" ("EmployeeId","LastName","FirstName","Title","ReportsTo",
	"BirthDate","HireDate","Address","City","State",
	"Country","PostalCode","Phone","Fax","Email")
	Values (9, 'McMullan' , 'Michael' , 'Operations Manager' , 7, '2000-02-13' , '2022-05-25' , '1234 Main Street' , 'Indianapolis' , 'Indiana' , 'USA' , '46123' , '(317)555-0987' , '(317)555-0988' , 'mmcmullan@gmail.com') ,  
(10, 'Webb' , 'Jim' , 'Operations Employee' , 7, '2005-07-19' , '2022-05-20' , '227 Avenue' , 'Gary' , 'Indiana' , 'USA' , '46203' , '(317)555-7657' , '(317)555-7655' , 'jwebb@gmail.com');

--Task � Insert two new records into Customer table
select *
from "Customer";

insert into "Customer" ("CustomerId","FirstName","LastName", "Email")
values (60,'McMullan','Michael','mmcmullan@gmail.com'),
(61,'Jim','Carey','jcarey@gmail.com');

--Task � Update Aaron Mitchell in Customer table to Robert Walter
update "Customer" 
set "FirstName" = 'Robert', "LastName" = 'Walter'
where "CustomerId" = 32;

--Task � Update name of artist �Creedence Clearwater Revival� to �CCR�
select * from "Artist"
where "Name" = 'Creedence Clearwater Revival'

update "Artist" 
set "Name" = 'CCR' 
where "ArtistId" = '76';

--Task � Select all invoices with a billing address like �T�
select * from "Invoice" where "BillingAddress" like '%T%'

--Task � Select all invoices that have a total between 15 and 50
select * from "Invoice" where "Total" >= 15 and "Total" <=50;

select * from "Invoice" where "Total" between 15 and 50;

--Task � Select all employees hired between 1st of June 2003 and 1st of March 2004
select * from "Employee" where "HireDate" >= '2003/06/01' and "HireDate" < '2004/03/01';

--Task � Delete a record in Customer table where the name is Robert Walter (There may be constraints that rely on this, find out how to resolve them).
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

--Task � Create a query that leverages a system-defined function to return the current time.
select current_time;

--Task � Create a query that leverages a system-defined function to return the length of a mediatype from the mediatype table
select length("Name") from "MediaType" mt;

--Task � Create a query that leverages a system-defined function to return the average total of all invoices
select avg("Total") from "Invoice";

--Task � Create a query that leverages a system-defined function to return the most expensive trackf
select max("Total") from "Invoice";

--Task � Create an inner join that joins customers and orders and specifies the name of the customer and the invoiceId.
select c."FirstName",
c."LastName",
i."InvoiceId" 
from "Customer" c 
inner join "Invoice" i 
on c."CustomerId" = i."CustomerId" ;

--Task � Create an outer join that joins the customer and invoice table, specifying the CustomerId, firstname, last name, invoiceId, and total.
select c."FirstName",
c."LastName",
i."InvoiceId",
i."Total" 
from "Invoice" i 
full outer join "Customer" c
on c."CustomerId" = i."CustomerId" ;

--Task � Create a right join that joins album and artist specifying artist name and title.
select ar."Name",
al."Title"
from "Artist" ar
right join "Album" al
on ar."ArtistId" = al."ArtistId";

--Task � Create a cross join that joins album and artist and sorts by artist name in ascending order.
select ar."Name"
from "Artist" ar
cross join "Album" a
order by ar."Name" desc;

--Task � Perform a self-join on the employee table, joining on the reports to column.
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




 






	





