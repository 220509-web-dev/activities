set search_path to chinook;

-- 2.1 Select

SELECT *
FROM "Employee";

SELECT *
FROM "Employee" where "LastName" = 'King';

SELECT * FROM "Employee" 
where "FirstName" = 'Andrew'
and "ReportsTo" IS NULL;

-- 2.2 Order by

SELECT * 
FROM "Album"
order by "AlbumId" desc;

SELECT * 
FROM "Album"
order by "AlbumId" asc;

-- 2.3 Insert into

insert into "Genre"( "GenreId", "Name")
values( 26, 'Afrobeat' );


insert into "Genre"( "GenreId", "Name")
values( 27, 'Drill' );

insert into "Employee"( "EmployeeId", "LastName", 
"FirstName", "Title", "ReportsTo", "BirthDate", 
"HireDate", "Address", "City", "State", "Country", 
"PostalCode", "Phone", "Fax", "Email" )
values(9, 'Tony', 'Stark', 'CEO', null, '1970-05-29 00:00:00.0', 
'2002-01-01 00:00:00.0', '10880 Malibu Point', 'Malibu', 'CA', 'USA', 
'90265', '+1 (212) 970-4133', '+1 (212) 970-4133', 'ironman@starkindustries.com');


insert into "Employee"( "EmployeeId", "LastName", 
"FirstName", "Title", "ReportsTo", "BirthDate", 
"HireDate", "Address", "City", "State", "Country", 
"PostalCode", "Phone", "Fax", "Email" )
values(10, 'Peter', 'Parker', 'Intern', 9, '2001-05-25 00:00:00.0', 
'2020-04-17 00:00:00.0', '88-39 69th Rd', 'Queens', 'NY', 'USA', 
'11375', '+1 (240) 776-2323', '+1 (240) 776-2323', 'spidey@starkindustries.com');

insert into "Customer"("CustomerId", "FirstName", "LastName", "Company",
"Address", "City", "State", "Country", "PostalCode", "Phone", "Fax", "Email", "SupportRepId" )
values(60, 'Tony', 'Stark', 'Stark Industries', '10880 Malibu Point', 'Malibu', 'CA', 'USA', '90265', 
'+1 (212) 970-4133', '+1 (212) 970-4133', 'ironman@starkindustries.com', 9);


insert into "Customer"("CustomerId", "FirstName", "LastName", "Company",
"Address", "City", "State", "Country", "PostalCode", "Phone", "Fax", "Email", "SupportRepId" )
values(61, 'Peter', 'Parker', 'Stark Industries', '88-39 69th Rd', 'Queens', 'NY', 'USA', '11375', 
'+1 (240) 776-2323', '+1 (240) 776-2323', 'spidey@starkindustries.com', 10);

-- 2.4 Update

update "Customer" 
set "FirstName" = 'Robert', "LastName" = 'Walter' 
where "FirstName" = 'Aaron' and "LastName" = 'Mitchell'; 

update "Artist" 
set "Name" = 'CCR'
where "Name" = 'Creedence Clearwater Revival';

-- 2.5 Like

select * 
from "Invoice" 
where "BillingAddress" 
like 'T%';

-- 2.6 Between

select * 
from "Invoice" 
where "Total" 
between 15 and 50;

select * 
from "Employee" 
where "HireDate" 
between '2003-06-01' and '2004-03-01 00:00:00.000';

-- 2.7 Delete

update "Invoice" 
set "CustomerId" = 33
where "CustomerId" = 32;

delete from "Customer" 
where "FirstName" = 'Robert' and "LastName" = 'Walter';

-- 3.1 System Defined Functions

select current_timestamp as DateAndTime;

select length("Name") as ln from "MediaType";

-- 3.2 System Defined Aggregation Functions

select avg("Total") as Average from "Invoice";

select max("UnitPrice") as mostExpensive from "Track";

-- 4.1 Inner

select "Invoice"."InvoiceId", "FirstName", "LastName"
from "Customer" 
inner join "Invoice" 
on "Customer"."CustomerId"  = "Invoice"."CustomerId";

-- 4.2 Outter

select "Customer"."CustomerId", "Customer"."FirstName", "Customer"."LastName", "Invoice"."InvoiceId",
"Invoice"."Total" 
from "Customer" 
full outer join "Invoice" on "Customer"."CustomerId" = "Invoice"."CustomerId"; 

-- 4.3 Right

select "Artist"."Name", "Album"."Title" 
from "Album"
right outer join "Artist" on "Album"."ArtistId" = "Artist"."ArtistId"; 

-- 4.4 Cross

select * 
from "Album" 
cross join "Artist" 
order by "Artist"."Name" asc;

-- 4.5 Self

select *
from "Employee" e 
join "Employee" e2
on e."ReportsTo" = e2."EmployeeId";

