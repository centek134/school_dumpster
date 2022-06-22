-- ============= Tworzenie tabel ===================


create table miasto_tab
(
id serial not null,
miasto varchar(50) not null,
constraint miasto_pkey primary key (id)
);
create table wersja_tab
(
 id serial not null,
 wersja varchar(30) not null,
 constraint wersja_pkey primary key (id)
);
create table platforma_tab
(
id serial not null,
platforma varchar(30) not null,
constraint platforma_pkey primary key (id)
);
create table typ_gry_tab
(
id serial not null,
typ_gry varchar(40) not null,
constraint typ_gry_pkey primary key (id)
);
create table producent_tab
(
id serial not null,
producent varchar(50) not null,
constraint producent_pkey primary key (id)
);
create table pegi_tab
(
id serial not null,
pegi varchar(10) not null,
constraint pegi_pkey primary key (id)
);
create table klient_tab
(
id serial not null,
imie varchar(40) not null,
nazwisko varchar(40) not null,
mail varchar(70) not null,
telefon integer not null,
miasto integer not null,
kod_pocztowy varchar(6) not null,
adres varchar(120) not null,
constraint klient_tab_pkey primary key (id),
constraint fk_klient_miasto_tab foreign key (miasto)
	references miasto_tab (id) match simple
);
create table gra_tab
(
id serial not null,
nazwa varchar(100) not null,
wersja integer not null,
platforma integer not null,
typ_gry integer not null,
producent integer not null,
pegi integer not null,
cena integer not null,
constraint gra_tab_pkey primary key (id),

constraint fk_gra_wersja_tab foreign key (wersja)
	references wersja_tab (id) match simple,
	
constraint fk_gra_platforma_tab foreign key (platforma)
	references platforma_tab (id) match simple,
	
constraint fk_gra_typ_gry_tab foreign key (typ_gry)
	references typ_gry_tab (id) match simple,
	
constraint fk_gra_producent_tab foreign key (producent)
	references producent_tab (id) match simple,
	
constraint fk_gra_pegi_tab foreign key (pegi)
	references pegi_tab (id) match simple
);
create table dostawa_tab
(
id serial not null,
rodzaj_dostawy varchar(50) not null,
constraint dostawa_tab_pkey primary key (id)
);
create table zamowienie_tab
(
id serial not null,
dane_klienta integer not null,
gra integer not null,
ilosc integer not null,
dostawa integer not null,
oplacone boolean not null,
znizka_procent integer not null,
data_start date not null,
data_end date,

constraint zamowienie_tab_pkey primary key (id),

constraint fk_zamowienie_klient_tab foreign key (dane_klienta)
	references klient_tab (id) match simple,
	
constraint fk_zamowienie_gra_tab foreign key (gra)
	references gra_tab (id) match simple,
	
constraint fk_zamowienie_dostawa_tab foreign key (dostawa)
	references dostawa_tab (id) match simple
);


-- ============= inserty do tabel ====================


insert into miasto_tab (miasto)
values
('Warszawa'),('Kraków'),('Lublin'),('Poznań'),('Łódź'),('Wrocław'),
('Toruń'),('Gdańsk'),('Bydgoszcz'),('Białystok'),('Szczecin'),('Rzeszów'),
('Zielona Góra'),('Elbląg'),('Kielce'),('Radom'),('Rybnik'),('Sosnowiec'),
('Gliwice'),('Nowogrodziec'),('Nowogród'),('Nowogród Bobrzański'),('Nowy Dwór Gdański'),
('Nowy Dwór Mazowiecki'),('Nowy Korczyn'),('Nowy Sącz'),('Nowy Staw'),('Nowy Targ'),
('Nowy Tomyśl'),('Nowy Wiśnicz'),('Nysa'),('Cedynia'),('Cegłów'),('Chełm'),
('Chełmek'),('Chełmno'),('Chełmża'),('ERROR'),('Chęciny'),('erROR'),('Chmielnik'),('Chocianów'),
('Chociwel'),('Chocz'),('Chodecz'),('Chodzież'),('Chojna'),('Chojnice'),
('error'),('eRRor'),('ERROR');

