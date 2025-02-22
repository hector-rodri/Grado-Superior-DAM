CREATE TABLE ALUMNE(
    DNI VARCHAR2(9) PRIMARY KEY,
    nom varchar2(50),
    llinatge1 varchar2(50),
    llinatge2 varchar2(50),
    email varchar2(50)
);

CREATE TABLE PROFESSOR(
    DNI VARCHAR2(9) PRIMARY KEY,
    nom VARCHAR2(50),
    llinatge1 VARCHAR2(50),
    llinatge2 VARCHAR2(50),
    email VARCHAR2(50),
	salari NUMBER
);

CREATE TABLE GRAU(
    ID NUMBER GENERATED AS IDENTITY PRIMARY KEY,
    nom VARCHAR2(50),
    cursos NUMBER
);

CREATE TABLE ASSIGNATURA(
    ID NUMBER GENERATED AS IDENTITY PRIMARY KEY,
    nom VARCHAR2(50),
    id_grau NUMBER,
    pla NUMBER(4),
    dni_professor VARCHAR2(9),
    credits_ects NUMBER(2,0) DEFAULT 6,
    FOREIGN KEY (dni_professor) REFERENCES PROFESSOR(DNI),
    FOREIGN KEY (id_grau) REFERENCES GRAU(ID)
);

CREATE TABLE NOTA(
    ID NUMBER GENERATED AS IDENTITY PRIMARY KEY,
    dni_alumne VARCHAR2(9),
    ID_assignatura NUMBER,
    convocatoria NUMBER(4),
    nota NUMBER,
    FOREIGN KEY (ID_assignatura) REFERENCES ASSIGNATURA(ID),
    FOREIGN KEY (dni_alumne) REFERENCES ALUMNE(DNI),
    UNIQUE(dni_alumne, ID_assignatura, convocatoria)
);

--DADES
-- Inserció d'alumnes
INSERT INTO ALUMNE (DNI, nom, llinatge1, llinatge2, email) VALUES ('12345678A', 'Laura', 'Martí', 'Soler', 'laura.marti@example.com');
INSERT INTO ALUMNE (DNI, nom, llinatge1, llinatge2, email) VALUES ('23456789B', 'Marc', 'Garcia', 'López', 'marc.garcia@example.com');
INSERT INTO ALUMNE (DNI, nom, llinatge1, llinatge2, email) VALUES ('34567890C', 'Anna', 'Puig', 'Casas', 'anna.puig@example.com');
INSERT INTO ALUMNE (DNI, nom, llinatge1, llinatge2, email) VALUES ('45678901D', 'David', 'Ferrer', 'Prat', 'david.ferrer@example.com');
INSERT INTO ALUMNE (DNI, nom, llinatge1, llinatge2, email) VALUES ('56789012E', 'Sara', 'Navarro', 'Vidal', 'sara.navarro@example.com');
INSERT INTO ALUMNE (DNI, nom, llinatge1, llinatge2, email) VALUES ('67890123F', 'Oriol', 'González', 'Moreno', 'oriol.gonzalez@example.com');
INSERT INTO ALUMNE (DNI, nom, llinatge1, llinatge2, email) VALUES ('78901234G', 'Clara', 'Sánchez', 'Molina', 'clara.sanchez@example.com');
INSERT INTO ALUMNE (DNI, nom, llinatge1, llinatge2, email) VALUES ('89012345H', 'Jordi', 'Ruiz', 'Dominguez', 'jordi.ruiz@example.com');
INSERT INTO ALUMNE (DNI, nom, llinatge1, llinatge2, email) VALUES ('90123456I', 'Mireia', 'Blanco', 'Torres', 'mireia.blanco@example.com');
INSERT INTO ALUMNE (DNI, nom, llinatge1, llinatge2, email) VALUES ('01234567J', 'Pau', 'Ortega', 'Castro', 'pau.ortega@example.com');

