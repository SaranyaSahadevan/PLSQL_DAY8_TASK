/* To create new procedure in package that generates/alters all tables created today. */
 

CREATE OR REPLACE PROCEDURE GENERATE_TABLES AS
BEGIN
  FOR I IN (SELECT * FROM USER_OBJECTS WHERE CREATED < SYSDATE)
  LOOP
    EXECUTE IMMEDIATE ('ALTER TABLE ' || I.OBJECT_NAME || ' ADD COLUMN SALARY NUMBER(5,2)');
  END LOOP;
END;
/
SELECT object_name, created FROM user_objects WHERE created < SYSDATE;