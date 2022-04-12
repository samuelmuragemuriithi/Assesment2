                                                            --Udemy(section6)
 --creating table department
    CREATE TABLE department
(
  id	   		number(5) constraint pk_department primary key,
  name	   		varchar2(50),
  monthly_budget 	number(8,2),
  last_employee_id 	number(5)
);

--creating table employee
CREATE TABLE employee
(
  id        number(5) constraint pk_employee primary key,
  name      varchar2(50),
  birthdate date,
  phone     varchar2(20),
  salary    number(7,2) not null,
  department_id number(3) constraint fk_employee_department references department,
  hire_date date,
  job_id    varchar2(20),
  email     varchar2(50)
 );

-- inserting into table department
 insert into department values (1,'ACCOUNTING',20000,8);
 insert into department values (2,'MARKETING',15000,9);
 insert into department values (3,'INFORMATION TECHNOLOGY',30000,10);
 insert into department values (4,'HUMAN RESOURCES',25000,13);
 insert into department values (5,'REGULATORY AFFAIRS',5000,null);
 insert into department values (6,'CUSTOMER SERVICE',2000,null);

--inserting into table employee
 insert into employee values (1,'JOHN SMITH',date '1995-01-01','1.123.456.7890',4000.00,1,date '2015-03-28','AC_ACCOUNT','JSMITH');
 insert into employee values (2,'JAMES BOSH',date '1992-02-15','1.234.567.8901',3500.00,2,date '2014-07-01','MK_REP','JBOSH');
 insert into employee values (3,'LUISA JACKSON',date '1970-03-08','1.345.678.9012',4500.00,3,date '2013-08-29','IT_PROG','LJACKSON');
 insert into employee values (4,'STUART GARCIA',date '1965-04-12','1.456.789.0123',2000.00,4,date '2010-02-15','HR_REP','SGARCIA');
 insert into employee values (5,'JUSTIN BLACK',date '1990-05-16','1.567.890.1234',2550.00,1,date '2015-05-02','AC_ACCOUNT','JBLACK');
 insert into employee values (6,'ANGIE CROOD',date '1998-06-22','1.678.901.2345',1500.00,1,date '2015-07-01','AC_ACCOUNT','ACROOD');
 insert into employee values (7,'CHARLES DEAN',date '1973-06-08','1.789.012.3456',2250.00,3,date '2002-03-01','IT_PROG','CDEAN');
 insert into employee values (8,'EDDIE FARREL',date '1980-07-28','1.890.123.4567',3000.00,1,date '2009-04-20','AC_ACCOUNT','EFARREL');
 insert into employee values (9,'GEORGE HAYES',date '1982-08-03',NULL,2500.00,2,date '2012-09-22','MK_REP','GHAYES');
 insert into employee values (10,'IGOR KEYS OSBOURNE',date '1987-09-11','144.898.7564',6000.00,3,date '2014-11-14','IT_PROG','IKEYS');
 insert into employee values (11,'LUKE MINT',date '1985-10-19','1.123.456.7890',5000.00,4,date '2011-01-08','HR_REP','LMINT');
 insert into employee values (12,'NIGEL OAKS',date '1997-11-05','52.987.654.3210',4750.00,4,date '2014-10-01','HR_REP','NOAKS');
 insert into employee values (13,'LUKE GREEN JR',date '1995-02-05',NULL,4750.00,4,date '2015-09-01','HR_REP','LGREEN');

  ALTER TABLE EMPLOYEE ADD BONUS NUMBER;
  
--creating table products 
CREATE TABLE products
  (
	Product_Id   NUMBER(5),
	Product_Name VARCHAR2(100),
	Price           NUMBER(8,2),
	Expiration_Date DATE
  ) ;

--adding primary key in table products
ALTER TABLE products ADD CONSTRAINT products_PK PRIMARY KEY ( Product_Id ) ;
 
-- inserting into table products
insert into products values (1,'Aspirin',5,date '2025-12-31');
insert into products values (2,'Penicillin',10,date '2026-04-30');
insert into products values (3,'Insulin',25,date '2026-05-31');
insert into products values (4,'Acetaminophen',5,date '2027-01-31');
insert into products values (5,'Amoxicillin',8,date '2026-07-31');
commit; 

    --New Table
