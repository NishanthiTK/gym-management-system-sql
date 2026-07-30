/*												Gym Management System                                                          */

create database GymManagementdb;
use GymManagementdb;
create table gyms_Branch (
    BranchID int AUTO_INCREMENT primary key,
    BranchName varchar(100) not null,
    AddressLine varchar(200),
    City varchar(50),
    StateName varchar(50),
    Phone varchar(15),
    Email varchar(100),
    OpeningDate date
);
create table MembershipFees_Plan (
    PlanID int auto_increment primary key,
    PlanName varchar(50) not null,
    DurationMonths int not null,
    RegistrationFee decimal(10,2) not null,
    MonthlyFee decimal(10,2) not null,
    TotalFee decimal(10,2) not null,
    PersonalTrainer varchar(5) default 'No',
    LockerFacility varchar(5) default 'No',
    DietConsultation varchar(5) default 'No',
    FreezeMembership varchar(5) default 'No',
    Description varchar(255)
);
create table gymexp_Trainers (
    TrainerID int auto_increment primary key,
    FirstName varchar(50),
    LastName varchar(50),
    Gender  varchar(10),
    Phone varchar(15) unique,
    Email varchar(100) unique,
    ExperienceYears int,
    Specialization varchar(100),
    HireDate date,
    Salary decimal(10,2),
    BranchID int,
    foreign key (BranchID) references gyms_Branch(BranchID)
);
create table Members_gym (
    MemberID int AUTO_INCREMENT primary key,
    FirstName varchar(50),
    LastName varchar(50),
    Gender varchar(10),
    DOB date,
    Phone varchar(15) unique,
    Email varchar(100) unique,
    JoinDate date,
    AddressLine varchar(200),
    Height decimal(5,2),
    Weight decimal(5,2),
    BranchID int,
    TrainerID int,
    foreign key (BranchID) references gyms_Branch(BranchID),
    foreign key (TrainerID) references gymexp_Trainers(TrainerID)
);

create table Employee_join (
    EmployeeID int AUTO_INCREMENT primary key,
    FirstName varchar(50),
    LastName varchar(50),
    Designation varchar(50),
    Phone varchar(15),
    Salary decimal(10,2),
    BranchID int,
    foreign key (BranchID) references gyms_Branch(BranchID)
);
create table Members_Membership_gym (
    MembershipID int primary key,
    MemberID int,
    PlanID int,
    StartDate date,
    EndDate date,
    MembershipStatus varchar(20),
    foreign key (MemberID) references Members_gym(MemberID),
    foreign key(PlanID) references MembershipFees_Plan(PlanID)
);

SELECT * FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';

-- =============================================
-- Insert Branch Details
-- =============================================

INSERT INTO gyms_Branch
(BranchID, BranchName, AddressLine, City, StateName, Phone, Email, OpeningDate)
VALUES
(1,'FitZone Velachery','12 GST Road','Chennai','Tamil Nadu','9876543210','velachery@fitzone.com','2024-01-10'),
(2,'FitZone Anna Nagar','25 Second Avenue','Chennai','Tamil Nadu','9876543211','annanagar@fitzone.com','2024-02-15'),
(3,'FitZone T Nagar','45 Usman Road','Chennai','Tamil Nadu','9876543212','tnagar@fitzone.com','2024-03-01'),
(4,'FitZone Adyar','18 LB Road','Chennai','Tamil Nadu','9876543213','adyar@fitzone.com','2024-03-20'),
(5,'FitZone Tambaram','10 GST Road','Chennai','Tamil Nadu','9876543214','tambaram@fitzone.com','2024-04-01'),
(6,'FitZone OMR','120 OMR Road','Chennai','Tamil Nadu','9876543215','omr@fitzone.com','2024-04-15'),
(7,'FitZone Porur','80 Mount Poonamallee Road','Chennai','Tamil Nadu','9876543216','porur@fitzone.com','2024-05-01'),
(8,'FitZone Ambattur','55 MTH Road','Chennai','Tamil Nadu','9876543217','ambattur@fitzone.com','2024-05-20'),
(9,'FitZone Medavakkam','90 Velachery Main Road','Chennai','Tamil Nadu','9876543218','medavakkam@fitzone.com','2024-06-01'),
(10,'FitZone Sholinganallur','150 OMR Road','Chennai','Tamil Nadu','9876543219','sholinganallur@fitzone.com','2024-06-15');

describe gyms_Branch;

SHOW CREATE TABLE gyms_Branch;

SELECT * FROM gyms_Branch;

describe MembershipFees_Plan;

insert into MembershipFees_Plan
(PlanName, DurationMonths, RegistrationFee, MonthlyFee, TotalFee,
 PersonalTrainer, LockerFacility, DietConsultation, FreezeMembership, Description)
values

('Silver',1,500,1500,2000,'No','Yes','No','No','Basic gym access'),

('Silver Plus',3,500,1400,4700,'No','Yes','Yes','No','3-month membership'),

('Gold',6,500,1300,8300,'Yes','Yes','Yes','No','6-month membership'),

('Gold Plus',9,500,1250,11750,'Yes','Yes','Yes','Yes','9-month membership'),

('Platinum',12,500,1200,14900,'Yes','Yes','Yes','Yes','1-year unlimited access'),

