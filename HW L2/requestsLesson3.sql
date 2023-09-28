1. Вывести ко-во поставщиков не из UK и не из China

SELECT
	COUNT(*) AS total_not_uk_china_suppliers
FROM Suppliers
WHERE
	NOT Country IN ('UK', 'China')

2. Вывести среднюю/MAX/MIN стоимости и ко-во товаров из категорий 3 и 5

SELECT
	AVG(Price) AS avg_price,
	MAX(Price) AS max_price, 
	MIN(Price) AS min_price,
	COUNT(*) AS total_products
FROM Products
WHERE
    CategoryID in (3, 5)

3. Вывести общую сумму проданных товаров

SELECT
	SUM(Products.Price * OrderDetails.Quantity) AS order_cost
FROM OrderDetails
    JOIN Products ON OrderDetails.ProductID=Products.ProductID

4. Вывести ко-во стран, которые поставляют напитки

SELECT 
    COUNT(DISTINCT Suppliers.Country) AS total_of_countries
FROM Suppliers
WHERE 
Suppliers.SupplierID IN (
    SELECT DISTINCT Products.SupplierID
FROM Products
    WHERE Products.CategoryID = '1'
)

5. Вывести сумму, на которую было отправлено товаров клиентам в Germany

SELECT
	SUM(Products.Price * OrderDetails.Quantity) AS order_cost
FROM OrderDetails
    JOIN Orders ON OrderDetails.OrderID=Orders.OrderID
    JOIN Products ON OrderDetails.ProductID=Products.ProductID
    JOIN Customers ON Orders.CustomerID=Customers.CustomerID
WHERE Customers.Country = 'Germany'