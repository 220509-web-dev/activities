-- select all from employee
select * from "Employee";

--select all from where lastname is king
select * from "Employee"  where  "LastName"='King';

--select all from where from employee is andrew and reportisto is null
select * from "Employee" where "FirstName"='Andrew' and "ReportsTo" is null;