create or replace FUNCTION GET_ID_SCHOOL_TYPE
RETURN int
AUTHID DEFINER
AS
    v_id school_types.id%TYPE;
BEGIN
    SELECT
        NVL(MAX(id)+1,1)
    INTO
        v_id
    FROM school_types;

    RETURN v_id;
END GET_ID_SCHOOL_TYPE;