CREATE TABLE company (
    id                  NUMBER(3) CONSTRAINT pk_company PRIMARY KEY,
    name                VARCHAR2(100) NOT NULL,
    commercial_contact  VARCHAR2(50),
    technical_contact   VARCHAR2(50),
    president           VARCHAR2(50),
    last_contacted      DATE,
    budget              NUMBER(8,2),
    budget_range_start  NUMBER(8,2) NOT NULL,
    budget_range_end    NUMBER(8,2) NOT NULL
);

INSERT INTO company (id,name,commercial_contact,president,budget_range_start,budget_range_end ) VALUES (1,'OUR BRILLIANT FUTURE LTD','LUISA JACKSON','JOHN SMITH',25000,50000);
INSERT INTO company (id,name,president,budget,budget_range_start,budget_range_end ) VALUES (2,'TESTING MAGIC','JUSTIN BLACK',35000,25000,50000);
INSERT INTO company (id,name,technical_contact,president,last_contacted,budget,budget_range_start,budget_range_end ) VALUES (3,'MAKING PROGRESS','ANGIE CROOD','CHARLES DEAN',DATE '2020-01-01',350000,125000,500000);
INSERT INTO company (id,name,commercial_contact,technical_contact,last_contacted,budget,budget_range_start,budget_range_end ) VALUES (4,'SKILL MASTERY','NIGEL OAKS','NIGEL OAKS',DATE '2020-02-15',12000,10000,24000);
INSERT INTO company (id,name,last_contacted,budget,budget_range_start,budget_range_end ) VALUES (5,'UNDECIDED AND CO.',DATE '2015-12-31',51000,51000,100000);
COMMIT;


   --Udemy section 2
     -- >, <, <>, !=. any, all , <=, >=, -, in, between, not, and, or    (operators)
     --any and all operator
     select *
     from products
     where price > any(5,10);
     
      select *
     from products
     where price > all(5,10);
     
     --undescore character
     select *
     from products
     where product_name like '_s%'  or product_name like '_e%';
     
    --in operator
    select *
     from products
     where price in (5,10,25);
    
    --employees whose name includes the letter “O” 2 times
    select *
    from employee
    where name like '%O% O%';
    --ans
    SELECT *
   FROM employee
   WHERE name LIKE '%O%O%'
    AND name NOT LIKE '%OO%';
                             
     -- mothly_budget > 15000 and  name includes a “G” or starts with an “H”, sorted by the department id in descending order. 
     select*
     from department
     where monthly_budget>15000 and (name like '%G%' or name like 'H%')
     order by id desc;
     --ans
     SELECT *
     FROM department
    WHERE monthly_budget > 15000
    AND
   (
    name LIKE '%G%'
    OR name LIKE 'H%'
    )
   ORDER BY id DESC;
     
     --employees of it and Hr  
     --earn 3000 or more but not more than 5000. 
     -- only employees who were born between 1970 and 1990.
     select*
     from employee
     where  department_id IN (3,4)and 
     (salary>3000 and salary<=5000) and (birthdate>date'1970-1-1' and birthdate<date'1990-12-31');
     --ans
     SELECT *
   FROM employee
   WHERE department_id IN (3,4)
   AND salary BETWEEN 3000 AND 5000
   AND birthdate BETWEEN DATE '1970-01-01' AND DATE '1990-12-31';

     
     --born before 01-jan-1980 or after 01-jan-1995 and earn more than 2000 a month, and whose name does not start or end with an “N”.
     select*
     from employee
     where (not birthdate between  date '1980-1-1' and  date '1995-1-1')
     and not  (name like 'N%' or name like '%N')
     and salary+ NVL(bonus,0) > 2000;
     --ans
        SELECT *
        FROM employee
        WHERE salary + NVL(bonus,0) > 2000
          AND
          (
            Birthdate < Date '1980-01-01'
            OR birthdate > date '1995-01-01'
          )
          AND NOT
          (
            Name LIKE '%N'
            OR Name LIKE 'N%'
          );
     
     --& symbol 
        select *
        from department
        where id=&department;
        
        select *
        from employee
        where salary=&&sal
        or salary=&sal*2;
        
        undefine sal;
        
        -- between January 1st, 2011, and December 15th, 2014)
        select *
        from employee
        where hire_date > date'&hiredate'
            and      hire_date < date'&hiredate'   ;
            
            undefine hiredate; 
        --ans
        SELECT *
        FROM employee
        WHERE hire_date BETWEEN DATE '&start_date' AND DATE '&end_date';
            
         -- salary is equal to the value entered, or equal to the half of the value entered or equal to a third of the value entered by the user.
        --The query must also prompt for the id of the department that the user wants to list.   
        select *
        from employee
        where department_id=&department and
      ( salary =&&sal
        or salary =&sal/2
        or salary =&sal/3 );
        --ans
        SELECT *
        FROM employee
        WHERE department_id = &department
        AND 
            (
                salary = &&sal
                OR salary = &sal/2
                OR salary = &sal/3
            );
            
        UNDEFINE sal;
        
        
         undefine sal;
         
         --quiz on logic
         select *
        from employee
        where salary between 3000 and 6000;
        
         select *
        from employee
        where salary in(3000,6000);
        
         select *
        from employee
        where not salary<3000;
        
         select *
        from employee
        where salary>any (3000,6000);
        
        
                                                                                -- --Udemy(section7)
