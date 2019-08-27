--Assessment Test 3

/*
Create a new database called 'School'.
This database should contain two tables: teachers and students.
*/

/*
The students table should have columns for student_id,
first_name, last_name, homeroom_number, phone, email and graduation year.
*/

CREATE TABLE students(
student_id SERIAL PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
homeroom_number INTEGER NOT NULL CONSTRAINT positive_room_numbers_check CHECK(homeroom_number > 0),
phone VARCHAR(50) NOT NULL UNIQUE,
email VARCHAR(200) UNIQUE,
graduation_year INTEGER NOT NULL CONSTRAINT graduation_year_check CHECK(graduation_year > 2019));

/*
The teachers table should have columns for teacher_id, first_name,
last_name, homeroom_number, department, email and phone.
*/

CREATE TABLE teachers(
teacher_id SERIAL PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
homeroom_number INTEGER NOT NULL CONSTRAINT positive_room_numbers_check CHECK(homeroom_number > 0),
department VARCHAR(50) NOT NULL,
email VARCHAR(200) NOT NULL UNIQUE,
phone VARCHAR(50) NOT NULL UNIQUE);

/*
Insert a student named Mark Watney who has a phone number of 777-555-1234
and doesn't have an email. He graduates in 2035 and has 5 as a homeroom number.
*/

INSERT INTO students(first_name, last_name, homeroom_number, phone, graduation_year)
VALUES('Mark', 'Watney', 5, '777-555-1234', 2035)
RETURNING *;

/*
Insert a teacher named Jonas Salk, who has a homeroom number of 5 and is from the Biology
department. His contact info is: jsalk@school.org and a phone number of 777-555-4321.
*/

--This insertion will fail due to teachers must have email address
INSERT INTO teachers(first_name, last_name, homeroom_number, department, phone)
VALUES('Jonas', 'Salk', 5, 'Biology', '777-555-4321');

--This insertion will fail due to teacher having a negative homeroom number
INSERT INTO teachers(first_name, last_name, homeroom_number, department, email, phone)
VALUES('Jonas', 'Salk', -5, 'Biology', 'test@gmail.com', '777-555-4321');

--This insertion will pass
INSERT INTO teachers(first_name, last_name, homeroom_number, department, email, phone)
VALUES('Nein', 'Joo', 5, 'Biology', 'test3@gmail.com', '777-557-4321')
RETURNING *;

INSERT INTO teachers
VALUES((SELECT COALESCE(MAX(teacher_id) + 1,1)
		FROM teachers), 
	'Jonas', 'Salk', 5, 'Biology', 'test7@gmail.com', '777-578-4321')
RETURNING *;

SELECT * FROM teachers;

DROP TABLE teachers;