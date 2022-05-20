-- Task 1.0

select * from "Employee";

-- Task 2.1

select * from "Employee" 
where "LastName" = 'King';

select * from "Employee"
where "FirstName" = 'Andrew'
and "ReportsTo" is null; -- tried to use =, didn't work

-- Task 2.2
select "Title" from "Album"
order by "Title" desc;

select "FirstName" from "Customer"
order by "FirstName" asc;

select "GenreId" from "Genre" g
order by g."GenreId" desc;

-- Task 2.3

insert into "Genre" values 
(26, 'Chiptune'),
(27, 'Baroque');

insert into "Employee" ("EmployeeId", "LastName", "FirstName", "Title", "ReportsTo", "Country", "Email")
values (9, 'Moch', 'Richard', 'Software Engineer', null, 'United States', 'richard@richardmoch.xyz'),
(10, 'McBoatface', 'Boaty', 'Lead Boat', null, 'United Kingdom', 'boaty.mcboatface@noc.ac.uk');

-- Task 2.4
