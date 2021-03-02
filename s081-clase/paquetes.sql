--PACKAGE SPECIFICATION
CREATE OR REPLACE PACKAGE TRIANGULO IS
    FUNCTION OBTENER_PERIMETRO(a NUMBER, b NUMBER, c NUMBER)
    RETURN NUMBER;
    
    PROCEDURE OBTENER_TIPO_TRIANGULO(a NUMBER, b NUMBER, c NUMBER);    
END TRIANGULO;

--PACKAGE BODY
CREATE OR REPLACE PACKAGE BODY TRIANGULO IS
    FUNCTION OBTENER_PERIMETRO(a NUMBER, b NUMBER, c NUMBER)
    RETURN NUMBER AS
        perimetro NUMBER;
    BEGIN
        perimetro := a + b + c;
        RETURN perimetro;
    END OBTENER_PERIMETRO;


    PROCEDURE OBTENER_TIPO_TRIANGULO(a NUMBER, b NUMBER, c NUMBER)
    AS
    BEGIN
        IF a = b AND b = c THEN
            DBMS_OUTPUT.PUT_LINE('Es un triangulo equilatero');
        ELSIF a = b OR a = c OR b = c THEN
            DBMS_OUTPUT.PUT_LINE('Es un triangulo isosceles');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Es un triangulo escaleno');
        END IF;
    END OBTENER_TIPO_TRIANGULO;

END TRIANGULO;


BEGIN
    --LLAMADO A PROCEDURE
    OBTENER_TIPO_TRIANGULO(3, 4, 5);
    --LLAMADO A PROCEDURE EN PAQUETE
    TRIANGULO.OBTENER_TIPO_TRIANGULO(3, 4, 5);
END;
