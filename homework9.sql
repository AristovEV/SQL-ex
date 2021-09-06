--task1  (lesson8)
-- oracle: https://leetcode.com/problems/department-top-three-salaries/
select Department,Employee,salary from(
select d.Name as Department,e.name as Employee ,salary, 
      dense_rank() over (partition by departmentid order by salary desc)
     from employee e  join department d on d.id=e.departmentid
     where e.name !='Janet') g
--task2  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/17
select distinct member_name,status,sum(unit_price) over(partition  by member_name)  as costs 
from FamilyMembers f LEFT JOIN   Payments p on f.member_id=p.family_member
where extract(year from cast(date as date))='2005'
--task3  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/13
select name from 
(select name, row_number() over(partition by name) as num 
from Passenger ) h
where num >1

--task4  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/38
select count(first_name) as count from Student
where first_name like 'Anna%'
--task5  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/35
select count(classroom) as count from(select classroom,date from Schedule 
WHERE date like '%2019-09-02%') d
--task6  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/38
select count(first_name) as count from Student
where first_name like 'Anna%'
--task7  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/32
select round(avg(age)) as age from (select timestampdiff(year,birthday,current_date) age from FamilyMembers) f
--task8  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/27
SELECT distinct good_type_name , sum(unit_price) over (partition BY good_type_name) as costs from GoodTypes gt 
JOIN  Goods g on good_type_id = type
JOIN    Payments p on good_id = good
WHERE extract(year from date)='2005'
order BY costs desc
--task9  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/37
select min(age) as year from (select timestampdiff(year,birthday,current_date) age from Student) f
--task10  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/44
select max(age) as max_year from (select timestampdiff(year,birthday,current_date) age
  from 
(SELECT birthday from Student s 
join Student_in_class st on s.id=st.Student
join Class c on c.id=st.class
where c.name LIKE  '10%') b ) h
--task11 (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/20
select status,member_name,unit_price as costs
from FamilyMembers  JOIN   Payments on member_id=family_member
JOIN     Goods on good = good_id
 JOIN   GoodTypes on type=good_type_id
where good_type_name = 'entertainment'
--task12  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/55
DELETE FROM Company 
where id in (SELECT Company 
from trip t 
GROUP BY Company 
HAVING  count(id) = 2)
--task13  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/45
select  classroom from (SELECT classroom, row_number() over (partition BY classroom) as num
from Schedule
) g
where num = 5

--task14  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/43
select last_name from teacher t 
join Schedule s on t.id=s.teacher
join Subject sub on s.subject=sub.id
where sub.name='Physical Culture'
ORDER BY last_name
--task15  (lesson8)
-- https://sql-academy.org/ru/trainer/tasks/63
select concat (last_name,'.',left(first_name,1),'.',left(middle_name,1),'.') as name 
from Student
order BY name