--task13 (lesson3)
--������������ �����: ������� ������ ���� ��������� � ������������� � ��������� ���� �������� (pc, printer, laptop). �������: model, maker, type
select model,maker,type 
from product 
--task14 (lesson3)
--������������ �����: ��� ������ ���� �������� �� ������� printer ������������� ������� ��� ���, � ���� ���� ����� ������� PC - "1", � ��������� - "0"
select * ,
		case when price>(select avg(price) from pc)
			then 1
			else 0
					end
from printer
--task15 (lesson3)
--�������: ������� ������ ��������, � ������� class ��������� (IS NULL)
select name 
from ships 
where class is null
--task16 (lesson3)
--�������: ������� ��������, ������� ��������� � ����, �� ����������� �� � ����� �� ����� ������ �������� �� ����.
select name 
from battles 
where extract(year from cast(date as date ))not in(select launched
													from ships)

--task17 (lesson3)
--�������: ������� ��������, � ������� ����������� ������� ������ Kongo �� ������� Ships.
select battle 
from outcomes 
where ship in (select name from ships 
			   where class ='Kongo')