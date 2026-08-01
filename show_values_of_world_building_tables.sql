
CREATE OR REPLACE PROCEDURE show_values_of_world_building_tables AS
BEGIN
    -- Display the values in the Categories and Articles tables
    DBMS_OUTPUT.PUT_LINE('Categories:');
    FOR rec IN (SELECT * FROM Categories) LOOP
        DBMS_OUTPUT.PUT_LINE(rec.position || '  ' || rec.name || ': ' || rec.description);
    END LOOP;
    -- Display the values in the Articles table
    DBMS_OUTPUT.PUT_LINE('Articles:');
    FOR rec IN (SELECT * FROM Articles) LOOP
        DBMS_OUTPUT.PUT_LINE(rec.position || '  ' || rec.title || ': ' || rec.summary);
    END LOOP;
    -- Display the values in the Sections table. 
    DBMS_OUTPUT.PUT_LINE('Sections:');
    FOR rec IN (SELECT * FROM Sections) LOOP
        DBMS_OUTPUT.PUT_LINE(rec.position || '  ' || rec.title || ': ' || rec.content);
    END LOOP;
END;
/