
--task1  (lesson4)
-- ������������ �����: ������� view (�������� all_products_flag_300) ��� ���� ������� (pc, printer, laptop) � ������, ���� ��������� ������ > 300. �� view ��� �������: model, price, flag

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
-- ������������ �����: ������� view (�������� all_products_flag_avg_price) ��� ���� ������� (pc, printer, laptop) � ������, ���� ��������� ������ c������ . �� view ��� �������: model, price, flag
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
-- ������������ �����: ������� ��� �������� ������������� = 'A' �� ���������� ���� ������� �� ��������� ������������� = 'D' � 'C'. ������� model
select p.*,pr.maker from printer as p join product as pr using(model) where price >(
select avg(price ) from printer as p 
join product as pr using(model)
where maker ='D'or maker ='C') and maker ='A'

--task4 (lesson4)
-- ������������ �����: ������� ��� ������ ������������� = 'A' �� ���������� ���� ������� �� ��������� ������������� = 'D' � 'C'. ������� model
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


-- ������������ �����: ����� ������� ���� ����� ���������� ��������� ������������� = 'A' (printer & laptop & pc)
select avg(price) from 
 (select distinct model  ,price from printer
union all 
select distinct model ,price from pc 
union all
select distinct model ,price from laptop 
) g
where model in (select model from product where maker='A')


--task6 (lesson4)
-- ������������ �����: ������� view � ����������� ������� (�������� count_products_by_makers) �� ������� �������������. �� view: maker, count
create or replace view count_products_by_makers as 
select count(*),maker from product
group by maker

select * from count_products_by_makers
--task7 (lesson4)
-- �� ����������� view (count_products_by_makers) ������� ������ � colab (X: maker, y: count)

--task8 (lesson4)
-- ������������ �����: ������� ����� ������� printer (�������� printer_updated) � ������� �� ��� ��� �������� ������������� 'D'
create table printer_updated as 
select * from printer where model in 
					 (select model from product where maker !='D' )

select * from printer_updated


--task9 (lesson4)
-- ������������ �����: ������� �� ���� ������� (printer_updated) view � �������������� �������� ������������� (�������� printer_updated_with_makers)
create view printer_updated_with_makers as 
select p.*,pr.maker from printer_updated as p 
left join product as pr using(model)

select * from printer_updated_with_makers

--task10 (lesson4)
-- �������: ������� view c ����������� ����������� �������� � ������� ������� (�������� sunk_ships_by_classes). �� view: count, class (���� �������� ������ ���/IS NULL, �� �������� �� 0)

create table sunk_ships_by_classes_nul as 
 select count(*) , class from ships s
full join  outcomes as o on s.name=o.ship
where result ='sunk'

group by class 
update sunk_ships_by_classes_nul set class = 0 where class is null

create or replace view sunk_ships_by_classes as select * from sunk_ships_by_classes_nul

select * from sunk_ships_by_classes

--task11 (lesson4)
-- �������: �� ����������� view (sunk_ships_by_classes) ������� ������ � colab (X: class, Y: count)

--task12 (lesson4)
-- �������: ������� ����� ������� classes (�������� classes_with_flag) � �������� � ��� flag: ���� ���������� ������ ������ ��� ����� 9 - �� 1, ����� 0
create table classes_with_flag as 
select *,case when numGuns >=9 then 1
else 0 
end flag
from classes

select * from classes_with_flag
--task13 (lesson4)
-- �������: ������� ������ � colab �� ������� classes � ����������� ������� �� ������� (X: country, Y: count)

--task14 (lesson4)
-- �������: ������� ���������� ��������, � ������� �������� ���������� � ����� "O" ��� "M".
select count(distinct name)
from ships 
where name like 'O%'or name like 'M%'
--task15 (lesson4)
-- �������: ������� ���������� ��������, � ������� �������� ������� �� ���� ����.
select count(distinct name)
from ships 
where name like '% %'
--task16 (lesson4)
-- �������: ��������� ������ � ����������� ���������� �� ���� �������� � ����� ������� (X: year, Y: count)
