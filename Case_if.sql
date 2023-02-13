Zad. 1.
Wyświetl wszystkie produkty i podaj przy nich informację czy trzeba zamówić dodatkowe produkty ze względu na braki w magazynie w stosunku do
wymaganej minimalnej liczby produktów w magazynie oraz podaj liczby tych produktów (jako wartości dodatnie).

Wyświetl  kolumny:
1) nazwa produktu
2) stan zamówienia (dwie wartości: trzeba zamówić, wystarczająca ilość),
3) liczba produktów (ile produktów brakuje, ile produktów jest w nadmiarze - jako liczby dodatnie)

Wyjaśnienie:
ReorderLevel w tabeli Products - informacja o wymaganej liczbie produktów w magazynie
UnitsInStock w tabeli Products - informacja o rzeczywistej liczbie produktów w magazynie

select ProductName as 'nazwa produktu',
case
when UnitsInStock < ReorderLevel then 'trzeba zamówić'
when UnitsinStock > ReorderLevel then 'wystarczająca ilość'
when UnitsinStock = ReorderLevel then 'wystarczająca ilość'
end as 'stan zamówienia',
case
when UnitsInStock < ReorderLevel then concat('brakuje',' ',(ReorderLevel - UnitsInStock))
when UnitsinStock > ReorderLevel then concat('jest w nadmiarze',' ',(UnitsInStock - ReorderLevel))
when UnitsinStock = ReorderLevel then concat('brakuje',' ','0')
end as 'liczba produktów'
from Products