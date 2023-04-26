/* To create function that calculates average grade of a student without utilizing SQL
functions (SUM/AVG). Input variable student id, output variable grade. Utilize this
function in select. */

SET SERVEROUTPUT ON
CREATE OR REPLACE FUNCTION calc_avg_grade (p_student_id NUMBER)
RETURN NUMBER
IS
  l_count INTEGER := 0;
  l_total NUMBER := 0;
  l_avg NUMBER;
BEGIN
  FOR c IN (SELECT test_grade
              FROM Teacher_1.Student_grade
             WHERE student_id = p_student_id)
  LOOP
    l_total := l_total + c.test_grade;
    l_count := l_count + 1;
  END LOOP;

  l_avg := l_total / l_count;
  RETURN ROUND(l_avg,2);
END;
/

SELECT calc_avg_grade(student_id)
  FROM Teacher_1.Student_grade;