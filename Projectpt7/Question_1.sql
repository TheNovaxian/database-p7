Connect sys/sys as sysdba;
DROP USER C##nora04 CASCADE;
CREATE USER c##nora04 IDENTIFIED BY 123;
GRANT connect, resource, create view TO c##nora04;
ALTER USER c##nora04 QUOTA 100M on USERS;
connect c##nora04/123;
SPOOL C:\Users\Shaquille\Projectpt7\PT7.txt
START "C:\Users\Shaquille\Desktop\School work\Oracle\7Software.sql"
SELECT to_char(sysdate,'DD MM YYYY Year Month Day HH:MI:SS Am') 
FROM DUAL;

CREATE OR REPLACE VIEW project_details AS
 SELECT project_name,consultant.c_first,consultant.c_last
 FROM project,project_consultant,consultant
 WHERE project.p_id = project_consultant.p_id AND project_consultant.c_id = consultant.c_id
WITH READ ONLY;

SPOOL OFF;