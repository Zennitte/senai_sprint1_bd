CREATE DATABASE OPTUS_KAUE;
GO

USE OPTUS_KAUE;
GO

CREATE TABLE ARTISTA(
 idArtista SMALLINT PRIMARY KEY IDENTITY(1,1),
 nomeArtista VARCHAR(20) NOT NULL
);
GO

INSERT INTO ARTISTA(nomeArtista)
VALUES ('SIA'), ('ALT-J');
GO

--DELETE FROM ARTISTA
--WHERE ARTISTA.idArtista > 2;
--GO

SELECT * FROM ARTISTA

CREATE TABLE ESTILO(
 idEstilo TINYINT PRIMARY KEY IDENTITY(1,1),
 nomeEstilo VARCHAR(20) NOT NULL
);
GO

INSERT INTO ESTILO(nomeEstilo)
VALUES ('POP'), ('INDIE'), ('ROCK');
GO

SELECT * FROM ESTILO

CREATE TABLE ALBUM(
 idAlbum SMALLINT PRIMARY KEY IDENTITY(1,1),
 idArtista SMALLINT FOREIGN KEY REFERENCES ARTISTA(idArtista),
 nomeAlbum VARCHAR(25) NOT NULL,
 dataLanc DATE NOT NULL,
 ativo BIT DEFAULT(1)
);
GO

INSERT INTO ALBUM(idArtista, nomeAlbum, dataLanc, ativo)
VALUES (1, 'ALIVE', '11/08/2019', 0), (2, 'BREEZEBLOCKS', '06/03/2018', 1);
GO

SELECT * FROM ALBUM

CREATE TABLE ESTILOALBUM(
 idAlbum SMALLINT FOREIGN KEY REFERENCES ALBUM(idAlbum),
 idEstilo TINYINT FOREIGN KEY REFERENCES ESTILO(idEstilo)
);
GO

INSERT INTO ESTILOALBUM
VALUES (1, 1), (2,2), (2,3);
GO

SELECT * FROM ESTILOALBUM

CREATE TABLE USUARIO(
 idUsuario SMALLINT PRIMARY KEY IDENTITY(1,1),
 nomeUsuario VARCHAR(25) NOT NULL,
 email VARCHAR(100) NOT NULL UNIQUE,
 senha VARCHAR(30) NOT NULL, 
 permissao VARCHAR(30) NOT NULL
);
GO

INSERT INTO USUARIO(nomeUsuario, email, senha, permissao)
VALUES ('LUCAS', 'lucas@email.com', '1111111', 'COMUM'), 
('SAULO', 'saulo@email.com', '2222222', 'ADM'), 
('ANA', 'ana#email.com', '555555555', 'ADM');
GO

SELECT * FROM USUARIO

DELETE FROM USUARIO
WHERE idUsuario = 1;
GO

-- listar todos os usuários administradores, sem exibir suas senhas

SELECT USUARIO.nomeUsuario, USUARIO.email, USUARIO.permissao FROM USUARIO
WHERE USUARIO.permissao LIKE 'ADM';
GO

-- listar todos os álbuns lançados após o um determinado ano de lançamento

SELECT ALBUM.nomeAlbum, ALBUM.dataLanc, ALBUM.ativo, ARTISTA.nomeArtista FROM ALBUM
INNER JOIN ARTISTA
ON ALBUM.idArtista = ARTISTA.idArtista
WHERE ALBUM.dataLanc > '2010';
GO

-- listar os dados de um usuário através do e-mail e senha

SELECT USUARIO.nomeUsuario, USUARIO.email, USUARIO.permissao FROM USUARIO
WHERE USUARIO.email LIKE 'ana#email.com' AND USUARIO.senha LIKE '555555555';
GO

-- listar todos os álbuns ativos, mostrando o nome do artista e os estilos do álbum 

SELECT ALBUM.nomeAlbum, ALBUM.dataLanc, ALBUM.ativo, ARTISTA.nomeArtista, ESTILO.nomeEstilo FROM ALBUM
INNER JOIN ARTISTA
ON ALBUM.idArtista = ARTISTA.idArtista
INNER JOIN ESTILOALBUM
ON ALBUM.idAlbum = ESTILOALBUM.idAlbum
INNER JOIN ESTILO
ON ESTILOALBUM.idEstilo = ESTILO.idEstilo
WHERE ALBUM.ativo = 'true';
GO