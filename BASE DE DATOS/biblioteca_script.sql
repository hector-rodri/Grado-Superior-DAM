CREATE TABLE EDITORIAL(
    ID number generated as identity primary key,
    nom varchar2(50)
);

CREATE TABLE LLIBRE (
    ID number generated as identity primary key,
    titol varchar2(50),
    an number,
    exemplars number,
    ID_editorial number NOT NULL,
    ID_sequela_de number,
    foreign key (ID_editorial) references EDITORIAL(ID),
    foreign key (ID_sequela_de) references LLIBRE(ID)
);

CREATE TABLE AUTOR (
    ID number generated as identity primary key,
    nom varchar2(50),
    cognoms varchar2(50),
    data_naix date,
    nacionalitat varchar2(3)
);

CREATE TABLE AUTOR_LLIBRE(
    ID_autor number,
    ID_llibre number,
    primary key(ID_autor, ID_llibre),
    foreign key (ID_autor) references AUTOR(ID),
    foreign key (ID_llibre) references LLIBRE(ID)
);

CREATE TABLE GENERE(
    nom varchar2(50) primary key
);

CREATE TABLE LLIBRE_GENERE(
    ID_llibre number,
    nom_genere varchar2(50),
    foreign key (ID_llibre) references LLIBRE(ID),
    foreign key (nom_genere) references GENERE(nom),
    primary key (ID_llibre, nom_genere)
);

INSERT INTO EDITORIAL (nom) VALUES ('LaButxaca');
INSERT INTO EDITORIAL (nom) VALUES ('Letras hispánicas');
INSERT INTO EDITORIAL (nom) VALUES ('Planeta');
INSERT INTO EDITORIAL (nom) VALUES ('Anaya');

INSERT INTO GENERE VALUES ('Misteri');
INSERT INTO GENERE VALUES ('Poesia');
INSERT INTO GENERE VALUES ('Fantasia');
INSERT INTO GENERE VALUES ('Aventura');
INSERT INTO GENERE VALUES ('Filosofia');

INSERT INTO AUTOR(nom, cognoms, data_naix, nacionalitat) VALUES ('Federico', 'García Lorca', DATE'1898-06-05', 'ESP');
INSERT INTO AUTOR(nom, cognoms, data_naix, nacionalitat) VALUES ('Manuel', 'de Pedrolo i Molina', DATE'1918-04-01', 'ESP');
INSERT INTO AUTOR(nom, cognoms, data_naix, nacionalitat) VALUES ('Joanne', 'Rowling', DATE'1965-07-31', 'GBR');
INSERT INTO AUTOR(nom, cognoms, data_naix, nacionalitat) VALUES ('Stephen', 'King', DATE'1947-09-21', 'USA');
INSERT INTO AUTOR(nom, cognoms, data_naix, nacionalitat) VALUES ('Owen', 'King', DATE'1977-02-21', 'USA');
INSERT INTO AUTOR(nom, cognoms, data_naix, nacionalitat) VALUES ('Shigeru', 'Miyamoto', DATE'1952-09-16', 'JPN');
INSERT INTO AUTOR(nom, cognoms, data_naix, nacionalitat) VALUES ('Hidetaka', 'Miyazaki', DATE'1974-09-19', 'JPN');

INSERT INTO LLIBRE(titol, an, exemplars, id_editorial) VALUES ('Bodas de sangre', 1933, 10, (SELECT ID FROM EDITORIAL WHERE NOM = 'Letras hispánicas'));
INSERT INTO LLIBRE(titol, an, exemplars, id_editorial) VALUES ('Yerma', 1934, 0, (SELECT ID FROM EDITORIAL WHERE NOM = 'Letras hispánicas'));
INSERT INTO LLIBRE(titol, an, exemplars, id_editorial) VALUES ('La casa de Bernarda Alba', 1936, 12, (SELECT ID FROM EDITORIAL WHERE NOM = 'Letras hispánicas'));
INSERT INTO LLIBRE(titol, an, exemplars, id_editorial) VALUES ('Poeta en Nueva York', 1940, 5, (SELECT ID FROM EDITORIAL WHERE NOM = 'Letras hispánicas'));
INSERT INTO LLIBRE(titol, an, exemplars, id_editorial) VALUES ('Romancero gitano', 1928, 1, (SELECT ID FROM EDITORIAL WHERE NOM = 'Letras hispánicas'));
INSERT INTO LLIBRE(titol, an, exemplars, id_editorial) VALUES ('El Lazarillo de Tormes', 1554, 2, (SELECT ID FROM EDITORIAL WHERE NOM = 'Letras hispánicas'));

