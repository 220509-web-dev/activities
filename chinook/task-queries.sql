select *
from "Employee" e;

select * 
from "Employee" e 
where "LastName" = 'King';

select *
from "Employee" e 
where "FirstName" = 'Andrew' 
	and "ReportsTo" is null;
	
select *
from "Album" a
order by "Title" desc;

select "FirstName" 
from "Customer" c 
order by "FirstName";

select *
from "Genre" g;

insert into "Genre" ("GenreId" ,"Name") 
values (26,'Night Core'),
(27,'Test');

select *
from "Employee" e;

insert into "Employee" ("EmployeeId","LastName","FirstName","Title","ReportsTo",
	"BirthDate","HireDate","Address","City","State",
	"Country","PostalCode","Phone","Fax","Email") 
values (9,'Barker','Bob','Game Show Host', 1, now(),now(),
	'1234 street', 'Kapolei', 'HI', 'USA', '96707',
	'(808)555-1234','(808)555-1234','bbarker@price.com'),
(10,'carey','drew','Game Show Host', 1, now(),now(),
	'1234 street', 'Kapolei', 'HI', 'USA', '96707',
	'(808)555-1235','(808)555-1235','dcarey@price.com');

select *
from "Customer" c;

insert into "Customer" ("CustomerId","FirstName","LastName","Email")
values (60,'Bob','Barker','bbarker@price.com'),
(61,'Drew','Carey','dcarey@price.com');

select *
from "Customer" c 
where "FirstName" = 'Aaron';

update "Customer" 
set "FirstName" = 'Robert',
	"LastName" = 'Walter'
where "CustomerId" = 32;

select *
from "Artist" a 
where "Name" = 'Creedence Clearwater Revival'

update "Artist" 
set "Name" = 'CCR'
where "ArtistId" = 76;

select *
from "Invoice" i 
where "BillingAddress" like 'T%'

select *
from "Invoice" i 
where "Total" >= 15 and "Total" <=50;

select *
from "Invoice" i 
where "Total" between 15 and 50;

select *
from "Employee" e 
where "HireDate" >= '2003/06/01' and "HireDate" < '2004/03/01'

select *
from "Employee" e 
where "HireDate" between '2003/06/01' and '2004/03/01';

select *
from "Customer" c 
where "CustomerId" = 32;

select * 
from "Invoice" i 
where "CustomerId" = 32;

select *
from "InvoiceLine" il 
where "InvoiceId" in (
	select "InvoiceId"  
	from "Invoice" i 
	where "CustomerId" = 32
);

delete from  "InvoiceLine" 
where "InvoiceId" in (
	select "InvoiceId"  
	from "Invoice" i 
	where "CustomerId" = 32
);

delete from "Invoice" 
where "CustomerId" = 32;

delete from "Customer" 
where "CustomerId" = 32;

select now();

select length("Name")
from "MediaType" mt; 

select avg("Total") 
from "Invoice" i;

select MAX("UnitPrice")
from "Track" t;

select i."InvoiceId", c."FirstName", c."LastName" 
from "Customer" c 
	join "Invoice" i 
		on c."CustomerId" = i."CustomerId";

select c."CustomerId", c."FirstName", c."LastName", 
	i."InvoiceId", i."Total"  
from "Customer" c 
	full outer join "Invoice" i 
		ON c."CustomerId" = i."CustomerId";

select a."Title", a2."Name" 
from "Album" a 
	right join "Artist" a2 
		on a."ArtistId" = a2."ArtistId";
	
select *
from "Album" a 
	cross join "Artist" a2 
order by a2."Name" 

select *
from "Employee" e 
	join "Employee" e2
		on e."EmployeeId" = e2."ReportsTo";