-- Inserció de professors
INSERT INTO PROFESSOR (DNI, nom, llinatge1, llinatge2, email, salari) VALUES ('11223344L', 'Elena', 'Gil', 'Rodríguez', 'elena.gil@example.com', 30000);
INSERT INTO PROFESSOR (DNI, nom, llinatge1, llinatge2, email, salari) VALUES ('22334455M', 'Carlos', 'López', 'Jiménez', 'carlos.lopez@example.com', 31000);
INSERT INTO PROFESSOR (DNI, nom, llinatge1, llinatge2, email, salari) VALUES ('33445566N', 'Patricia', 'Martín', 'Pérez', 'patricia.martin@example.com', 32000);
INSERT INTO PROFESSOR (DNI, nom, llinatge1, llinatge2, email, salari) VALUES ('44556677O', 'Francisco', 'García', 'Sánchez', 'francisco.garcia@example.com', 28000);
INSERT INTO PROFESSOR (DNI, nom, llinatge1, llinatge2, email, salari) VALUES ('55667788P', 'Susana', 'Fernández', 'González', 'susana.fernandez@example.com', 26000);
INSERT INTO PROFESSOR (DNI, nom, llinatge1, llinatge2, email, salari) VALUES ('66778899Q', 'Luis', 'Álvarez', 'Gómez', 'luis.alvarez@example.com', 22000);
INSERT INTO PROFESSOR (DNI, nom, llinatge1, llinatge2, email, salari) VALUES ('77889900R', 'Carmen', 'Moreno', 'Ruiz', 'carmen.moreno@example.com', 40000);
INSERT INTO PROFESSOR (DNI, nom, llinatge1, llinatge2, email, salari) VALUES ('88990011S', 'Antonio', 'Navarro', 'Lorenzo', 'antonio.navarro@example.com', 33000);
INSERT INTO PROFESSOR (DNI, nom, llinatge1, llinatge2, email, salari) VALUES ('99001122T', 'Isabel', 'Serra', 'Miralles', 'isabel.serra@example.com', 32000);
INSERT INTO PROFESSOR (DNI, nom, llinatge1, llinatge2, email, salari) VALUES ('00112233U', 'Josep', 'Torres', 'Silva', 'josep.torres@example.com', 29000);

-- Inserció de graus
INSERT INTO GRAU (nom, cursos) VALUES ('Psicologia', 4);
INSERT INTO GRAU (nom, cursos) VALUES ('Dret', 4);
INSERT INTO GRAU (nom, cursos) VALUES ('Medicina', 6);
INSERT INTO GRAU (nom, cursos) VALUES ('Arquitectura', 5);
INSERT INTO GRAU (nom, cursos) VALUES ('Filologia Anglesa', 4);
INSERT INTO GRAU (nom, cursos) VALUES ('Ciències Polítiques', 4);
INSERT INTO GRAU (nom, cursos) VALUES ('Matemàtiques', 4);
INSERT INTO GRAU (nom, cursos) VALUES ('Informàtica', 4);
INSERT INTO GRAU (nom, cursos) VALUES ('Física', 4);

-- Inserció d'assignatures
INSERT INTO ASSIGNATURA (nom, id_grau, pla, dni_professor) VALUES ('Història de la Psicologia', 1, 2019, '11223344L');
INSERT INTO ASSIGNATURA (nom, id_grau, pla, dni_professor) VALUES ('Dret Constitucional', 2, 2024, '22334455M');
INSERT INTO ASSIGNATURA (nom, id_grau, pla, dni_professor) VALUES ('Anatomia Humana', 3, 2024, '33445566N');
INSERT INTO ASSIGNATURA (nom, id_grau, pla, dni_professor) VALUES ('Disseny Arquitectònic', 4, 2023, '44556677O');
INSERT INTO ASSIGNATURA (nom, id_grau, pla, dni_professor) VALUES ('Literatura Anglesa', 5, 2018, '55667788P');
INSERT INTO ASSIGNATURA (nom, id_grau, pla, dni_professor) VALUES ('Teories Polítiques', 6, 2022, '66778899Q');
INSERT INTO ASSIGNATURA (nom, id_grau, pla, dni_professor) VALUES ('Tècniques de crispació social', 6, 2022, '66778899Q');
INSERT INTO ASSIGNATURA (nom, id_grau, pla, dni_professor) VALUES ('Càlcul Diferencial', 7, 2021, '77889900R');
INSERT INTO ASSIGNATURA (nom, id_grau, pla, dni_professor) VALUES ('Programació I', 8, 2020, '88990011S');
INSERT INTO ASSIGNATURA (nom, id_grau, pla, dni_professor) VALUES ('Estructura de computadors', 8, 2020, '99001122T');
INSERT INTO ASSIGNATURA (nom, id_grau, pla, dni_professor) VALUES ('Teoria de la computació', 8, 2020, '00112233U');
