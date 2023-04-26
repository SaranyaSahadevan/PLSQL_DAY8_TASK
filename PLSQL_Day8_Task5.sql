/* Create procedure that fill this column for all rows in the table with random number between 1000
and 10000 rounded up to two decimals. */

ALTER TABLE USER_NAMES
ADD SALARY NUMBER(5,2);

CREATE OR REPLACE PROCEDURE FILL_SALARY IS
BEGIN
  FOR I IN (SELECT * FROM TABLE_USER_NAMES
  LOOP
 UPDATE TABLE_USER_NAMES
    SET SALARY = ROUND(DBMS_RANDOM.VALUE(1000,10000),2)
    WHERE NAME = I.NAME AND SURNAME = I.SURNAME;
  END LOOP;
END;
/