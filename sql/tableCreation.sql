CREATE TABLE db_supplier 
(
  SupplierID       INT unsigned NOT NULL, 
  CompanyName      VARCHAR(20), 
  ContactFirstName VARCHAR(20),
  ContactLastName  VARCHAR(20), 
  PHONE            VARCHAR(20),
  PRIMARY KEY      (SupplierID)
);

CREATE TABLE db_subject 
(
  SubjectID       INT unsigned NOT NULL, 
  CategoryName    VARCHAR(20),
  PRIMARY KEY     (SubjectID)
);

CREATE TABLE db_shipper 
(
  ShipperID       INT unsigned NOT NULL,
  Shippername     VARCHAR(20),
  PRIMARY KEY     (ShipperID)
);

CREATE TABLE db_employee 
(
  EmployeeID      INT unsigned NOT NULL AUTO_INCREMENT, 
  LastName        VARCHAR(150) NOT NULL,                
  FirstName       VARCHAR(150) NOT NULL,                
  PRIMARY KEY     (EmployeeID)
);

CREATE TABLE db_customer 
(
  CustomerID      INT unsigned NOT NULL, 
  LastName        VARCHAR(150) NOT NULL,                
  FirstName       VARCHAR(150) NOT NULL,                
  Phone           VARCHAR(150) NOT NULL,                 
  PRIMARY KEY     (CustomerID)
);

CREATE TABLE db_book 
(
  BookID          INT unsigned NOT NULL, 
  Title           VARCHAR(150) NOT NULL,                
  UnitPrice       DECIMAL(10,2) NOT NULL,               
  Author          VARCHAR(150) NOT NULL,                
  Quantity        INT NOT NULL,                         
  SupplierID      INT unsigned NOT NULL,
  SubjectID       INT unsigned NOT NULL,
  PRIMARY KEY     (BookID),                             
  FOREIGN KEY     (SupplierID) REFERENCES db_supplier(SupplierID),
  FOREIGN KEY     (SubjectID) REFERENCES db_subject(SubjectID)
);

CREATE TABLE db_order 
(
  OrderID         INT unsigned NOT NULL, 
  CustomerID      INT unsigned NOT NULL,
  EmployeeID      INT unsigned NOT NULL,
  OrderDate       DATE NOT NULL,                
  ShippedDate     DATE,                         
  ShipperID       INT unsigned,
  PRIMARY KEY     (OrderID),
  FOREIGN KEY     (CustomerID) REFERENCES db_customer(CustomerID),
  FOREIGN KEY     (EmployeeID) REFERENCES db_employee(EmployeeID),
  FOREIGN KEY     (ShipperID) REFERENCES db_shipper(ShipperID)
);

CREATE TABLE db_orderdetail
(
  BookID          INT unsigned NOT NULL, 
  OrderID         INT unsigned NOT NULL,                
  Quantity        VARCHAR(150) NOT NULL,                
  PRIMARY KEY     (BookID, OrderID),
  FOREIGN KEY     (BookID) REFERENCES db_book(BookID),
  FOREIGN KEY     (OrderID) REFERENCES db_order(OrderID)
);






