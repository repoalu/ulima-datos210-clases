CREATE TABLE ZIPCODE(
ZIP VARCHAR2(5) PRIMARY KEY,
CITY VARCHAR2(25),
STATE VARCHAR2(2),
CREATED_BY VARCHAR2(30) NOT NULL,
CREATED_DATE VARCHAR2(30) NOT NULL,
MODIFIED_BY VARCHAR2(30) NOT NULL,
MODIFIED_DATE DATE NOT NULL
);

CREATE TABLE STUDENT(
STUDENT_ID NUMBER(8,0) PRIMARY KEY,
SALUTATION VARCHAR2(5),
FIRST_NAME VARCHAR2(25),
LAST_NAME VARCHAR2(25) NOT NULL,
STREET_ADDRESS VARCHAR2(50),
ZIP VARCHAR2(5) REFERENCES ZIPCODE NOT NULL,
PHONE VARCHAR2(15),
EMPLOYER VARCHAR2(50),
REGISTRATION_DATE DATE NOT NULL,
CREATED_BY VARCHAR2(30) NOT NULL,
CREATED_DATE VARCHAR2(30) NOT NULL,
MODIFIED_BY VARCHAR2(30) NOT NULL,
MODIFIED_DATE DATE NOT NULL
);

CREATE TABLE INSTRUCTOR(
INSTRUCTOR_ID NUMBER(8,0) PRIMARY KEY,
SALUTATION VARCHAR2(5),
FIRST_NAME VARCHAR2(25),
LAST_NAME VARCHAR2(25),
STREET_ADDRESS VARCHAR2(50),
ZIP VARCHAR2(5) REFERENCES ZIPCODE,
PHONE VARCHAR2(15),
CREATED_BY VARCHAR2(30) NOT NULL,
CREATED_DATE VARCHAR2(30) NOT NULL,
MODIFIED_BY VARCHAR2(30) NOT NULL,
MODIFIED_DATE DATE NOT NULL
);

/*
SE OBSERVA EN ESTA TABLA UNA RELACION RECURSIVA (SIMILAR A LA DE EMPLEADO - MANAGER)
CADA TUPLA DE CURSO SE RELACIONA A OTRA TUPLA DE CURSO QUE ES SU PRE-REQUISITO
PARA INDICAR ESA RELACION SOLAMENTE INCLUIIMOS "REFERENCES COURSE" EN EL CAMPO CORRESPONDIENTE
*/

CREATE TABLE COURSE(
COURSE_NO NUMBER(8,0) PRIMARY KEY,
DESCRIPTION VARCHAR2(50) NOT NULL,
COST NUMBER(9,2),
PREREQUISITE NUMBER(8,0) REFERENCES COURSE, --RELACION RECURSIVA
CREATED_BY VARCHAR2(30) NOT NULL,
CREATED_DATE VARCHAR2(30) NOT NULL,
MODIFIED_BY VARCHAR2(30) NOT NULL,
MODIFIED_DATE DATE NOT NULL
);

/*
OBSERVESE LO SIGUIENTE:
- SECIONT_ID: CODIGO QUE IDENTIFICA A LA SECCION (PK)
- COURSE_NO: FK QUE REFERENCIA A LA TABLA CURSO
*/

CREATE TABLE SECTION(
SECTION_ID NUMBER(8,0) PRIMARY KEY,
COURSE_NO NUMBER(8,0) NOT NULL REFERENCES COURSE,
SECTION_NO NUMBER(3,0) NOT NULL,
START_DATE_TIME DATE,
LOCATION VARCHAR2(50),
INSTRUCTOR_ID NUMBER(8,0) REFERENCES INSTRUCTOR,
CAPACITY NUMBER(3,0),
CREATED_BY VARCHAR2(30) NOT NULL,
CREATED_DATE VARCHAR2(30) NOT NULL,
MODIFIED_BY VARCHAR2(30) NOT NULL,
MODIFIED_DATE DATE NOT NULL
);

/*
OBSERVE QUE LA TABLA ENROLLMENT (MATRICULA) ES UNA TABLA ASOCIATIVA.
LA TABLA VINCULA SECTION Y STUDENT.
PARA PODER DEFINIR LAS RESTRICCIONES DEBEMOS HACER LOS SIGUIENTE:
- DEFINIR EL CAMPO STUDENT_ID COMO FK.
    STUDENT_ID NUMBER(8,0) REFERENCES STUDENT NOT NULL,
- DEFINIR EL CAMPO SECTION_ID COMO FK.
    SECTION_ID NUMBER(8,0) REFERENCES SECTION NOT NULL,
- DEFINIR COMO PK A LA COMPOSICION DE AMBOS CAMPOS.
    PRIMARY KEY(STUDENT_ID, SECTION_ID)
*/

CREATE TABLE ENROLLMENT(
STUDENT_ID NUMBER(8,0) REFERENCES STUDENT NOT NULL,
SECTION_ID NUMBER(8,0) REFERENCES SECTION NOT NULL,
ENROLL_DATE DATE NOT NULL,
FINAL_GRADE NUMBER(3,0),
CREATED_BY VARCHAR2(30) NOT NULL,
CREATED_DATE VARCHAR2(30) NOT NULL,
MODIFIED_BY VARCHAR2(30) NOT NULL,
MODIFIED_DATE DATE NOT NULL,
PRIMARY KEY(STUDENT_ID, SECTION_ID)
);

/*
OBSERVESE EL USO DE LA TABLA GRADE_CONVERSION:
ME AYUDARA A CONVERTIR LAS NOTAS FINALES EN ESCALA 1 - 100 (FINAL_GRADE) A LETRAS.
*/

CREATE TABLE GRADE_CONVERSION(
LETTER_GRADE VARCHAR2(2) PRIMARY KEY,
GRANDE_POINT NUMBER(3,2) NOT NULL,
MAX_GRADE NUMBER(3,0) NOT NULL,
MIN_GRADE NUMBER(3,0) NOT NULL,
CREATED_BY VARCHAR2(30) NOT NULL,
CREATE_DATE DATE NOT NULL,
MODIFIED_BY VARCHAR2(30) NOT NULL,
MODIFIED_DATE DATE NOT NULL
);

