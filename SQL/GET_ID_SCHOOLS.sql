create or replace FUNCTION GET_ID_SCHOOLS
RETURN int
AUTHID DEFINER
AS
    v_id schools.school_id%TYPE;
BEGIN
    SELECT
        NVL(MAX(school_id)+1,1)
    INTO
        v_id
    FROM schools;

    RETURN v_id;
END GET_ID_SCHOOLS;