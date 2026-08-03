
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
    -- Display the values in the Sections table. D
    DBMS_OUTPUT.PUT_LINE('Sections:');
    FOR rec IN (SELECT * FROM Sections) LOOP
        DBMS_OUTPUT.PUT_LINE(rec.position || '  ' || rec.title || ': ' || rec.content);
    END LOOP;
END;
/

CREATE OR REPLACE PROCEDURE show_values_of_world_building_tables_in_detail AS
v_count NUMBER;
BEGIN
    -- Display the values in the Categories and Articles tables
    DBMS_OUTPUT.PUT_LINE('Categories:');
    SELECT COUNT(*) INTO v_count FROM Categories;
    DBMS_OUTPUT.PUT_LINE('Categories Count: ' || v_count);

    FOR rec IN (SELECT * FROM Categories) LOOP
        DBMS_OUTPUT.PUT_LINE('ID: ' || rec.category_id || ', Name: ' || rec.name || ', Description: ' || rec.description || ', Position: ' || rec.position);
    END LOOP;
    -- Display the values in the Articles table
    DBMS_OUTPUT.PUT_LINE('Articles:');
    SELECT COUNT(*) INTO v_count FROM Articles;
    DBMS_OUTPUT.PUT_LINE('Articles Count: ' || v_count);

    FOR rec IN (SELECT * FROM Articles) LOOP
        DBMS_OUTPUT.PUT_LINE('ID: ' || rec.article_id || ', Title: ' || rec.title || ', Summary: ' || rec.summary || ', Category ID: ' || rec.category_id || ', Position: ' || rec.position);
    END LOOP;
    -- Display the values in the Sections table. 
    DBMS_OUTPUT.PUT_LINE('Sections:');
    SELECT COUNT(*) INTO v_count FROM Sections;
    DBMS_OUTPUT.PUT_LINE('Sections Count: ' || v_count);

    FOR rec IN (SELECT * FROM Sections) LOOP
        DBMS_OUTPUT.PUT_LINE('ID: ' || rec.section_id || ', Article ID: ' || rec.article_id || ', Title: ' || rec.title || ', Content: ' || rec.content || ', Position: ' || rec.position);
    END LOOP;
END;
/