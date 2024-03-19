Connect sys/sys as sysdba;
DROP USER C##nora03 CASCADE;
CREATE USER c##nora03 IDENTIFIED BY 124;
GRANT connect, resource, create view TO c##nora03;
ALTER USER c##nora03 QUOTA 100M on USERS;
connect c##nora03/124;
SPOOL C:\Users\Shaquille\Projectpt7\PT7_Q2.txt
START "C:\Users\Shaquille\Desktop\School work\Oracle\7Northwoods.sql"
SELECT to_char(sysdate,'DD MM YYYY Year Month Day HH:MI:SS Am') 
FROM DUAL;

CREATE OR REPLACE VIEW student_faculty_1 AS
 SELECT s_last, s_first, s_dob, f_id
 FROM student
 WHERE f_id = 1 OR f_id = 2
 WITH CHECK OPTION;

-- view new table
SELECT * FROM student_faculty_1;
-- checking if the view and check condition is functional
GRANT SELECT ON student_faculty_1 TO c##nora03;
GRANT select, insert, update, delete ON student_faculty_1 TO c##nora03;

UPDATE student_faculty_1
SET f_id = 3
WHERE s_last = 'Miller'AND s_first = 'Sarah' ;

SPOOL OFF;