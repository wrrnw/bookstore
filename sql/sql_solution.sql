-- 1. Show the subject names of book supplied by *supplier2*.
SELECT db_subject.CategoryName FROM db_book 
JOIN db_supplier
ON db_book.SupplierID=db_supplier.SupplierID
JOIN db_subject
ON db_book.SubjectID=db_subject.SubjectID
WHERE db_supplier.CompanyName='supplier2'

-- 2. Show the name and price of the most expensive book supplied by *supplier3*.  
SELECT Title, maxPrice
FROM db_supplier
JOIN (SELECT db_book.Title, db_book.SupplierID, max(db_book.UnitPrice) maxPrice FROM db_book) maxbook
ON maxbook.SupplierID=db_supplier.SupplierID
WHERE db_supplier.CompanyName='supplier3';

-- 3. Show the unique names of all book ordered by *lastname1 firstname1*.
select distinct(Title) 
from db_book
join db_orderdetail
on db_book.BookID=db_orderdetail.BookID
join db_order
on db_orderdetail.OrderID=db_order.OrderID
join db_customer
on db_order.CustomerID=db_customer.CustomerID
where db_customer.FirstName='firstname1'
and db_customer.LastName='lastname1';

-- 4. Show the title of book which have more than 10 units in stock.
select Title from db_book where db_book.Quantity>10

-- 5. Show the total price *lastname1 firstname1* has paid for the book.
select sum(db_orderdetail.Quantity * db_book.UnitPrice) as Output
from db_book
join db_orderdetail
on db_book.BookID=db_orderdetail.BookID
join db_order
on db_order.OrderID=db_orderdetail.OrderID
join db_customer
on db_order.CustomerID=db_customer.CustomerID
where db_customer.FirstName='firstname1'
and db_customer.LastName='lastname1'

-- 6. Show the names of the db_customer who have paid less than $80 in totals.
select output.FirstName, output.LastName, output.Sums as Output
from (select db_customer.FirstName, db_customer.LastName, sum(db_book.UnitPrice*db_orderdetail.Quantity) Sums
from db_book
join db_orderdetail
on db_book.BookID=db_orderdetail.BookID
join db_order
on db_order.OrderID=db_orderdetail.OrderID
join db_customer
on db_order.CustomerID=db_customer.CustomerID
group by db_customer.FirstName, db_customer.LastName) output
where output.Sums < 80

-- 7. Show the name of book supplied by *supplier2*.
select Title
from db_book
join db_supplier
on db_book.SupplierID=db_supplier.SupplierID
where db_supplier.CompanyName='supplier2'

-- 8. Show the total price each customer paid and their names.  List the result in descending price.
select db_customer.FirstName, db_customer.LastName, sum(db_book.UnitPrice*db_orderdetail.Quantity) as Output
from db_book
join db_orderdetail
on db_book.BookID=db_orderdetail.BookID
join db_order
on db_order.OrderID=db_orderdetail.OrderID
join db_customer
on db_order.CustomerID=db_customer.CustomerID
group by db_customer.FirstName, db_customer.LastName
order by Output DESC

-- 9. Show the names of all the book shipped on 08/04/2016 and their shippers' names.
select db_book.Title, db_shipper.ShipperName
from db_book
join db_orderdetail
on db_book.BookID=db_orderdetail.BookID
join db_order
on db_order.OrderID=db_orderdetail.OrderID
join db_shipper
on db_order.ShipperID=db_shipper.ShipperID
where db_order.ShippedDate='2016-08-04'

-- 10. Show the unique names of all the book *lastname1 firstname1* and  *lastname4 firstname4* *both* ordered.
select distinct(db_book.Title)
from db_book
join db_orderdetail
on db_book.BookID=db_orderdetail.BookID
join db_order
on db_orderdetail.OrderID=db_order.OrderID
join db_customer
on db_customer.CustomerID=db_order.CustomerID
where (db_customer.FirstName='firstname1' 
and db_customer.LastName='lastname1')
or (db_customer.FirstName='firstname4' 
and db_customer.LastName='lastname4')
order by db_book.Title ASC

-- 11. Show the names of all the book *lastname6 firstname6* was responsible for.
select distinct(db_book.Title) 
from db_book
join db_orderdetail
on db_book.BookID=db_orderdetail.BookID
join db_order
on db_order.OrderID=db_orderdetail.OrderID
join db_employee
on db_employee.EmployeeID=db_order.EmployeeID
where db_employee.FirstName='firstname6'
and db_employee.LastName='lastname6'
order by db_book.Title ASC

