INSERT INTO db_supplier (SupplierID, CompanyName, ContactLastName, ContactFirstName, Phone) 
VALUES
    ('1', 'supplier1', 'company1', 'company1', '1111111111'),
    ('2', 'supplier2', 'company2', 'company2', '2222222222'),
    ('3', 'supplier3', 'company3', 'company3', '3333333333'),
    ('4', 'supplier4', 'company4', ''        , '4444444444');

INSERT INTO db_subject (SubjectID, CategoryName)
VALUES
    ('1', 'category1'),
    ('2', 'category2'),
    ('3', 'category3'),
    ('4', 'category4'),
    ('5', 'category5');

INSERT INTO db_shipper (ShipperID, ShipperName)
VALUES
    ('1', 'shipper1'),
    ('2', 'shipper2'),
    ('3', 'shipper3'),
    ('4', 'shipper4');

INSERT INTO db_employee (EmployeeID, LastName, FirstName)
VALUES 
    ('1', 'Lastname5', 'firstname5'),
    ('2', 'Lastname6', 'firstname6'),
    ('3', 'Lastname6', 'firstname9');

INSERT INTO db_customer (CustomerID, LastName, FirstName, Phone)
VALUES 
    ('1', 'Lastname1', 'firstname1', '334-001-001'),
    ('2', 'Lastname2', 'firstname2', '334-002-002'),
    ('3', 'Lastname3', 'firstname3', '334-003-003'),
    ('4', 'Lastname4', 'firstname4', '334-004-004');

INSERT INTO db_book (BookID, Title, UnitPrice, Author, Quantity, SupplierID, SubjectID)
VALUES 
    ('1', 'book1', '12.34', 'author1', '5', '3', '1'),
    ('2', 'book2', '56.78', 'author2', '2', '3', '1'),
    ('3', 'book3', '90.12', 'author3', '10', '2', '1'),
    ('4', 'book4', '34.56', 'author4', '12', '3', '2'),
    ('5', 'book5', '78.90', 'author5', '5', '2', '2'),
    ('6', 'book6', '12.34', 'author6', '30', '1', '3'),
    ('7', 'book7', '56.90', 'author2', '17', '3', '4'),
    ('8', 'book8', '33.44', 'author7', '2', '1', '3');
 
INSERT INTO db_order (OrderID, CustomerID, EmployeeID, OrderDate, ShippedDate, ShipperID)
VALUES
    ('1', '1', '1', '2016-08-01', '2016-08-03', 1),
    ('2', '1', '2', '2016-08-04', NULL, NULL),
    ('3', '2', '1', '2016-08-01', '2016-08-04', 2),
    ('4', '4', '2', '2016-08-04', '2016-08-04', 1),
    ('5', '1', '1', '2016-08-04', '2016-08-05', 1),
    ('6', '4', '2', '2016-08-04', '2016-08-05', 1),
    ('7', '3', '1', '2016-08-04', '2016-08-04', 1);


INSERT INTO db_orderdetail (BookID, OrderID, Quantity) 
VALUES 
    ('1', '1', '2'),
    ('4', '1', '1'),
    ('6', '2', '2'),
    ('7', '2', '3'),
    ('5', '3', '1'),
    ('3', '4', '2'),
    ('4', '4', '1'),
    ('7', '4', '1'),
    ('1', '5', '1'),
    ('1', '6', '2'),
    ('1', '7', '1');