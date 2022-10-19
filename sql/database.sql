CREATE DATABASE dbRelatorio;
USE dbRelatorio;

CREATE TABLE tbCurso (
    idCurso INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    curso VARCHAR(255) NOT NULL
);
CREATE TABLE tbSerie (
    idSerie INT NOT NULL PRIMARY KEY AUTO_INCREMENT
    serie VARCHAR(255),
);
CREATE TABLE tbTurno (
    idTurno INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    turno VARCHAR(255) NOT NULL
);
CREATE TABLE tbComponente (
	componenteId INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    componente VARCHAR(255) NOT NULL,
    componenteCurso INT NOT NULL,
    componenteSerie INT NOT NULL,
    FOREIGN KEY (`componenteCurso`) REFERENCES tbCurso(`idCurso`),
    FOREIGN KEY (`componenteSerie`) REFERENCES tbSerie(`serie`)
);
CREATE TABLE tbRelatorio (
    idRelatorio INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    turno INT NOT NULL,
    curso INT NOT NULL,
    serie INT NOT NULL,
    componente INT NOT NULL,
    aluno VARCHAR(255) NOT NULL,
    comentario VARCHAR(1000) NOT NULL,
    FOREIGN KEY (`curso`) REFERENCES tbCurso(`idCurso`),
    FOREIGN KEY (`serie`) REFERENCES tbSerie(`serie`),
    FOREIGN KEY (`turno`) REFERENCES tbTurno(`idTurno`),
    FOREIGN KEY (`componente`) REFERENCES tbComponente(`componenteId`)
);

INSERT INTO `tbcurso` (`idCurso`, `curso`) VALUES ('1', 'Desenvolvimento de Sistemas'), ('2', 'Nutrição'), ('3', 'Finanças'), ('4', 'Administração'),
 ('5', 'Gastronomia'), ('6', 'Guia de Turismo'), ('7', 'Marketing'), ('8', 'Contabilidade'), ('9', 'Serviços Públicos'), ('10', 'Ensino Médio');
INSERT INTO `tbserie` (`serie`) VALUES ('1', '1° Série'), ('2', '2° Série'), ('3', '3° Série'), ('4');
INSERT INTO `tbturno` (`idTurno`, `turno`) VALUES ('1', 'Matutino'), ('2', 'Vespertino'), ('3', 'Noturno');

INSERT INTO `tbcomponente` (`componenteId`, `componente`, `componenteCurso`, `componenteSerie`) VALUES ('1', 'Matemática', '10', '4'), 
('2', 'Português', '10', '4'), ('3', 'História', '10', '4'), ('4', 'Geografia', '10', '4'), ('5', 'Física', '10', '4'), ('6', 'Química', '10', '4'), 
('7', 'Biologia', '10', '4'), ('8', 'Língua Inglesa', '10', '4'), ('9', 'Ética e Cidadania Organizacional', '10', '4'), ('10', 'Filosofia', '10', '4'), 
('11', 'Sociologia', '10', '4'), ('12', 'Artes', '10', '4'), ('13', 'Educação Física', '10', '4');



-- SELECT COMPONENTE E IDCOMPONENTE

-- Exemplo selecionando todos os Componentes de DS 2
SELECT componenteId, componente FROM `tbcomponente` WHERE componenteCurso = 1 AND componenteSerie = 2 OR componenteCurso = 10 AND componenteSerie = 4