CREATE OR REPLACE FUNCTION CHECK_ZIP_CODE 
(
  zipcode ZIP_CODES.zipcode%TYPE
) 
RETURN INT 
AUTHID CURRENT_USER
IS
    v_length int;
    v_i int;
    v_char CHAR;
BEGIN
    IF LENGTH(TRIM(zipcode)) <> 4 THEN
        RETURN 0;
    END IF;
      v_length := LENGTH(zipcode);
      v_i := 1;
    WHILE v_i <= v_length LOOP
        v_char := SUBSTR(zipcode,v_i,1);
        IF NOT (ASCII('0') <= ASCII(v_char) and ASCII(v_char) <= ASCII('9')) THEN
             RETURN 0;
        END IF;
    v_i:= v_i+1;
  END LOOP;
  RETURN 1;
END CHECK_ZIP_CODE;