insert into wersja_tab (wersja)
values
('Cyfrowa'),('Pudełkowa'),('Wersja kolekcjonerska');

insert into platforma_tab (platforma)
values
('Steam'),('Epic Games'),('Origin'),('GOG'),('Battle.net'),('Uplay');

insert into typ_gry_tab (typ_gry)
values
('Zręcznościowa'),('Przygodowa'),('Fabularna'),('Strategiczna'),('Symulacyjna'),
('Akcja'),('Sportowa'),('Logiczna'),('Edukacyjna'),('Wyścigowa'),('testowy1'),('testowy2')
,('testowy3'),('testowy4'),('testowy5'),('testowy6'),('testowy7'),('testowy8')
,('testowy9');

insert into producent_tab (producent)
values
('CD Projekt RED'),('FromSoftware'),('Bethesda Softworks'),('Techland'),
('Gearbox Software'),('Blizzard Entertainment'),('Rockstar Games'),('Ubisoft'),('Electronic Arts');

insert into pegi_tab (pegi)
values
('PEGI 3'),('PEGI 7'),('PEGI 12'),('PEGI 16'),('PEGI 18');

insert into klient_tab (imie,nazwisko,mail,telefon,miasto,kod_pocztowy,adres)
values
('Tomasz','Osuch','osuchT@gmail.com',123456789,1,'00-141','Aleja Jana Pawła 2/32'),
('Gabe','Newell','gaben@gmail.com',573992834,18,'39-591','Armi Krajowej 15'),
('Robert','Makłowicz','makłowicz@gmail.com',582923112,2,'30-063','3 Maja Al. 5'),
('Jan','Kowalski','kowaljan@gmail.com',319872056,3,'52-521','Jana lisa 3/52'),
('Jacek','Skrzypek','skrzypek@wp.pl',999998997,10,'10-395','Świętego Andrzeja Boboli'),
('Jarosław','Psikuta','psikuta@onet.pl',987654321,15,'23-192','Jagodowa 72/2'),
('Stefan','Siarzewski','siara@gmail.com',666777888,16,'03-275','Stefana Banacha 2/13'),
('Nikodem','Dyzma','nikus@gmail.com',523662123,13,'22-042','Bociania 6'),
('Albert','Einstein','mckwadrat@gmail.com',723875212,19,'01-230','Parkowa 11'),
('Error','Error','Error',000000000,1,'00-000','');

insert into dostawa_tab (rodzaj_dostawy)
values
('Paczkomaty InPost'),('Wysyłka na adres mail'),
('Kurier DPD'),('Poczta Polska'),('Kurier UPS');

insert into gra_tab (nazwa,wersja,platforma,typ_gry,producent,pegi,cena)
values
('Wiedźmin 3',1,1,3,1,5,179),('Wiedźmin 3',1,2,3,1,5,169),('Wiedźmin 3',1,4,3,1,5,189),
('Wiedźmin 3',2,1,3,1,5,199),('Wiedźmin 3',2,2,3,1,5,199),('Wiedźmin 3',2,4,3,1,5,199),
('Elden ring',1,1,1,2,5,219),('Elden ring',2,1,1,2,5,249),('Elden ring',3,1,1,2,5,499),
('Fallout: New Vegas',1,1,3,3,5,25),('Fallout: New Vegas',1,4,3,3,5,19),('Fallout: New Vegas',2,1,3,3,5,59),
('Fallout: New Vegas',2,4,3,3,5,40),
('Dying light',2,1,3,4,5,79),('Dying light',2,2,3,4,5,49),('Dying light',2,4,3,4,5,60),
('Dying light 2',2,1,3,4,5,220),('Dying light 2',2,1,3,4,5,229),('Dying light 2',2,1,3,4,5,199),
('Borderlands',1,1,6,5,3,19),('Borderlands',1,2,6,5,3,25),('Borderlands',1,4,6,5,3,30),
('World of Warcraft',1,5,2,6,2,129),('World of Warcraft',2,5,2,6,2,149),
('MONOPOLY Madness',1,6,9,8,1,39),('MONOPOLY Madness',2,6,9,8,1,69),
('Grand Theft Auto V',1,1,5,7,5,149),('Grand Theft Auto V',1,2,5,7,5,120),
('Grand Theft Auto V',1,4,5,7,5,159),('Grand Theft Auto V',2,1,5,7,5,179),
('Grand Theft Auto V',2,2,5,7,5,190),('Grand Theft Auto V',2,4,5,7,5,160);