('Student',6,300,1000,6300,'No','No','No','No','Student discount plan'),

('Corporate',12,500,1100,13700,'Yes','Yes','No','Yes','Corporate employees'),

('Couple',12,1000,2000,25000,'Yes','Yes','Yes','Yes','Membership for two'),

('Weekend',12,500,700,8900,'No','Yes','No','No','Weekend-only access'),

('Premium Elite',24,1000,1100,27400,'Yes','Yes','Yes','Yes','VIP membership');

select * from MembershipFees_Plan;

INSERT INTO gymexp_Trainers
(FirstName, LastName, Gender, Phone, Email, Specialization,
 ExperienceYears, Salary, HireDate, BranchID)
VALUES

('Rahul','Sharma','Male','9000000001','rahul@fitzone.com','Weight Training',5,45000,'2024-01-15',1),
('Sneha','Iyer','Female','9000000002','sneha@fitzone.com','Yoga',4,42000,'2024-02-10',2),
('Arjun','Kumar','Male','9000000003','arjun@fitzone.com','CrossFit',6,47000,'2024-03-12',3),
('Priya','Menon','Female','9000000004','priya@fitzone.com','Zumba',3,40000,'2024-04-10',4),
('Vikram','Singh','Male','9000000005','vikram@fitzone.com','Strength Training',7,48000,'2024-05-01',5),
('Anitha','R','Female','9000000006','anitha@fitzone.com','Pilates',5,43000,'2024-05-20',6),
('Deepak','Raj','Male','9000000007','deepak@fitzone.com','Cardio',4,41000,'2024-06-01',7),
('Meena','S','Female','9000000008','meena@fitzone.com','Aerobics',3,40500,'2024-06-15',8),
('Karan','Patel','Male','9000000009','karan@fitzone.com','Functional Training',6,46000,'2024-07-01',9),
('Riya','Shah','Female','9000000010','riya@fitzone.com','Nutrition',5,44000,'2024-07-20',10),

('Sanjay','Rao','Male','9000000011','sanjay@fitzone.com','HIIT',5,45000,'2024-08-01',1),
('Pooja','Nair','Female','9000000012','pooja@fitzone.com','Yoga',4,42000,'2024-08-10',2),
('Ajith','K','Male','9000000013','ajith@fitzone.com','Bodybuilding',8,52000,'2024-08-20',3),
('Harini','V','Female','9000000014','harini@fitzone.com','Dance Fitness',3,39000,'2024-09-01',4),
('Manoj','B','Male','9000000015','manoj@fitzone.com','Strength Training',6,47000,'2024-09-10',5),

('Divya','S','Female','9000000016','divya@fitzone.com','Pilates',4,43000,'2024-09-20',6),
('Rakesh','P','Male','9000000017','rakesh@fitzone.com','CrossFit',5,46500,'2024-10-01',7),
('Lavanya','M','Female','9000000018','lavanya@fitzone.com','Aerobics',2,38500,'2024-10-10',8),
('Surya','N','Male','9000000019','surya@fitzone.com','Cardio',4,42000,'2024-10-20',9),
('Keerthi','R','Female','9000000020','keerthi@fitzone.com','Nutrition',5,44500,'2024-11-01',10),

('Vignesh','T','Male','9000000021','vignesh@fitzone.com','HIIT',7,50000,'2024-11-10',1),
('Anu','Priya','Female','9000000022','anu@fitzone.com','Yoga',3,41000,'2024-11-20',2),
('Prakash','L','Male','9000000023','prakash@fitzone.com','Powerlifting',9,55000,'2024-12-01',3),
('Nisha','K','Female','9000000024','nishak@fitzone.com','Zumba',4,41500,'2024-12-10',4),
('Gokul','S','Male','9000000025','gokul@fitzone.com','Functional Training',6,47500,'2024-12-20',5);

select * from gymexp_Trainers;

-- ===========================================
-- Insert Member Details
-- ===========================================

INSERT INTO Members_gym
(FirstName, LastName, Gender, DOB, Phone, Email, JoinDate, AddressLine, Height, Weight, BranchID, TrainerID)
VALUES
('Nisha','R','Female','2000-05-15','9876000001','nisha.r@gmail.com','2026-01-10','Velachery, Chennai',152.00,51.00,1,1),
('Karthik','M','Male','1998-07-20','9876000002','karthik.m@gmail.com','2026-01-12','Anna Nagar, Chennai',172.00,74.00,2,2),
('Priya','S','Female','1999-03-10','9876000003','priya.s@gmail.com','2026-01-15','T Nagar, Chennai',160.00,58.00,3,3),
('Arun','K','Male','1995-06-18','9876000004','arun.k@gmail.com','2026-01-18','Adyar, Chennai',175.00,78.00,4,4),
('Divya','P','Female','1997-04-22','9876000005','divya.p@gmail.com','2026-01-20','Tambaram, Chennai',158.00,54.00,5,5),
('Rohit','S','Male','1994-08-11','9876000006','rohit.s@gmail.com','2026-01-22','OMR, Chennai',180.00,82.00,6,6),
('Meena','R','Female','2001-01-14','9876000007','meena.r@gmail.com','2026-01-24','Porur, Chennai',155.00,50.00,7,7),
('Suresh','K','Male','1996-12-12','9876000008','suresh.k@gmail.com','2026-01-25','Ambattur, Chennai',173.00,76.00,8,8),
('Lavanya','M','Female','1998-09-19','9876000009','lavanya.m@gmail.com','2026-01-28','Medavakkam, Chennai',162.00,57.00,9,9),
('Ajay','R','Male','1993-11-09','9876000010','ajay.r@gmail.com','2026-02-01','Sholinganallur, Chennai',178.00,81.00,10,10),

