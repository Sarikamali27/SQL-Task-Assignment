use sarika;
create table employees(emp_id int,emp_name varchar(50),department varchar(20),salary int,experience int,
city varchar(20),project_name varchar(20),project_status varchar(50));
insert into employees values(101,'Amit','IT',60000,3,'Nagpur','Alpha','completed'),
(102,'Sneha','HR',45000,2,'Pune','Beta','Ongoing'),
(103,'Rahul','IT',75000,5,'Mumbai','Gamma','Completed'),
(104,'priya','finance',50000,4,'Nagpur','Alpha','Ongoing'),
(105,'Karan','IT',80000,6,'Banglore','Delta','Completed'),
(106,'Neha','HR',48000,3,'Pune','Beta','Completed'),
(107,'Arjun','finance',52000,4,'Mumbai','Gamma','Ongoing'),
(108,'Pooja','IT',72000,5,'Nagpur','Alpha','Completed'),
(109,'Riya','HR',46000,2,'Delhi','Delta','Ongoing'),
(110,'Mohit','IT',67000,4,'Pune','Beta','Completed'),
(111,'Anjali','finance',53000,3,'Nagpur','Gamma','Completed'),
(112,'Vikram','IT',78000,6,'Mumbai','Delta','Ongoing');
select * from employees;

---update salary of amit into 70000.
update employees
set salary=70000
where emp_name='Amit';

---show project_status is completed where project_name is beta.
update employees
set project_status='Completed'
where project_name='Beta';

---delete the details of employee where id is 109
delete from employees
where emp_id=109;

---show the employees who have salary is greter than 70000.
select * from employees
where salary>70000;

---show employees that city is nagpur.
select * from employees
where city='Nagpur';
use sarika;

--count the total no. of employees departmentwise.
select department,count(department) as total_no from employees
group by department;

---show the total salary of IT department.
select department,sum(salary) as total_salary from employees
where department in ('IT')
group by department;

---show the average salary of employees city wise.
select city,avg(salary) as average from employees
group by city;

---show the top 3 salary from the table.
select top(3) * from employees
order by salary desc;

---show that employees that project status is completed and having more than 4 years of experience.
select * from employees
where project_status='Completed' and experience>4;

---show employees those not in HR department.
select * from employees
where department not in ('HR');