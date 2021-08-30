
--task1  (lesson4)
-- Компьютерная фирма: Сделать view (название all_products_flag_300) для всех товаров (pc, printer, laptop) с флагом, если стоимость больше > 300. Во view три колонки: model, price, flag

create or replace view  all_products_flag_300 as 
select model,price,flag from(select * ,
case when price > 300 then 1
else 0
end flag from (
select distinct model  ,price from printer
union all 
select distinct model ,price from pc 
union all
select distinct model ,price from laptop  ) d ) s

select * from  all_products_flag_300
--task2  (lesson4)
-- Компьютерная фирма: Сделать view (название all_products_flag_avg_price) для всех товаров (pc, printer, laptop) с флагом, если стоимость больше cредней . Во view три колонки: model, price, flag
create or replace view  all_products_flag_avg_price as 
select model,price,flag from(select * ,
case when price > (select avg(price) from laptop  ) and price 
then 1
else 0
end flag from (
select distinct model  ,price from printer
union all 
select distinct model ,price from pc 
union all
select distinct model ,price from laptop  ) d ) s

select * from  all_products_flag_avg_price

select avg(price) from pc
--task3  (lesson4)
-- Компьютерная фирма: Вывести все принтеры производителя = 'A' со стоимостью выше средней по принтерам производителя = 'D' и 'C'. Вывести model
select p.*,pr.maker from printer as p join product as pr using(model) where price >(
select avg(price ) from printer as p 
join product as pr using(model)
where maker ='D'or maker ='C') and maker ='A'

--task4 (lesson4)
-- Компьютерная фирма: Вывести все товары производителя = 'A' со стоимостью выше средней по принтерам производителя = 'D' и 'C'. Вывести model
select model from (
select distinct model  ,price from printer
union all 
select distinct model ,price from pc 
union all
select distinct model ,price from laptop) j
join product as pr using(model)

where price >(
select avg(price ) from printer as p 
join product as pr using(model)
where maker ='D'or maker ='C') and maker ='A'


-- Компьютерная фирма: Какая средняя цена среди уникальных продуктов производителя = 'A' (printer & laptop & pc)
select avg(price) from 
 (select distinct model  ,price from printer
union all 
select distinct model ,price from pc 
union all
select distinct model ,price from laptop 
) g
where model in (select model from product where maker='A')


--task6 (lesson4)
-- Компьютерная фирма: Сделать view с количеством товаров (название count_products_by_makers) по каждому производителю. Во view: maker, count
create or replace view count_products_by_makers as 
select count(*),maker from product
group by maker

select * from count_products_by_makers
--task7 (lesson4)
-- По предыдущему view (count_products_by_makers) сделать график в colab (X: maker, y: count)

--task8 (lesson4)
-- Компьютерная фирма: Сделать копию таблицы printer (название printer_updated) и удалить из нее все принтеры производителя 'D'
create table printer_updated as 
select * from printer where model in 
					 (select model from product where maker !='D' )

select * from printer_updated


--task9 (lesson4)
-- Компьютерная фирма: Сделать на базе таблицы (printer_updated) view с дополнительной колонкой производителя (название printer_updated_with_makers)
create view printer_updated_with_makers as 
select p.*,pr.maker from printer_updated as p 
left join product as pr using(model)

select * from printer_updated_with_makers

--task10 (lesson4)
-- Корабли: Сделать view c количеством потопленных кораблей и классом корабля (название sunk_ships_by_classes). Во view: count, class (если значения класса нет/IS NULL, то заменить на 0)

create table sunk_ships_by_classes_nul as 
 select count(*) , class from ships s
full join  outcomes as o on s.name=o.ship
where result ='sunk'

group by class 
update sunk_ships_by_classes_nul set class = 0 where class is null

create or replace view sunk_ships_by_classes as select * from sunk_ships_by_classes_nul

select * from sunk_ships_by_classes

--task11 (lesson4)
-- Корабли: По предыдущему view (sunk_ships_by_classes) сделать график в colab (X: class, Y: count)

--task12 (lesson4)
-- Корабли: Сделать копию таблицы classes (название classes_with_flag) и добавить в нее flag: если количество орудий больше или равно 9 - то 1, иначе 0
create table classes_with_flag as 
select *,case when numGuns >=9 then 1
else 0 
end flag
from classes

select * from classes_with_flag
--task13 (lesson4)
-- Корабли: Сделать график в colab по таблице classes с количеством классов по странам (X: country, Y: count)

--task14 (lesson4)
-- Корабли: Вернуть количество кораблей, у которых название начинается с буквы "O" или "M".
select count(distinct name)
from ships 
where name like 'O%'or name like 'M%'
--task15 (lesson4)
-- Корабли: Вернуть количество кораблей, у которых название состоит из двух слов.
select count(distinct name)
from ships 
where name like '% %'
--task16 (lesson4)
-- Корабли: Построить график с количеством запущенных на воду кораблей и годом запуска (X: year, Y: count)
