--Code written by: Kalon Penagraph
--### 2.1 SELECT
--Task – Select all records from the Employee table. 
    select * from "Employee" e ;
--Task – Select all records from the Employee table where last name is King.
    select * from "Employee" e 
where "LastName" = 'King';
--Task – Select all records from the Employee table where first name is Andrew and REPORTSTO is NULL.
    select * from "Employee" e 
where "FirstName" = 'Andrew';




--### 2.2 ORDER BY
--Task – Select all albums in album table and sort result set in descending order
    select *
from "Album" a
order by "Title" desc;

--or

select *
from "Album" a
order by "AlbumId" desc;
 
--Just depends on which field you want to use to sort in descending order.

--Task – Select first name from Customer and sort result set in ascending order

    select "FirstName" 
from "Customer" c
order by "FirstName";



--### 2.3 INSERT INTO
--Task – Insert two new records into Genre table

--Task – Insert two new records into Employee table

--Task – Insert two new records into Customer table