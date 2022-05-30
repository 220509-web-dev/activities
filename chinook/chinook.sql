SET search_path TO chinook;

--Task selecting all employees

SELECT * FROM Employees;

--Task selecting all employees with last name King
 
 SELECT * FROM Employees WHERE LastName = 'King';

 --Task selecting all employees with first name Andrew and reportsto null

 SELECT * FROM Employees WHERE FirstName = 'Andrew' AND ReportsTo is NULL;

 --Task select all albums in album table and sort results in descending

 SELECT * FROM Albums ORDER BY DESC;

 --Task first name from customer and sort in ascending 

 SELECT FirstName FROM Customer AND ORDER BY ASC;

 --Task open genre table and insert two new genres  

SELECT FROM Genre INSERT INTO Genre VALUES (N'Theater', N'Gospel');

--Task inserting two new records into employee table 

SELECT FROM Employee
INSERT INTO Employee ('EmployeeID','LastName', 'FirstName', 'Title', 'ReportsTo','Birthdate', 'Hiredate', 'Address', 'City', 'State', 'Country', 'PostalCode','Phone', 'Fax', 'Email') 
VALUES (9, N'Dheija', N'Jones', N'IT Staff', 6, '1995/5/22','2020/1/1', N'324 Garey St', N'Toronto', N'NA', N'Canada', N'NA', N'+1 (909) 555-5555', N'NA', N'dheija530@revature.net'), (10, N'Erica', N'Clayton', N'IT Manager', 1, '1993/7/22', '2020/1/1', N'825 Welder Drive', N'Toronto', N'NA', N'Canada', N'NA', N'+1 (403) 555-555', N'NA', N'ericac@aol.com');

--Task inserting two new records into customer table 

SELECT FROM Customer
INSERT INTO Employee ('CustomerId', 'FirstName', 'LastName','Company', 'Address', 'City','State','Country', 'PostalCode', 'Phone', 'Fax', 'Email', 'SupportRepId')
VALUES (60, N'Bill', N'Beaver', N'USPS', N'7452 Riverhead', N'Garey', N'Indiana', N'USA', N'91475-0471', N'+1 (514) 555-555', N'NA', N'bbeaver@aol.com', 8 ), (61, N'Ariana', N'Fletcher', N'Walmart', N'14520 Haven Ave', N'Ontario', N'California', N'USA', N'58414-9840', N'+1 (951) 555-5555', N'NA', N'Afletcher@gmail.com', 12);

--Task updating Aaron Mitchell in Customer table to Robert Walker

UPDATE Customer SET FirstName = 'Robert', LastName = 'Walker'
WHERE CustomerID = 32; 

--Task updating name of artist "Creedance Clearwater Revival" to "CCR"

UPDATE Artists SET 'Name' = 'CCR'
WHERE ArtistID = 76;

--Task select all invoices with a billing addresse like "T"

SELECT * FROM Invoice WHERE Billing_Address LIKE 'T%';

--Task select all invoices that have a total between 15 and 50

SELECT * FROM Invoice WHERE Total BETWEEN 15 AND 50;

--Task select all employees hired between 1st of June 2003 and 1st of March 2004

SELECT * FROM Employee WHERE Hire_date BETWEEN '2003/6/1' AND '2004/3/1';

--Task delete a record in customer table where the name is Robert Walter

DELETE FROM Customer WHERE CustomerID = 32;













































































































