('Keerthi','V','Female','1999-10-10','9876000011','keerthi.v@gmail.com','2026-02-05','Velachery, Chennai',159.00,55.00,1,11),
('Manoj','T','Male','1997-07-07','9876000012','manoj.t@gmail.com','2026-02-07','Anna Nagar, Chennai',176.00,79.00,2,12),
('Harini','B','Female','2000-08-08','9876000013','harini.b@gmail.com','2026-02-09','T Nagar, Chennai',157.00,52.00,3,13),
('Vignesh','L','Male','1996-05-05','9876000014','vignesh.l@gmail.com','2026-02-11','Adyar, Chennai',174.00,75.00,4,14),
('Naveen','K','Male','1995-02-14','9876000015','naveen.k@gmail.com','2026-02-15','Tambaram, Chennai',177.00,80.00,5,15),
('Anu','S','Female','1998-06-16','9876000016','anu.s@gmail.com','2026-02-18','OMR, Chennai',160.00,56.00,6,16),
('Kavin','M','Male','2001-09-21','9876000017','kavin.m@gmail.com','2026-02-20','Porur, Chennai',171.00,70.00,7,17),
('Shalini','R','Female','1997-03-13','9876000018','shalini.r@gmail.com','2026-02-22','Ambattur, Chennai',156.00,53.00,8,18),
('Pradeep','J','Male','1994-04-04','9876000019','pradeep.j@gmail.com','2026-02-25','Medavakkam, Chennai',179.00,84.00,9,19),
('Aishwarya','N','Female','2002-12-25','9876000020','aishwarya.n@gmail.com','2026-02-28','Sholinganallur, Chennai',161.00,55.00,10,20);

select * from Members_gym;

-- ===========================================
-- Insert Employee Details
-- ===========================================

INSERT INTO Employee_join
(FirstName, LastName, Designation, Phone, Salary, BranchID)
VALUES
('Ramesh','Kumar','Branch Manager','9001000001',65000,1),
('Priya','Sharma','Receptionist','9001000002',28000,1),
('Arun','Raj','Cleaner','9001000003',18000,1),

('Divya','Menon','Branch Manager','9001000004',65000,2),
('Karthik','S','Receptionist','9001000005',28000,2),
('Vijay','K','Cleaner','9001000006',18000,2),

('Anitha','R','Branch Manager','9001000007',65000,3),
('Suresh','M','Receptionist','9001000008',28000,3),
('Manoj','P','Cleaner','9001000009',18000,3),

('Lavanya','S','Branch Manager','9001000010',65000,4),
('Rahul','B','Receptionist','9001000011',28000,4),
('Deepak','R','Cleaner','9001000012',18000,4),

('Keerthi','V','Branch Manager','9001000013',65000,5),
('Harini','N','Receptionist','9001000014',28000,5),
('Ajay','L','Cleaner','9001000015',18000,5),

('Meena','P','Branch Manager','9001000016',65000,6),
('Prakash','T','Receptionist','9001000017',28000,6),
('Gokul','S','Cleaner','9001000018',18000,6),

('Naveen','R','Branch Manager','9001000019',65000,7),
('Aarthi','K','Receptionist','9001000020',28000,7),

('Saravanan','M','Branch Manager','9001000021',65000,8),
('Nisha','V','Receptionist','9001000022',28000,8),

('Kiran','J','Branch Manager','9001000023',65000,9),
('Pooja','L','Receptionist','9001000024',28000,9),

('Ashok','D','Branch Manager','9001000025',65000,10),
('Swathi','R','Receptionist','9001000026',28000,10);
DESCRIBE Employee_join;
SHOW TABLES;
insert into Members_Membership_gym
(MembershipID, MemberID, PlanID, StartDate, EndDate, MembershipStatus)
VALUES
(1,1,1,'2026-01-10','2026-02-09','Expired'),
(2,2,2,'2026-01-12','2026-04-11','Expired'),
(3,3,3,'2026-01-15','2026-07-14','Active'),
(4,4,4,'2026-01-18','2026-10-17','Active'),
(5,5,5,'2026-01-20','2027-01-19','Active'),
(6,6,6,'2026-01-22','2026-07-21','Active'),
(7,7,7,'2026-01-24','2027-01-23','Active'),
(8,8,8,'2026-01-25','2026-07-24','Expired'),
(9,9,9,'2026-01-28','2027-01-27','Active'),
(10,10,10,'2026-02-01','2028-01-31','Active'),
(11,11,1,'2026-02-05','2026-03-04','Expired'),
(12,12,2,'2026-02-07','2026-05-06','Active'),
(13,13,3,'2026-02-09','2026-08-08','Active'),
(14,14,4,'2026-02-11','2026-11-10','Cancelled'),
(15,15,5,'2026-02-15','2027-02-14','Active'),
(16,16,6,'2026-02-18','2026-08-17','Expired'),
(17,17,7,'2026-02-20','2027-02-19','Active'),
(18,18,8,'2026-02-22','2026-08-21','Active'),
(19,19,9,'2026-02-25','2027-02-24','Active'),
(20,20,10,'2026-02-28','2028-02-27','Pending');