INSERT INTO LLIBRE(titol, an, exemplars, id_editorial) VALUES ('Mecanoscrit del segon origen', 1974, 1, (SELECT ID FROM EDITORIAL WHERE NOM = 'LaButxaca'));
INSERT INTO LLIBRE(titol, an, exemplars, id_editorial) VALUES ('Totes les bèsties de càrrega', 1965, 5, (SELECT ID FROM EDITORIAL WHERE NOM = 'LaButxaca'));
INSERT INTO LLIBRE(titol, an, exemplars, id_editorial) VALUES ('Joc brut', 1965, 2, (SELECT ID FROM EDITORIAL WHERE NOM = 'LaButxaca'));
INSERT INTO LLIBRE(titol, an, exemplars, id_editorial) VALUES ('Trajecte final', 1981, 6, (SELECT ID FROM EDITORIAL WHERE NOM = 'LaButxaca'));
INSERT INTO LLIBRE(titol, an, exemplars, id_editorial) VALUES ('Es vessa una sang fàcil', 1954, 5, (SELECT ID FROM EDITORIAL WHERE NOM = 'LaButxaca'));

INSERT INTO LLIBRE(titol, an, exemplars, id_editorial) VALUES ('Harry Potter i la pedra filosofal', 1997, 0, (SELECT ID FROM EDITORIAL WHERE NOM = 'Planeta'));
INSERT INTO LLIBRE(titol, an, exemplars, id_editorial, id_sequela_de) VALUES ('Harry Potter i la cambra secreta', 1998, 7, (SELECT ID FROM EDITORIAL WHERE NOM = 'Planeta'), (SELECT ID FROM LLIBRE WHERE TITOL = 'Harry Potter i la pedra filosofal'));
INSERT INTO LLIBRE(titol, an, exemplars, id_editorial, id_sequela_de) VALUES ('Harry Potter i el pres d''Azkaban', 1999, 6, (SELECT ID FROM EDITORIAL WHERE NOM = 'Planeta'), (SELECT ID FROM LLIBRE WHERE TITOL = 'Harry Potter i la cambra secreta'));
INSERT INTO LLIBRE(titol, an, exemplars, id_editorial, id_sequela_de) VALUES ('Harry Potter i el calze de foc', 2000, 5, (SELECT ID FROM EDITORIAL WHERE NOM = 'Planeta'), (SELECT ID FROM LLIBRE WHERE TITOL = 'Harry Potter i el pres d''Azkaban'));
INSERT INTO LLIBRE(titol, an, exemplars, id_editorial, id_sequela_de) VALUES ('Harry Potter i l''orde del Fènix', 2003, 4, (SELECT ID FROM EDITORIAL WHERE NOM = 'Planeta'), (SELECT ID FROM LLIBRE WHERE TITOL = 'Harry Potter i el calze de foc'));
INSERT INTO LLIBRE(titol, an, exemplars, id_editorial) VALUES ('Bellas durmientes', 2017, 3, (SELECT ID FROM EDITORIAL WHERE NOM = 'Planeta'));

INSERT INTO AUTOR_LLIBRE SELECT (SELECT id FROM AUTOR WHERE nom = 'Federico'), id FROM LLIBRE WHERE id_editorial = (SELECT id from EDITORIAL WHERE nom = 'Letras hispánicas') and titol != 'El Lazarillo de Tormes';
INSERT INTO AUTOR_LLIBRE SELECT (SELECT id FROM AUTOR WHERE nom = 'Manuel'), id FROM LLIBRE WHERE id_editorial = (SELECT id from EDITORIAL WHERE nom = 'LaButxaca');
INSERT INTO AUTOR_LLIBRE SELECT (SELECT id FROM AUTOR WHERE nom = 'Joanne'), id FROM LLIBRE WHERE id_editorial = (SELECT id from EDITORIAL WHERE nom = 'Planeta') and titol LIKE 'Harry%';
INSERT INTO AUTOR_LLIBRE SELECT (SELECT id FROM AUTOR WHERE nom = 'Stephen'), id FROM LLIBRE WHERE id_editorial = (SELECT id from EDITORIAL WHERE nom = 'Planeta') and titol NOT LIKE 'Harry%';
INSERT INTO AUTOR_LLIBRE SELECT (SELECT id FROM AUTOR WHERE nom = 'Owen'), id FROM LLIBRE WHERE id_editorial = (SELECT id from EDITORIAL WHERE nom = 'Planeta') and titol NOT LIKE 'Harry%';