--Aggragate function
select count (distinct salary)
from employee;

--Accounting department, the total sum of their salaries, and the average salary.
--average must appear 2 times in the results.
select count(*), sum (salary),avg(salary),sum (salary)/count(*) as "Manual avg"
from employee
where department_id =1;

--ans
SELECT COUNT(*) AS employees, 
      SUM(salary) AS total_salaries,
      AVG(salary) AS average_salary,
      SUM(salary) / COUNT(salary) AS manual_average_salary
FROM employee
WHERE department_id = 1;

--STATEMENT NUMBER 1
UPDATE employee
SET bonus =
  CASE
    WHEN salary < 3000
    THEN 100
    WHEN salary BETWEEN 3000 AND 4000
    THEN 200
    WHEN salary BETWEEN 4001 AND 4900
    THEN 300
  END;

--STATEMENT NUMBER 2
commit;


--list the different bonuses from  employee ,  with the number of employees that earn that bonus,
--and the greatest salary for employees in that group. 
--Please include only employees who were born before 1995.
select  bonus,COUNT(*),MAX(salary)
from employee
where  birthdate<date '1995-1-1'
group by bonus
order by bonus ;
--ans
SELECT bonus,
   COUNT(*) AS employees,
   MAX(salary) AS greatest_salary
FROM employee
WHERE birthdate < DATE '1995-01-01'
GROUP BY bonus
ORDER BY bonus;

--minimum and maximum salaries and also the bonus average per department 
--don’t include employees who don’t have a value defined for their bonus.
-- only departments whose smallest salary is less than 2000 or their highest salary is greater than 4000.
--esults must be displayed in descending order by the minimum salary.
select department_id,min(salary),max(salary),avg(bonus)
from employee
where bonus is not null  
group by department_id
having min(salary)<2000 or max(salary)>4000
order by min(salary),max(salary),avg(bonus) desc;
--ans
SELECT department_id, MIN(salary), MAX(salary), AVG(bonus)
FROM employee
WHERE bonus IS NOT NULL
GROUP BY department_id
HAVING MIN(salary) < 2000
   OR MAX(salary) > 4000
ORDER BY MIN(salary) DESC;

                                                                                -- -- --Udemy(section8)

--details of the department where the youngest employee in the company works.
select id,monthly_budget,last_employee_id
from employee  join department 
using (id)
where birthdate=(select max(birthdate)
from employee);

--departments , along with the average salary 
--the birthdate of the oldest employee that works in each department ordered by department id in descending order.
select department_id,avg(salary),max(employee.birthdate)
from employee  join department 
using (id)
group by department_id;
order by department_id desc nulls first;


                                                                                                --Assesment2
