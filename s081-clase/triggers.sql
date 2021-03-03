--TRIGGERS
--CREACION DE TRIGGER (A NIVEL DE SENTENCIA)
CREATE OR REPLACE TRIGGER trigEmp
BEFORE INSERT OR UPDATE OR DELETE ON EMPLOYEES
BEGIN
    IF TO_CHAR(SYSDATE, 'D') IN (7, 1) 
        OR TO_CHAR(SYSDATE, 'hh24:mi') NOT BETWEEN '09:00' AND '18:00' THEN
        
        RAISE_APPLICATION_ERROR(-20100, 'Operacion no permitida en este horario');
    END IF;
END;


--TABLA DE AUDITORIA
CREATE TABLE EMP_AUDITORIA(
    TIPO_OPERACION VARCHAR2(10),
    COD_EMPLEADO NUMBER(6),
    SALARIO_ANTES NUMBER(8,2),
    SALARIO_DESPUES NUMBER(8,2),
    FECHA DATE,
    USUARIO VARCHAR2(30)
);

--CREACION DE TRIGGER (A NIVEL DE FILA)
CREATE OR REPLACE TRIGGER trigEmp2
AFTER DELETE OR INSERT OR UPDATE ON EMPLOYEES
FOR EACH ROW
DECLARE
    operacion VARCHAR2(10);
BEGIN
    IF DELETING THEN
        operacion := 'DELETE';
    ELSIF INSERTING THEN
        operacion := 'INSERT';
    ELSIF UPDATING THEN
        operacion := 'UPDATE';
    END IF;
    INSERT INTO EMP_AUDITORIA VALUES (operacion, :old.EMPLOYEE_ID,:old.SALARY, 
                                      :new.SALARY, SYSDATE, USER);
END;