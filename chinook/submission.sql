
#2.1 -- SELECT
-- Task – Select all records from the Employee table.
SELECT * FROM "Employee";
-- Task – Select all records from the Employee table where last name is King.
select * from "Employee" where "LastName" = 'King';
-- Task – Select all records from the Employee table where first name is Andrew and REPORTSTO is NULL.
select * from "Employee" where "FirstName" = 'Andrew' and "ReportsTo" is null;

#2.2 --ORDER BY
-- Task – Select all albums in album table and sort result set in descending order
select * from "Album" order by "AlbumId" desc;
--Task – Select first name from Customer and sort result set in ascending order
select * from "Album" order by "AlbumId" asc;

#2.3 -- INSERT into 