--1. CREATE A TABLE WITH YOUR OWN EXAMPLE with each column should have constraints like PRIMARY KEY, NOT NULL ,UNIQUE and FOREIGN KEY constraints and insert 6 records.  
    --table 0 regions
      drop table regions;
      create  table regions
      (region_id      number,
      region_name  varchar(25),
       primary key (region_id)
      );
      --table 1 countries
      drop table countries;
      create table countries
      (country_id       CHAR(2) not null,--not null
        country_name varchar(40) unique,--unique constaints
        region_id         number,
        primary key (country_id),--primary key constrait
        foreign key (region_id) references regions(region_id)--foreign key constraint
      );
      insert into   regions values (1,'africa');
       insert into   regions values (2,'us');
        insert into   regions values (3,'asia');
         insert into   regions values (4,'north America');
          insert into   regions values (5,'Soth America');
           insert into   regions values (6,'Europe');
    
     insert into   countries values (1,'Kenya',1);
       insert into   countries values (2,'uganda',1);
        insert into   countries values (3,'tz',1);
         insert into   countries values (4,'zambia',1);
          insert into   countries values (5,'Soth Afiica',1);
           insert into   countries values (6,'sudan',1);
    
      select*
      from countries;
      
      --2. write a query to add new column to emp table.
      DROP TABLE DEPT;
CREATE TABLE DEPT
       (DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
	DNAME VARCHAR2(14) ,
	LOC VARCHAR2(13) ) ;
DROP TABLE EMP;
CREATE TABLE EMP
       (EMPNO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY,
	ENAME VARCHAR2(10),
	JOB VARCHAR2(9),
	MGR NUMBER(4),
	HIREDATE DATE,
	SAL NUMBER(7,2),
	COMM NUMBER(7,2),
	DEPTNO NUMBER(2) CONSTRAINT FK_DEPTNO REFERENCES DEPT);
