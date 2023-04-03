CREATE DATABASE umitech;
use umitech;

CREATE TABLE cliente (
idCliente INT PRIMARY KEY auto_increment,
empresa VARCHAR(50),
cnpj CHAR(18),
email VARCHAR(50),
senha VARCHAR(30)
);

INSERT INTO cliente VALUES
(NULL, 'Brasspress', '48.740.351/0001-65', 'compras@Braspress.com', 'brasspress123'),
(NULL, 'Fedex', '10.970.887/0001-02', 'laccrobr@fedex.com', 'fedex321'),
(NULL, 'Correios', '34.028.316/0001-03', 'contato@correios.com.br', 'correios789'),
(NULL, 'One Time Express', '09.329.143/0001-16', 'timeexpress@timeexpress.com.br', 'expresstime00'),
(NULL, 'DHL Express', '58.890.252/0001-13', 'contato@dhl.com', 'DHLexpress01'),
(NULL, 'Total Express', '79.939.449/0001-93', 'contato@totalexpress.com', 'TotalExpress1'); 
SELECT * FROM cliente;

CREATE TABLE sensor (
idSensor INT PRIMARY KEY auto_increment,
FKCliente INT,
constraint FKCliente foreign key (FKCliente) references cliente(idCliente),
sensor VARCHAR(5),
transporte VARCHAR(35)
);

INSERT INTO sensor VALUES
(NULL, 1, 'DHT11', 'Van e Caminhão'),
(NULL, 2, 'DHT11', 'Caminhão e Van'),
(NULL, 3, 'DHT11', 'Caminhão e Van'),
(NULL, 4, 'DHT11', 'Van e Caminhão'),
(NULL, 5, 'DHT11', 'Van e Caminhão'),
(NULL, 6, 'DHT11', 'Caminhão e Van');
SELECT * FROM sensor;
SELECT * FROM sensor JOIN cliente ON idCliente=FKCliente;

CREATE TABLE SensorDados(
idSensorDados INT PRIMARY KEY auto_increment,
FKSensor INT,
constraint FKSensor foreign key (FKSensor) references sensor(idSensor),
dtHora DATETIME default current_timestamp,
Umidade DOUBLE,
Temperatura DOUBLE
);

INSERT INTO SensorDados VALUES
(NULL,'1',20230312103020,'65','35'),
(NULL,'2',20230312103020,'60','30'),
(NULL,'3',20230312103020,'70','30'),
(NULL,'4',20230312103020,'70','40'),
(NULL,'5',20230312103020,'65','35'),
(NULL,'6',20230312103020,'52','25');
SELECT*FROM SensorDados;
SELECT * FROM SensorDados JOIN Sensor ON idSensor=FKSensor;