INSERT INTO LLIBRE_GENERE SELECT id_llibre, 'Poesia' FROM AUTOR_LLIBRE WHERE id_autor = (SELECT id FROM AUTOR WHERE NOM = 'Federico');
INSERT INTO LLIBRE_GENERE SELECT id_llibre, 'Fantasia' FROM AUTOR_LLIBRE WHERE id_autor = (SELECT id FROM AUTOR WHERE NOM = 'Joanne');
INSERT INTO LLIBRE_GENERE SELECT id_llibre, 'Aventura' FROM AUTOR_LLIBRE WHERE id_autor = (SELECT id FROM AUTOR WHERE NOM = 'Manuel') AND rownum < 3;
INSERT INTO LLIBRE_GENERE SELECT id_llibre, 'Misteri' FROM AUTOR_LLIBRE WHERE id_autor = (SELECT id FROM AUTOR WHERE NOM = 'Manuel') AND id_llibre not in (SELECT id_llibre FROM LLIBRE_GENERE);

DELETE FROM LLIBRE_GENERE WHERE id_llibre = (SELECT ID FROM LLIBRE WHERE TITOL = 'Totes les bèsties de càrrega');
DELETE FROM LLIBRE_GENERE WHERE id_llibre = (SELECT ID FROM LLIBRE WHERE TITOL = 'Harry Potter i el calze de foc');
DELETE FROM LLIBRE_GENERE WHERE id_llibre = (SELECT ID FROM LLIBRE WHERE TITOL = 'Bellas durmientes');

/*1. Escriu un bloc anònim que, donat un ID de llibre, miri si el llibre és seqüela d'algun altre.
Si no ho és, mostra un missatge indicant-ho. Si ho és, mostra un missatge indicant que
el llibre és seqüela d'un altre, juntament amb el títol i l'autor d'aquest altre llibre.
Utilitza una variable que tengui com a valor inicial l'ID del llibre que s'ha de comprovar.
Recordau que podeu utilitzar IS NULL com a operador als IF i que teniu l'operador de concatenació ||

OUTPUT d'exemple (no és seqüela de cap altre llibre):
El llibre Bellas durmientes no és seqüela de cap altre.

OUTPUT d'exemple (és seqüela d'un altre):
El llibre Harry Potter i la cambra secreta i és seqüela de Harry Potter i la pedra filosofal.
*/

SET SERVEROUTPUT ON;/*Recordar ejecutar esto si solo sale Procedimiento PL/SQL terminado correctamente.*/

DECLARE
    id_llibre_comprovar LLIBRE.ID%TYPE;
    titol_llibre LLIBRE.TITOL%TYPE;
    id_padre LLIBRE.ID_SEQUELA_DE%TYPE;
    titol_padre LLIBRE.TITOL%TYPE;
    autor_padre AUTOR.NOM%TYPE;
BEGIN
    SELECT LLIBRE.ID INTO id_llibre_comprovar FROM LLIBRE WHERE TITOL = 'Harry Potter i la cambra secreta';
    
    SELECT TITOL, ID_SEQUELA_DE INTO titol_llibre, id_padre
    FROM LLIBRE WHERE ID = id_llibre_comprovar;
    
    IF id_padre IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('El llibre ' || titol_llibre || ' no és seqüela de cap altre');
    ELSE
        SELECT L.TITOL, A.NOM INTO titol_padre, autor_padre
        FROM LLIBRE L
        JOIN AUTOR_LLIBRE AL ON L.ID = AL.ID_LLIBRE
        JOIN AUTOR A ON AL.ID_AUTOR = A.ID
        WHERE L.ID = id_padre;
        DBMS_OUTPUT.PUT_LINE('El llibre ' || titol_llibre || ' és seqüela de ' || titol_padre || ' de ' || autor_padre);
    END IF;
END;

/*2. Escriu un bloc anònim que, donat un ID de llibre i un nombre, incrementi el nombre
d'exemplars del llibre en el nombre donat. Per exemple, si el llibre té 10 exemplars i
el nombre donat és 7, al final de l'execucució del bloc ha de tenir 17 exemplars.
Utilitza un FOR per incrementar els exemplars d'un amb un fins arribar al nombre desitjat.
NO podeu incrementar-ho tot de cop.
Imprimeix per pantalla un missatge a cada increment, a més dels valor inicial i final del
nombre d'exemplars del llibre.

OUTPUT d'exemple:
El llibre amb ID 9 té 6 exemplars. S'ha sol·licitat afegir-li 4 exemplars.
Afegit exemplar. Exemplars: 7
Afegit exemplar. Exemplars: 8
Afegit exemplar. Exemplars: 9
Afegit exemplar. Exemplars: 10
Exemplars finals: 10
*/
DECLARE
    id_nuevo_llibre LLIBRE.ID%TYPE;
    numero NUMBER := 10;
    exemplars_nuevo_llibre LLIBRE.EXEMPLARS%TYPE;
    