INSERT INTO DEPT VALUES
	(10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES
	(30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES
	(40,'OPERATIONS','BOSTON');
INSERT INTO EMP VALUES
(7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO EMP VALUES
(7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30);
INSERT INTO EMP VALUES
(7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30);
INSERT INTO EMP VALUES
(7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20);
INSERT INTO EMP VALUES
(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30);
INSERT INTO EMP VALUES
(7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30);
INSERT INTO EMP VALUES
(7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10);
INSERT INTO EMP VALUES
(7788,'SCOTT','ANALYST',7566,to_date('13-JUL-87')-85,3000,NULL,20);
INSERT INTO EMP VALUES
(7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO EMP VALUES
(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30);
INSERT INTO EMP VALUES
(7876,'ADAMS','CLERK',7788,to_date('13-JUL-87')-51,1100,NULL,20);
INSERT INTO EMP VALUES
(7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30);
INSERT INTO EMP VALUES
(7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES
(7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);
DROP TABLE BONUS;
CREATE TABLE BONUS
	(
	ENAME VARCHAR2(10)	,
	JOB VARCHAR2(9)  ,
	SAL NUMBER,
	COMM NUMBER
	) ;
DROP TABLE SALGRADE;
CREATE TABLE SALGRADE
      ( GRADE NUMBER,
	LOSAL NUMBER,
	HISAL NUMBER );
INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);
COMMIT;

       
       
--3.Write a query to find all the employees whose salary is between 3000 to 10000 for only who doesn't have commission.
select *
from emp
where sal between 3000 and 10000 and comm is  null;

--4. write a query to dispaly employee count from each department .
select deptno,count(*)  
from emp
group by deptno;

--5.write a query to display salesmans data and department 10 data.
select *
from emp
where job ='SALESMAN' or  deptno =10 ;

--6.write a query to display in which year more employees joined
with hYear as(
select EXTRACT(YEAR FROM hiredate),count(*) as counter
from emp
group by  EXTRACT(YEAR FROM hiredate)
)
 select *
 from hYear
 where counter =(SELECT  max(counter) FROM hYear );
 

                                                                            --section2:
--1. Write query to display empno, ename,sal,dname from emp and dept tables for those employees location is newyork.
select empno, ename,sal,dname from emp join dept 
using(deptno) where loc='NEW YORK' ;

--1. write a query to dispaly maximum employee count department name over other departments .
with counterdept as(
select deptno, count(*) counter
from emp e 
group by deptno
)
select c.*, dname
from counterdept c join dept d on c.deptno = d.deptno
 where  counter= (select max(counter) from counterdept);

--2. Write query to display empno, ename,sal,dname for entered employee number.
select empno, ename,sal,dname
from emp e join dept d
using(deptno)
where deptno=&deptno;
--3. Write query to display empno, ename,sal,grade for those emplyees with higest grade (note: grade is in salgrade table)

select empno, ename,sal,grade
from   emp e , salgrade s
where e.sal between  losal and hisal and  grade= (select max(grade)from salgrade);
--3. Write query to display empno, ename,sal,grade for those emplyees with 2nD  HIGEST SALARY GRADE (note: grade is in salgrade table)
select empno, ename,sal,grade
from   emp e , salgrade s
where e.sal between  losal and hisal 
and  grade= (   select grade from (
                        select  grade, dense_rank() 
                        over(order by grade desc)r from salgrade) 
                        where r=2
                        );    
                        
      -- Group ans              
        select * 
         from
         (
        select ename, sal, dense_rank() 
        over(order by sal desc)r from Emp) 
        where r=&2;
--4. Write query to display employee and their boss details those who are having salary more than their boss(manager).
select *
from emp e1,emp e2
where e1.mgr= e2.empno
and e1.sal>e2.sal;


--*5. Write a query to diaplay every emplyee those belongs to any department & also those all not belongs to any department.
select  *
from emp 
where deptno is not null
UNION
select  *
from emp 
where deptno is  null;
--6. Write query to display employees who doesn't have boss(manager)
select *
from emp
where mgr is null;

--6.wrirte a query to dispaly empno, ename,sal,grade and (grade name  if grade is 5 then 'highest paid guys' ,if grade is 1 then 'lowest paid guys' and other grade guys as 'medium paid guys).
SELECT EMPNO, ENAME, SAL, GRADE,
CASE
    WHEN GRADE = 1 THEN 'Lowest Paid Guys'
    WHEN GRADE = 5 THEN 'Highest Paid Guys'
    ELSE 'Medium Paid Guys'
END AS GRADE
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN LOSAL AND HISAL;
;
--7. scenario: there are 2 tables data give n in below as table1  and table2, both tables have only one column.
--Question to disple the number of rows if you do inner join, left join, right join and full join.
drop table table1;
create table table1( val1 number);
insert into table1 values ( 1);         
insert into table1 values ( 1);     
insert into table1 values ( 1);     
insert into table1 values ( 2);     
insert into table1 values ( null);     
insert into table1 values ( 3);  
insert into table1 values ( 3 );    
drop table table2;
create table table2( val2 number);
insert into table2 values ( 1);         
insert into table2 values ( 1);         
insert into table2 values ( null);         
insert into table2 values ( 4);         
insert into table2 values ( 2);   


--inner join 
select table1.val1, table2.val2  from table1
inner join table2
on table1.val1 = table2.val2;
--left join
select table1.val1, table2.val2  from table1
left join table2
on table1.val1 = table2.val2;
-- right
select table1.val1, table2.val2  from table1
right join table2
on table1.val1 = table2.val2;
--full
select table1.val1, table2.val2  from table1
full join table2
on table1.val1 = table2.val2;



---8. display emplee name in uper case, lower case, lenght of each emplyee name, first charecter of employee name.
SELECT upper(ENAME) as caps,
lower(ename) as scaps,
length(ename)as len,
SUBSTR(ename,1,1) as letter  FROM  emp;
--8. display emplee name in uper case, lower case, lenght of each emplyee name, first&  charecter of employee name in one column.
select upper(ename)|| ' '|| lower(ename) || ' '|| length(ename) || ' '|| substr(ename,1,&first)
from emp;

SELECT upper(ENAME) || ' '||
lower(ename) || ' '||
length(ename)|| ' '||
SUBSTR(ename,1,1) as NAMES FROM  emp;

--9. display each employee name and experience in months.
select ename, MONTHS_BETWEEN
              (CURRENT_DATE,HIREDATE ) "Months"
         FROM EMP;

--9. display employee name who MOST  EXPERIENCED among all emplyees and LEAST EXPERIENCED EMPLOYEE among all.

select *
from (
              SELECT ename,  months_between (sysdate, hiredate), row_number()
              over (order by months_between (sysdate, hiredate) desc) as rank
              FROM emp
  ) emp
FETCH FIRST 1 ROW ONLY ;


select *
from (
  SELECT ename,  months_between (sysdate, hiredate), row_number()
  over (order by months_between (sysdate, hiredate) asc) as rank
  FROM emp
  ) emp
FETCH FIRST 1 ROW ONLY; 

select *
from (
  SELECT ename, row_number() 
  over (order by hiredate desc) as experience_in_years
  FROM emp
  ) emp
WHERE experience_in_years in (1 , 15);

--10.display current month first day and next month first sunday date. use dual table.
        SELECT TRUNC(sysdate, 'MONTH') as " current month first day",
        next_day(last_day(sysdate),'sunday') as "next month first sunday date" FROM DUAL;
        
  

--11display department wise average salary whose department avarage salary more than department 10.(sub query)
select deptno, avg(sal) 
from emp
group by deptno
having avg(sal)>(select avg(sal)
from emp
where deptno=10);


--11. display department wise average salary whose department avarage salary more than department ( 20).(sub query)

select deptno, avg(sal) 
from emp
group by deptno
having avg(sal)>(select avg(sal)
from emp
where deptno=20);

SELECT deptno,AVG(sal) FROM emp
HAVING AVG(sal)>(
SELECT AVG(sal) FROM emp
WHERE deptno=20
)
GROUP BY deptno  ;
--12.dispaly deptno where atleast 4 emplyees working 
select deptno,count(*)
from emp
group by deptno
having  count(*)>=4;
--12.dispaly employee details and dept details where no emplyees working (hint check in both emp and dep tables)

select *
from dept 
where  not deptno in (
select deptno
from emp
intersect
select distinct deptno
from  dept);



--13.display 5th record to 10th record from employee table (rownum)

SELECT * FROM EMP WHERE ROWNUM < 10
OFFSET 5 ROWS;

--13.display 5th record,7th record and 10th record from employee table (rownum)
SELECT * 
FROM (
  SELECT empno ,ename ,sal,job,mgr,hiredate,comm,deptno,
  row_number() over (order by rownum ) as row_num
  FROM emp
  ) emp
WHERE row_num in (5,7,10);

SELECT * FROM (
  SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno,row_number() OVER (ORDER BY empno) AS row_num
  FROM emp
  ) emp
WHERE row_num in (5,7,10);
--14. display 1st and last records fro memp table.
Select * from emp where rowid  =(select min(rowid) from emp)
Union
Select * from emp where rowid  =(select max(rowid) from emp);



--15. display 2nd last record (2nd row from last) from emp table.
SELECT * 
FROM emp                     
ORDER BY empno DESC
OFFSET 1 ROW
FETCH FIRST 1 ROW ONLY ; 

--16.display fifth maximum salary from emp table.

select sal from (
select  sal, dense_rank() 
over(order by sal desc)r from Emp) 
where r=5;

--16. display 2nD, 5th AND 9th maximum salary from emp table.
select * from (
select  sal, dense_rank() 
over(order by sal desc)r from Emp) 
where r=2
union
select * from (
select  sal, dense_rank() 
over(order by sal desc)r from Emp) 
where r=5
union
select * from (
select  sal, dense_rank() 
over(order by sal desc)r from Emp) 
where r=9;

select * from (
  SELECT ename ,sal,row_number() over (order by sal desc) as row_num
  FROM emp
  ) emp
WHERE row_num in (2,5,9);
--17.display 2nd and 7th maximum salary employee details.
select * from (
select  sal, dense_rank() 
over(order by sal desc)r from Emp) 
where r=2
union
select * from (
select  sal, dense_rank() 
over(order by sal desc)r from Emp) 
where r=7;
--17.display 2nd to 4th maximum salary employee details.
SELECT * 
FROM (
  SELECT empno ,ename ,sal,job,mgr,hiredate,comm,deptno,
  row_number() over (order by sal desc) as row_num
  FROM emp
  ) emp
WHERE row_num in (2,4);

--18.scenario: display only duplicate records from below table also write one more query to delete duplicate records.
DROP TABLE table3;
create table table3 (col number, loc_nm varchar(10) );
INSERT INTO table3 VALUES (1,'NY');
INSERT INTO table3 VALUES (1,'TX');
INSERT INTO table3 VALUES (2,'FL');
INSERT INTO table3 VALUES (3,'NJ');
INSERT INTO table3 VALUES (4,'DL');
INSERT INTO table3 VALUES (2,'MG');
INSERT INTO table3 VALUES (5,'CF');
INSERT INTO table3 VALUES (3,'MP');
INSERT INTO table3 VALUES (2,'MG');
--display only duplicate records 
select col, count(col)
from table3
group by col
having count(col)>1;
--qiestion2: write A query to display non first occurence duplate records
with cntall as (
select col,loc_nm, count(*) as cnt
from table3 
group by col,loc_nm)
select col,loc_nm
from cntall
where cnt >1 
;
-- delete duplicate records.
delete 
from table3 where rowid not in
(select min(rowid)
from table3
group by col
);
select *
from table3;


--19. display the empno, ename,salary from the previous row to calculate the difference between the salary of the current row and that of the previous row.
SELECT empno,ename, sal,
LAG(sal, 1, 0) OVER (ORDER BY sal) AS previous,
sal - LAG(sal, 1, 0) OVER (ORDER BY sal) AS diff
FROM   emp;

--20. display the deptno, ename,salary from the previous row to calculate the difference between the salary of the current row 
--and that of the previous row from each department separately.
SELECT deptno, ename,sal,
LAG(sal, 1, 0) OVER (PARTITION BY deptno ORDER BY sal) AS previous,
sal - LAG(sal, 1, 0) OVER (PARTITION BY deptno ORDER BY deptno) AS diff
FROM   emp;

SELECT deptno, ename,sal,
LAG(sal, 1, 0) OVER (PARTITION BY deptno ORDER BY sal) AS PREV_ROW,
sal - LAG(sal, 1, 0) OVER (PARTITION BY deptno ORDER BY deptno) AS DIFFERENCE
FROM   emp;
--21. display the empno, ename,salary from the next row to calculate the difference between the salary of the current row and that of the previous row.
SELECT empno,ename,sal,
LEAD(sal, 1, 0) OVER (ORDER BY sal) AS sal_next,
sal - LAG(sal, 1, 0) OVER (ORDER BY sal) AS diff
FROM   emp;

SELECT deptno, ename,sal,
LEAD(sal, 1, 0) OVER (ORDER BY sal) AS Next,
sal - LAG(sal, 1, 0) OVER (ORDER BY sal) AS Difference
FROM   emp;

--22. display the deptno, ename,salary from the next row to calculate the 
--difference between the salary of the current row and that of the previous row from each department separately.
SELECT ename,deptno, sal,
LEAD(sal, 1, 0) OVER (PARTITION BY deptno ORDER BY sal) AS nextsal,
sal - LAG(sal, 1, 0) OVER (PARTITION BY deptno ORDER BY sal) AS diff
FROM   emp;
-
--23.write a query to create view usning sum(sal), avg(sal), min(comm), max(comm) from employee table
drop view aggregate;
create view aggregate as
select sum(sal) sum, avg(sal) avg, min(comm) min, max(comm) max
from emp;

select*
from aggregate;

--24. dispaly all dept numbers from emp table and dept table (sHOULD NOT MISS ANY DEPT exist in either of tables)
select distinct deptno
from  dept
union
select distinct deptno
from  emp;

--25.write a query to display deptno from dept table which is not present in emp table without join and subquery.
--12.dispaly employee details and dept details where no emplyees working (hint check in both emp and dep tables)
select deptno
from dept 
where  not deptno in (
select deptno
from emp
intersect
select distinct deptno
from  dept);

                                                                                            --section2b
--1.Query to find Second Highest Salary of Employee?
SELECT sal
FROM emp                     
ORDER BY sal DESC
OFFSET 1 ROW
FETCH FIRST 1 ROW ONLY ; 

--2.Query to find duplicate rows in table? 
select deptno
from emp
group by deptno
having count(deptno)>1;

create view newEmpTable as
select ename,sal/12 as newSal
from emp;

--3.How to fetch monthly Salary of Employee if annual salary is given? 

drop view newEmpTable;
create view newEmpTable as
select ename,sal/12 as newSal
from emp;

--4.What is the Query to fetch first record from Employee table? 
Select * from emp where rowid  =(select min(rowid) from emp);

--5.What is the Query to fetch last record from the table?
Select * from emp where rowid  =(select max(rowid) from emp);

--6.What is Query to display first 5 Records from Employee table.
SELECT * FROM EMP WHERE ROWNUM <= 5;

--*7.What is Query to display Nth Record from Employee table
Select * from emp where rowid  =(select min(rowid) from emp);

--8.How to get 3 Highest salaries records from Employee table?
select distinct sal from (
select  sal, dense_rank() 
over(order by sal desc)r from Emp) 
where r<=3;

--9.How to Display odd rows in Employee table?
SELECT *
FROM (
            SELECT empno,ename, Row_Number() OVER(ORDER BY empno) AS RowNumber
            FROM emp
) 
WHERE  mod(RowNumber,2)=1;

--10.How to Display Even rows in Employee table?
SELECT *
FROM (
            SELECT empno,ename, Row_Number() OVER(ORDER BY empno) AS RowNumber
            FROM emp
) 
WHERE  mod(RowNumber,2)=0;

--11.How to fetch 3rd highest salary using Rank Function?
select distinct sal from (
select  sal, dense_rank() 
over(order by sal desc)r from Emp) 
where r=3;

--13.Display first 50% records from Employee table?
SELECT *
FROM emp                     
FETCH FIRST  15/2  ROW ONLY ; 

--14.Display last 50% records from Employee table?
SELECT *
FROM emp                     
OFFSET  15/2  ROW ; 

--15. Create table with same structure with data of Employee table?
create view newemp as
select*from emp;

--16. Fetch only common records between 2 tables.
select distinct deptno
from emp join dept
using(deptno);

--17.Find Query to get information of Employee where Employee is not assigned to the department
select *
from emp 
where deptno is  null;

--18.How to get distinct records from the table without using distinct keyword.
select deptno,count(deptno)
from emp
group by deptno;

--19.Select all records from Employee table whose name is ‘Amit’ and ‘Pradnya’
select *
from emp
where ename like 'FORD' or ename like'KING';

--20.Select all records from Employee table where name not in ‘Amit’ and ‘Pradnya’
select *
from emp
where not( ename like 'FORD' or ename like'KING');

--22.How to fetch all the records from Employee whose joining year is  2017?
 SELECT   *
FROM emp
where hiredate like '%81';

--23.What is SQL Query to find maximum salary of each department?
select deptno,MAX(sal)
FROM emp
group by deptno;

--24.How Do you find all Employees with its managers?
select e1.ename,e2.ename Manager
from emp e1 , emp e2
where e1.empno = e2.mgr ;

--25.Display the name of employees who have joined in 2016 and salary is greater than 10000?
SELECT   *
FROM emp
where hiredate like '%81' and sal<3000;

--26.How to display following using query?

--27.How to add the email validation using only one query?

--28.How to display 1 to 100 Numbers with query?

--29.How to remove duplicate rows from table








                                                                                            --(ASSESMENT 2)
                                                                                            


select col
from table3
group by col
having count(col)>1;
       select *
       from dept;
       
       