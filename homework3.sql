--task13 (lesson3)
--Компьютерная фирма: Вывести список всех продуктов и производителя с указанием типа продукта (pc, printer, laptop). Вывести: model, maker, type
select model,maker,type 
from product 
--task14 (lesson3)
--Компьютерная фирма: При выводе всех значений из таблицы printer дополнительно вывести для тех, у кого цена вышей средней PC - "1", у остальных - "0"
select * ,
		case when price>(select avg(price) from pc)
			then 1
			else 0
					end
from printer
--task15 (lesson3)
--Корабли: Вывести список кораблей, у которых class отсутвует (IS NULL)
select name 
from ships 
where class is null
--task16 (lesson3)
--Корабли: Укажите сражения, которые произошли в годы, не совпадающие ни с одним из годов спуска кораблей на воду.
select name 
from battles 
where extract(year from cast(date as date ))not in(select launched
													from ships)

--task17 (lesson3)
--Корабли: Найдите сражения, в которых участвовали корабли класса Kongo из таблицы Ships.
select battle 
from outcomes 
where ship in (select name from ships 
			   where class ='Kongo')