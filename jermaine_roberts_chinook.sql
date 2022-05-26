--JERMAINE ROBERTS
--chinook activity

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--2.1 SELECT .1) Task Select all records from the Employee table.

select * 
from "Employee";

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--2.1 SELECT .2) Task Select all records from the Employee table where last name is King.

select * 
from "Employee"
where "LastName"='King';

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--2.1 SELECT .3) Task Select all records from the Employee table where first name is Andrew and REPORTSTO is NULL.

select * 
from "Employee"
where "FirstName"='Andrew'
and "ReportsTo" is NULL;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 2.2 ORDER BY .1) Task Select all albums in album table and sort result set in descending order

select *
from "Album"
ORDER by "AlbumId" desc;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 2.2 ORDER BY .2) Task Select first name from Customer and sort result set in ascending order

select "FirstName"  
from "Customer"
ORDER by "FirstName" asc ;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--2.3 INSERT INTO .1) Task Insert two new records into Genre table

INSERT INTO "Genre" ("GenreId", "Name") 
VALUES (26, 'Trap'), (27, 'Lofi');

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--2.3 INSERT INTO .2) Task Insert two new records into Employee table

INSERT INTO "Employee" ("EmployeeId", "LastName", "FirstName", "Title", "ReportsTo", "BirthDate", "HireDate", "Address", "City", "State", "Country", "PostalCode", "Phone", "Fax" , "Email") 
VALUES 
(9, 'Kind', 'Roberts', 'IT Staff', 6, '1970/5/29', '2004/1/2', '597770 Columbia Boulevard West', 'Lethbridge', 'AB', 'Canada', 'T1K 5N8', '+1 (407) 476-9986', '+1 (403) 456-8785', 'robet@chinookcorp.com'), 
(10, 'Jessi', 'Robits', 'IT Staff', 6, '1970/5/29', '2004/1/2', '597770 Columbia Boulevard West', 'Lethbridge', 'AB', 'Canada', 'T1K 5N8', '+1 (483) 473-9686', '+1 (403) 496-8585', 'roobet@chinookcorp.com');

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--2.3 INSERT INTO .3) Task Insert two new records into Customer table

INSERT INTO "Customer"
("CustomerId", "FirstName", "LastName", "Company", "Address", "City", "State", "Country", "PostalCode", "Phone", "Fax", "Email", "SupportRepId")
values
(60, 'Clare', 'Tracy', 'revature', '555 point st', 'fakecity', 'fakestate', 'russia', '12345', '1234567890', '1234567890', 'email@example.com', 4)
(61, 'Kathleen', 'Mavis', 'revature', '575 point st', 'falsecity', 'falsetate', 'russia', '12345', '1234567850', '1264567890', 'emails@example.com', 5);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--2.4 UPDATE .1) Task  Update Aaron Mitchell in Customer table to Robert Walter

UPDATE "Customer"
SET "FirstName"='Robert', "LastName"='Walter'
WHERE "CustomerId"=32;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--2.4 UPDATE .2) Task  Update name of artist Creedence Clearwater Revival to CCR

UPDATE "Artist"
SET "Name"='CCR'
WHERE "ArtistId"=76;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--2.5 LIKE .1) Task Select all invoices with a billing address like %T%

SELECT all "InvoiceId", "CustomerId", "InvoiceDate", "BillingAddress", "BillingCity", "BillingState", "BillingCountry", "BillingPostalCode", "Total"
FROM "Invoice"
WHERE "BillingAddress" LIKE '%T%';

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--2.6 BETWEEN .1) Task Select all invoices that have a total between 15 and 50

select all "InvoiceId", "CustomerId", "InvoiceDate", "BillingAddress", "BillingCity", "BillingState", "BillingCountry", "BillingPostalCode", "Total"
FROM "Invoice"
WHERE "Total" BETWEEN 15 AND 50;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--2.6 BETWEEN .2) Task Select all employees hired between 1st of June 2003 and 1st of March 2004

select * 
FROM "Employee"
WHERE "HireDate" BETWEEN '06-01-2003' AND '03-01-2004';

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--2.7 DELETE .1) Task Delete a record in Customer table where the name is Robert Walter (There may be constraints that rely on this, find out how to resolve them)

Alter table "Invoice" drop CONSTRAINT "FK_InvoiceCustomerId";
Alter table "InvoiceLine" drop CONSTRAINT "FK_InvoiceLineInvoiceId";

ALTER TABLE "Invoice" ADD CONSTRAINT "FK_InvoiceCustomerId" FOREIGN KEY ("CustomerId") REFERENCES "Customer"("CustomerId") on DELETE cascade;
ALTER TABLE "InvoiceLine" ADD CONSTRAINT "FK_InvoiceLineInvoiceId" FOREIGN KEY ("InvoiceId") REFERENCES "Invoice"("InvoiceId") on DELETE cascade;

DELETE FROM "Customer"
WHERE "CustomerId"=32;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--3.1 System Defined Functions .1) Task Create a query that leverages a system-defined function to return the current time.

SELECT CURRENT_TIMESTAMP;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--3.1 System Defined Functions .2) Task Create a query that leverages a system-defined function to return the length of a mediatype from the mediatype table

SELECT "Name",length("Name") 
AS "Length of a Media Type Name" 
FROM "MediaType";

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--3.2 System Defined Aggregate Functions .1) Task Create a query that leverages a system-defined function to return the average total of all invoices

SELECT AVG("Total")
FROM "Invoice";

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--3.2 System Defined Aggregate Functions .2) Task Create a query that leverages a system-defined function to return the most expensive trackf

SELECT MAX("UnitPrice")
FROM "Track";

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--4.1 INNER .1) Task Create an inner join that joins customers and orders and specifies the name of the customer and the invoiceId

SELECT
	"Customer"."CustomerId",
	"FirstName",
	"LastName",
	"InvoiceId"
FROM
	"Customer"
INNER JOIN "Invoice" 
    ON "Invoice"."CustomerId" = "Customer"."CustomerId";

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--4.2 OUTER .1) Task Create an outer join that joins the customer and invoice table, specifying the CustomerId, firstname, last name, invoiceId, and total.

SELECT
	"Customer"."CustomerId",
	"FirstName",
	"LastName",
	"InvoiceId",
	"Total",
	"InvoiceDate"
FROM
	"Customer"
INNER JOIN "Invoice" 
    ON "Invoice"."CustomerId" = "Customer"."CustomerId"
ORDER BY "InvoiceDate";

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--4.3 RIGHT .1) Task Create a right join that joins album and artist specifying artist name and title.

SELECT 
   "Name", 
   "Title"
FROM 
   "Artist" 
RIGHT JOIN "Album" 
   ON "Album"."ArtistId" = "Artist"."ArtistId";
  
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--4.4 CROSS .1) Task Create a cross join that joins album and artist and sorts by artist name in ascending order.
  
SELECT *
FROM "Album"
CROSS JOIN "Artist"
order by "Name" asc;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--4.5 SELF .1) Task Perform a self-join on the employee table, joining on the reports to column

SELECT
    e."FirstName" || ' ' || e."LastName" "employee",
    m ."FirstName" || ' ' || m ."LastName" "reportsTo" 
FROM
    "Employee" e
INNER JOIN "Employee" m ON m."EmployeeId" = e."ReportsTo"
ORDER BY "reportsTo";

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


