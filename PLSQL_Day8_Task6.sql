/* To create package that stores both previously created procedures, move types to specification.
Create function that executes both previously created procedures sequentially and returns 1 if
there is no error, or 0 and Error code it there is any. */


CREATE OR REPLACE PACKAGE USER_NAMES_PACKAGE AS
  PROCEDURE FILL_SALARY;
END USER_NAMES_PACKAGE;
/

CREATE OR REPLACE PACKAGE BODY USER_NAMES_PACKAGE AS
  PROCEDURE FILL_SALARY IS
  BEGIN
    FOR I IN (SELECT * FROM USER_NAMES)
    LOOP
      UPDATE USER_NAMES
      SET SALARY = ROUND(DBMS_RANDOM.VALUE(1000,10000),2)
      WHERE NAME = I.NAME AND SURNAME = I.SURNAME;
    END LOOP;
  END;
END USER_NAMES_PACKAGE;
/

CREATE OR REPLACE FUNCTION EXECUTE_PROCEDURES
RETURN INTEGER
IS
  v_error_code INTEGER;
BEGIN
  USER_NAMES_PACKAGE.FILL_SALARY;
  IF SQL%ROWCOUNT = 0 THEN
    v_error_code := 0;
  ELSE
    v_error_code := 1;
  END IF;
  RETURN v_error_code;
END;
/

SELECT * FROM USER_NAMES;