select * from Members_Membership_gym;

-- ==========================================
-- phase 3 - basic select queries
-- project : gym management system
-- ==========================================

-- display all members
select * from members_gym;

-- display all trainers
select * from gymexp_trainers;

-- display all branches
select * from gyms_branch;

-- display all membership plans
select * from MembershipFees_Plan;

-- display all employees
select * from employee_join;

-- display member first name and phone number
select firstname, phone
from members_gym;

-- display female members
select *
from members_gym
where gender = 'female';

-- display male trainers
select *
from gymexp_trainers
where gender = 'male';

-- display members who joined after 31 jan 2026
select *
from members_gym
where joindate > '2026-01-31';

--  display members whose weight is greater than 70
select *
from members_gym
where weight > 70;

-- display members whose weight is between 50 and 60
select *
from members_gym
where weight between 50 and 60;

-- display trainers whose salary is greater than 45000
select *
from gymexp_trainers
where salary > 45000;

-- display members from branch 1
select *
from members_gym
where branchid = 1;

-- display members from branch 1 and 2
select *
from members_gym
where branchid in (1,2);

-- display members whose first name starts with 'a'
select *
from members_gym
where firstname like 'a%';

-- display members whose last name ends with 'r'
select *
from members_gym
where lastname like '%r';

-- display members whose email contains gmail
select *
from members_gym
where email like '%gmail%';

-- display members in ascending order of first name
select *
from members_gym
order by firstname asc;

-- display members in descending order of weight
select *
from members_gym
order by weight desc;

-- display trainers in descending order of salary
select *
from gymexp_trainers
order by salary desc;

--  display first five members
select *
from members_gym
limit 5;

-- count total number of members
select count(*) as total_members
from members_gym;

-- count total female members
select count(*) as female_members
from members_gym
where gender = 'female';

-- calculate average member weight
select avg(weight) as average_weight
from members_gym;

-- display highest trainer salary
select max(salary) as highest_salary
from gymexp_trainers;

-- display lowest trainer salary
select min(salary) as lowest_salary
from gymexp_trainers;

-- calculate total salary of all trainers
select sum(salary) as total_salary
from gym_trainers;

--  display unique branch ids
select distinct branchid
from members_gym;

--  display members whose email is null
select *
from members_gym
where email is null;

--  display members whose phone number is available
select *
from members_gym
where phone is not null;

-- ==========================================
-- phase 3 
-- joins
-- ==========================================

-- display member details with branch name
select m.memberid,
       m.firstname,
       m.lastname,
       b.branchname
from members_gym m
inner join gyms_branch b
on m.branchid = b.branchid;

-- display member details with trainer name
select m.memberid,
       m.firstname,
       t.firstname as trainer_name,
       t.specialization
from members_gym m
inner join gymexp_trainers t
on m.trainerid = t.trainerid;

-- display member with membership plan
select m.firstname,
       p.planname,
       mm.startdate,
       mm.enddate
from Members_Membership_gym mm
inner join members_gym m
on mm.memberid = m.memberid
inner join MembershipFees_Plan p
on mm.planid = p.planid;

-- display member, trainer and branch
select m.firstname,
       t.firstname as trainer_name,
       b.branchname
from members_gym m
inner join gymexp_trainers t
on m.trainerid = t.trainerid
inner join gyms_branch b
on m.branchid = b.branchid;

-- display trainers with their branch
select t.firstname,
       t.lastname,
       b.branchname
from gymexp_trainers t
inner join gyms_branch b
on t.branchid = b.branchid;

-- display employees with branch
select e.firstname,
       e.designation,
       b.branchname
from employee_join e
inner join gyms_branch b
on e.branchid = b.branchid;

-- display active memberships
select m.firstname,
       p.planname,
       mm.membershipstatus
from Members_Membership_gym mm
inner join members_gym m
on mm.memberid = m.memberid
inner join MembershipFees_Plan p
on mm.planid = p.planid
where mm.membershipstatus = 'active';

-- display expired memberships
select m.firstname,
       p.planname
from Members_Membership_gym mm
inner join members_gym m
on mm.memberid = m.memberid
inner join MembershipFees_Plan p
on mm.planid = p.planid
where mm.membershipstatus = 'expired';

-- display cancelled memberships
select m.firstname,
       p.planname
from Members_Membership_gym mm
inner join members_gym m
on mm.memberid = m.memberid
inner join MembershipFees_Plan p
on mm.planid = p.planid
where mm.membershipstatus = 'cancelled';

-- display members with gold plan
select m.firstname,
       p.planname
from Members_Membership_gym mm
inner join members_gym m
on mm.memberid = m.memberid
inner join MembershipFees_Plan p
on mm.planid = p.planid
where p.planname = 'gold';

-- count members in each branch
select b.branchname,
       count(m.memberid) as total_members
