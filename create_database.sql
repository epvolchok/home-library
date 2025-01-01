CREATE DATABASE db_home_library;

USE db_home_library;

CREATE TABLE books
(
    id_book INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    book_title VARCHAR(255) NOT NULL,
    publication_year YEAR NOT NULL
);

CREATE TABLE authors
(
    id_author INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(50) NOT NULL
);

CREATE TABLE book_author
( 
    id_book INT NOT NULL,
    FOREIGN KEY (id_book)
    REFERENCES books(id_book),
    id_author INT NOT NULL,
    FOREIGN KEY (id_author)
    REFERENCES authors(id_author),
    PRIMARY KEY(id_author, id_book)
);

CREATE TABLE isbns
(
    id_isbn INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_book INT NOT NULL,
    FOREIGN KEY (id_book)
    REFERENCES books(id_book),
    isbn INT(13) NOT NULL
);

CREATE TABLE category
(
    id_category INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    category VARCHAR(30) NOT NULL
);

CREATE TABLE book_category
(
    id_book INT NOT NULL,
    FOREIGN KEY (id_book)
    REFERENCES books(id_book),
    id_category INT NOT NULL,
    FOREIGN KEY (id_category)
    REFERENCES category(id_category),
    PRIMARY KEY(id_book, id_category)
);

CREATE TABLE publisher
(
    id_pub INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    pub_name VARCHAR(20) NOT NULL,
    city_country VARCHAR(20)
);

CREATE TABLE book_pubs
(
    id_book INT NOT NULL,
    FOREIGN KEY (id_book)
    REFERENCES books(id_book),
    id_pub INT NOT NULL,
    FOREIGN KEY (id_pub)
    REFERENCES publisher(id_pub),
    PRIMARY KEY(id_book, id_pub)
);