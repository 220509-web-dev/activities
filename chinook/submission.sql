
-- SELECT
-- Task – Select all records from the Employee table.
SELECT * FROM "Employee";
-- Task – Select all records from the Employee table where last name is King.
select * from "Employee" where "LastName" = 'King';
-- Task – Select all records from the Employee table where first name is Andrew and REPORTSTO is NULL.
select * from "Employee" where "FirstName" = 'Andrew' and "ReportsTo" is null;

-- ORDER BY
-- Task – Select all albums in album table and sort result set in descending order
select * from "Album" order by "AlbumId" desc;
--Task – Select first name from Customer and sort result set in ascending order
select * from "Album" order by "AlbumId" asc;

-- INSERT INTO
-- Task – Insert two new records into Genre table
select * from "Genre";
insert into "Genre" ("GenreId","Name")
values (26,'Hot'), (27, 'Banger');
--Task – Insert two new records into Employee table
insert into "Employee" ("EmployeeId","LastName","FirstName")
values (9,'Almustafa','James'), (10,'Melissa','James');
-- Task – Insert two new records into Customer table
select * from "Customer";
insert into "Customer" ("CustomerId","FirstName","LastName","Email")
values (60,'Al','James','aljames@revature.net'), (61,'Mel','James','meljames@revature.net');

-- UPDATE
-- Task – Update Aaron Mitchell in Customer table to Robert Walter
update "Customer" 
set "FirstName" = 'Robert', "LastName" = 'Walter'
where "CustomerId" = 32;