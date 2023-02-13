Zad. 1
Należy wybrać produkty sprzedawane w słoikach (ang. jar), gdzie cena produktu jest w zakresie od 20 do 40, a identyfikator dostawcy to 2 lub 3, w kolejności od największego zapasu magazynowego. Wyświetl nazwy produktów oraz wszystkie szczegóły związane z podanymi warunkami..

SELECT ProductName, QuantityPerUnit, UnitPrice, SupplierID * FROM Products
WHERE QuantityPerUnit LIKE '%jar%' AND
WHERE UnitPrice BETWEEN 20 AND 40 
WHERE SupplierID in ('2', '3')
ORDER BY UnitsInStock desc

Zad. 2
Należy wybrać zamówienia, gdzie kraj dostawy to Wenezuela lub Brazylia, miasto dostawy zaczyna się na literę C lub I, zamówienie zostało dostarczone, w kolejności dostarczania zamówień. Wyświetl numery zamówień oraz wszystkie szczegóły związane z podanymi warunkami.

SELECT OrderID, ShipCountry, ShipCity, ShippedDate
FROM Orders
WHERE ShipCountry IN ('Venezuela', 'Brazil') AND (ShipCity LIKE 'C%' OR ShipCity LIKE 'I%') AND ShippedDate IS NOT NULL
ORDER BY ShippedDate DESC;
