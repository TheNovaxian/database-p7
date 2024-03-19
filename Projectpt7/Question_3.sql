Connect sys/sys as sysdba;
DROP USER C##nora02 CASCADE;
CREATE USER c##nora2 IDENTIFIED BY 125;
GRANT connect, resource, create view TO c##nora2;
ALTER USER c##nora2 QUOTA 100M on USERS;
connect c##nora2/125;
SPOOL C:\Users\Shaquille\Projectpt7\PT7_Q3.txt
START "C:\Users\Shaquille\Desktop\School work\Oracle\7clearwater.sql"
SELECT to_char(sysdate,'DD MM YYYY Year Month Day HH:MI:SS Am') 
FROM DUAL;


----- yes you can create a view even if the table have not been created yet



CREATE OR REPLACE FORCE VIEW OLD_ORDER_DETAIL AS
SELECT old_o_id, old_inv_id, old_ol_quantity, o_date,
o_methpmt , item_desc , c_last,c_first 
FROM ORDER_LINE_ARCHIVE, orders,order_line,inventory, item,customer
WHERE ORDER_LINE_ARCHIVE.old_o_id = orders.o_id AND ORDER_LINE_ARCHIVE.old_inv_id = inventory.inv_id AND ORDER_LINE_ARCHIVE.old_ol_quantity = order_line.ol_quantity AND inventory.item_id = item.item_id AND orders.c_id = customer.c_id;

DROP TABLE ORDER_LINE_ARCHIVE;
CREATE TABLE ORDER_LINE_ARCHIVE(old_o_id NUMBER, old_inv_id NUMBER, old_ol_quantity NUMBER,
CONSTRAINT order_line_archive_old_o_id_old_inv_id_PK PRIMARY KEY(old_o_id,old_inv_id));

INSERT INTO ORDER_LINE_ARCHIVE
VALUES (1,14,2);

SELECT DISTINCT * FROM OLD_ORDER_DETAIL;
SELECT * FROM ORDER_LINE_ARCHIVE;

SPOOL OFF;