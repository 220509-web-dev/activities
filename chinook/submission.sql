-- Task – Select all records from the Employee table.
SELECT * FROM "Employee";

-- Task – Select all records from the Employee table where last name is King.
select * from "Employee" where "LastName" = 'King';

-- Task – Select all records from the Employee table where first name is Andrew and REPORTSTO is NULL.
select * from "Employee" where "FirstName" = 'Andrew' and "ReportsTo" is null;

-- Task – Select all albums in album table and sort result set in descending order
select * from "Album" order by "AlbumId" desc;