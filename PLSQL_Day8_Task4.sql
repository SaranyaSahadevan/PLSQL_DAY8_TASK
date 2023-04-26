  /* To create table that hold name and surname values. */
  
 CREATE TABLE USER_NAMES (
NAME VARCHAR2(50),
SURNAME VARCHAR2(50)
);
 
  
 /* To Create varray of random names and surnames from:
https://www.randomlists.com/random-names?qty=10 */
  
  
 DECLARE
  TYPE names_list IS VARRAY(10) OF VARCHAR2(50);
  names_list_var names_list := names_list('Cayden Mason','Samson Roman','Dayana Levy','Alexandria Watson','Matilda Wiley','Walker Wilson','Luciano Chen','Walker Haley','Vivian Mora','Bridget Leach');
BEGIN
  FOR i IN 1..names_list_var.COUNT
  LOOP
    INSERT INTO USER_NAMES(NAME, SURNAME)
    VALUES(SUBSTR(names_list_var(i),1,INSTR(names_list_var(i),' ')-1),SUBSTR(names_list_var(i),INSTR(names_list_var(i),' ')+1));
  END LOOP;
END;
/
SELECT NAME, SURNAME FROM USER_NAMES;

