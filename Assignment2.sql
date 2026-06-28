
use sarika;
create table patient(patient_id int primary key,
patient_name varchar(30),
age int,gender varchar(20),city varchar(50));

create table doctor(doctor_id int primary key,doctor_name varchar(20),specialization varchar(30),experience int);

create table appointments(appointment_id int primary key,patient_id int,doctor_id int,appointment_date date,status varchar(20)
foreign key (patient_id) references patient(patient_id),foreign key (doctor_id) references doctor(doctor_id));
drop table bills;
create table bills(bill_id int primary key,appointment_id int,total_amount decimal(10,2),payment_status varchar(20)
foreign key (appointment_id) references appointments(appointment_id));

insert into patient values(1,'unnati marathe',35,'female','dhule'),
(2,'divya kumbhar',56,'female','pune'),
(3,'mahesh sonwane',24,'male','mumbai'),
(4,'hardik pandya',35,'male','delhi'),
(5,'samayra mehta',25,'female','manipur');

insert into doctor values(101,'samir gupta','orthopedic',6),
(102,'henna khanna','neurologist',3),
(103,'pratha chaudhari','endocrinologist',4),
(104,'manvi mali','psychologist',8);

insert into appointments values(1001,1,101,'2025-08-07','completed'),
(1002,2,102,'2013-03-26','pending'),
(1003,3,103,'2024-04-23','pending'),
(1004,4,104,'2034-12-25','completed'),
(1005,4,101,'2000-03-24','completed');

insert into bills values(501,1001,34000,'paid'),
(502,1002,56000,'unpaid'),
(503,1003,45000,'refunded'),
(504,1004,87000,'unpaid'),
(505,1005,20000,'paid');

select * from patient;
select * from doctor;
select * from appointments;
select * from bills;

----show all patient details.
select * from patient;

---show all doctors with specialization.
select doctor_name,specialization from doctor;

---show completed appointments.
select * from appointments
where status  = 'completed';

---show total bill ammount collected.
select sum(total_amount) as total_bill_amount from bills;

---find doctor with highest experience.
select doctor_name,max(experience)as max_experience from doctor
group by doctor_name;

---show doctors who handled completed appointments.
select d.doctor_name,d.doctor_id,a.status from doctor d inner join appointments a
on d.doctor_id = a.doctor_id
where a.status = 'completed';

---show patient names with appointment dates.
select p.patient_name,a.appointment_date from patient p inner join appointments a
on p.patient_id = a.patient_id;

---show doctor names with patient names.
select d.doctor_name,p.patient_name from doctor d inner join appointments a
on d.doctor_id = a.doctor_id inner join patient p
on a.patient_id = p.patient_id;

---show patient,doctor,and bill amount together.
select p.patient_name,d.doctor_name,b.total_amount from bills b inner join appointments a 
on b.appointment_id = a.appointment_id inner join patient p
on p.patient_id = a.patient_id inner join doctor d
on d.doctor_id = a.doctor_id; 