insert into zamowienie_tab 
(dane_klienta,gra,ilosc,dostawa,oplacone,znizka_procent,data_start,data_end)
values
(2,12,1,1,true,0,'2022-04-03','2022-04-06'),(3,21,2,2,true,10,'2022-04-23','2022-04-23'),
(5,4,1,3,false,0,'2022-03-21',null),(8,17,2,1,true,0,'2022-01-23','2022-01-27'),
(1,7,1,2,true,0,'2022-02-25','2022-02-25'),(8,25,3,2,true,15,'2022-04-20','2022-04-20'),
(6,9,1,4,false,5,'2022-02-26',null),(4,23,1,2,true,30,'2021-12-24','2021-12-24'),
(9,15,1,5,true,0,'2022-01-23','2022-01-27'),(7,10,2,5,false,0,'2022-01-29',null),
(2,5,1,4,true,0,'2022-01-11','2022-01-14'),(3,8,1,1,true,0,'2022-04-01','2022-04-05'),
(4,17,1,1,false,0,'2021-09-30',null),(5,27,1,2,true,0,'2021-04-11','2022-04-11'),
(9,27,1,2,true,0,'2021-06-20','2021-06-20'),(1,24,1,5,false,10,'2021-09-01',null),
(2,11,1,4,true,10,'2021-03-11','2022-03-11'),(1,22,2,2,true,0,'2022-02-21','2022-02-21'),
(6,2,1,2,false,0,'2022-02-01',null),(3,25,2,2,true,30,'2021-01-05','2021-01-05'),
(10,1,1,1,false,0,'2022-05-22',null);

-- =============== przykładowy update  ==================


update typ_gry_tab set typ_gry='Horror' where id = 10;

update gra_tab set nazwa='The Sims 4', typ_gry=5, producent=9, pegi=2,cena=60
where lower(nazwa) = 'borderlands';

-- =============== kilka delete =======================


delete from typ_gry_tab
where lower(typ_gry) like 'testowy_';

delete from miasto_tab
where lower(miasto) = 'error';

delete from klient_tab
where id = 12;

delete from zamowienie_tab
where id = 21;

-- ============ przykladowe inserty ================

insert into dostawa_tab (rodzaj_dostawy)
values
('Kurier InPost'), ('Paczkomat DPD'),('Odbiór na miejscu');

insert into producent_tab (producent)
values
('Fatshark'),('TaleWorlds'),('Nintendo');


-- ================ przykladowe selecty ===================

-- pokazuje ile dany kliet wykonał zamowien
select k.imie || ' ' || k.nazwisko "Imie i nazwisko", count(z.ilosc)
from zamowienie_tab z, klient_tab k
where k.id = z.dane_klienta
group by k.imie, k.nazwisko;

-- pokazuje ile dany klient wydal pieniedzy w sklepie
select k.imie || ' ' || k.nazwisko "Imie i nazwisko", SUM(cast(g.cena as float)*z.ilosc*(100 - z.znizka_procent)/100)
from zamowienie_tab z, klient_tab k, gra_tab g
where k.id = z.dane_klienta
and g.id = z.gra
and z.oplacone = true
group by k.imie, k.nazwisko;

