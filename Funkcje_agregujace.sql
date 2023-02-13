Zad.1 
Ile zamówień zrealizowali poszczególni przewoźnicy i ile łącznie za nie dostali w roku 1997.
Wyświetl trzy kolumny: identyfikator przewoźnika (ShipVia), liczba zamówień, łączny koszt przewozu (Freight)

select shipvia as 'liczba zamowien', count(orderid) as 'ilość', sum(freight) as 'koszt'
from orders
where year(shippeddate) = 1997 and shippeddate is not null
group by shipvia

Zad.2 
Jaki jest średni czas (w dniach) realizacji zamówienia (od złożenia do wysłania) przez poszczególnych pracowników.
Wyświetl dwie kolumny: identyfikator pracownika, średni czas dostawy.
Średnia powinna być przedstawiona jako ułamek (liczba z przecinkiem).

select EmployeeID as 'identyfikator', avg(Cast(ShippedDate - OrderDate as float)) as 'średnia dni'
from orders
where ShippedDate is not null
group by EmployeeID

Zad.3 
Pokaż pracowników, którzy w pierwszej połowie 1997 roku przyjęli więcej niż 15 zamówień
Wyświetl dwie kolumny: identyfikator pracownika, liczba zamówień

SELECT EmployeeID as 'identyfikator', count(ORDERID) AS 'ilosc' 
FROM Orders 
WHERE YEAR(shippeddate) = 1997 and shippeddate is not null and MONTH(shippeddate)<= 6 
GROUP BY EmployeeID
HAVING COUNT(orderid) > 15