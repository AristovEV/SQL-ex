--Задание 1: Вывести name, class по кораблям, выпущенным после 1920
select name,class
from ships
where launched > '1920';
--Задание 2: Вывести name, class по кораблям, выпущенным после 1920, но не позднее 1942
select name,class
from ships
where launched between '1921' and '1942';
--Задание 3: Какое количество кораблей в каждом классе. Вывести количество и class
select count(*),class
from ships
group by class;
--Задание 4: Для классов кораблей, калибр орудий которых не менее 16, укажите класс и страну. (таблица classes)
select class,country
from classes 
where bore >= 16;
--Задание 5: Укажите корабли, потопленные в сражениях в Северной Атлантике (таблица Outcomes, North Atlantic). Вывод: ship.
select ship 
from Outcomes
where result = 'sunk';
--Задание 6: Вывести название (ship) последнего потопленного корабля
select ship
from outcomes as o
full join battles as b on o.battle=b.name
where result = 'sunk'
order by date desc
limit 1;



--Задание 7: Вывести название корабля (ship) и класс (class) последнего потопленного корабля
select ship,class
from outcomes as o

left join ships as s on o.ship = s.name
 
where result = 'sunk' and battle in (select name  from battles order by date desc )

limit 1;
--Задание 8: Вывести все потопленные корабли, у которых калибр орудий не менее 16, и которые потоплены. Вывод: ship, class
with 
o as (select * from outcomes),
s as (select * from ships),
c as (select * from classes)
select ship,c.class from o
full outer join s on o.ship=s.name
full outer join c on s.class=c.class
where result = 'sunk' and bore>=16
--Задание 9: Вывести все классы кораблей, выпущенные США (таблица classes, country = 'USA'). Вывод: class
select class 
from classes 
where country = 'USA'
--Задание 10: Вывести все корабли, выпущенные США (таблица classes & ships, country = 'USA'). Вывод: name, class
select name,class 
from ships 
where class in (select class from classes 
			where country = 'USA')