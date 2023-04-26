/* Create new procedure in package that drops all objects created today. (e.g. tables, standalone procedures
and functions, excluding current package where drop procedure will be created). */


set serveroutput on
CREATE OR REPLACE PROCEDURE DROP_OBJECTS AS
BEGIN
  FOR I IN (SELECT * FROM USER_OBJECTS WHERE CREATED < SYSDATE)
  LOOP
    EXECUTE IMMEDIATE ('DROP ' || I.OBJECT_TYPE || ' ' || I.OBJECT_NAME);
    DBMS_OUTPUT.PUT_LINE(I.OBJECT_TYPE || ' ' || I.OBJECT_NAME || ' DROPPED');
  END LOOP;
END;
/

