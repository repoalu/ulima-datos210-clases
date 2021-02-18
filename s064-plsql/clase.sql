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

DECLARE
  nota1 NUMBER := 12;
  nota2 NUMBER := 16;
  promedio NUMBER;

BEGIN
  promedio := (nota1 + nota2) / 2;
  DBMS_OUTPUT.PUT_LINE('El promedio es: ' || promedio);
  IF promedio BETWEEN 17 AND 20 THEN
    DBMS_OUTPUT.PUT_LINE('Sobresaliente');
  ELSIF promedio >= 14 AND promedio < 17 THEN
    DBMS_OUTPUT.PUT_LINE('Bueno');
  ELSIF promedio >= 11 AND promedio < 14 THEN
    DBMS_OUTPUT.PUT_LINE('Aceptable');
  ELSIF promedio >= 0 AND PROMEDIO < 11 THEN
    DBMS_OUTPUT.PUT_LINE('Desaprobado');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Valor de notas incorrecto');
  END IF;
END;

--SQL Y PL/SQL
DECLARE 
	codigo EMPLOYEES.EMPLOYEE_ID%TYPE := 103;
	apellido EMPLOYEES.LAST_NAME%TYPE;
	salario EMPLOYEES.SALARY%TYPE;
	promedio EMPLOYEES.SALARY%TYPE;
BEGIN
    SELECT LAST_NAME, SALARY
    INTO apellido, salario
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = codigo;
    
	SELECT AVG(SALARY)
    INTO promedio
    FROM EMPLOYEES;
    
    DBMS_OUTPUT.PUT_LINE('Apellido: ' || apellido);
    DBMS_OUTPUT.PUT_LINE('Salario: ' || salario);
    DBMS_OUTPUT.PUT_LINE('Promedio de la empresa: ' || promedio);        
END;

--LOOP TRADICIONAL
DECLARE
    contador NUMBER := 0;
BEGIN
    LOOP
        contador := contador + 1;
        DBMS_OUTPUT.PUT_LINE('ALUMNO' || contador);
    EXIT WHEN contador = 100;
    END LOOP;
END;

--FOR LOOP
BEGIN
    FOR i IN 1..100 LOOP
        DBMS_OUTPUT.PUT_LINE('ALUMNO' || i);
    END LOOP;
END;

--FUNCIONES
CREATE OR REPLACE FUNCTION CALCULAR_SALARIO_TOTAL(codEmp EMPLOYEES.EMPLOYEE_ID%TYPE)
RETURN NUMBER AS
    total NUMBER;
BEGIN
    SELECT SALARY * (1 + NVL(COMMISSION_PCT, 0)) 
    INTO total
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = codEmp;
    
    RETURN total;
END;

--PRUEBA EN PROCEDURE
BEGIN
    FOR X IN 100..107 LOOP
        DBMS_OUTPUT.PUT_LINE(X || ': ' ||CALCULAR_SALARIO_TOTAL(X));
    END LOOP;
END;
    
--PRUEBA EN QUERY
SELECT LAST_NAME, CALCULAR_SALARIO_TOTAL(EMPLOYEE_ID)
FROM EMPLOYEES;
