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
delete from "Customer" where "FirstName" = 'Robert';


