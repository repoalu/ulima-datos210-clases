/*
SYSDATE: OBTIENE LA FECHA / HORA DEL SERVIDOR
USER: OBTIENE EL NOMBRE DEL USURIO LOGUEADO
*/
INSERT INTO ZIPCODE VALUES('90001', 'LOS ANGELES', 'CA', 'USER01', SYSDATE, USER, SYSDATE);
INSERT INTO ZIPCODE VALUES('91041', 'LOS ANGELES', 'CA', 'USER01', SYSDATE, USER, SYSDATE);
INSERT INTO ZIPCODE VALUES('33132', 'MIAMI', 'FL', 'USER01', SYSDATE, USER, SYSDATE);
INSERT INTO ZIPCODE VALUES('94305', 'STANFORD', 'CA', 'USER01', SYSDATE, USER, SYSDATE);

INSERT INTO STUDENT VALUES(100, 'MR.', 'JUAN', 'PEREZ', 'CALLE1 484', '90001', '958576775', 'FACEBOOK', SYSDATE, USER, SYSDATE, USER, SYSDATE);
INSERT INTO STUDENT VALUES(200, 'MISS.', 'JOHANA', 'RODRIGUEZ', 'CALLE2 685', '90001', '984758337', 'AMAZON', SYSDATE, USER, SYSDATE, USER, SYSDATE);
INSERT INTO STUDENT VALUES(300, 'MR.', 'PEDRO', 'VARGAS', 'CALLE3 999', '91041', '934758867', 'GOOGLE', SYSDATE, USER, SYSDATE, USER, SYSDATE);
INSERT INTO STUDENT VALUES(400, 'MRS.', 'KARINA', 'CESPEDES', 'CALLE11 746', '91041', '983745623', 'NETFLIX', SYSDATE, USER, SYSDATE, USER, SYSDATE);
INSERT INTO STUDENT VALUES(500, 'MR.', 'ALVARO', 'GONZALES', 'CALLE9 366', '94305', '964732134', 'AMAZON', SYSDATE, USER, SYSDATE, USER, SYSDATE);
INSERT INTO STUDENT VALUES(600, 'MRS.', 'MARIANA', 'MARTINEZ', 'CALLE8 766', '94305', '903857361', 'MICROSOFT', SYSDATE, USER, SYSDATE, USER, SYSDATE);

INSERT INTO INSTRUCTOR VALUES(201, 'DR.', 'ASHLEY', 'TAYLOR',  '450 Serra Mall', '94305', '985658663', USER, SYSDATE, USER, SYSDATE);
INSERT INTO INSTRUCTOR VALUES(202, 'DR.', 'ERIC', 'ROBERTS',  NULL, '94305', '623358956', USER, SYSDATE, USER, SYSDATE);
INSERT INTO INSTRUCTOR VALUES(203, 'MR.', 'JOHN', 'DOE',  '698 NE 1st Ave', '33132', '65895655', USER, SYSDATE, USER, SYSDATE);

INSERT INTO COURSE VALUES (101, 'INTRODUCTION TO COMPUTING AT STANFORD', 1000, NULL, USER, SYSDATE, USER, SYSDATE); 
INSERT INTO COURSE VALUES (102, 'PROGRAMMING ABSTRACTIONS (ACCELERATED)', 1000, NULL, USER, SYSDATE, USER, SYSDATE); 
INSERT INTO COURSE VALUES (105, 'LINEAR ALGEBRA', 1000, NULL, USER, SYSDATE, USER, SYSDATE); 
INSERT INTO COURSE VALUES (106, 'COMPUTER VISION: FOUNDATIONS AND APPLICATIONS', 1000, 105, USER, SYSDATE, USER, SYSDATE); 
INSERT INTO COURSE VALUES (103, 'MACHINE LEARNING', 1000, 106, USER, SYSDATE, USER, SYSDATE); 
INSERT INTO COURSE VALUES (107, 'MACHINE LEARNING II', 1000, 103, USER, SYSDATE, USER, SYSDATE); 
INSERT INTO COURSE VALUES (108, 'MACHINE LEARNING III', 1000, 107, USER, SYSDATE, USER, SYSDATE); 

INSERT INTO SECTION VALUES(1001, 101, 1, TO_DATE('10/13/2020', 'MM/DD/YYYY'), 'S4-156', 201, 40, USER, SYSDATE, USER, SYSDATE);
INSERT INTO SECTION VALUES(1002, 101, 2, TO_DATE('10/13/2020', 'MM/DD/YYYY'), 'S2-655', 201, 40, USER, SYSDATE, USER, SYSDATE);
INSERT INTO SECTION VALUES(1003, 102, 1, TO_DATE('10/13/2020', 'MM/DD/YYYY'), 'S6-458', 202, 40, USER, SYSDATE, USER, SYSDATE);
INSERT INTO SECTION VALUES(1004, 102, 2, TO_DATE('10/13/2020', 'MM/DD/YYYY'), 'S5-623', 202, 25, USER, SYSDATE, USER, SYSDATE);
INSERT INTO SECTION VALUES(1005, 105, 1, TO_DATE('10/13/2020', 'MM/DD/YYYY'), 'S1-825', 203, 30, USER, SYSDATE, USER, SYSDATE);

INSERT INTO ENROLLMENT VALUES(100, 1001, SYSDATE, 100, USER, SYSDATE, USER, SYSDATE);
INSERT INTO ENROLLMENT VALUES(100, 1003, SYSDATE, 88, USER, SYSDATE, USER, SYSDATE);
INSERT INTO ENROLLMENT VALUES(100, 1005, SYSDATE, 76, USER, SYSDATE, USER, SYSDATE);
INSERT INTO ENROLLMENT VALUES(200, 1002, SYSDATE, 90, USER, SYSDATE, USER, SYSDATE);
INSERT INTO ENROLLMENT VALUES(200, 1003, SYSDATE, 95, USER, SYSDATE, USER, SYSDATE);
INSERT INTO ENROLLMENT VALUES(200, 1005, SYSDATE, 77, USER, SYSDATE, USER, SYSDATE);
INSERT INTO ENROLLMENT VALUES(300, 1005, SYSDATE, 58, USER, SYSDATE, USER, SYSDATE);
INSERT INTO ENROLLMENT VALUES(400, 1005, SYSDATE, 66, USER, SYSDATE, USER, SYSDATE);

INSERT INTO GRADE_CONVERSION VALUES ('A', 4, 100, 70, 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO GRADE_CONVERSION VALUES ('B', 3, 69, 40, 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO GRADE_CONVERSION VALUES ('C', 2, 39, 10, 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
INSERT INTO GRADE_CONVERSION VALUES ('D', 1, 9, 0, 'ADMIN', SYSDATE, 'ADMIN', SYSDATE);