BEGIN
    SELECT LLIBRE.ID INTO id_nuevo_llibre FROM LLIBRE WHERE TITOL = 'Harry Potter i la cambra secreta';
    SELECT EXEMPLARS INTO exemplars_nuevo_llibre FROM LLIBRE WHERE TITOL = 'Harry Potter i la cambra secreta';
    
     DBMS_OUTPUT.PUT_LINE('El llibre amb ID ' || id_nuevo_llibre || ' té ' || exemplars_nuevo_llibre || ' exemplars');
     DBMS_OUTPUT.PUT_LINE('Hem de introduir ' || numero || ' exemplars');
     
     FOR i IN 1..numero LOOP
     exemplars_nuevo_llibre := exemplars_nuevo_llibre + 1;
     DBMS_OUTPUT.PUT_LINE('Afegit exemplar. Exemplars: ' || exemplars_nuevo_llibre);
     END LOOP;
     DBMS_OUTPUT.PUT_LINE('Exemplars finals: ' || exemplars_nuevo_llibre);
END;

/*3. Escriu un bloc anònim que, donat un ID de llibre i un nombre, decrementi el nombre
d'exemplars del llibre segons el nombre donat, però sense poder passar mai de 0 exemplars.
Per exemple, si el llibre té 2 exemplars i el nombre donat és 3, al final de l'execucució 
del bloc ha de tenir 0 exemplars, no -1.
Utilitza un FOR per decrementar els exemplars d'un amb un fins arribar al nombre desitjat
o 0, segons el cas.
NO podeu decrementar-ho tot de cop.
Imprimeix per pantalla un missatge a cada decrement, a més dels valor inicial i final del
nombre d'exemplars del llibre.
Si no s'han pogut decrementar les vegades previstes per haver arribat a 0, indica-ho.

OUTPUT d'exemple (No s'arriba a 0 exemplars):
El llibre amb ID 9 té 6 exemplars. S'ha sol·licitat eliminar 4 exemplars.
Eliminat exemplar. Exemplars: 5
Eliminat exemplar. Exemplars: 4
Eliminat exemplar. Exemplars: 3
Eliminat exemplar. Exemplars: 2
Exemplars finals: 2

OUTPUT d'exemple (S'arriba a 0 exemplars):
El llibre amb ID 7 té 3 exemplars. S'ha sol·licitat eliminar 5 exemplars.
Eliminat exemplar. Exemplars: 2
Eliminat exemplar. Exemplars: 1
Eliminat exemplar. Exemplars: 0
No queden més exemplars. 2 exemplars han quedat sense eliminar.
Exemplars finals: 0
*/

DECLARE
    id_nuevo_llibre LLIBRE.ID%TYPE;
    numero NUMBER := 8; 
    exemplars_nuevo_llibre LLIBRE.EXEMPLARS%TYPE;
    exemplars_no_eliminats NUMBER := 0;
BEGIN
    SELECT LLIBRE.ID INTO id_nuevo_llibre FROM LLIBRE WHERE TITOL = 'Harry Potter i la cambra secreta';
    SELECT EXEMPLARS INTO exemplars_nuevo_llibre FROM LLIBRE WHERE TITOL = 'Harry Potter i la cambra secreta';
    DBMS_OUTPUT.PUT_LINE('El llibre amb ID ' || id_nuevo_llibre || ' té ' || exemplars_nuevo_llibre || ' exemplars');
    DBMS_OUTPUT.PUT_LINE('Hem de eliminar ' || numero || ' exemplars');
    
    FOR i IN 1..numero LOOP
        IF exemplars_nuevo_llibre > 0 THEN
            exemplars_nuevo_llibre := exemplars_nuevo_llibre - 1;
            DBMS_OUTPUT.PUT_LINE('Eliminat exemplar. Exemplars: ' || exemplars_nuevo_llibre);
        ELSE
            exemplars_no_eliminats := numero - i + 1;
            EXIT;
        END IF;
        
    END LOOP;
    
    IF exemplars_no_eliminats > 0 THEN
        DBMS_OUTPUT.PUT_LINE('No s''han pogut eliminar ' || exemplars_no_eliminats || ' exemplars perquè no queden més');
    END IF;
    DBMS_OUTPUT.PUT_LINE('Exemplars finals: ' || exemplars_nuevo_llibre);
END;