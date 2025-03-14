CREATE TABLE fabricante (
  id NUMBER PRIMARY KEY,
  nombre VARCHAR2(100) NOT NULL
);

CREATE TABLE producto (
  id NUMBER PRIMARY KEY,
  nombre VARCHAR2(100) NOT NULL,
  precio NUMBER(10,2) NOT NULL,
  id_fabricante NUMBER NOT NULL,
  FOREIGN KEY (id_fabricante) REFERENCES fabricante(id)
);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

SELECT nombre, precio FROM producto ORDER BY precio DESC;

SELECT nombre, precio FROM producto ORDER BY precio DESC FETCH FIRST 3 ROWS ONLY;

SELECT nombre FROM producto ORDER BY precio ASC OFFSET 1 ROW FETCH FIRST 3 ROWS ONLY;

SELECT nombre FROM producto WHERE UPPER(nombre) LIKE UPPER ('%Impresora%');

SELECT id_fabricante, count(*) AS ID FROM producto GROUP BY id_fabricante;

SELECT id_fabricante, AVG(precio) FROM producto  GROUP BY id_fabricante;

SELECT nombre, ROUND(precio,0) FROM producto;

SELECT nombre, precio*1.1 FROM producto;