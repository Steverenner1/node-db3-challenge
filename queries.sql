-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
select c.CategoryName as Category, p.ProductName as Product
from [Product] as p
join Category as c on p.CategoryID = c.Id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
select [Order].Id as OrderId, Shipper.CompanyName from [Order]
join Shipper on [Order].ShipVia = Shipper.Id
where ShippedDate < '2012-08-09';

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
select p.ProductName as Product, q.Quantity as OrderDetail
from [OrderDetail] as q
join Product as p on q.ProductID = p.Id
where OrderID = "10251"
order by ProductName;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
select [Order].Id, [Customer].CompanyName, [Employee].LastName
from [Order]
join [Customer], [Employee]
where [Order].CustomerId = [Customer].Id AND [Order].EmployeeId = [Employee].Id;