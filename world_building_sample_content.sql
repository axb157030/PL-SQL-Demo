
CREATE OR REPLACE FUNCTION get_sample_category_description(p_name VARCHAR2)
RETURN CLOB IS
BEGIN
    CASE LOWER(p_name)
        WHEN 'characters' THEN
            RETURN 'Profiles, histories, and traits of individuals within the world.';
        WHEN 'geography' THEN
            RETURN 'Locations, landscapes, regions, and physical features of the world.';
        WHEN 'species' THEN
            RETURN 'Biological classifications, traits, and behaviors of living beings.';
        WHEN 'nations' THEN
            RETURN 'Political entities, cultures, governments, and societal structures.';
        WHEN 'systems' THEN
            RETURN 'technologies, economies, or rule‑based frameworks.';
        ELSE
            RETURN 'General world‑building information and thematic elements.';
    END CASE;
END;
/


CREATE OR REPLACE FUNCTION get_sample_article_summary(p_title VARCHAR2)
RETURN VARCHAR2 IS
BEGIN
    RETURN 'An overview of ' || LOWER(p_title) ||
           ', exploring its significance within the world.';
END;
/


CREATE OR REPLACE FUNCTION get_sample_section_content(
    p_section_title VARCHAR2,
    p_article_title VARCHAR2,
    p_summary       VARCHAR2
) RETURN CLOB IS
BEGIN
    RETURN
        'This section, "' || p_section_title || '", expands upon the article "' ||
        p_article_title || '". ' ||
        'The article summary notes: ' || p_summary || ' ' ||
        'Here, additional details are provided to deepen the understanding of this topic.';
END;
/