from gyms_branch b
left join members_gym m
on b.branchid = m.branchid
group by b.branchname;

-- count trainers in each branch
select b.branchname,
       count(t.trainerid) as total_trainers
from gyms_branch b
left join gymexp_trainers t
on b.branchid = t.branchid
group by b.branchname;

-- count employees in each branch
select b.branchname,
       count(e.employeeid) as total_employees
from gyms_branch b
left join employee_join e
on b.branchid = e.branchid
group by b.branchname;

-- display branch with highest members
select b.branchname,
       count(m.memberid) as total_members
from gyms_branch b
join members_gym m
on b.branchid = m.branchid
group by b.branchname
order by total_members desc
limit 1;

-- display average trainer salary by branch
select b.branchname,
       avg(t.salary) as average_salary
from gyms_branch b
join gymexp_trainers t
on b.branchid = t.branchid
group by b.branchname;

-- display members with platinum plan
select m.firstname,
       p.planname
from Members_Membership_gym mm
join members_gym m
on mm.memberid = m.memberid
join MembershipFees_Plan p
on mm.planid = p.planid
where p.planname = 'platinum';

-- display members whose membership expires in 2027
select m.firstname,
       mm.enddate
from Members_Membership_gym mm
join members_gym m
on mm.memberid = m.memberid
where year(mm.enddate) = 2027;

-- display trainers earning above average salary
select *
from gymexp_trainers
where salary >
(
select avg(salary)
from gymexp_trainers
);

-- display branches having more than two members
select branchid,
       count(*) as total_members
from members_gym
group by branchid
having count(*) > 1;

-- display all active members with branch and trainer
select m.firstname,
       b.branchname,
       t.firstname as trainer_name,
       mm.membershipstatus
from members_gym m
join gyms_branch b
on m.branchid = b.branchid
join gymexp_trainers t
on m.trainerid = t.trainerid
join Members_Membership_gym mm
on m.memberid = mm.memberid
where mm.membershipstatus = 'active';

-- ==========================================
-- phase 4 
-- gym management system
-- ==========================================

-- count total members
select count(*) as total_members
from members_gym;

-- count total trainers
select count(*) as total_trainers
from gymexp_trainers;

-- count total branches
select count(*) as total_branches
from gyms_branch;

-- count total employees
select count(*) as total_employees
from employee_join;

-- count total membership plans
select count(*) as total_plans
from MembershipFees_Plan;

-- calculate total salary of trainers
select sum(salary) as total_salary
from gym_trainers;

-- calculate average trainer salary
select avg(salary) as average_salary
from gymexp_trainers;

-- display highest trainer salary
select max(salary) as highest_salary
from gymexp_trainers;

-- display lowest trainer salary
select min(salary) as lowest_salary
from gymexp_trainers;

-- calculate average member weight
select avg(weight) as average_weight
from members_gym;

-- display maximum member weight
select max(weight) as highest_weight
from members_gym;

-- display minimum member weight
select min(weight) as lowest_weight
from members_gym;

-- calculate average member height
select avg(height) as average_height
from members_gym;

-- display maximum member height
select max(height) as tallest_member
from members_gym;

-- display minimum member height
select min(height) as shortest_member
from members_gym;

-- count members in each branch
select branchid,
count(*) as total_members
from members_gym
group by branchid;

-- count trainers in each branch
select branchid,
count(*) as total_trainers
from gymexp_trainers
group by branchid;

-- count employees in each branch
select branchid,
count(*) as total_employees
from employee_join
group by branchid;

-- calculate total trainer salary branch wise
select branchid,
sum(salary) as total_salary
from gymexp_trainers
group by branchid;

-- calculate average trainer salary branch wise
select branchid,
avg(salary) as average_salary
from gymexp_trainers
group by branchid;

-- display highest trainer salary branch wise
select branchid,
max(salary) as highest_salary
from gymexp_trainers
group by branchid;

-- display lowest trainer salary branch wise
select branchid,
min(salary) as lowest_salary
from gymexp_trainers
group by branchid;

-- count members by gender
select gender,
count(*) as total_members
from members_gym
group by gender;

-- count trainers by gender
select gender,
count(*) as total_trainers
from gymexp_trainers
group by gender;

-- count employees by designation
select designation,
count(*) as total_employees
from employee_join
group by designation;

-- display average member weight by branch
select branchid,
avg(weight) as average_weight
from members_gym
group by branchid;

-- display highest member weight by branch
select branchid,
max(weight) as highest_weight
from members_gym
group by branchid;

-- display lowest member weight by branch
select branchid,
min(weight) as lowest_weight
from members_gym
group by branchid;

-- count active memberships
select membershipstatus,
count(*) as total_members
from Members_Membership_gym
group by membershipstatus;

-- display total members assigned to each trainer
select trainerid,
count(*) as total_members
from members_gym
group by trainerid;

-- ==========================================
-- subqueries and nested queries
-- gym management system
-- ==========================================

-- display members whose weight is greater than average weight
select *
from members_gym
where weight >
(
    select avg(weight)
    from members_gym
);

-- display trainers whose salary is greater than average salary
select *
from gym_trainers
where salary >
(
    select avg(salary)
    from gymexp_trainers
);

-- display members having maximum weight
select *
from members_gym
where weight =
(
    select max(weight)
    from members_gym
);

