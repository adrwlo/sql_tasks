Zad. 1 
Wyświetl numery pierwszych 15 zamówień, zamówionych w środę. Wyświetl jedną kolumnę: numery zamówień.

select top 15 orderId 
from orders
where DATENAME(dw, OrderDate) like 'Wednesday'

Zad. 2 
Podaj ile lat mieli pracownicy w chwili zatrudnienia. Pracowników wyświetl w kolejności najwcześniej zatrudnionych. Wyświetl cztery kolumny: identyfikator pracownika, rok urodzenia, rok zatrudnienia, wiek w chwili zatrudnienia.

select EmployeeId, BirthDate, HireDate, DATEDIFF(yy, BirthDate, HireDate) as 'wiekzatrudnienia' 
from employees
order by 3