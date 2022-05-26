/*
 * CHINOOK-DATABASE-GERARD PAUL
 */


-- 2.1 SELECT

--Task _ Select All records from the Employee table. 
select * from "Employee";
-- Task - Select All records from the Employee table where the last name is King.
select * from "Employee" where "LastName" = 'King';
-- Task - Select All records from the Employee table where first name is Andrew and Reportsto is null.
select * from "Employee" where "FirstName" = 'Andrew' and "Employee"."ReportsTo" is null;

-- 2.2 ORDER BY 

-- Task-Select all ablums table and sort result set in desceding order. 
select * from "Album" order by "Album"."Title" desc;
--Task-Select firstname from customer and sort result set in ascending order. 
select "FirstName" from "Customer" order by "CustomerId" asc;

--2.3 INSERT INTO 

--Task-Insert two new records into Genre table
 insert into "Genre" ("GenreId","Name") values(26,'BIG BASE BOOM');
insert into "Genre" ("GenreId","Name") values(27,'HOT SEX IN A FISH BOWL');
--Task-Insert two new records into Employee table.
INSERT INTO "Employee" ("EmployeeId", "LastName", "FirstName", "Title", "BirthDate", "HireDate", "Address", "City", "State", "Country", "PostalCode", "Phone", "Fax", "Email") 
VALUES (9, N'DoePuddy', N'Bobby', N'Worker', '1962/2/18', '2002/8/14', N'120 asper Ave NW', N'Edison', N'AB', N'New Mexico', N'T5K 2N1', N'+1 (718) 328-9000', N'+1 (718) 428-3457', N'getdoe@chinookcorp.com');
INSERT INTO "Employee" ("EmployeeId", "LastName", "FirstName", "Title", "BirthDate", "HireDate", "Address", "City", "State", "Country", "PostalCode", "Phone", "Fax", "Email") 
VALUES (10, N'Purdookie', N'Arnold', N'Worker', '1962/2/18', '2002/8/14', N'800 Napster Ave NW', N'Gibon', N'Blkn', N'North Hampshire', N'21567', N'+1 (718) 300-1220', N'+1 (718) 428-3457', N'jimbrownski@chinookcorp.com');

-- Task-Insert two new records in Customer table. 
INSERT INTO "Customer" ("CustomerId", "FirstName", "LastName", "Address", "City", "State", "Country", "PostalCode", "Phone", "Email", "SupportRepId") 
VALUES (60, N'Mary', N'Mancini', N'Via Vobaboo st, 87', N'Caplain', N'New-Jersey', N'America', N'56001', N'+221 665 6694', N'vobadoo.mancini@yahoo.it', 7);
INSERT INTO "Customer" ("CustomerId", "FirstName", "LastName", "Address", "City", "State", "Country", "PostalCode", "Phone", "Email", "SupportRepId") 
VALUES (61, N'Mia', N'Mancini', N'Via Vobaboo st, 87', N'Caplain', N'New-Jersey', N'America', N'56001', N'+221 666 6666', N'miavobadoo.mancini@yahoo.it', 1);

--2.4 UPDATE 

--Task-Update Aaron Mitchel in Customer table to Robert Walter 
update "Customer" set "LastName" = 'Walter', "FirstName" = 'Robert' where "CustomerId" = 32;

--Task Update name of artist "Creedence Clearwater Revival to CCR"
update "Artist" set "Name" = "CCR" where "ArtistId" = 76;

--2.5 LIKE

--Task-Select all invoices with a billing address like "T"
select * from "Invoice" i
where "BillingAddress" like '%T%';
	
commit;
