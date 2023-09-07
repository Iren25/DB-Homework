1. Вывести название и стоимость товаров от 20 EUR.

SELECT ProductName, Price
FROM [Products]
WHERE  Price >= 20

2. Вывести страны поставщиков.

SELECT Country FROM [Suppliers]

3. В упорядоченном по стоимости виде вывести название 
и стоимость товаров от всех поставщиков, кроме поставщика 1.

SELECT ProductName, Price 
FROM [Products]
WHERE NOT SupplierID = 1
ORDER BY Price ASC

4. Вывести контактные имена клиентов, кроме тех, что из France и USA.

SELECT ContactName
FROM [Customers]
WHERE
NOT Country IN ('France', 'USA')