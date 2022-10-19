-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 19-Out-2022 às 11:56
-- Versão do servidor: 5.7.36
-- versão do PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `dbrelatorio`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbcomponente`
--

DROP TABLE IF EXISTS `tbcomponente`;
CREATE TABLE IF NOT EXISTS `tbcomponente` (
  `componenteId` int(11) NOT NULL AUTO_INCREMENT,
  `componente` varchar(255) NOT NULL,
  `componenteCurso` int(11) NOT NULL,
  `componenteSerie` int(11) NOT NULL,
  PRIMARY KEY (`componenteId`),
  KEY `componenteCurso` (`componenteCurso`),
  KEY `componenteSerie` (`componenteSerie`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbcomponente`
--

INSERT INTO `tbcomponente` (`componenteId`, `componente`, `componenteCurso`, `componenteSerie`) VALUES
(1, 'Matemática', 10, 4),
(2, 'Português', 10, 4),
(3, 'História', 10, 4),
(4, 'Geografia', 10, 4),
(5, 'Física', 10, 4),
(6, 'Química', 10, 4),
(7, 'Biologia', 10, 4),
(8, 'Língua Inglesa', 10, 4),
(9, 'Ética e Cidadania Organizacional', 10, 4),
(10, 'Filosofia', 10, 4),
(11, 'Sociologia', 10, 4),
(12, 'Artes', 10, 4),
(13, 'Educação Física', 10, 4),
(14, 'Design Digital', 1, 1),
(15, 'Banco de Dados I', 1, 1),
(16, 'Técnica de Programação e Algoritmos', 1, 1),
(17, 'Fundamentos da Informática', 1, 1),
(18, 'Análise de Projetos de Sistemas', 1, 1),
(19, 'Programação Web I', 1, 1),
(20, 'Desenvolvimento de Sistemas', 1, 2),
(21, 'Programação Web II ', 1, 2),
(22, 'Programação Mobile I', 1, 2),
(23, 'Banco de Dados II', 1, 2),
(24, 'Internet, Protocolos e Segurança', 1, 3),
(25, 'Planejamento e Desenvolvimento do TCC em DS', 1, 3),
(26, 'Qualidade e Teste de Software', 1, 3),
(27, 'Sistemas Embarcados', 1, 3),
(28, 'Programação Web III', 1, 3),
(29, 'Programação Mobile III', 1, 3),
(30, 'Diagnóstico de Alimentação Humana', 2, 1),
(31, 'Técnica Dietética I', 2, 1),
(32, 'Higiene dos Alimentos', 2, 1),
(33, 'Administração e Segurança no Serviço de Alimentação', 2, 1),
(34, 'Linguagem, Trabalho e Tecnologia', 2, 1),
(35, 'Educação Nutricional em Saúde Pública', 2, 2),
(36, 'Planejamento Alimentar', 2, 2),
(37, 'Estrutura e Rotinas em Serviços de Alimentação', 2, 2),
(38, 'Técnica Dietética II', 2, 2),
(39, 'Gestão Operacional em Serviços de Alimentação', 2, 3),
(40, 'Terapia Nutricional e Gastronomia Hospitalar', 2, 3),
(41, 'Tecnologia dos Alimentos e Rotulagem Nutricional', 2, 3),
(42, 'Gestão Profissional em Unidades de Alimentação', 2, 3),
(43, 'Técnica Dietética III', 2, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbcurso`
--

DROP TABLE IF EXISTS `tbcurso`;
CREATE TABLE IF NOT EXISTS `tbcurso` (
  `idCurso` int(11) NOT NULL AUTO_INCREMENT,
  `curso` varchar(255) NOT NULL,
  PRIMARY KEY (`idCurso`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbcurso`
--

INSERT INTO `tbcurso` (`idCurso`, `curso`) VALUES
(1, 'Desenvolvimento de Sistemas'),
(2, 'Nutrição'),
(3, 'Finanças'),
(4, 'Administração'),
(5, 'Gastronomia'),
(6, 'Guia de Turismo'),
(7, 'Marketing'),
(8, 'Contabilidade'),
(9, 'Serviços Públicos'),
(10, 'Ensino Médio');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbrelatorio`
--

DROP TABLE IF EXISTS `tbrelatorio`;
CREATE TABLE IF NOT EXISTS `tbrelatorio` (
  `idRelatorio` int(11) NOT NULL AUTO_INCREMENT,
  `turno` int(11) NOT NULL,
  `curso` int(11) NOT NULL,
  `serie` int(11) NOT NULL,
  `componente` int(11) NOT NULL,
  `aluno` varchar(255) NOT NULL,
  `comentario` varchar(1000) NOT NULL,
  PRIMARY KEY (`idRelatorio`),
  KEY `curso` (`curso`),
  KEY `serie` (`serie`),
  KEY `turno` (`turno`),
  KEY `componente` (`componente`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbrelatorio`
--

INSERT INTO `tbrelatorio` (`idRelatorio`, `turno`, `curso`, `serie`, `componente`, `aluno`, `comentario`) VALUES
(1, 2, 1, 2, 4, 'Albert Smaczylo', 'Melhor matéria'),
(2, 2, 1, 2, 21, 'Albert Smaczylo', 'Adoro'),
(3, 3, 1, 2, 1, 'Albert Smaczylo', 'ffff'),
(4, 2, 1, 2, 20, 'Bigode', 'Ele gosta'),
(5, 2, 1, 2, 2, 'Albert Smaczylo', 'A Professora Eliana é mó legal, mas ela odeia meus assobio'),
(6, 2, 1, 2, 2, 'Albert Smaczylo', 'A Professora Eliana é mó legal, mas ela odeia meus assobio'),
(7, 2, 1, 2, 2, 'Albert Smaczylo', 'A Professora Eliana é mó legal, mas ela odeia meus assobio'),
(8, 2, 1, 2, 2, 'Albert Smaczylo', 'A Professora Eliana é mó legal, mas ela odeia meus assobio'),
(9, 2, 1, 2, 2, 'Albert Smaczylo', 'A Professora Eliana é mó legal, mas ela odeia meus assobio'),
(10, 1, 1, 1, 16, 'Albert Smaczylo', 'Albert do primeiro ano achava mo daora'),
(11, 1, 1, 1, 16, 'Albert Smaczylo', 'Albert do primeiro ano achava mo daora'),
(12, 1, 1, 1, 16, 'Albert Smaczylo', 'Albert do primeiro ano achava mo daora'),
(13, 1, 1, 1, 16, 'Albert Smaczylo', 'Albert do primeiro ano achava mo daora'),
(14, 1, 1, 1, 16, 'Albert Smaczylo', 'Albert do primeiro ano achava mo daora'),
(15, 1, 1, 1, 16, 'Albert Smaczylo', 'Albert do primeiro ano achava mo daora'),
(16, 1, 1, 1, 16, 'Albert Smaczylo', 'Albert do primeiro ano achava mo daora'),
(17, 1, 1, 1, 16, 'Albert Smaczylo', 'Albert do primeiro ano achava mo daora'),
(18, 1, 1, 1, 16, 'Albert Smaczylo', 'Albert do primeiro ano achava mo daora'),
(19, 1, 1, 1, 16, 'Albert Smaczylo', 'Albert do primeiro ano achava mo daora'),
(20, 1, 1, 1, 16, 'Albert Smaczylo', 'Albert do primeiro ano achava mo daora'),
(21, 1, 1, 1, 16, 'Albert Smaczylo', 'Albert do primeiro ano achava mo daora'),
(22, 1, 1, 1, 16, 'Albert Smaczylo', 'Albert do primeiro ano achava mo daora'),
(23, 1, 1, 1, 16, 'Albert Smaczylo', 'Albert do primeiro ano achava mo daora');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbserie`
--

DROP TABLE IF EXISTS `tbserie`;
CREATE TABLE IF NOT EXISTS `tbserie` (
  `idSerie` int(11) NOT NULL AUTO_INCREMENT,
  `serie` varchar(255) NOT NULL,
  PRIMARY KEY (`idSerie`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbserie`
--

INSERT INTO `tbserie` (`idSerie`, `serie`) VALUES
(1, '1° Série'),
(2, '2° Série'),
(3, '3° Série'),
(4, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbturno`
--

DROP TABLE IF EXISTS `tbturno`;
CREATE TABLE IF NOT EXISTS `tbturno` (
  `idTurno` int(11) NOT NULL AUTO_INCREMENT,
  `turno` varchar(255) NOT NULL,
  PRIMARY KEY (`idTurno`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbturno`
--

INSERT INTO `tbturno` (`idTurno`, `turno`) VALUES
(1, 'Matutino'),
(2, 'Vespertino'),
(3, 'Noturno');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