/*
 *  ============== widok 1 ====================
 * najwazniejsze info, tzn dane klienta + gra jaka kupil i jej specyfikacja + ilosc + rodzaj dostawy + oplacone
 */


create or replace view widok_pierwszy as
select k.imie || ' ' || k.nazwisko "Imie i Nazwisko", k.mail "Mail", k.telefon "Telefon", m.miasto "Miasto", k.kod_pocztowy "Kod pocztowy", k.adres "Adres",
g.nazwa "Nazwa gry", w.wersja "Wersja gry", p.platforma "Platforma gry", g.cena "Cena gry", z.ilosc "Ilosc", z.oplacone "Oplacone", z.znizka_procent "Procent znizki",
cast(g.cena as float)*z.ilosc*(100 - z.znizka_procent)/100 as "Kwota ostateczna",
d.rodzaj_dostawy "Rodzaj dostawy", z.data_start "Data zlozenia", z.data_end "Data skompletowania" 
from zamowienie_tab z, klient_tab k, miasto_tab m, gra_tab g,wersja_tab w, platforma_tab p, dostawa_tab d
where k.id = z.dane_klienta
and m.id = k.miasto
and g.id = z.gra
and w.id = g.wersja
and p.id = g.platforma
and d.id = z.dostawa;

-- ================Koniec widoku 1 =============


/* 
 * =================== widok 2 ==================
 * skompletowane zamowienia
 */

create or replace view widok_drugi as
select z.id "Zamowienie id" ,z.dane_klienta "Klient id", g.nazwa "Nazwa gry",
w.wersja "Wersja gry", p.platforma "Platforma gry", g.cena "Cena gry",
z.ilosc "Ilosc", z.oplacone "Oplacone",z.data_start "Data zlozenia", z.data_end "Data skompletowania"
from gra_tab g right outer join zamowienie_tab z
on g.id = z.gra
, wersja_tab w, platforma_tab p
where w.id = g.wersja
and p.id = g.platforma
and z.oplacone = true
and z.ilosc >= 1
and z.data_end - data_start >= 0
and z.data_end is not null;

/*
 * ==================== koniec widoku 2 =========================
 */


/*
 * ==================== widok 3 ==============================
 *  nieskompletowane zamowienia
 */


create or replace view widok_trzeci as
select z.id "Zamowienie id",z.dane_klienta "Klient id", g.nazwa "Nazwa gry", w.wersja "Wersja gry",
p.platforma "Platforma gry", g.cena "Cena gry", z.ilosc "Ilosc", z.oplacone "Oplacone",
z.data_start "Data zlozenia", z.data_end "Data skompletowania"
from gra_tab g right outer join zamowienie_tab z
on g.id = z.gra
, wersja_tab w, platforma_tab p
where w.id = g.wersja
and z.ilosc >= 1
and p.id = g.platforma
and z.data_end is null;

/*
 *======================== koniec widoku 3 =========================
 */

/*
 * ======================== Widok 4 ===============================
 * calkowite zarobki
*/


create or replace view widok_czwarty as
select SUM(cast(g.cena as float)*z.ilosc*(100 - z.znizka_procent)/100) as "calkowite zarobki"
from gra_tab g, zamowienie_tab z
where g.id = z.gra 
and z.oplacone = true
and z.ilosc >= 1
and z.data_end - data_start >= 0
and z.data_end is not null;

/*
 * ==================== Koniec widoku 4 ========================
 */

-- =========== select widoków =================

select * from widok_pierwszy;
select * from widok_drugi;
select * from widok_trzeci;
select * from widok_czwarty;

-- ========== dropy widoków =============== 

drop view widok_pierwszy;
drop view widok_drugi;
drop view widok_trzeci;
drop view widok_czwarty;

-- ========== dropy tabel ===============

drop table zamowienie_tab;
drop table dostawa_tab;
drop table klient_tab;
drop table miasto_tab;
drop table gra_tab;
drop table wersja_tab;
drop table platforma_tab;
drop table typ_gry_tab;
drop table producent_tab;
drop table pegi_tab;



