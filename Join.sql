Zad. 1. 
Podaj klientów (z nazwy), którzy w 1996 roku złożyli przynajmniej 3 zamówienia na produkty w butelkach.
Wyświetl nazwy kolumn w kolejności: KLIENT, LICZBA_ZAM, 
uporządkowane od największej liczby zamówień, a następnie alfabetycznie po nazwie klienta.

select C.CompanyName as 'KLIENT', count(O.OrderID) as 'LICZBA_ZAM' from Customers C
join Orders O on C.customerID=O.CustomerID
join [Order Details] OD on O.OrderID=OD.OrderID
join Products P on OD.ProductID=P.ProductID
where QuantityPerUnit LIKE '%bot%' and YEAR(O.OrderDate) = 1996
group by C.CompanyName
having count(O.OrderID) >= 3
order by 2 desc, 1

Zad. 2. 
Jaka była sumaryczna wartość pozycji zamówień wg Nazwy Kategorii produktów zamówionych w drugiej połowie roku 1996.
Wyświetl nazwy  kolumn w kolejności: NAZWA_KATEGORII, WARTOSC_ZAM, 
uporządkowane od najmniejszej wartości.

SELECT C.CategoryName as 'NAZWA_KATEGORII', SUM(OD.Quantity * OD.UnitPrice) as 'WARTOSC_ZAM' from Orders O 
JOIN [Order Details] OD on O.OrderID = OD.OrderID
JOIN Products P on OD.ProductID = P.ProductID
JOIN Categories C on P.CategoryID = C.CategoryID
WHERE MONTH(O.OrderDate) >= 6 AND YEAR(O.OrderDate) = 1996
GROUP BY C.CategoryName
ORDER BY 2