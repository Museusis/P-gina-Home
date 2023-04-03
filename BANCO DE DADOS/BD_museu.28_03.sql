CREATE DATABASE monitoramento_museu; 
USE testes;

CREATE TABLE cliente ( 
idCliente INT PRIMARY KEY auto_increment,
nomeMuseu varchar(70),
cnpj char(18),
rua varchar(60),
numero int null,
bairro varchar(60),
cep char(9),
cidade varchar(25),
area float,
quantidade_salas int,
email varchar(50),
senha char(8),
telefone varchar(13)
 );
 CREATE TABLE sensor( 
idSensor int primary key auto_increment,
nomeSensor char(5),
sala char(5),
idCliente int -- temos que criar chave estrangeira
);
DESC sensor;
CREATE TABLE registro( 
idRegistro int primary key,
temperatura float,
umidade float,
dtHora datetime default current_timestamp,
idSensor int
);

DESCRIBE cliente; 
DESCRIBE sensor; 
DESCRIBE registro; 

INSERT INTO cliente(nomeMuseu, cnpj, rua, numero, bairro, cep, cidade, area, quantidade_salas, email, senha, telefone) VALUES 
('MUSEU MASP', '60.664.745/0001-87', 'Avenida Paulista', '1578', 'Bela Vista', '01310-200', 'SP - São Paulo', 10.000, 5, 'agendamento@masp.org.br', 'masp123',  '(11)3149-5959'),
('MUSEU IPIRANGA', '63.025.530/0032-00' , 'Parque da Independência', '2545', 'Ipiranga', '04263-000', 'SP - São Paulo', 5.000, 2, 'mp@usp.br', 'ipiranga', '(11)2065-8000'),
('MUSEU DA LÍNGUA PORTUGUESA', '10.233.223.0002/33', 'Praça da Luz', '2358', 'Luz', '01120-010', 'SP - São Paulo', 15.000, 10, 'museu@museulp.org.br', '@lngport', '(11)4470-1515');

SELECT * FROM cliente; 

INSERT INTO sensor (nomeSensor, sala, idCliente) VALUES 
('DHT11', '9A', 1),
('DHT11', '7H', 2),
('DHT11', '9A', 1),
('DHT11', '11B', 3);

SELECT * FROM sensor; 

INSERT INTO registro (idRegistro, idSensor, temperatura, umidade) VALUES 
(1, 1, 20.0, 75),
(2, 2, 30.0, 15),
(3, 3, 18.5, 85);

SELECT * FROM registro; 