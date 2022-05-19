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

--insert two records in the genre table
insert into "Genre" ("GenreId","Name") values (26,'Nightcore'),
(27, 'NuMetal');

--inser two new records into "Employee" 
insert into "Employee" ("EmployeeId", "FirstName", "LastName", "Title", "ReportsTo", "BirthDate","HireDate") values (11, 'Naruto', 'Uzumaki', 'IT Staff', '6', '1999-04-12', '2022-03-17'),
(12, 'Sailor', 'Moon', 'It Staff','6', '1986-12-07', '2020-04-12');