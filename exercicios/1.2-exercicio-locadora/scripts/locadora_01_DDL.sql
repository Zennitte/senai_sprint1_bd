CREATE DATABASE LOCADORA;
GO

USE LOCADORA;
GO

CREATE TABLE EMPRESA(
 idEmpresa SMALLINT PRIMARY KEY IDENTITY(1,1),
 nomeEmpresa VARCHAR(30) NOT NULL
);
GO

CREATE TABLE MARCA(
 idMarca SMALLINT PRIMARY KEY IDENTITY(1,1),
 nomeMarca VARCHAR(20) NOT NULL
);
GO

CREATE TABLE MODELO(
 idModelo SMALLINT PRIMARY KEY IDENTITY(1,1),
 idMarca SMALLINT FOREIGN KEY REFERENCES MARCA(idMarca),
 nomeModelo VARCHAR(25) NOT NULL
);
GO

CREATE TABLE VEICULO(
 idVeiculo SMALLINT PRIMARY KEY IDENTITY(1,1),
 idModelo SMALLINT FOREIGN KEY REFERENCES MODELO(idModelo),
 idEmpresa SMALLINT FOREIGN KEY REFERENCES EMPRESA(idEmpresa),
 placa VARCHAR(10) NOT NULL
);
GO

CREATE TABLE CLIENTE(
 idCLiente SMALLINT PRIMARY KEY IDENTITY(1,1),
 nomeCliente VARCHAR(25) NOT NULL,
 cpfCliente VARCHAR(13) NOT NULL
);
GO

CREATE TABLE ALUGUEL(
 idAluguel SMALLINT PRIMARY KEY IDENTITY(1,1),
 idVeiculo SMALLINT FOREIGN KEY REFERENCES VEICULO(idVeiculo),
 idCliente SMALLINT FOREIGN KEY REFERENCES CLIENTE(idCliente)
);
GO