create or replace FUNCTION GET_ID_STUDENTS
RETURN int
AUTHID DEFINER
AS
    v_id students_details.educational_identity%TYPE;
BEGIN
    IF (check_educational_identity(v_id) <> 0) THEN
      RETURN v_id;
      END IF;
    return -1;
END GET_ID_STUDENTS;