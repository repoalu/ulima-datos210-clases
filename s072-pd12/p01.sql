CREATE OR REPLACE FUNCTION OBTENER_PERIMETRO(a NUMBER, b NUMBER, c NUMBER)
RETURN NUMBER AS
    perimetro NUMBER;
BEGIN
    perimetro := a + b + c;
    RETURN perimetro;
END;

DECLARE
    res NUMBER;
BEGIN
    res := OBTENER_PERIMETRO(3, 4, 5);
    DBMS_OUTPUT.PUT_LINE('Perimetro: ' || res);
END;