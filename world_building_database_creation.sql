
CREATE TABLE Categories (
    category_id RAW(16) PRIMARY KEY,
    name VARCHAR2(100) UNIQUE NOT NULL,
    description CLOB,
    position NUMBER NOT NULL -- ordering of Categories
);

CREATE TABLE Articles (
    article_id RAW(16) PRIMARY KEY,
    title VARCHAR2(255) NOT NULL,
    summary CLOB,
    category_id RAW(16),
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    position NUMBER NOT NULL,
    CONSTRAINT fk_category
        FOREIGN KEY (category_id)
        REFERENCES Categories(category_id)
);

CREATE TABLE Sections (
    section_id RAW(16) PRIMARY KEY,
    article_id RAW(16) NOT NULL,
    title VARCHAR2(255) NOT NULL,
    content CLOB,
    position NUMBER NOT NULL, 
    FOREIGN KEY (article_id) REFERENCES Articles(article_id)
);



