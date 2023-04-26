/* To adjust procedure to work with any number (not only 128) as an input parameter. Add an error 
handling if number is not dividable by 2. */

SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE divide_num (p_num IN NUMBER) 
AS 
   l_num NUMBER := p_num; 
BEGIN 
   IF MOD(l_num,2) <> 0 THEN
      RAISE_APPLICATION_ERROR(-20000, 'Error: number is not dividable by 2');
   ELSE
      WHILE l_num > 1 LOOP 
         DBMS_OUTPUT.PUT_LINE(l_num || ' divided by 2 is ' || l_num / 2); 
         l_num := l_num / 2; 
      END LOOP; 
   END IF;
END;
/
EXECUTE divide_num(4);