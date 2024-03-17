using Northwind from './external/Northwind.cds';

service NorthwindSampleService {
    @readonly
    entity Categories as projection on Northwind.Categories
    {        key CategoryID, CategoryName, Description
    //, Picture     
    
    }    
;
    @readonly
    entity Products as projection on Northwind.Products
    {        key ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued     }    
;
}