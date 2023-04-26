/* Create procedure that utilizes previous tasks function to generate
result based on class number. Print this result out for all students in
certain class. */

CREATE OR REPLACE PROCEDURE print_avg_grades (p_class_number NUMBER)
AS
  l_student_id NUMBER;
  l_first_name VARCHAR2(30);
  l_last_name VARCHAR2(30);
  l_class_number NUMBER;
  l_avg_grade NUMBER;
BEGIN
  FOR c IN (SELECT s.student_id, s.first_name, s.last_name, s.study_class
              FROM Teacher_1.Student s
             WHERE s.study_class = p_class_number)
  LOOP
    l_student_id := c.student_id;
    l_first_name := c.first_name;
    l_last_name := c.last_name;
    l_class_number := c.study_class;
    l_avg_grade := calc_avg_grade(l_student_id);
    dbms_output.put_line('Student ID: ' || l_student_id || ' | ' ||
                         'Name: ' || l_first_name || ' ' || l_last_name || ' | ' ||
                         'Class: ' || l_class_number || ' | ' ||
                         'Average Grade: ' || l_avg_grade);
  END LOOP;
END;
/

EXECUTE print_avg_grades(1);