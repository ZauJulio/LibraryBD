CREATE SCHEMA db_library
	CHARACTER SET 'utf8'
    COLLATE 'utf8_unicode_ci';

use db_library;
SET time_zone = 'UTC';

CREATE TABLE author (
    id NUMERIC PRIMARY KEY NOT NULL,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE gender (
    id NUMERIC PRIMARY KEY NOT NULL,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE publisher (
    id NUMERIC PRIMARY KEY NOT NULL,
    name VARCHAR(100) NOT NULL,
    cnpj VARCHAR(14) NOT NULL,
    telephone VARCHAR(16) NOT NULL,
    email VARCHAR(256) NOT NULL
);

CREATE TABLE book (
    id NUMERIC PRIMARY KEY NOT NULL,
    author NUMERIC NOT NULL,
    publisher NUMERIC NOT NULL,
    isbn NUMERIC NOT NULL,
    unity BIGINT NOT NULL,
    title VARCHAR(100) NOT NULL,
    subtitle VARCHAR(50) NOT NULL,
    status NUMERIC NOT NULL,
    gender NUMERIC NOT NULL,
    CONSTRAINT fk_book_gender FOREIGN KEY (gender)
        REFERENCES Gender (id),
    CONSTRAINT fk_book_author FOREIGN KEY (author)
        REFERENCES Author (id),
    CONSTRAINT fk_book_publisher FOREIGN KEY (publisher)
        REFERENCES Publisher (id)
);

CREATE TABLE functionary (
    id NUMERIC PRIMARY KEY NOT NULL,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE operation (
    id NUMERIC PRIMARY KEY NOT NULL,
    functionary NUMERIC NOT NULL,
    day NUMERIC NOT NULL,
    horary_start TIME NOT NULL,
    horary_end TIME NOT NULL,
    workload NUMERIC NOT NULL,
    CONSTRAINT fk_operation_functionary FOREIGN KEY (functionary)
        REFERENCES Functionary (id)
);

CREATE TABLE loan (
    id NUMERIC PRIMARY KEY NOT NULL,
    deadline DATE NOT NULL,
    expedition DATE NOT NULL,
    book NUMERIC NOT NULL,
    CONSTRAINT fk_loan_book FOREIGN KEY (book)
        REFERENCES Book (id)
);


CREATE TABLE address (
    id NUMERIC PRIMARY KEY NOT NULL,
    street VARCHAR(50) NOT NULL,
    neighborhood VARCHAR(50),
    zipcode NUMERIC NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(5) NOT NULL,
    country VARCHAR(50) NOT NULL,
    number NUMERIC NOT NULL
);

CREATE TABLE user (
    id NUMERIC PRIMARY KEY NOT NULL,
    username NUMERIC NOT NULL,
    name VARCHAR(100) NOT NULL,
    registration NUMERIC AUTO_INCREMENT NOT NULL,
    telephone VARCHAR(14) NOT NULL,
    email VARCHAR(256) NOT NULL,
    password VARCHAR(32) NOT NULL,
    status NUMERIC NOT NULL,
    loan NUMERIC NOT NULL,
    address NUMERIC NOT NULL,
    CONSTRAINT fk_user_loan FOREIGN KEY (loan)
        REFERENCES Loan (id),
    CONSTRAINT fk_user_address FOREIGN KEY (address)
        REFERENCES Address (id)
);

CREATE TABLE category (
    id NUMERIC PRIMARY KEY NOT NULL,
    name VARCHAR(100) NOT NULL,
    CONSTRAINT fk_category_book FOREIGN KEY (id)
        REFERENCES Book (id)
);

CREATE TABLE session (
    id NUMERIC PRIMARY KEY NOT NULL,
    name VARCHAR(100) NOT NULL,
    CONSTRAINT fk_session_category FOREIGN KEY (id)
        REFERENCES Category (id)
);

CREATE TABLE library (
    id NUMERIC PRIMARY KEY NOT NULL,
    CONSTRAINT fk_library_operation FOREIGN KEY (id)
        REFERENCES Operation (id),
    CONSTRAINT fk_library_user FOREIGN KEY (id)
        REFERENCES User (id),
    CONSTRAINT fk_library_session FOREIGN KEY (id)
        REFERENCES Session (id)
);


INSERT INTO author(id, name)
  VALUES
    (NULL, "João"),
    (NULL, "Maria"),
    (NULL, "Pedro"),
    (NULL, "Júlio"),
    (NULL, "Emanuel");

INSERT INTO gender(id, name)
  VALUES
    (NULL, "Ação"),
    (NULL, "Filosofia"),
    (NULL, "Fantasia"),
    (NULL, "Matemática"),
    (NULL, "Aventura");

INSERT INTO publisher(id, name, cnpj, telephone, email)
  VALUES
    (NULL, "Iluz", "65.500.846/0001-36","(84)2344-3443", "iluz@edt.com"),
    (NULL, "PubEdit", "79.985.005/0001-70","(84)6453-4543", "pubEdit@gmail.com"),
    (NULL, "Kabum", "70.067.312/0001-06","(84)5329-3783", "kabum@hyper.com"),
    (NULL, "Porto", "17.508.480/0001-07","(84)0993-3443", "porto@uol.com"),
    (NULL, "Mega", "65.202.121/0001-61","(84)4928-1243", "mega@mega.editor.com");

INSERT INTO book(id, author, publisher, isbn, unity, title, subtitle, status, gender)
  VALUES
    (NULL, 1, 3, 9788541106993, 1, "Aleatório", NULL, 0, 1),
    (NULL, 2, 2, 7968525816632, 1, "História é tudo que me deixou", NULL, 0, 2),
    (NULL, 2, 4, 8373571800587, 1, "Vermelho, Branco e Sangue Azul", NULL, 0, 3),
    (NULL, 3, 1, 5614827216374, 1, "15 Dias", NULL, 0, 4),
    (NULL, 4, 5, 2125251257992, 1, "Entre o Céu e o Inferno", NULL, 0, 5);

INSERT INTO functionary(id, name)
  VALUES
    (NULL, "Gustavo"),
    (NULL, "Augusto"),
    (NULL, "Xuxa"),
    (NULL, "Mário"),
    (NULL, "Sonic");

INSERT INTO operation(id, functionary, day, horary_start, horary_end, workload)
  VALUES
    (NULL, 1, 0,"08:00:00", "18:00:00", 50),
    (NULL, 2, 0,"08:00:00", "12:00:00", 20),
    (NULL, 3, 0,"08:00:00", "13:00:00", 25),
    (NULL, 4, 0,"08:00:00", "18:00:00", 50),
    (NULL, 5, 0,"08:00:00", "17:00:00", 45);

INSERT INTO author(id, name)
  VALUES
    (NULL, "João"),
    (NULL, "Maria"),
    (NULL, "Pedro"),
    (NULL, "Júlio"),
    (NULL, "Emanuel");

INSERT INTO loan(id, deadline, expedition, book)
  VALUES
    (NULL, "2021-03-17", "2021-04-17", 1),
    (NULL, "2021-01-17", "2021-02-17", 2),
    (NULL, "2021-04-20", "2021-05-20", 3),
    (NULL, "2022-01-17", "2021-01-17", 4),
    (NULL, "2021-02-01", "2021-03-01", 5);

INSERT INTO address(id, street, neighborhood, zipcode, city, state, country, number)
  VALUES
    (NULL, "Rua João Pedro", NULL, 59300000, "Caíco", "RN", "Brasil", 35),
    (NULL, "Av Pedro Augosto", NULL, 39840923, "João Pessoa", "PB", "Brasil", 64),
    (NULL, "Rua Roraraima Braga", NULL, 56632236, "Bentinho", "RS", "Brasil", 5643),
    (NULL, "Av Júlio César", NULL, 62353000, "São Paulo", "SP", "Brasil", 543),
    (NULL, "Rua João Gomes", NULL, 24323674, "Natal", "RN", "Brasil", 85);

INSERT INTO user(id, username, name, registration, telephone, email, password, status, loan, address)
  VALUES
    (NULL, "joazinho", "João Alvez", NULL, "(23)3592-5213", "joaozinho@gmail.com" "2941ehijd1", 0, 0, 0);
    (NULL, "pedrinho", "Pedro Gomes", NULL, "(23)4398-5533", "pedrinho@gmail.com" "t3ccr2x", 0, 1, 1);
    (NULL, "amemIrmao", "Maria Silva", NULL, "(23)3492-6713", "amemIrmao@gmail.com" "3v4c2x", 0, 2, 2);
    (NULL, "davi22", "Bruno Costa", NULL, "(23)9562-5273", "davi22@gmail.com" "5b2vc52", 0, 3, 3);
    (NULL, "megaVic", "Victor Luiz", NULL, "(23)3652-4533", "megaVic@gmail.com" "senha", 0, 4, 4);
    (NULL, "carolzinha", "Carol Konká", NULL, "(23)3242-5621", "carolzinha@gmail.com" "42525", 0, 5, 5);


SELECT * FROM book, author, gender, publisher, functionary, operation, loan, address, user;
