--SELECCION
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, PHONE_NUMBER
FROM EMPLOYEES;

--USO DE DISTINCT
SELECT DISTINCT DEPARTMENT_ID FROM EMPLOYEES;

--RELACION RECURSIVA: MANAGER_ID
SELECT * FROM EMPLOYEES
WHERE EMPLOYEE_ID = 101
UNION
SELECT * FROM EMPLOYEES 
WHERE EMPLOYEE_ID = 100;

--CONCATENACION
SELECT FIRST_NAME || ' ' || LAST_NAME AS NOMBRE_COMPLETO 
FROM EMPLOYEES;

SELECT LAST_NAME || ' gana ' || SALARY AS "TEXTO DE PRUEBA"
FROM EMPLOYEES;

--EMPLEADOS CON SALARIO EN EL INTERVALO [4000, 8000>
SELECT * FROM EMPLOYEES
WHERE SALARY >= 4000
AND SALARY < 8000;

--EMPLEADOS CON SALARIO EN EL INTERVALO [10000, 15000]
SELECT * FROM EMPLOYEES
WHERE SALARY BETWEEN 10000 AND 15000;

--EMPLEADOS QUE NO PERTENEZCAN AL DEPARTAMENTO 50
SELECT * FROM EMPLOYEES
WHERE DEPARTMENT_ID <> 50;

--EMPLEADOS QUE GANAN COMISION
SELECT * FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL;

--MUESTRE AQUELLOS EMPLEADOS QUE TRABAJAN EN LOS DEPARTAMENTOS 40 Y 60
SELECT * FROM EMPLOYEES
WHERE DEPARTMENT_ID = 40
OR DEPARTMENT_ID = 60;

--MUESTRE AQUELLOS EMPLEADOS QUE TRABAJAN EN LOS DEPARTAMENTOS 10, 20, 50, 60 Y 70
SELECT * FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (10, 20, 50, 60, 70);

--MUESTRE AQUELLOS EMPLEADOS CUYO APELLIDO EMPIECE CON "J"
SELECT * FROM EMPLOYEES 
WHERE LAST_NAME LIKE 'J%';

--MUESTRE AQUELLOS EMPLEADOS CUYO APELLIDO TERMINO CON "son"
SELECT * FROM EMPLOYEES
WHERE LAST_NAME LIKE '%son';

--MUESTRE LOS EMPLEADOS CUYA SEGUNDA LETRA DEL NOMBRE SEA "o"
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE '_o%';

--MUESTRE LOS EMPLEADOS CUYA SEGUNDA LETRA DEL NOMBRE SEA "o" Y LA QUINTA "l"
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE '_o__l%';

--MUESTRE EL NOMBRE COMPLETO DEL EMPLEADO EN MAYUSCULAS
SELECT UPPER(FIRST_NAME || ' ' || LAST_NAME) AS FULL_NAME
FROM EMPLOYEES;

--EMPLEADOS CUYO APELLIDO TENGA MAS DE 8 LETRAS
SELECT *
FROM EMPLOYEES
WHERE LENGTH(LAST_NAME) > 8;

--MUESTRE EL CODIGO DE EMPLEADO CON 8 DIGITOS COMPLETADOS CON CERO A LA IZQUIERDA
SELECT LPAD(EMPLOYEE_ID, 6, '0')
FROM EMPLOYEES;

--MUESTRE EL SALARIO MENSUAL DEL EMPLEADO REDONDEADO
SELECT LAST_NAME, ROUND(SALARY / 12)
FROM EMPLOYEES;

--MUESTRE EL SALARIO MENSUAL DEL EMPLEADO TRUNCADO A 2 DECIMALES
SELECT LAST_NAME, TRUNC(SALARY / 12, 2)
FROM EMPLOYEES;

--DIFERENCIA ENTRE ROUND Y TRUNC
SELECT ROUND(100.666, 2) FROM DUAL;
SELECT TRUNC(100.666, 2) FROM DUAL;
