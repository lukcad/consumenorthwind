/* checksum : 3094b8db1500bda131177c8f24cfa399 */
@cds.external : true
@cds.persistence.skip : true
entity NorthwindModel.Category_Sales_for_1997 {
  key CategoryName : String(15) not null;
  CategorySales : Decimal(19, 4);
};

@cds.external : true
@cds.persistence.skip : true
entity NorthwindModel.Product_Sales_for_1997 {
  key CategoryName : String(15) not null;
  key ProductName : String(40) not null;
  ProductSales : Decimal(19, 4);
};

@cds.external : true
service Northwind {};

@cds.external : true
@cds.persistence.skip : true
entity Northwind.Categories {
  key CategoryID : Integer not null;
  CategoryName : String(15) not null;
  Description : LargeString;
  Picture : LargeBinary;
  @cds.ambiguous : 'missing on condition?'
  Products : Association to many Northwind.Products {  };
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind.CustomerDemographics {
  key CustomerTypeID : String(10) not null;
  CustomerDesc : LargeString;
  @cds.ambiguous : 'missing on condition?'
  Customers : Association to many Northwind.Customers {  };
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind.Customers {
  key CustomerID : String(5) not null;
  CompanyName : String(40) not null;
  ContactName : String(30);
  ContactTitle : String(30);
  Address : String(60);
  City : String(15);
  Region : String(15);
  PostalCode : String(10);
  Country : String(15);
  Phone : String(24);
  Fax : String(24);
  @cds.ambiguous : 'missing on condition?'
  Orders : Association to many Northwind.Orders {  };
  @cds.ambiguous : 'missing on condition?'
  CustomerDemographics : Association to many Northwind.CustomerDemographics {  };
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind.Employees {
  key EmployeeID : Integer not null;
  LastName : String(20) not null;
  FirstName : String(10) not null;
  Title : String(30);
  TitleOfCourtesy : String(25);
  @odata.Precision : 0
  @odata.Type : 'Edm.DateTimeOffset'
  BirthDate : DateTime;
  @odata.Precision : 0
  @odata.Type : 'Edm.DateTimeOffset'
  HireDate : DateTime;
  Address : String(60);
  City : String(15);
  Region : String(15);
  PostalCode : String(10);
  Country : String(15);
  HomePhone : String(24);
  Extension : String(4);
  Photo : LargeBinary;
  Notes : LargeString;
  ReportsTo : Integer;
  PhotoPath : String(255);
  @cds.ambiguous : 'missing on condition?'
  Employees1 : Association to many Northwind.Employees {  };
  @cds.ambiguous : 'missing on condition?'
  Employee1 : Association to one Northwind.Employees on Employee1.EmployeeID = ReportsTo;
  @cds.ambiguous : 'missing on condition?'
  Orders : Association to many Northwind.Orders {  };
  @cds.ambiguous : 'missing on condition?'
  Territories : Association to many Northwind.Territories {  };
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind.Order_Details {
  key OrderID : Integer not null;
  key ProductID : Integer not null;
  UnitPrice : Decimal(19, 4) not null;
  Quantity : Integer not null;
  @odata.Type : 'Edm.Single'
  Discount : Double not null;
  @cds.ambiguous : 'missing on condition?'
  Order : Association to one Northwind.Orders on Order.OrderID = OrderID;
  @cds.ambiguous : 'missing on condition?'
  Product : Association to one Northwind.Products on Product.ProductID = ProductID;
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind.Orders {
  key OrderID : Integer not null;
  CustomerID : String(5);
  EmployeeID : Integer;
  @odata.Precision : 0
  @odata.Type : 'Edm.DateTimeOffset'
  OrderDate : DateTime;
  @odata.Precision : 0
  @odata.Type : 'Edm.DateTimeOffset'
  RequiredDate : DateTime;
  @odata.Precision : 0
  @odata.Type : 'Edm.DateTimeOffset'
  ShippedDate : DateTime;
  ShipVia : Integer;
  Freight : Decimal(19, 4);
  ShipName : String(40);
  ShipAddress : String(60);
  ShipCity : String(15);
  ShipRegion : String(15);
  ShipPostalCode : String(10);
  ShipCountry : String(15);
  @cds.ambiguous : 'missing on condition?'
  Customer : Association to one Northwind.Customers on Customer.CustomerID = CustomerID;
  @cds.ambiguous : 'missing on condition?'
  Employee : Association to one Northwind.Employees on Employee.EmployeeID = EmployeeID;
  @cds.ambiguous : 'missing on condition?'
  Order_Details : Association to many Northwind.Order_Details {  };
  @cds.ambiguous : 'missing on condition?'
  Shipper : Association to one Northwind.Shippers on Shipper.ShipperID = ShipVia;
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind.Products {
  key ProductID : Integer not null;
  ProductName : String(40) not null;
  SupplierID : Integer;
  CategoryID : Integer;
  QuantityPerUnit : String(20);
  UnitPrice : Decimal(19, 4);
  UnitsInStock : Integer;
  UnitsOnOrder : Integer;
  ReorderLevel : Integer;
  Discontinued : Boolean not null;
  @cds.ambiguous : 'missing on condition?'
  Category : Association to one Northwind.Categories on Category.CategoryID = CategoryID;
  @cds.ambiguous : 'missing on condition?'
  Order_Details : Association to many Northwind.Order_Details {  };
  @cds.ambiguous : 'missing on condition?'
  Supplier : Association to one Northwind.Suppliers on Supplier.SupplierID = SupplierID;
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind.Regions {
  key RegionID : Integer not null;
  RegionDescription : String(50) not null;
  @cds.ambiguous : 'missing on condition?'
  Territories : Association to many Northwind.Territories {  };
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind.Shippers {
  key ShipperID : Integer not null;
  CompanyName : String(40) not null;
  Phone : String(24);
  @cds.ambiguous : 'missing on condition?'
  Orders : Association to many Northwind.Orders {  };
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind.Suppliers {
  key SupplierID : Integer not null;
  CompanyName : String(40) not null;
  ContactName : String(30);
  ContactTitle : String(30);
  Address : String(60);
  City : String(15);
  Region : String(15);
  PostalCode : String(10);
  Country : String(15);
  Phone : String(24);
  Fax : String(24);
  HomePage : LargeString;
  @cds.ambiguous : 'missing on condition?'
  Products : Association to many Northwind.Products {  };
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind.Territories {
  key TerritoryID : String(20) not null;
  TerritoryDescription : String(50) not null;
  RegionID : Integer not null;
  @cds.ambiguous : 'missing on condition?'
  Region : Association to one Northwind.Regions on Region.RegionID = RegionID;
  @cds.ambiguous : 'missing on condition?'
  Employees : Association to many Northwind.Employees {  };
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind.Alphabetical_list_of_products {
  key ProductID : Integer not null;
  key ProductName : String(40) not null;
  SupplierID : Integer;
  CategoryID : Integer;
  QuantityPerUnit : String(20);
  UnitPrice : Decimal(19, 4);
  UnitsInStock : Integer;
  UnitsOnOrder : Integer;
  ReorderLevel : Integer;
  key Discontinued : Boolean not null;
  key CategoryName : String(15) not null;
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind.Category_Sales_for_1997 {
  key CategoryName : String(15) not null;
  CategorySales : Decimal(19, 4);
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind.Current_Product_Lists {
  key ProductID : Integer not null;
  key ProductName : String(40) not null;
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind.Customer_and_Suppliers_by_Cities {
  City : String(15);
  key CompanyName : String(40) not null;
  ContactName : String(30);
  key Relationship : String(9) not null;
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind.Invoices {
  ShipName : String(40);
  ShipAddress : String(60);
  ShipCity : String(15);
  ShipRegion : String(15);
  ShipPostalCode : String(10);
  ShipCountry : String(15);
  CustomerID : String(5);
  key CustomerName : String(40) not null;
  Address : String(60);
  City : String(15);
  Region : String(15);
  PostalCode : String(10);
  Country : String(15);
  key Salesperson : String(31) not null;
  key OrderID : Integer not null;
  @odata.Precision : 0
  @odata.Type : 'Edm.DateTimeOffset'
  OrderDate : DateTime;
  @odata.Precision : 0
  @odata.Type : 'Edm.DateTimeOffset'
  RequiredDate : DateTime;
  @odata.Precision : 0
  @odata.Type : 'Edm.DateTimeOffset'
  ShippedDate : DateTime;
  key ShipperName : String(40) not null;
  key ProductID : Integer not null;
  key ProductName : String(40) not null;
  key UnitPrice : Decimal(19, 4) not null;
  key Quantity : Integer not null;
  @odata.Type : 'Edm.Single'
  key Discount : Double not null;
  ExtendedPrice : Decimal(19, 4);
  Freight : Decimal(19, 4);
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind.Order_Details_Extendeds {
  key OrderID : Integer not null;
  key ProductID : Integer not null;
  key ProductName : String(40) not null;
  key UnitPrice : Decimal(19, 4) not null;
  key Quantity : Integer not null;
  @odata.Type : 'Edm.Single'
  key Discount : Double not null;
  ExtendedPrice : Decimal(19, 4);
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind.Order_Subtotals {
  key OrderID : Integer not null;
  Subtotal : Decimal(19, 4);
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind.Orders_Qries {
  key OrderID : Integer not null;
  CustomerID : String(5);
  EmployeeID : Integer;
  @odata.Precision : 0
  @odata.Type : 'Edm.DateTimeOffset'
  OrderDate : DateTime;
  @odata.Precision : 0
  @odata.Type : 'Edm.DateTimeOffset'
  RequiredDate : DateTime;
  @odata.Precision : 0
  @odata.Type : 'Edm.DateTimeOffset'
  ShippedDate : DateTime;
  ShipVia : Integer;
  Freight : Decimal(19, 4);
  ShipName : String(40);
  ShipAddress : String(60);
  ShipCity : String(15);
  ShipRegion : String(15);
  ShipPostalCode : String(10);
  ShipCountry : String(15);
  key CompanyName : String(40) not null;
  Address : String(60);
  City : String(15);
  Region : String(15);
  PostalCode : String(10);
  Country : String(15);
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind.Product_Sales_for_1997 {
  key CategoryName : String(15) not null;
  key ProductName : String(40) not null;
  ProductSales : Decimal(19, 4);
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind.Products_Above_Average_Prices {
  key ProductName : String(40) not null;
  UnitPrice : Decimal(19, 4);
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind.Products_by_Categories {
  key CategoryName : String(15) not null;
  key ProductName : String(40) not null;
  QuantityPerUnit : String(20);
  UnitsInStock : Integer;
  key Discontinued : Boolean not null;
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind.Sales_by_Categories {
  key CategoryID : Integer not null;
  key CategoryName : String(15) not null;
  key ProductName : String(40) not null;
  ProductSales : Decimal(19, 4);
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind.Sales_Totals_by_Amounts {
  SaleAmount : Decimal(19, 4);
  key OrderID : Integer not null;
  key CompanyName : String(40) not null;
  @odata.Precision : 0
  @odata.Type : 'Edm.DateTimeOffset'
  ShippedDate : DateTime;
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind.Summary_of_Sales_by_Quarters {
  @odata.Precision : 0
  @odata.Type : 'Edm.DateTimeOffset'
  ShippedDate : DateTime;
  key OrderID : Integer not null;
  Subtotal : Decimal(19, 4);
};

@cds.external : true
@cds.persistence.skip : true
entity Northwind.Summary_of_Sales_by_Years {
  @odata.Precision : 0
  @odata.Type : 'Edm.DateTimeOffset'
  ShippedDate : DateTime;
  key OrderID : Integer not null;
  Subtotal : Decimal(19, 4);
};

