CREATE OR REPLACE FUNCTION OBTENER_SALARIO_TOTAL(codEmp EMPLOYEES.EMPLOYEE_ID%TYPE)
RETURN NUMBER
AS
    sal_total NUMBER;
BEGIN
    SELECT SALARY * (1 + NVL(COMMISSION_PCT, 0))
    INTO sal_total
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = codEmp;
    
    RETURN sal_total;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Empleado no existe');
        RETURN NULL;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Se ha producido un error');
        RETURN NULL;
END;

--PRUEBAS
--1) BLOQUE PL/SQL (function, procedure, anonimo)
DECLARE
    sal_total NUMBER;
BEGIN
    FOR codEmp IN 100..107 LOOP
        sal_total := OBTENER_SALARIO_TOTAL(codEmp);
        DBMS_OUTPUT.PUT_LINE('Salario de Emp. ' || codEmp || ' es ' || sal_total);
    END LOOP;
END;


--2) QUERY
SELECT EMPLOYEE_ID, SALARY, OBTENER_SALARIO_TOTAL(EMPLOYEE_ID)
FROM EMPLOYEES;



