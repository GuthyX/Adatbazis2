create or replace FUNCTION CHECK_EDUCATIONAL_IDENTITY 
(
  EI_szam students_details.educational_identity%TYPE
) 
RETURN INT 
AUTHID CURRENT_USER
IS
    v_length int;
    v_i int;
    v_char CHAR;
BEGIN
    /* Az oktatási azonosító 11 számból áll*/
  IF LENGTH(TRIM(EI_szam)) <> 11 THEN
        RETURN 0;
  END IF;
  v_length := LENGTH(EI_szam);
  v_i := 1;
  WHILE v_i <= v_length LOOP
    v_char:=SUBSTR(EI_szam,v_i,1); /*Ki szedi azt a karaktert ahol pont járunk a v_i változóval*/
    IF NOT (ASCII('0') <= ASCII(v_char) and ASCII(v_char) <= ASCII('9')) THEN
        RETURN 0;
    END IF;
    v_i:= v_i+1;
  END LOOP;
  RETURN 1;
END CHECK_EDUCATIONAL_IDENTITY;