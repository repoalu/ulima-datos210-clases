CREATE OR REPLACE PROCEDURE MOSTRAR_REPORTE(codRegion REGIONS.REGION_ID%TYPE)
AS
    CURSOR curPaises IS
        SELECT * FROM COUNTRIES WHERE REGION_ID = codRegion;
    
    CURSOR curOficinas(codPais COUNTRIES.COUNTRY_ID%TYPE) IS
        SELECT * FROM LOCATIONS WHERE COUNTRY_ID = codPais;
BEGIN
    FOR pais IN curPaises LOOP
        DBMS_OUTPUT.PUT_LINE(pais.COUNTRY_NAME);
        DBMS_OUTPUT.PUT_LINE('******************');
        FOR oficina IN curOficinas(pais.COUNTRY_ID) LOOP
            DBMS_OUTPUT.PUT_LINE('- ' || oficina.CITY);
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('******************');
    END LOOP;
END;

--PRUEBAS
BEGIN
    MOSTRAR_REPORTE(2);
END;

