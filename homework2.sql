--������� 1: ������� name, class �� ��������, ���������� ����� 1920
select name,class
from ships
where launched > '1920';
--������� 2: ������� name, class �� ��������, ���������� ����� 1920, �� �� ������� 1942
select name,class
from ships
where launched between '1921' and '1942';
--������� 3: ����� ���������� �������� � ������ ������. ������� ���������� � class
select count(*),class
from ships
group by class;
--������� 4: ��� ������� ��������, ������ ������ ������� �� ����� 16, ������� ����� � ������. (������� classes)
select class,country
from classes 
where bore >= 16;
--������� 5: ������� �������, ����������� � ��������� � �������� ��������� (������� Outcomes, North Atlantic). �����: ship.
select ship 
from Outcomes
where result = 'sunk';
--������� 6: ������� �������� (ship) ���������� ������������ �������
select ship
from outcomes as o
full join battles as b on o.battle=b.name
where result = 'sunk'
order by date desc
limit 1;



--������� 7: ������� �������� ������� (ship) � ����� (class) ���������� ������������ �������
select ship,class
from outcomes as o

left join ships as s on o.ship = s.name
 
where result = 'sunk' and battle in (select name  from battles order by date desc )

limit 1;
--������� 8: ������� ��� ����������� �������, � ������� ������ ������ �� ����� 16, � ������� ���������. �����: ship, class
with 
o as (select * from outcomes),
s as (select * from ships),
c as (select * from classes)
select ship,c.class from o
full outer join s on o.ship=s.name
full outer join c on s.class=c.class
where result = 'sunk' and bore>=16
--������� 9: ������� ��� ������ ��������, ���������� ��� (������� classes, country = 'USA'). �����: class
select class 
from classes 
where country = 'USA'
--������� 10: ������� ��� �������, ���������� ��� (������� classes & ships, country = 'USA'). �����: name, class
select name,class 
from ships 
where class in (select class from classes 
			where country = 'USA')