-- display members having minimum weight
select *
from members_gym
where weight =
(
    select min(weight)
    from members_gym
);


-- display members who belong to branch 'fitzone velachery'
select *
from members_gym
where branchid =
(
    select branchid
    from gyms_branch
    where branchname = 'fitzone velachery'
);

-- display trainers working in branch 'fitzone anna nagar'
select *
from gym_trainers
where branchid =
(
    select branchid
    from gyms_branch
    where branchname = 'fitzone anna nagar'
);

-- display members enrolled in the gold plan
select *
from members_gym
where memberid in
(
    select memberid
    from Members_Membership_gym
    where planid =
    (
        select planid
        from MembershipFees_Plan
        where planname = 'gold'
    )
);

-- display members enrolled in the platinum plan
select *
from members_gym
where memberid in
(
    select memberid
    from members_membership_gym
    where planid =
    (
        select planid
        from MembershipFees_Plan
        where planname = 'platinum'
    )
);

-- display active members
select *
from members_gym
where memberid in
(
    select memberid
    from member_membership_gym
    where membershipstatus = 'active'
);

-- display expired members
select *
from members_gym
where memberid in
(
    select memberid
    from members_membership_gym
    where membershipstatus = 'expired'
);

-- display cancelled members
select *
from members_gym
where memberid in
(
    select memberid
    from members_membership_gym
    where membershipstatus = 'cancelled'
);

-- display members assigned to trainer 1
select *
from members_gym
where trainerid =
(
    select trainerid
    from gymexp_trainers
    where trainerid = 1
);

-- display trainers having members
select *
from gymexp_trainers
where trainerid in
(
    select trainerid
    from members_gym
);

-- display trainers without members
select *
from gymexp_trainers
where trainerid not in
(
    select trainerid
    from members_gym
);

-- display branches having members
select *
from gyms_branch
where branchid in
(
    select branchid
    from members_gym
);

-- display branches without members
select *
from gyms_branch
where branchid not in
(
    select branchid
    from members_gym
);

-- display employees working in branch 1
select *
from employee_join
where branchid =
(
    select branchid
    from gyms_branch
    where branchid = 1
);

-- display members taller than average height
select *
from members_gym
where height >
(
    select avg(height)
    from members_gym
);

-- display members whose weight is equal to maximum weight in branch 1
select *
from members_gym
where weight =
(
    select max(weight)
    from members_gym
    where branchid = 1
);

-- display trainer earning the second highest salary
select *
from gymexp_trainers
where salary =
(
    select max(salary)
    from gymexp_trainers
    where salary <
    (
        select max(salary)
        from gymexp_trainers
    )
);

-- display members whose membership ends in the latest date
select *
from members_membership_gym
where enddate =
(
    select max(enddate)
    from members_membership_gym
);

-- display members whose membership starts first
select *
from members_membership_gym
where startdate =
(
    select min(startdate)
    from members_membership_gym
);

-- display trainers earning less than average salary
select *
from gymexp_trainers
where salary <
(
    select avg(salary)
    from gymexp_trainers
);

-- display members whose branch has trainer id 1
select *
from members_gym
where branchid =
(
    select branchid
    from gymexp_trainers
    where trainerid = 1
);

-- display all plans used by members
select *
from membershipfees_plan
where planid in
(
    select distinct planid
    from members_membership_gym
);

-- display unused membership plans
select *
from membershipfees_plan
where planid not in
(
    select distinct planid
    from members_membership_gym
);

-- display branches having more than one trainer
select *
from gyms_branch
where branchid in
(
    select branchid
    from gymexp_trainers
    group by branchid
    having count(*) > 1
);

-- display members belonging to the branch with the highest number of members
select *
from members_gym
where branchid =
(
    select branchid
    from members_gym
    group by branchid
    order by count(*) desc
    limit 1
);
-- ==========================================
-- window functions
-- gym management system
-- ==========================================


-- assign row number to all members
select
memberid,
firstname,
lastname,
row_number() over(order by memberid) 
from members_gym;


-- display members based on weight ranking
select
firstname,
weight,
row_number() over(order by weight desc) as weight_rank
from members_gym;


-- rank trainers based on salary
select
firstname,
salary,
rank() over(order by salary desc) as salary_rank
from gymexp_trainers;


-- dense rank trainers based on salary
select
firstname,
salary,
dense_rank() over(order by salary desc) as salary_rank
from gymexp_trainers;


-- find top 5 highest paid trainers
select *
from
(
select
firstname,
salary,
rank() over(order by salary desc) as salary_rank
from gymexp_trainers
) x
where salary_rank <= 5;


-- rank members based on weight
select
firstname,
weight,
rank() over(order by weight desc) as weight_rank
from members_gym;


-- rank members branch wise based on weight
select
firstname,
branchid,
weight,
rank() over(partition by branchid order by weight desc) as branch_rank
from members_gym;


-- rank trainers branch wise by salary
select
firstname,
branchid,
salary,
rank() over(partition by branchid order by salary desc) as salary_rank
from gymexp_trainers;


-- display total members in each branch using window function
select
firstname,
branchid,
count(*) over(partition by branchid) as total_members
from members_gym;


