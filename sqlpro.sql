-- creating and using a database
create database Student;
use Student;


-- creating a student table
create table student(
student_id int primary key,
name varchar(50),
date_of_birth DATE,
address varchar(100),
contact_number varchar(15)
);


-- creating a courses table
create table courses(
course_id int primary key,
name varchar(50),
descriptionn varchar(200),
credits int
);


-- creating a grades table
create table grades(
student_id int,
course_id int,
grade float,
primary key(student_id,course_id),
foreign key(student_id) references student(student_id),
foreign key(course_id) references courses(course_id)
);


-- createing a table enrollments
create table enrollments(
student_id int,
course_id int,
enrollment_date date,
primary key(student_id,course_id),
foreign key(student_id) references student(student_id),
foreign key(course_id) references courses(course_id)
);


-- inserting data into student table
insert into student values(1,'Rama','2003-01-01','Hyderabad',1234567890);
insert into student values(2,'Sita','2003-02-01','Banglore',2345678901);
insert into student values(3,'Lakshmana','2003-03-01','Delhi',3456789012);
insert into student values(4,'Ravana','2003-04-01','China',4567890123);
insert into student values(5,'Hanuman','2003-05-01','Chennai',5678901234);

select * from student;


-- inserting data into courses table
insert into courses values(101,'DBMS','DBMS (Database Management System) organizes and manages structured data efficiently for storage, retrieval, and manipulation',4);
insert into courses values(102,'python','Python is a versatile, high-level programming language known for its simplicity and readability',3);
insert into courses values(103,'Numpy','NumPy is a powerful library for numerical computing in Python, providing efficient array operations and mathematical functions',4);
insert into courses values(104,'Excel','Excel is a widely used spreadsheet program that allows for data organization, analysis, and visualization',2);
insert into courses values(105,'Tableau','Tableau is a popular data visualization tool that helps users analyze and present complex data in an intuitive way',4);

select * from courses;


-- inserting data into grades table
insert into grades values(1,101,4.0);
insert into grades values(2,102,4.9);
insert into grades values(3,103,3.8);
insert into grades values(4,101,5.0);
insert into grades values(5,105,4.2);

select * from grades;


-- inserting data into enrollments table
insert into enrollments values(1,101,'2023-04-02');
insert into enrollments values(2,102,'2023-04-05');
insert into enrollments values(3,103,'2023-04-10');
insert into enrollments values(4,101,'2023-05-01');
insert into enrollments values(5,105,'2023-05-02');

select * from enrollments;


-- performing CRUD operations

-- Adding a new Student
insert into student values(6,'Sugriva','2003-06-01','Chennai',6789012345);

-- Adding a new course 
insert into courses values(106,'powerbi','Power BI is a business intelligence tool for data visualization and analysis',3);

-- Adding a new Grade 
insert into grades values(3,105,4.6);

-- Updating a student grade
update grades set grade=4.5 where student_id=3 and  course_id=103;

-- Enroll a student in a new course
insert into enrollments values (2,104,'2023-05-05');

-- Retrieve enrolled course for a student
select courses.* from courses join enrollments
on courses.course_id =enrollments.course_id
where enrollments.student_id=2;


-- Using Aggregating Functions
-- calculating average grade for a student
select avg(grade) from grades where student_id=3;

-- displaying top performing students
select student.*,avg(grades.grade) as average_grade from student
join grades on student.student_id=grades.student_id
group by student.student_id
order by average_grade DESC
limit 2;

