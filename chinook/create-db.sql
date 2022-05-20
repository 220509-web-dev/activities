select * from "Employee";

select * from "Employee" 
where "LastName" = 'King';

select * from "Employee"
where "FirstName" = 'Andrew'
and "ReportsTo" is null; -- tried to use =, didn't work

select "Title" from "Album"
order by "Title";