-- display average weight branch wise
select
firstname,
branchid,
weight,
avg(weight) over(partition by branchid) as avg_branch_weight
from members_gym;


-- display maximum salary in each branch
select
firstname,
branchid,
salary,
max(salary) over(partition by branchid) as max_salary
from gymexp_trainers;


-- display minimum salary in each branch
select
firstname,
branchid,
salary,
min(salary) over(partition by branchid) as min_salary
from gymexp_trainers;


-- calculate running salary total
select
firstname,
salary,
sum(salary) over(order by trainerid) as running_salary
from gymexp_trainers;


-- calculate running member count
select
memberid,
firstname,
count(*) over(order by memberid) as running_member_count
from members_gym;


-- display previous trainer salary
select
firstname,
salary,
lag(salary) over(order by trainerid) as previous_salary
from gymexp_trainers;


-- display next trainer salary
select
firstname,
salary,
lead(salary) over(order by trainerid) as next_salary
from gymexp_trainers;


-- compare current salary with previous salary
select
firstname,
salary,
salary -
lag(salary) over(order by trainerid) as salary_difference
from gymexp_trainers;


-- display membership status with row number
select
membershipid,
membershipstatus,
row_number() over(order by membershipid) as row_num
from members_membership_gym;


-- rank membership plans by total fee
select
planname,
totalfee,
rank() over(order by totalfee desc) as fee_rank
from membershipfees_plan;


-- dense rank membership plans
select
planname,
totalfee,
dense_rank() over(order by totalfee desc) as fee_rank
from membershipfees_plan;


-- find most expensive membership plan
select *
from
(
select
planname,
totalfee,
rank() over(order by totalfee desc) as rnk
from membershipfees_plan
) x
where rnk = 1;


-- find cheapest membership plan
select *
from
(
select
planname,
totalfee,
rank() over(order by totalfee asc) as rnk
from membershipfees_plan
) x
where rnk = 1;


-- branch wise member ranking
select
firstname,
branchid,
row_number() over(partition by branchid order by memberid) as member_number
from members_gym;


-- employee salary ranking
select
firstname,
designation,
salary,
rank() over(order by salary desc) as salary_rank
from employee_join;


-- employee salary ranking by designation
select
firstname,
designation,
salary,
rank() over(partition by designation order by salary desc) as designation_rank
from employee_join;


-- display first joined member in each branch
select *
from
(
select
firstname,
branchid,
joindate,
row_number() over(partition by branchid order by joindate) as rnk
from members_gym
) x
where rnk = 1;


-- display latest joined member in each branch
select *
from
(
select
firstname,
branchid,
joindate,
row_number() over(partition by branchid order by joindate desc) as rnk
from members_gym
) x
where rnk = 1;


-- divide members into 4 groups based on weight
select
firstname,
weight,
ntile(4) over(order by weight desc) as weight_group
from members_gym;


-- divide trainers into salary groups
select
firstname,
salary,
ntile(3) over(order by salary desc) as salary_group
from gymexp_trainers;


-- complete member report with branch ranking
select
m.firstname,
b.branchname,
m.weight,
rank() over(partition by m.branchid order by m.weight desc) as weight_rank
from members_gym m
join gyms_branch b
on m.branchid = b.branchid;

-- ==========================================
-- views, stored procedures & triggers
-- gym management system
-- ==========================================

-- ==========================================
-- views
-- ==========================================

-- create view for all members
create view vw_members as
select *
from members_gym;

-- display view
select * from vw_members;

-- create view for trainers
create view vw_trainers as
select trainerid,
firstname,
lastname,
specialization,
salary
from gymexp_trainers;

-- display trainer view
select * from vw_trainers;

-- create view for member and branch
create view vw_member_branch as
select
m.memberid,
m.firstname,
b.branchname
from members_gym m
join gyms_branch b
on m.branchid = b.branchid;

-- display member branch view
select * from vw_member_branch;

-- create view for active memberships
create view vw_active_members as
select
m.memberid,
m.firstname,
mm.membershipstatus
from members_gym m
join member_membership_gym mm
on m.memberid = mm.memberid
where mm.membershipstatus='active';

-- display active members
select * from vw_active_members;

-- create salary view
create view vw_trainer_salary as
select
trainerid,
firstname,
salary
from gym_trainers;

-- display salary view
select * from vw_trainer_salary;

-- ==========================================
-- stored procedures
-- ==========================================

-- display all members
delimiter $$

create procedure sp_all_members()
begin
select *
from members_gym;
end $$

delimiter ;

-- execute procedure
call sp_all_members();

-- display all trainers
delimiter $$
create procedure sp_all_trainers()
begin
select *
from gym_trainers;
end $$
delimiter ;

-- execute trainer procedure
call sp_all_trainers();

-- display members by branch
delimiter $$

create procedure sp_member_branch
(
in p_branchid int
)
begin
select *
from members_gym
where branchid=p_branchid;
end $$

delimiter ;

-- execute
call sp_member_branch(1);

-- display trainer by specialization
delimiter $$

create procedure sp_specialization
(
in p_specialization varchar(50)
)
begin
select *
from gym_trainers
where specialization=p_specialization;
end $$

delimiter ;

-- execute
call sp_specialization('cardio');

-- display members by gender
delimiter $$

