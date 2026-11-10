Create DATABASE college_db;
Use college_db;

Create table if not exists student(
    s_id int auto_increment primary key,
    first_name varchar(30) not null,
    last_name varchar(30) not null,
    score float(5,2)
);

Insert into student value(null, 'Leyla', 'Garcia', 42);
Insert into student value (null, 'David', 'Freitas', 99);
Insert into student value(null, 'Eli', 'Jarvis',75);

SELECT *
FROM student;

--alter table student add graade char(1);
--insert into student value(null, "Martin", "Fernandez", 01, null);
drop procedure update_student_grade;
CREATE PROCEDURE IF NOT EXISTS  update_student_grade(IN p_id INT)
BEGIN
    Update student 
    SET graade = CASE
        WHEN score >= 90 THEN 'A'
        WHEN score >= 80 THEN 'B'
        WHEN score >= 70 THEN 'C'
        WHEN score >= 60 THEN 'D'
        ELSE 'F'
    END
    WHERE s_id =p_id;
END;

CALL update_student_grade(2);
SELECT *
FROM student;