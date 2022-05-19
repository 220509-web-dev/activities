-- pgAdmin

/* 2.1 SELECT */

-- Select all records from the Employee table
select * from chinook."Employee"; 	
set search_path to chinook; select * from "Employee";
-- both commands work

-- Select records from the Employee table where the LastName field is 'King'
select * from chinook."Employee" e
where e."LastName"='King';
-- Only 1 record found

-- Widen the search
select * from chinook."Employee" e
where lower(e."LastName") like '%king%';

-- Select all records from the Employee table where first name is Andrew and REPORTSTO is NULL.

-- How many records have a NULL value in the ReportsTo field?
select * from chinook."Employee" e
where e."ReportsTo" is null;
-- 1 record

-- Better refine the search anyways
select * from chinook."Employee" e
where e."ReportsTo" is null 
and
e."FirstName" = 'Andrew';

/* 2.2 ORDER BY */

-- Select all albums in album table and sort result set in descending order

-- Peek at the Album table
select * from chinook."Album"
limit 10;

-- Sort by the Title field
select * from chinook."Album" al
order by al."Title" desc;

-- Peek at the Customer table
select * from chinook."Customer"
limit 10;

-- Select first name from Customer and sort result set in ascending order
select * from chinook."Customer" cu
order by cu."FirstName" asc;

/* 2.3 INSERT INTO */

-- Peek at the Genre table
select * from chinook."Genre" ge
order by ge."GenreId" desc
limit 10;
-- new records must start PK increment at 26

--Insert two new records into Genre table
insert into chinook."Genre" ("GenreId","Name")
values (26,'Lecture Recordings'),(27,'Computer Fan Whirling');

-- Insert two new records into Employee table
select * from chinook."Employee" order by "EmployeeId" desc; 	
-- PK increment ends at 8

insert into chinook."Employee"
values
(9,'John','Doe','IT Staff',1,'2022-05-18 00:00:00','2022-05-19 00:00:00','1 Ave way','Cityberg','TX','USA','78250','+1 (999) 999-9999', '+1 (111) 999-9999', 'unmonitored@no-reply.org')
;
insert into chinook."Employee"
values
(10,'Jane','Doe','IT Staff',1,'2022-05-18 00:00:00','2022-05-19 00:00:00','1 Ave way','Cityberg','TX','USA','78250','+1 (999) 999-9999', '+1 (111) 999-9999', 'unmonitored@no-reply.org')
;

-- Peek at the Customer table
select * from chinook."Customer"
order by "CustomerId" desc
limit 10;
--Ends at 59

-- Insert two new records into Customer table
insert into chinook."Customer"
values
(60,'First','Last',null,'1 Lane Way','Cityville',null,'USA',null,'+1 (999) 123 4567',null,'unmonitored@no-reply.org',4);
insert into chinook."Customer"
values
(61,'Firstfirst','Lastlast',null,'1 Lane Way','Cityville',null,'USA',null,'+1 (999) 123 4567',null,'unmonitored@no-reply.org',4);


/* 2.4 UPDATE */