create procedure sp_gender
(
in p_gender varchar(10)
)
begin
select *
from members_gym
where gender=p_gender;
end $$

delimiter ;

-- execute
call sp_gender('female');

-- ==========================================
-- triggers
-- ==========================================

-- create audit table
create table member_audit
(
auditid int auto_increment primary key,
memberid int,
actiontype varchar(30),
actiondate datetime
);

-- trigger after insert
delimiter $$

create trigger trg_member_insert
after insert
on members_gym
for each row
begin
insert into member_audit(memberid,actiontype,actiondate)
values(new.memberid,'insert',now());
end $$

delimiter ;

-- insert new member to test trigger
insert into members_gym
(firstname,lastname)
values('test','member');

-- display audit table
select *
from member_audit;

-- trigger after delete
delimiter $$

create trigger trg_member_delete
after delete
on members_gym
for each row
begin
insert into member_audit(memberid,actiontype,actiondate)
values(old.memberid,'delete',now());
end $$

delimiter ;

-- delete a member
delete
from members_gym
where memberid=1;

-- display audit records
select *
from member_audit;

-- trigger before update
delimiter $$

create trigger trg_member_update
before update
on members_gym
for each row
begin
set new.firstname=upper(new.firstname);
end $$

delimiter ;

-- update member
update members_gym
set firstname='nisha'
where memberid=2;

-- verify updated member
select *
from members_gym
where memberid=2;

-- ==========================================
--  indexes, transactions,
-- ctes & advanced business reports
-- gym management system
-- ==========================================


-- ==========================================
-- indexes
-- ==========================================

-- create index on member email

drop index idx_member_email on members_gym;
create index idx_member_email
on members_gym(email);

show index from members_gym;

-- create index on member phone
create index idx_member_phone
on members_gym(phone);

-- create index on trainer specialization
create index idx_specialization
on gym_trainers(specialization);

-- create composite index
create index idx_member_branch
on members_gym(branchid,trainerid);

-- display indexes
show index
from members_gym;


-- ==========================================
-- transactions
-- ==========================================

-- start transaction
start transaction;

-- insert a new member
insert into members_gym
(firstname,lastname,gender)
values
('arun','kumar','male');

-- rollback transaction
rollback;

-- start transaction
start transaction;

-- insert another member
insert into members_gym
(firstname,lastname,gender)
values
('priya','r','female');

-- commit transaction
commit;


-- ==========================================
-- common table expressions
-- ==========================================

-- display members above average weight
with avg_weight as
(
select avg(weight) as avg_wt
from members_gym
)
select *
from members_gym
where weight >
(
select avg_wt
from avg_weight
);

-- trainer salary report
with salary_cte as
(
select *
from gym_trainers
where salary >=35000
)
select *
from salary_cte;

-- active members report
with active_member as
(
select *
from member_membership_gym
where membershipstatus='active'
)
select *
from active_member;

-- branch member count
with branch_count as
(
select
branchid,
count(*) total_members
from members_gym
group by branchid
)
select *
from branch_count;


-- ==========================================
-- advanced business reports
-- ==========================================

-- display top 5 heaviest members
select *
from members_gym
order by weight desc
limit 5;

-- display top 5 highest paid trainers
select *
from gym_trainers
order by salary desc
limit 5;

-- display total members in each branch
select
b.branchname,
count(m.memberid) total_members
from gyms_branch b
left join members_gym m
on b.branchid=m.branchid
group by b.branchname;

-- display total trainers in each branch
select
b.branchname,
count(t.trainerid) total_trainers
from gyms_branch b
left join gym_trainers t
on b.branchid=t.branchid
group by b.branchname;

-- display total employees in each branch
select
b.branchname,
count(e.employeeid) total_employees
from gyms_branch b
left join employee_join e
on b.branchid=e.branchid
group by b.branchname;

-- display branch having maximum members
select
branchid,
count(*) total_members
from members_gym
group by branchid
order by total_members desc
limit 1;

-- display trainer with maximum salary
select *
from gym_trainers
order by salary desc
limit 1;

-- display member having highest weight
select *
from members_gym
order by weight desc
limit 1;

-- display average trainer salary
select
avg(salary) average_salary
from gym_trainers;

-- display total salary paid to trainers
select
sum(salary) total_salary
from gym_trainers;

-- display branch wise average member weight
select
branchid,
avg(weight) average_weight
from members_gym
group by branchid;

-- display active membership count
select
count(*) active_members
from member_membership_gym
where membershipstatus='active';

-- display expired membership count
select
count(*) expired_members
from member_membership_gym
where membershipstatus='expired';

-- display members whose membership expires this year
select
m.firstname,
mm.enddate
from members_gym m
join member_membership_gym mm
on m.memberid=mm.memberid
where year(mm.enddate)=year(curdate());

-- generate complete gym report
select
m.memberid,
m.firstname,
m.lastname,
b.branchname,
t.firstname trainer_name,
p.planname,
mm.membershipstatus
from members_gym m
join gyms_branch b
on m.branchid=b.branchid
join gym_trainers t
on m.trainerid=t.trainerid
join member_membership_gym mm
on m.memberid=mm.memberid
join membershipfess_plan p
on mm.planid=p.planid
order by b.branchname,m.firstname;