-- 12. Show the names of all the ordered book and their total quantities.  List the result in ascending quantity.
select db_book.Title, sum(db_orderdetail.Quantity) as Output
from db_book
join db_orderdetail
on db_book.BookID=db_orderdetail.BookID
group by db_book.Title
order by Output ASC

-- 13. Show the names of the db_customer who ordered at least 2 book.
select output.FirstName, output.LastName
from (select db_customer.FirstName, db_customer.LastName, sum(db_orderdetail.Quantity) Sums
from db_book
join db_orderdetail
on db_book.BookID=db_orderdetail.BookID
join db_order
on db_orderdetail.OrderID=db_order.OrderID
join db_customer
on db_customer.CustomerID=db_order.CustomerID
group by db_customer.FirstName, db_customer.LastName) output
where output.Sums>2

-- 14. Show the name of the db_customer who have ordered at least a book in *category3* or *category4* and the book names.
select output.FirstName, output.LastName, output.Title
from (select db_customer.FirstName, db_customer.LastName, db_book.Title, sum(db_orderdetail.Quantity) Sums
from db_book
join db_orderdetail
on db_book.BookID=db_orderdetail.BookID
join db_order
on db_orderdetail.OrderID=db_order.OrderID
join db_customer
on db_customer.CustomerID=db_order.CustomerID
join db_subject
on db_book.SubjectID=db_subject.SubjectID
where db_subject.CategoryName='category3' or
db_subject.CategoryName='category4' 
group by db_subject.CategoryName) output
where output.Sums>=1

-- 15. Show the name of the customer who has ordered at least one book written by *author1*.
select output.FirstName, output.LastName
from (select db_customer.FirstName, db_customer.LastName, sum(db_orderdetail.Quantity) Sums
from db_book
join db_orderdetail
on db_book.BookID=db_orderdetail.BookID
join db_order
on db_orderdetail.OrderID=db_order.OrderID
join db_customer
on db_customer.CustomerID=db_order.CustomerID
where db_book.Author='author1'
group by  db_customer.FirstName, db_customer.LastName) output
where output.Sums>=1

-- 16. Show the name and total sale (price of db_order) of each employee.
select db_employee.FirstName, db_employee.LastName, sum(db_orderdetail.Quantity) as Output
from db_book
join db_orderdetail
on db_book.BookID=db_orderdetail.BookID
join db_order
on db_orderdetail.OrderID=db_order.OrderID
join db_employee
on db_order.EmployeeID=db_employee.EmployeeID
group by db_employee.FirstName, db_employee.LastName

-- 17. Show the book names and their respective quantities for open db_order (the db_order which have not been shipped) at midnight 08/04/2016.
select db_book.Title, sum(db_orderdetail.Quantity) as Output
from db_book
join db_orderdetail
on db_book.BookID=db_orderdetail.BookID
join db_order
on db_orderdetail.OrderID=db_order.OrderID
where db_order.ShippedDate > '2016/04/08' or
db_order.ShippedDate = '0000/00/00'
group by db_book.Title

-- 18. Show the names of db_customer who have ordered more than 1 book and the corresponding quantities.  List the result in the descending quantity.
select output.FirstName, output.LastName, output.Sums as Output
from (select db_customer.FirstName, db_customer.LastName, sum(db_orderdetail.Quantity) Sums
from db_book
join db_orderdetail
on db_book.BookID=db_orderdetail.BookID
join db_order
on db_order.OrderID=db_orderdetail.OrderID
join db_customer
on db_customer.CustomerID=db_order.CustomerID
group by db_customer.FirstName, db_customer.LastName) output
where output.Sums>1
order by output.Sums DESC

-- 19. Show the names of db_customer who have ordered more than 3 book and their respective telephone numbers.
select output.FirstName, output.LastName, output.Phone
from (select db_customer.FirstName, db_customer.LastName, db_customer.Phone, sum(db_orderdetail.Quantity) Sums
from db_book
join db_orderdetail
on db_book.BookID=db_orderdetail.BookID
join db_order
on db_order.OrderID=db_orderdetail.OrderID
join db_customer
on db_customer.CustomerID=db_order.CustomerID
order by db_customer.FirstName, db_customer.LastName) output
where output.Sums>3