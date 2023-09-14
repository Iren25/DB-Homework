1. Вывести название и стоимость в USD одного самого дорогого проданного товара

SELECT ProductName, MAX(Price) as MaxPrice
FROM Products

2. Вывести два самых дорогих товара из категории Beverages из USA

SELECT * FROM [Products]

JOIN Categories ON Products.CategoryID = Products.CategoryID
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID

WHERE Categories.CategoryName = 'Beverages' AND Suppliers.Country ='USA'

ORDER BY Price DESC
LIMIT 2

3. Удалить товары с ценой менее 5 EUR

DELETE Products 
WHERE Price < 5

4. Вывести список стран, которые поставляют морепродукты

SELECT DISTINCT Suppliers.Country
FROM Products
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE Products.CategoryID = (SELECT CategoryID FROM Categories WHERE CategoryName = 'Seafood');

5. Очистить поле ContactName у всех клиентов не из China

UPDATE Customers
SET ContactName = ''
WHERE Country != 'China';