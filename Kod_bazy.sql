Create Database Wypożyczalnia

use Wypożyczalnia

create table Klienci (
			ID_Klienta smallint primary key not null,
			Imię varchar(30),
			Nazwisko varchar(30) not null,
			Miejscowość int not null,
			Adres varchar(30) not null,
						)
						

ALTER TABLE Klienci ALTER COLUMN Miejscowość VARCHAR(40)

insert into Klienci values
('3', 'Przemysław', 'Nowak', 'Katowice', 'ul. Adama Mickiewicza 3'),
('5', 'Dawid', 'Jabłoński', 'Kraków', 'ul. Focha 8'),
('1', 'Bartek', 'Wierzbicki', 'Częstochowa', 'ul. Armii Krajowej 43'),
('6', 'Marek', 'Chrzanowski', 'Katowice', 'ul. Bogucicka 33'),
('4', 'Edyta', 'Giermala', 'Warszawa', 'ul. Henryka Sienkiewicza 13'),
('2', 'Szymon', 'Wawryło', 'Gdańsk', 'ul. Spacerowa 4')

select * from Klienci

create table Samochody (

			ID_Samochodu int primary key not null,
			Marka_i_model varchar(30) not null,
			Moc int not null,
			Kolor varchar(30) not null,
			Rodzaj_paliwa varchar(20)
						)

ALTER TABLE Samochody ALTER COLUMN Moc VARCHAR(20)


insert into Samochody values
('153', 'Audi A4', '190 KM', 'Zielony', 'benzyna'),
('124', 'Mercedes E Klasa', '220 KM', 'Czarny', 'diesel'),
('174', 'Volvo XC60', '230 KM', 'Biały', 'benzyna'),
('127', 'Bmw seria 5', '310 KM', 'Niebieski', 'diesel'),
('143', 'Audi A5', '250 KM', 'Granatowy', 'benzyna'),
('185', 'Opel Insignia', '160 KM', 'Błękitny', 'benzyna')


select * from Samochody

create table Wypożyczenia
					(
        ID_Wypożyczenia int not null primary key, 
        ID_Klienta smallint foreign key references Klienci(ID_Klienta), 
		ID_Samochodu int foreign key references Samochody(ID_Samochodu), 
        Data_wypożyczenia datetime check (Data_wypożyczenia >= '2021-01-15'), 
		Data_zwrotu datetime check (Data_zwrotu >= '2021-01-16'),
		constraint warunek check (datediff(dd,Data_wypożyczenia, Data_zwrotu ) >= 0),

					)

insert into Wypożyczenia values
('13', '3', '124', '2021-01-18 16:00:00:000', '2021-01-22 16:00:00:000'),
('15', '5', '185', '2021-01-20 14:00:00:000', '2021-01-21 18:00:00:000'),
('16', '6', '174', '2021-02-05 20:00:00:000', '2021-02-10 20:00:00:000'),
('14', '2', '153', '2021-02-20 14:30:00:000', '2021-02-28 14:30:00:000'),
('11', '4', '127', '2021-03-17 17:00:00:000', '2021-03-20 18:00:00:000'),
('12', '1', '143', '2021-04-15 15:45:00:000', '2021-05-01 15:45:00:000')

select * from Klienci K join Wypożyczenia W on K.ID_Klienta=W.ID_Klienta
join Samochody S on W.ID_Samochodu=S.ID_Samochodu

select CONCAT(Imię, ' ', Nazwisko) as 'Imię i nazwisko' from Klienci
order by 1 desc


SELECT Marka_i_model, Kolor INTO Auta_i_kolory FROM Samochody

select * from Auta_i_kolory

update Samochody set Marka_i_model = 'Ford Mustang', Kolor = 'Żółty' WHERE ID_Samochodu = 174
update Klienci set Imię = 'Bartosz' WHERE ID_Klienta = 1

select * from Samochody
select * from Klienci

delete from Klienci WHERE Imię = 'Tadeusz'

drop table Wypożyczenia

drop Database Wypożyczalnia