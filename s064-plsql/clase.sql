SET SERVEROUTPUT ON

BEGIN
    DBMS_OUTPUT.PUT_LINE('Hola mundo');
    DBMS_OUTPUT.PUT_LINE('Hola Peru');
END;

DECLARE
    a NUMBER := 10;
    b NUMBER := 13;
    suma NUMBER;
BEGIN
    suma := a + b;
    DBMS_OUTPUT.PUT_LINE('La suma es ' || suma);
    
    IF suma > 20 THEN
        DBMS_OUTPUT.PUT_LINE('La suma es mayor que 20');
    END IF;
END;
