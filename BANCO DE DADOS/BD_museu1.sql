CREATE DATABASE ATS;
USE ATS;

CREATE TABLE cliente ( 
idCliente INT PRIMARY KEY auto_increment,
nomeMuseu varchar(45),
cnpj char(18),
rua varchar(45),
numero int null,
bairro varchar(45),
cep char(9),
cidade varchar(25),
area float,
quantidade_salas int,
email varchar(50),
senha char(8),
telefone varchar(13)
 );
 INSERT INTO cliente  VALUES 
(NULL,'MUSEU MASP', '60.664.745/0001-87', 'Avenida Paulista', '1578', 'Bela Vista', '01310-200', 'SP - São Paulo', 10.000, 5, 'agendamento@masp.org.br', 'masp123',  '(11)3149-5959'),
(NULL,'MUSEU IPIRANGA', '63.025.530/0032-00' , 'Parque da Independência', '2545', 'Ipiranga', '04263-000', 'SP - São Paulo', 5.000, 2, 'mp@usp.br', 'ipiranga', '(11)2065-8000'),
(NULL,'MUSEU DA LÍNGUA PORTUGUESA', '10.233.223.0002/33', 'Praça da Luz', '2358', 'Luz', '01120-010', 'SP - São Paulo', 15.000, 10, 'museu@museulp.org.br', '@lngport', '(11)4470-1515');
SELECT*FROM cliente;
DESC cliente;

CREATE TABLE sensor( 
idSensor int primary key auto_increment,
nomeSensor char(5),
sala char(5),
FKcliente INT,
FOREIGN KEY (FKcliente) REFERENCES cliente(idCliente)
);
INSERT INTO sensor  VALUES 
(NULL,'DHT11', '9A', 1),
(NULL,'DHT11', '7H', 2),
(NULL,'DHT11', '9A', 1),
( NULL,'DHT11', '11B', 3);
SELECT*FROM sensor;
SELECT*FROM sensor JOIN cliente ON FKcliente=idCliente;
DESC sensor;

CREATE TABLE sensorData( 
idData int primary key auto_increment,
temperatura float,
umidade float,
dtHora datetime default current_timestamp,
FKsensor INT,
FOREIGN KEY (FKsensor) REFERENCES sensor(idSensor)
);
INSERT INTO sensorData  VALUES 
(NULL, 20.0, 75,20230322083020,1),
(NULL, 30.0, 15,20230322083020,3),
(NULL, 18.5, 85,20230322083020,4);
SELECT*FROM sensorData;
SELECT*FROM sensorData JOIN sensor ON FKsensor=idSensor;
SELECT*FROM sensorData JOIN sensor ON FKsensor=idSensor JOIN cliente ON FKcliente=idCliente;
DESC sensorData;