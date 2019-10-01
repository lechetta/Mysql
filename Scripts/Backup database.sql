-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 12-Out-2018 às 02:07
-- Versão do servidor: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `arvore`
--
CREATE DATABASE IF NOT EXISTS `arvore` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `arvore`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `equipe`
--

CREATE TABLE `equipe` (
  `codFunc` int(11) NOT NULL,
  `nomeFunc` char(50) DEFAULT NULL,
  `cpfFuncionario` char(50) DEFAULT NULL,
  `email` char(50) DEFAULT NULL,
  `cod_chefia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `equipe`
--

INSERT INTO `equipe` (`codFunc`, `nomeFunc`, `cpfFuncionario`, `email`, `cod_chefia`) VALUES
(1, 'Daniela de Souza Leão', '19872617', 'dani.leao@coisas.com.br', NULL),
(2, 'João Carlos da Silva', '78546932', 'dJ.silva@coisas.com.br', 1),
(3, 'Fernando de Oliveira', '45789652', 'F.oliveira@coisas.com.br', 1),
(4, 'Mariana da Cruz', '5647965', 'm.cruz@coisas.com.br', 3),
(5, 'Jairo de Oliveira Leão', '7896542', 'j.leao@coisas.com.br', 2),
(6, 'Giovanna da Silva', '7896542', 'j.leao@coisas.com.br', 4),
(7, 'Lucas Ribeiro Oliveira', '7896542', 'j.leao@coisas.com.br', 4),
(8, 'Helder Ribeiro Oliveira', '7896542', 'j.leao@coisas.com.br', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `equipe`
--
ALTER TABLE `equipe`
  ADD PRIMARY KEY (`codFunc`),
  ADD KEY `cod_chefia` (`cod_chefia`);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `equipe`
--
ALTER TABLE `equipe`
  ADD CONSTRAINT `equipe_ibfk_1` FOREIGN KEY (`cod_chefia`) REFERENCES `equipe` (`codFunc`);
--
-- Database: `aula17`
--
CREATE DATABASE IF NOT EXISTS `aula17` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `aula17`;
--
-- Database: `aula_views`
--
CREATE DATABASE IF NOT EXISTS `aula_views` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `aula_views`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `departamento`
--

CREATE TABLE `departamento` (
  `deptoID` varchar(10) NOT NULL,
  `depto` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `departamento`
--

INSERT INTO `departamento` (`deptoID`, `depto`) VALUES
('D001', 'RH'),
('D002', 'Financeiro'),
('D003', 'Producao'),
('D004', 'TI');

-- --------------------------------------------------------

--
-- Estrutura da tabela `item`
--

CREATE TABLE `item` (
  `itemID` varchar(10) NOT NULL,
  `item` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `item`
--

INSERT INTO `item` (`itemID`, `item`) VALUES
('I001', 'Papel'),
('I002', 'Caneta'),
('I003', 'NoteBook'),
('I004', 'Impressora');

-- --------------------------------------------------------

--
-- Estrutura da tabela `requisicoes`
--

CREATE TABLE `requisicoes` (
  `reqID` varchar(10) NOT NULL,
  `deptoID` varchar(10) DEFAULT NULL,
  `itemID` varchar(10) DEFAULT NULL,
  `qtd` int(11) DEFAULT NULL,
  `precounit` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `requisicoes`
--

INSERT INTO `requisicoes` (`reqID`, `deptoID`, `itemID`, `qtd`, `precounit`) VALUES
('Q001', 'D002', 'I001', 500, 0.3),
('Q002', 'D004', 'I002', 40, 2.5),
('Q003', 'D001', 'I003', 5, 3000),
('Q004', 'D001', 'I004', 2, 650),
('Q005', 'D001', 'I003', 2, 3000);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vwdepto`
-- (See below for the actual view)
--
CREATE TABLE `vwdepto` (
`depto` varchar(30)
,`item` varchar(30)
,`qtd` int(11)
,`precounit` float
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vwrequisicoes`
-- (See below for the actual view)
--
CREATE TABLE `vwrequisicoes` (
`reqid` varchar(10)
,`deptoid` varchar(10)
,`depto` varchar(30)
,`itemid` varchar(10)
,`item` varchar(30)
,`qtd` int(11)
,`precounit` float
,`total` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `wxexemplo`
-- (See below for the actual view)
--
CREATE TABLE `wxexemplo` (
`depto` varchar(30)
,`item` varchar(30)
,`sum(r.qtd)` decimal(32,0)
,`total` double
);

-- --------------------------------------------------------

--
-- Structure for view `vwdepto`
--
DROP TABLE IF EXISTS `vwdepto`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwdepto`  AS  select `d`.`depto` AS `depto`,`i`.`item` AS `item`,`r`.`qtd` AS `qtd`,`r`.`precounit` AS `precounit` from ((`requisicoes` `r` join `departamento` `d` on((`r`.`deptoID` = `d`.`deptoID`))) join `item` `i` on((`i`.`itemID` = `r`.`itemID`))) ;

-- --------------------------------------------------------

--
-- Structure for view `vwrequisicoes`
--
DROP TABLE IF EXISTS `vwrequisicoes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwrequisicoes`  AS  select `r`.`reqID` AS `reqid`,`d`.`deptoID` AS `deptoid`,`d`.`depto` AS `depto`,`i`.`itemID` AS `itemid`,`i`.`item` AS `item`,`r`.`qtd` AS `qtd`,`r`.`precounit` AS `precounit`,(`r`.`qtd` * `r`.`precounit`) AS `total` from ((`requisicoes` `r` join `departamento` `d` on((`r`.`deptoID` = `d`.`deptoID`))) join `item` `i` on((`i`.`itemID` = `r`.`itemID`))) ;

-- --------------------------------------------------------

--
-- Structure for view `wxexemplo`
--
DROP TABLE IF EXISTS `wxexemplo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wxexemplo`  AS  select `d`.`depto` AS `depto`,`i`.`item` AS `item`,sum(`r`.`qtd`) AS `sum(r.qtd)`,sum((`r`.`qtd` * `r`.`precounit`)) AS `total` from ((`requisicoes` `r` join `departamento` `d` on((`r`.`deptoID` = `d`.`deptoID`))) join `item` `i` on((`i`.`itemID` = `r`.`itemID`))) group by `d`.`depto`,`i`.`item` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`deptoID`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`itemID`);

--
-- Indexes for table `requisicoes`
--
ALTER TABLE `requisicoes`
  ADD PRIMARY KEY (`reqID`),
  ADD KEY `deptoID` (`deptoID`),
  ADD KEY `itemID` (`itemID`);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `requisicoes`
--
ALTER TABLE `requisicoes`
  ADD CONSTRAINT `requisicoes_ibfk_1` FOREIGN KEY (`deptoID`) REFERENCES `departamento` (`deptoID`),
  ADD CONSTRAINT `requisicoes_ibfk_2` FOREIGN KEY (`itemID`) REFERENCES `item` (`itemID`);
--
-- Database: `avaliacao`
--
CREATE DATABASE IF NOT EXISTS `avaliacao` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `avaliacao`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `associados`
--

CREATE TABLE `associados` (
  `matricula` int(4) NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  `cpf` varchar(30) NOT NULL,
  `genero` varchar(30) DEFAULT NULL,
  `data_nascimento` varchar(30) DEFAULT NULL,
  `celular` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `associados`
--

INSERT INTO `associados` (`matricula`, `nome`, `cpf`, `genero`, `data_nascimento`, `celular`) VALUES
(123, 'gustavo', '1478545200', 'masculino', '26/08/1990', '41578428541'),
(1234, 'jessica', '25478965212', 'feminino', '12/10/1995', '415789652300');

-- --------------------------------------------------------

--
-- Estrutura da tabela `dependentes`
--

CREATE TABLE `dependentes` (
  `matricula_associado` int(4) DEFAULT NULL,
  `nome_dependente` varchar(30) DEFAULT NULL,
  `cpf_dependente` varchar(50) NOT NULL,
  `data_nascimento_dependente` varchar(30) DEFAULT NULL,
  `genero_dependente` varchar(30) DEFAULT NULL,
  `Grau_parentesco` varchar(30) DEFAULT NULL,
  `celular_dependente` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `dependentes`
--

INSERT INTO `dependentes` (`matricula_associado`, `nome_dependente`, `cpf_dependente`, `data_nascimento_dependente`, `genero_dependente`, `Grau_parentesco`, `celular_dependente`) VALUES
(123, 'Gabriela', '12475212', '10/02/2005', 'feminino', 'filha', NULL),
(1234, 'Gabriel', '74854632100', '10/02/2010', 'masculino', 'filho', NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vwfamilia`
-- (See below for the actual view)
--
CREATE TABLE `vwfamilia` (
`matricula` int(4)
,`nome` varchar(30)
,`cpf` varchar(30)
,`genero` varchar(30)
,`data_nascimento` varchar(30)
,`celular` varchar(30)
,`matricula_associado` int(4)
,`nome_dependente` varchar(30)
,`cpf_dependente` varchar(50)
,`data_nascimento_dependente` varchar(30)
,`genero_dependente` varchar(30)
,`Grau_parentesco` varchar(30)
,`celular_dependente` varchar(30)
);

-- --------------------------------------------------------

--
-- Structure for view `vwfamilia`
--
DROP TABLE IF EXISTS `vwfamilia`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwfamilia`  AS  select `a`.`matricula` AS `matricula`,`a`.`nome` AS `nome`,`a`.`cpf` AS `cpf`,`a`.`genero` AS `genero`,`a`.`data_nascimento` AS `data_nascimento`,`a`.`celular` AS `celular`,`d`.`matricula_associado` AS `matricula_associado`,`d`.`nome_dependente` AS `nome_dependente`,`d`.`cpf_dependente` AS `cpf_dependente`,`d`.`data_nascimento_dependente` AS `data_nascimento_dependente`,`d`.`genero_dependente` AS `genero_dependente`,`d`.`Grau_parentesco` AS `Grau_parentesco`,`d`.`celular_dependente` AS `celular_dependente` from (`associados` `a` join `dependentes` `d` on((`a`.`matricula` = `d`.`matricula_associado`))) group by `a`.`matricula` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `associados`
--
ALTER TABLE `associados`
  ADD PRIMARY KEY (`matricula`,`cpf`);

--
-- Indexes for table `dependentes`
--
ALTER TABLE `dependentes`
  ADD PRIMARY KEY (`cpf_dependente`),
  ADD KEY `matricula_associado` (`matricula_associado`);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `dependentes`
--
ALTER TABLE `dependentes`
  ADD CONSTRAINT `dependentes_ibfk_1` FOREIGN KEY (`matricula_associado`) REFERENCES `associados` (`matricula`);
--
-- Database: `cc`
--
CREATE DATABASE IF NOT EXISTS `cc` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `cc`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cate`
--

CREATE TABLE `cate` (
  `cod_categoria` int(3) NOT NULL,
  `tipo` varchar(40) DEFAULT NULL,
  `acrescimo` decimal(3,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cate`
--

INSERT INTO `cate` (`cod_categoria`, `tipo`, `acrescimo`) VALUES
(1, 'utilidades domesticas', '0.10'),
(2, 'decoração', '1.20'),
(3, 'jardinagem', '0.60');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoas`
--

CREATE TABLE `pessoas` (
  `id_pessoa` int(3) NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  `cpf` varchar(30) NOT NULL,
  `data_nascimento` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pessoas`
--

INSERT INTO `pessoas` (`id_pessoa`, `nome`, `cpf`, `data_nascimento`) VALUES
(1, 'gustavo', '785420395411', '2000/05/28'),
(2, 'joao', '1254579600', '1999/03/12'),
(3, 'felipe', '5468796324555', '1998/08/07');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `id_produto` int(3) NOT NULL,
  `nome` varchar(40) DEFAULT NULL,
  `descricao` varchar(40) DEFAULT NULL,
  `custo_compra` int(5) DEFAULT NULL,
  `cod_categoria` int(4) NOT NULL,
  `preco_venda` int(4) NOT NULL,
  `promocao` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`id_produto`, `nome`, `descricao`, `custo_compra`, `cod_categoria`, `preco_venda`, `promocao`) VALUES
(1, 'talher', 'inox', 200, 1, 220, 1),
(2, 'conjunto de panelas', 'inox', 200, 1, 220, 1),
(3, 'vaso', 'vidro', 50, 2, 110, 0),
(4, 'tapete', 'tecido', 300, 2, 660, 0),
(5, 'maquina de cortar grama', 'roçadeira', 250, 3, 400, 0),
(6, 'grama', 'bloco', 7, 3, 12, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cate`
--
ALTER TABLE `cate`
  ADD PRIMARY KEY (`cod_categoria`);

--
-- Indexes for table `pessoas`
--
ALTER TABLE `pessoas`
  ADD PRIMARY KEY (`id_pessoa`,`cpf`);

--
-- Indexes for table `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id_produto`,`cod_categoria`,`preco_venda`),
  ADD KEY `cod_categoria` (`cod_categoria`);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`cod_categoria`) REFERENCES `cate` (`cod_categoria`);
--
-- Database: `designdeinteracao`
--
CREATE DATABASE IF NOT EXISTS `designdeinteracao` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `designdeinteracao`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `contatos`
--

CREATE TABLE `contatos` (
  `id_contato` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `contatos`
--

INSERT INTO `contatos` (`id_contato`, `nome`, `email`, `telefone`) VALUES
(1, 'Juvenal Pulme Honesco', 'juvepu@gmail.com', '41988762345'),
(2, 'Cabacraio Roneivos Tudes', 'cabatus@gmail.com', '41987676633'),
(3, 'Xuneide Ligagatakaki', 'xuneide346@gmail.com', '41999887766');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contatos`
--
ALTER TABLE `contatos`
  ADD PRIMARY KEY (`id_contato`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contatos`
--
ALTER TABLE `contatos`
  MODIFY `id_contato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Database: `divertido`
--
CREATE DATABASE IF NOT EXISTS `divertido` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `divertido`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `cod_categoria` char(50) NOT NULL,
  `categoria` char(50) DEFAULT NULL,
  `preco` decimal(3,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`cod_categoria`, `categoria`, `preco`) VALUES
('1', 'terror', '1.00'),
('2', 'guerra', '2.00'),
('3', 'policial', '3.00'),
('4', 'comedia', '3.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `cpf` char(50) NOT NULL,
  `nome` char(50) DEFAULT NULL,
  `data` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`cpf`, `nome`, `data`) VALUES
('2645789', 'gustavo', '1999-08-26'),
('784630122', 'jesus', '2014-06-22'),
('7854632', 'ricardo', '1998-03-16'),
('9874563', 'victor', '1945-09-08');

-- --------------------------------------------------------

--
-- Estrutura da tabela `consumo`
--

CREATE TABLE `consumo` (
  `id_consumo` char(50) NOT NULL,
  `tipo_consumo` char(50) DEFAULT NULL,
  `cod_franquia` char(50) DEFAULT NULL,
  `cod_servico` char(50) DEFAULT NULL,
  `cod_categoria` char(50) DEFAULT NULL,
  `cpf` char(50) DEFAULT NULL,
  `id_plano` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `consumo`
--

INSERT INTO `consumo` (`id_consumo`, `tipo_consumo`, `cod_franquia`, `cod_servico`, `cod_categoria`, `cpf`, `id_plano`) VALUES
('1', 'familia', '1', '7', '2', '2645789', '1'),
('2', 'solo', '2', '7', '2', '2645789', '4'),
('3', 'dupla', '3', '5', '1', '9874563', '2'),
('4', 'esquadrao', '2', '5', '1', '9874563', '3');

-- --------------------------------------------------------

--
-- Estrutura da tabela `forma`
--

CREATE TABLE `forma` (
  `cod_forma` char(50) NOT NULL,
  `forma` char(50) DEFAULT NULL,
  `cod_opcao` char(50) DEFAULT NULL,
  `cpf` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `forma`
--

INSERT INTO `forma` (`cod_forma`, `forma`, `cod_opcao`, `cpf`) VALUES
('1', 'cartao de credito', '1', '2645789'),
('2', 'boleto', '2', '9874563');

-- --------------------------------------------------------

--
-- Estrutura da tabela `franquia`
--

CREATE TABLE `franquia` (
  `cod_franquia` char(50) NOT NULL,
  `franquia` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `franquia`
--

INSERT INTO `franquia` (`cod_franquia`, `franquia`) VALUES
('1', '10 creditos'),
('2', '20 creditos'),
('3', '30 creditos');

-- --------------------------------------------------------

--
-- Estrutura da tabela `opcao`
--

CREATE TABLE `opcao` (
  `cod_opcao` char(50) NOT NULL,
  `opcao` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `opcao`
--

INSERT INTO `opcao` (`cod_opcao`, `opcao`) VALUES
('1', 'pre pago'),
('2', 'pos pago');

-- --------------------------------------------------------

--
-- Estrutura da tabela `plano`
--

CREATE TABLE `plano` (
  `id_plano` char(50) NOT NULL,
  `plano` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `plano`
--

INSERT INTO `plano` (`id_plano`, `plano`) VALUES
('1', 'normal'),
('2', 'medio'),
('3', 'premium'),
('4', 'vip');

-- --------------------------------------------------------

--
-- Estrutura da tabela `servico`
--

CREATE TABLE `servico` (
  `cod_servico` char(50) NOT NULL,
  `servico` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `servico`
--

INSERT INTO `servico` (`cod_servico`, `servico`) VALUES
('1', '1 tela'),
('2', '2 telas'),
('3', '2 telas HD'),
('4', '3 telas HD'),
('5', '4 telas Full HD'),
('6', '3 telas Full HD'),
('7', '2 telas 4k');

-- --------------------------------------------------------

--
-- Estrutura da tabela `servicoxcategoria`
--

CREATE TABLE `servicoxcategoria` (
  `cod_servico` char(50) NOT NULL,
  `cod_categoria` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `servicoxcategoria`
--

INSERT INTO `servicoxcategoria` (`cod_servico`, `cod_categoria`) VALUES
('1', '1'),
('1', '2'),
('1', '3'),
('1', '4'),
('2', '1'),
('2', '2'),
('2', '3'),
('2', '4'),
('3', '1'),
('3', '2'),
('3', '3'),
('3', '4'),
('4', '1'),
('4', '2'),
('4', '3'),
('4', '4'),
('5', '1'),
('5', '2'),
('5', '3'),
('5', '4'),
('6', '1'),
('6', '2'),
('6', '3'),
('6', '4'),
('7', '1'),
('7', '2'),
('7', '3'),
('7', '4');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`cod_categoria`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cpf`);

--
-- Indexes for table `consumo`
--
ALTER TABLE `consumo`
  ADD PRIMARY KEY (`id_consumo`),
  ADD KEY `cod_franquia` (`cod_franquia`),
  ADD KEY `cod_servico` (`cod_servico`,`cod_categoria`),
  ADD KEY `cpf` (`cpf`),
  ADD KEY `id_plano` (`id_plano`);

--
-- Indexes for table `forma`
--
ALTER TABLE `forma`
  ADD PRIMARY KEY (`cod_forma`),
  ADD KEY `cod_opcao` (`cod_opcao`),
  ADD KEY `cpf` (`cpf`);

--
-- Indexes for table `franquia`
--
ALTER TABLE `franquia`
  ADD PRIMARY KEY (`cod_franquia`);

--
-- Indexes for table `opcao`
--
ALTER TABLE `opcao`
  ADD PRIMARY KEY (`cod_opcao`);

--
-- Indexes for table `plano`
--
ALTER TABLE `plano`
  ADD PRIMARY KEY (`id_plano`);

--
-- Indexes for table `servico`
--
ALTER TABLE `servico`
  ADD PRIMARY KEY (`cod_servico`);

--
-- Indexes for table `servicoxcategoria`
--
ALTER TABLE `servicoxcategoria`
  ADD PRIMARY KEY (`cod_servico`,`cod_categoria`),
  ADD KEY `cod_categoria` (`cod_categoria`);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `consumo`
--
ALTER TABLE `consumo`
  ADD CONSTRAINT `consumo_ibfk_1` FOREIGN KEY (`cod_franquia`) REFERENCES `franquia` (`cod_franquia`),
  ADD CONSTRAINT `consumo_ibfk_2` FOREIGN KEY (`cod_servico`,`cod_categoria`) REFERENCES `servicoxcategoria` (`cod_servico`, `cod_categoria`),
  ADD CONSTRAINT `consumo_ibfk_3` FOREIGN KEY (`cpf`) REFERENCES `cliente` (`cpf`),
  ADD CONSTRAINT `consumo_ibfk_4` FOREIGN KEY (`id_plano`) REFERENCES `plano` (`id_plano`);

--
-- Limitadores para a tabela `forma`
--
ALTER TABLE `forma`
  ADD CONSTRAINT `forma_ibfk_1` FOREIGN KEY (`cod_opcao`) REFERENCES `opcao` (`cod_opcao`),
  ADD CONSTRAINT `forma_ibfk_2` FOREIGN KEY (`cpf`) REFERENCES `cliente` (`cpf`);

--
-- Limitadores para a tabela `servicoxcategoria`
--
ALTER TABLE `servicoxcategoria`
  ADD CONSTRAINT `servicoxcategoria_ibfk_1` FOREIGN KEY (`cod_servico`) REFERENCES `servico` (`cod_servico`),
  ADD CONSTRAINT `servicoxcategoria_ibfk_2` FOREIGN KEY (`cod_categoria`) REFERENCES `categoria` (`cod_categoria`);
--
-- Database: `gustavo`
--
CREATE DATABASE IF NOT EXISTS `gustavo` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `gustavo`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `curso`
--

CREATE TABLE `curso` (
  `id_curso` int(11) NOT NULL,
  `nome_curso` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `curso`
--

INSERT INTO `curso` (`id_curso`, `nome_curso`) VALUES
(1, 'SPSS'),
(2, 'pesquisa'),
(3, 'IVA'),
(4, 'C++'),
(5, 'investimen'),
(6, 'TQM');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cursoquestao2`
--

CREATE TABLE `cursoquestao2` (
  `id_curso` int(11) NOT NULL,
  `curso` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cursoquestao2`
--

INSERT INTO `cursoquestao2` (`id_curso`, `curso`) VALUES
(1, 'BSI'),
(2, 'ciencia de dados'),
(3, 'engenharia de software');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cursoxfuncionario`
--

CREATE TABLE `cursoxfuncionario` (
  `id_emp` int(11) DEFAULT NULL,
  `id_curso` int(11) DEFAULT NULL,
  `data_conclusao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cursoxfuncionario`
--

INSERT INTO `cursoxfuncionario` (`id_emp`, `id_curso`, `data_conclusao`) VALUES
(100, 1, '2002-06-19'),
(100, 2, '2002-10-07'),
(140, 3, '2002-12-08'),
(110, 1, '2002-12-01'),
(110, 4, '2002-04-22'),
(190, 5, '2002-05-07'),
(150, 1, '2002-06-19'),
(150, 6, '2003-08-12');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cursoxlivroxpro`
--

CREATE TABLE `cursoxlivroxpro` (
  `cod` int(11) NOT NULL,
  `id_curso` int(11) DEFAULT NULL,
  `id_livro` int(11) DEFAULT NULL,
  `cod_prof` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cursoxlivroxpro`
--

INSERT INTO `cursoxlivroxpro` (`cod`, `id_curso`, `id_livro`, `cod_prof`) VALUES
(1, 1, 1, 1),
(2, 1, 1, 2),
(3, 1, 1, 3),
(4, 1, 2, 5),
(5, 2, NULL, 3),
(6, 2, NULL, 4),
(7, 2, NULL, 1),
(8, 3, NULL, 5),
(9, 2, NULL, 6),
(10, 2, NULL, 7);

-- --------------------------------------------------------

--
-- Estrutura da tabela `depart`
--

CREATE TABLE `depart` (
  `id_depart` int(11) NOT NULL,
  `nome_depart` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `depart`
--

INSERT INTO `depart` (`id_depart`, `nome_depart`) VALUES
(1, 'marketing'),
(2, 'financeira'),
(3, 'sistemas de informação'),
(4, 'contabilidade');

-- --------------------------------------------------------

--
-- Estrutura da tabela `equipe`
--

CREATE TABLE `equipe` (
  `cod_func` int(11) NOT NULL,
  `nome_func` char(50) DEFAULT NULL,
  `cpf_funcionario` char(50) DEFAULT NULL,
  `cod_chefia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `equipe`
--

INSERT INTO `equipe` (`cod_func`, `nome_func`, `cpf_funcionario`, `cod_chefia`) VALUES
(1, 'vitoria', '457854', NULL),
(2, 'pedro', '47854', 1),
(3, 'ana maria', '78546', 1),
(4, 'silvio', '74856', 1),
(5, 'carlos', '66652', 3),
(6, 'paula', '98745', 3),
(7, 'cristiana', '145875', 3),
(8, 'antonio', '475821', 6),
(9, 'eduardo', '457852', 6),
(10, 'anelise', '52136', 4),
(11, 'cintia', '65893', 4),
(12, 'mario', '78542', 4),
(13, 'vilma', '47856', 10),
(14, 'fernando', '78546', 10),
(15, 'paulo', '00123', 12),
(16, 'andre', '4520', 12);

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `id_emp` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`id_emp`, `nome`) VALUES
(100, 'margarida'),
(110, 'cristovao'),
(140, 'helio'),
(150, 'susana'),
(190, 'lourenço');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionarioxdepart`
--

CREATE TABLE `funcionarioxdepart` (
  `id_emp` int(11) DEFAULT NULL,
  `id_depart` int(11) DEFAULT NULL,
  `salario` decimal(6,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `funcionarioxdepart`
--

INSERT INTO `funcionarioxdepart` (`id_emp`, `id_depart`, `salario`) VALUES
(100, 1, '42.0000'),
(140, 2, '39.0000'),
(110, 3, '41.5000'),
(190, 4, '38.0000'),
(150, 1, '38.5000');

-- --------------------------------------------------------

--
-- Estrutura da tabela `livro`
--

CREATE TABLE `livro` (
  `id_livro` int(11) NOT NULL,
  `livro` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `livro`
--

INSERT INTO `livro` (`id_livro`, `livro`) VALUES
(1, 'Técnicas de aprendizado de máquina'),
(2, 'Matemática para newbies');

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor`
--

CREATE TABLE `professor` (
  `cod_prof` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `professor`
--

INSERT INTO `professor` (`cod_prof`, `nome`) VALUES
(1, 'joao marcelo'),
(2, 'pedro silva'),
(3, 'adriana souza'),
(4, 'mario costa'),
(5, 'carlos castanheda'),
(6, 'felipe inocencio'),
(7, 'pedro de lara');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`id_curso`);

--
-- Indexes for table `cursoquestao2`
--
ALTER TABLE `cursoquestao2`
  ADD PRIMARY KEY (`id_curso`);

--
-- Indexes for table `cursoxfuncionario`
--
ALTER TABLE `cursoxfuncionario`
  ADD KEY `id_emp` (`id_emp`),
  ADD KEY `id_curso` (`id_curso`);

--
-- Indexes for table `cursoxlivroxpro`
--
ALTER TABLE `cursoxlivroxpro`
  ADD PRIMARY KEY (`cod`),
  ADD KEY `id_curso` (`id_curso`),
  ADD KEY `id_livro` (`id_livro`),
  ADD KEY `cod_prof` (`cod_prof`);

--
-- Indexes for table `depart`
--
ALTER TABLE `depart`
  ADD PRIMARY KEY (`id_depart`);

--
-- Indexes for table `equipe`
--
ALTER TABLE `equipe`
  ADD PRIMARY KEY (`cod_func`),
  ADD KEY `cod_chefia` (`cod_chefia`);

--
-- Indexes for table `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`id_emp`);

--
-- Indexes for table `funcionarioxdepart`
--
ALTER TABLE `funcionarioxdepart`
  ADD KEY `id_emp` (`id_emp`),
  ADD KEY `id_depart` (`id_depart`);

--
-- Indexes for table `livro`
--
ALTER TABLE `livro`
  ADD PRIMARY KEY (`id_livro`);

--
-- Indexes for table `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`cod_prof`);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `cursoxfuncionario`
--
ALTER TABLE `cursoxfuncionario`
  ADD CONSTRAINT `cursoxfuncionario_ibfk_1` FOREIGN KEY (`id_emp`) REFERENCES `funcionario` (`id_emp`),
  ADD CONSTRAINT `cursoxfuncionario_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`);

--
-- Limitadores para a tabela `cursoxlivroxpro`
--
ALTER TABLE `cursoxlivroxpro`
  ADD CONSTRAINT `cursoxlivroxpro_ibfk_1` FOREIGN KEY (`id_curso`) REFERENCES `cursoquestao2` (`id_curso`),
  ADD CONSTRAINT `cursoxlivroxpro_ibfk_2` FOREIGN KEY (`id_livro`) REFERENCES `livro` (`id_livro`),
  ADD CONSTRAINT `cursoxlivroxpro_ibfk_3` FOREIGN KEY (`cod_prof`) REFERENCES `professor` (`cod_prof`);

--
-- Limitadores para a tabela `equipe`
--
ALTER TABLE `equipe`
  ADD CONSTRAINT `equipe_ibfk_1` FOREIGN KEY (`cod_chefia`) REFERENCES `equipe` (`cod_func`);

--
-- Limitadores para a tabela `funcionarioxdepart`
--
ALTER TABLE `funcionarioxdepart`
  ADD CONSTRAINT `funcionarioxdepart_ibfk_1` FOREIGN KEY (`id_emp`) REFERENCES `funcionario` (`id_emp`),
  ADD CONSTRAINT `funcionarioxdepart_ibfk_2` FOREIGN KEY (`id_depart`) REFERENCES `depart` (`id_depart`);
--
-- Database: `gustavo01`
--
CREATE DATABASE IF NOT EXISTS `gustavo01` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `gustavo01`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `Codigo_cliente` int(11) NOT NULL,
  `Nome_cliente` varchar(50) DEFAULT NULL,
  `CPF_Cliente` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`CPF_Cliente`);
--
-- Database: `gustavojava`
--
CREATE DATABASE IF NOT EXISTS `gustavojava` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `gustavojava`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `cod_cliente` int(11) DEFAULT NULL,
  `nome` varchar(144) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`cod_cliente`, `nome`) VALUES
(1, 'gustavo'),
(2, 'josicleiton'),
(3, 'maria'),
(3, 'maria');
--
-- Database: `heranca`
--
CREATE DATABASE IF NOT EXISTS `heranca` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `heranca`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `nome` varchar(50) DEFAULT NULL,
  `cod` int(50) NOT NULL,
  `validade` int(11) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `preco` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`nome`, `cod`, `validade`, `tipo`, `preco`) VALUES
('coxinha', 1, 2, 'salgado', 4),
('kibe', 2, 2, 'salgado', 4),
('pastel', 3, 1, 'salgado', 3),
('refrigerante', 4, 30, 'bebida', 4.5),
('cha', 5, 30, 'bebida', 4),
('suco', 6, 30, 'bebida', 4.5),
('doce', 7, 5, 'bomboniere', 2),
('bala', 8, 10, 'bomboniere', 1),
('chicletes', 12, 30, 'bomboniere', 2),
('x-salada', 13, 1, 'sandwich', 6),
('x-bacon', 14, 1, 'sandwich', 7),
('x-tudo', 15, 1, 'sandwich', 13);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`cod`);
--
-- Database: `huhu`
--
CREATE DATABASE IF NOT EXISTS `huhu` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `huhu`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id`, `nome`, `email`) VALUES
(1, 'lechetta', 'radioativo');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);
--
-- Database: `lechetta`
--
CREATE DATABASE IF NOT EXISTS `lechetta` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `lechetta`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `Codigo_cliente` int(11) NOT NULL,
  `Nome_cliente` varchar(50) DEFAULT NULL,
  `CPF_Cliente` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`CPF_Cliente`);
--
-- Database: `northwind`
--
CREATE DATABASE IF NOT EXISTS `northwind` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `northwind`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `company` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `email_address` varchar(50) DEFAULT NULL,
  `job_title` varchar(50) DEFAULT NULL,
  `business_phone` varchar(25) DEFAULT NULL,
  `home_phone` varchar(25) DEFAULT NULL,
  `mobile_phone` varchar(25) DEFAULT NULL,
  `fax_number` varchar(25) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state_province` varchar(50) DEFAULT NULL,
  `zip_postal_code` varchar(15) DEFAULT NULL,
  `country_region` varchar(50) DEFAULT NULL,
  `web_page` varchar(250) DEFAULT NULL,
  `notes` varchar(250) DEFAULT NULL,
  `attachments` longblob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `customers`
--

INSERT INTO `customers` (`id`, `company`, `last_name`, `first_name`, `email_address`, `job_title`, `business_phone`, `home_phone`, `mobile_phone`, `fax_number`, `address`, `city`, `state_province`, `zip_postal_code`, `country_region`, `web_page`, `notes`, `attachments`) VALUES
(1, 'Company A', 'Bedecs', 'Anna', NULL, 'Owner', '(123)555-0100', NULL, NULL, '(123)555-0101', '123 1st Street', 'Seattle', 'WA', '99999', 'USA', NULL, NULL, ''),
(2, 'Company B', 'Gratacos Solsona', 'Antonio', NULL, 'Owner', '(123)555-0100', NULL, NULL, '(123)555-0101', '123 2nd Street', 'Boston', 'MA', '99999', 'USA', NULL, NULL, ''),
(3, 'Company C', 'Axen', 'Thomas', NULL, 'Purchasing Representative', '(123)555-0100', NULL, NULL, '(123)555-0101', '123 3rd Street', 'Los Angelas', 'CA', '99999', 'USA', NULL, NULL, ''),
(4, 'Company D', 'Lee', 'Christina', NULL, 'Purchasing Manager', '(123)555-0100', NULL, NULL, '(123)555-0101', '123 4th Street', 'New York', 'NY', '99999', 'USA', NULL, NULL, ''),
(5, 'Company E', 'O’Donnell', 'Martin', NULL, 'Owner', '(123)555-0100', NULL, NULL, '(123)555-0101', '123 5th Street', 'Minneapolis', 'MN', '99999', 'USA', NULL, NULL, ''),
(6, 'Company F', 'Pérez-Olaeta', 'Francisco', NULL, 'Purchasing Manager', '(123)555-0100', NULL, NULL, '(123)555-0101', '123 6th Street', 'Milwaukee', 'WI', '99999', 'USA', NULL, NULL, ''),
(7, 'Company G', 'Xie', 'Ming-Yang', NULL, 'Owner', '(123)555-0100', NULL, NULL, '(123)555-0101', '123 7th Street', 'Boise', 'ID', '99999', 'USA', NULL, NULL, ''),
(8, 'Company H', 'Andersen', 'Elizabeth', NULL, 'Purchasing Representative', '(123)555-0100', NULL, NULL, '(123)555-0101', '123 8th Street', 'Portland', 'OR', '99999', 'USA', NULL, NULL, ''),
(9, 'Company I', 'Mortensen', 'Sven', NULL, 'Purchasing Manager', '(123)555-0100', NULL, NULL, '(123)555-0101', '123 9th Street', 'Salt Lake City', 'UT', '99999', 'USA', NULL, NULL, ''),
(10, 'Company J', 'Wacker', 'Roland', NULL, 'Purchasing Manager', '(123)555-0100', NULL, NULL, '(123)555-0101', '123 10th Street', 'Chicago', 'IL', '99999', 'USA', NULL, NULL, ''),
(11, 'Company K', 'Krschne', 'Peter', NULL, 'Purchasing Manager', '(123)555-0100', NULL, NULL, '(123)555-0101', '123 11th Street', 'Miami', 'FL', '99999', 'USA', NULL, NULL, ''),
(12, 'Company L', 'Edwards', 'John', NULL, 'Purchasing Manager', '(123)555-0100', NULL, NULL, '(123)555-0101', '123 12th Street', 'Las Vegas', 'NV', '99999', 'USA', NULL, NULL, ''),
(13, 'Company M', 'Ludick', 'Andre', NULL, 'Purchasing Representative', '(123)555-0100', NULL, NULL, '(123)555-0101', '456 13th Street', 'Memphis', 'TN', '99999', 'USA', NULL, NULL, ''),
(14, 'Company N', 'Grilo', 'Carlos', NULL, 'Purchasing Representative', '(123)555-0100', NULL, NULL, '(123)555-0101', '456 14th Street', 'Denver', 'CO', '99999', 'USA', NULL, NULL, ''),
(15, 'Company O', 'Kupkova', 'Helena', NULL, 'Purchasing Manager', '(123)555-0100', NULL, NULL, '(123)555-0101', '456 15th Street', 'Honolulu', 'HI', '99999', 'USA', NULL, NULL, ''),
(16, 'Company P', 'Goldschmidt', 'Daniel', NULL, 'Purchasing Representative', '(123)555-0100', NULL, NULL, '(123)555-0101', '456 16th Street', 'San Francisco', 'CA', '99999', 'USA', NULL, NULL, ''),
(17, 'Company Q', 'Bagel', 'Jean Philippe', NULL, 'Owner', '(123)555-0100', NULL, NULL, '(123)555-0101', '456 17th Street', 'Seattle', 'WA', '99999', 'USA', NULL, NULL, ''),
(18, 'Company R', 'Autier Miconi', 'Catherine', NULL, 'Purchasing Representative', '(123)555-0100', NULL, NULL, '(123)555-0101', '456 18th Street', 'Boston', 'MA', '99999', 'USA', NULL, NULL, ''),
(19, 'Company S', 'Eggerer', 'Alexander', NULL, 'Accounting Assistant', '(123)555-0100', NULL, NULL, '(123)555-0101', '789 19th Street', 'Los Angelas', 'CA', '99999', 'USA', NULL, NULL, ''),
(20, 'Company T', 'Li', 'George', NULL, 'Purchasing Manager', '(123)555-0100', NULL, NULL, '(123)555-0101', '789 20th Street', 'New York', 'NY', '99999', 'USA', NULL, NULL, ''),
(21, 'Company U', 'Tham', 'Bernard', NULL, 'Accounting Manager', '(123)555-0100', NULL, NULL, '(123)555-0101', '789 21th Street', 'Minneapolis', 'MN', '99999', 'USA', NULL, NULL, ''),
(22, 'Company V', 'Ramos', 'Luciana', NULL, 'Purchasing Assistant', '(123)555-0100', NULL, NULL, '(123)555-0101', '789 22th Street', 'Milwaukee', 'WI', '99999', 'USA', NULL, NULL, ''),
(23, 'Company W', 'Entin', 'Michael', NULL, 'Purchasing Manager', '(123)555-0100', NULL, NULL, '(123)555-0101', '789 23th Street', 'Portland', 'OR', '99999', 'USA', NULL, NULL, ''),
(24, 'Company X', 'Hasselberg', 'Jonas', NULL, 'Owner', '(123)555-0100', NULL, NULL, '(123)555-0101', '789 24th Street', 'Salt Lake City', 'UT', '99999', 'USA', NULL, NULL, ''),
(25, 'Company Y', 'Rodman', 'John', NULL, 'Purchasing Manager', '(123)555-0100', NULL, NULL, '(123)555-0101', '789 25th Street', 'Chicago', 'IL', '99999', 'USA', NULL, NULL, ''),
(26, 'Company Z', 'Liu', 'Run', NULL, 'Accounting Assistant', '(123)555-0100', NULL, NULL, '(123)555-0101', '789 26th Street', 'Miami', 'FL', '99999', 'USA', NULL, NULL, ''),
(27, 'Company AA', 'Toh', 'Karen', NULL, 'Purchasing Manager', '(123)555-0100', NULL, NULL, '(123)555-0101', '789 27th Street', 'Las Vegas', 'NV', '99999', 'USA', NULL, NULL, ''),
(28, 'Company BB', 'Raghav', 'Amritansh', NULL, 'Purchasing Manager', '(123)555-0100', NULL, NULL, '(123)555-0101', '789 28th Street', 'Memphis', 'TN', '99999', 'USA', NULL, NULL, ''),
(29, 'Company CC', 'Lee', 'Soo Jung', NULL, 'Purchasing Manager', '(123)555-0100', NULL, NULL, '(123)555-0101', '789 29th Street', 'Denver', 'CO', '99999', 'USA', NULL, NULL, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `customersauxiliar`
--

CREATE TABLE `customersauxiliar` (
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email_address` varchar(50) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `customersauxiliar`
--

INSERT INTO `customersauxiliar` (`first_name`, `last_name`, `email_address`, `phone`) VALUES
('Anna', 'Bedecs', NULL, NULL),
('Jean Philippe', 'Bagel', NULL, NULL),
('Jean Philippe', 'Bagel', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `company` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `email_address` varchar(50) DEFAULT NULL,
  `job_title` varchar(50) DEFAULT NULL,
  `business_phone` varchar(25) DEFAULT NULL,
  `home_phone` varchar(25) DEFAULT NULL,
  `mobile_phone` varchar(25) DEFAULT NULL,
  `fax_number` varchar(25) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state_province` varchar(50) DEFAULT NULL,
  `zip_postal_code` varchar(15) DEFAULT NULL,
  `country_region` varchar(50) DEFAULT NULL,
  `web_page` varchar(250) DEFAULT NULL,
  `notes` varchar(250) DEFAULT NULL,
  `attachments` longblob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `employees`
--

INSERT INTO `employees` (`id`, `company`, `last_name`, `first_name`, `email_address`, `job_title`, `business_phone`, `home_phone`, `mobile_phone`, `fax_number`, `address`, `city`, `state_province`, `zip_postal_code`, `country_region`, `web_page`, `notes`, `attachments`) VALUES
(1, 'Northwind Traders', 'Freehafer', 'Nancy', 'nancy@northwindtraders.com', 'Sales Representative', '(123)555-0100', '(123)555-0102', NULL, '(123)555-0103', '123 1st Avenue', 'Seattle', 'WA', '99999', 'USA', '#http://northwindtraders.com#', NULL, ''),
(2, 'Northwind Traders', 'Cencini', 'Andrew', 'andrew@northwindtraders.com', 'Vice President, Sales', '(123)555-0100', '(123)555-0102', NULL, '(123)555-0103', '123 2nd Avenue', 'Bellevue', 'WA', '99999', 'USA', 'http://northwindtraders.com#http://northwindtraders.com/#', 'Joined the company as a sales representative, was promoted to sales manager and was then named vice president of sales.', ''),
(3, 'Northwind Traders', 'Kotas', 'Jan', 'jan@northwindtraders.com', 'Sales Representative', '(123)555-0100', '(123)555-0102', NULL, '(123)555-0103', '123 3rd Avenue', 'Redmond', 'WA', '99999', 'USA', 'http://northwindtraders.com#http://northwindtraders.com/#', 'Was hired as a sales associate and was promoted to sales representative.', ''),
(4, 'Northwind Traders', 'Sergienko', 'Mariya', 'mariya@northwindtraders.com', 'Sales Representative', '(123)555-0100', '(123)555-0102', NULL, '(123)555-0103', '123 4th Avenue', 'Kirkland', 'WA', '99999', 'USA', 'http://northwindtraders.com#http://northwindtraders.com/#', NULL, ''),
(5, 'Northwind Traders', 'Thorpe', 'Steven', 'steven@northwindtraders.com', 'Sales Manager', '(123)555-0100', '(123)555-0102', NULL, '(123)555-0103', '123 5th Avenue', 'Seattle', 'WA', '99999', 'USA', 'http://northwindtraders.com#http://northwindtraders.com/#', 'Joined the company as a sales representative and was promoted to sales manager.  Fluent in French.', ''),
(6, 'Northwind Traders', 'Neipper', 'Michael', 'michael@northwindtraders.com', 'Sales Representative', '(123)555-0100', '(123)555-0102', NULL, '(123)555-0103', '123 6th Avenue', 'Redmond', 'WA', '99999', 'USA', 'http://northwindtraders.com#http://northwindtraders.com/#', 'Fluent in Japanese and can read and write French, Portuguese, and Spanish.', ''),
(7, 'Northwind Traders', 'Zare', 'Robert', 'robert@northwindtraders.com', 'Sales Representative', '(123)555-0100', '(123)555-0102', NULL, '(123)555-0103', '123 7th Avenue', 'Seattle', 'WA', '99999', 'USA', 'http://northwindtraders.com#http://northwindtraders.com/#', NULL, ''),
(8, 'Northwind Traders', 'Giussani', 'Laura', 'laura@northwindtraders.com', 'Sales Coordinator', '(123)555-0100', '(123)555-0102', NULL, '(123)555-0103', '123 8th Avenue', 'Redmond', 'WA', '99999', 'USA', 'http://northwindtraders.com#http://northwindtraders.com/#', 'Reads and writes French.', ''),
(9, 'Northwind Traders', 'Hellung-Larsen', 'Anne', 'anne@northwindtraders.com', 'Sales Representative', '(123)555-0100', '(123)555-0102', NULL, '(123)555-0103', '123 9th Avenue', 'Seattle', 'WA', '99999', 'USA', 'http://northwindtraders.com#http://northwindtraders.com/#', 'Fluent in French and German.', ''),
(1900, NULL, 'Escobar', 'Leandro', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Acionadores `employees`
--
DELIMITER $$
CREATE TRIGGER `atualizaCidade` BEFORE UPDATE ON `employees` FOR EACH ROW begin 
	if(old.city != 'Boston') then 
    signal sqlstate '45000'
    set message_text = 'cidade invalido';
    end if;
    end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `evitaGravar` BEFORE INSERT ON `employees` FOR EACH ROW begin
	if new.first_name = 'Leandro' && new.last_name = 'Escobar' then
    signal sqlstate '45000'
    set message_text = 'nome invalido';
    end if;
    end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `exercicio1`
-- (See below for the actual view)
--
CREATE TABLE `exercicio1` (
`first_name` varchar(50)
,`id` int(11)
,`ship_address` varchar(250)
,`ship_city` varchar(50)
,`ship_state_province` varchar(50)
,`quantity` decimal(18,4)
,`product_name` varchar(50)
,`product_id` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `inventory_transactions`
--

CREATE TABLE `inventory_transactions` (
  `id` int(11) NOT NULL,
  `transaction_type` tinyint(4) NOT NULL,
  `transaction_created_date` datetime DEFAULT NULL,
  `transaction_modified_date` datetime DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `purchase_order_id` int(11) DEFAULT NULL,
  `customer_order_id` int(11) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `inventory_transactions`
--

INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
(35, 1, '2006-03-22 00:00:00', '2006-03-22 00:00:00', 80, 75, NULL, NULL, NULL),
(36, 1, '2006-03-22 00:00:00', '2006-03-22 00:00:00', 72, 40, NULL, NULL, NULL),
(37, 1, '2006-03-22 00:00:00', '2006-03-22 00:00:00', 52, 100, NULL, NULL, NULL),
(38, 1, '2006-03-22 00:00:00', '2006-03-22 00:00:00', 56, 120, NULL, NULL, NULL),
(39, 1, '2006-03-22 00:00:00', '2006-03-22 00:00:00', 57, 80, NULL, NULL, NULL),
(40, 1, '2006-03-22 00:00:00', '2006-03-22 00:00:00', 6, 100, NULL, NULL, NULL),
(41, 1, '2006-03-22 00:00:00', '2006-03-22 00:00:00', 7, 40, NULL, NULL, NULL),
(42, 1, '2006-03-22 00:00:00', '2006-03-22 00:00:00', 8, 40, NULL, NULL, NULL),
(43, 1, '2006-03-22 00:00:00', '2006-03-22 00:00:00', 14, 40, NULL, NULL, NULL),
(44, 1, '2006-03-22 00:00:00', '2006-03-22 00:00:00', 17, 40, NULL, NULL, NULL),
(45, 1, '2006-03-22 00:00:00', '2006-03-22 00:00:00', 19, 20, NULL, NULL, NULL),
(46, 1, '2006-03-22 00:00:00', '2006-03-22 00:00:00', 20, 40, NULL, NULL, NULL),
(47, 1, '2006-03-22 00:00:00', '2006-03-22 00:00:00', 21, 20, NULL, NULL, NULL),
(48, 1, '2006-03-22 00:00:00', '2006-03-22 00:00:00', 40, 120, NULL, NULL, NULL),
(49, 1, '2006-03-22 00:00:00', '2006-03-22 00:00:00', 41, 40, NULL, NULL, NULL),
(50, 1, '2006-03-22 00:00:00', '2006-03-22 00:00:00', 48, 100, NULL, NULL, NULL),
(51, 1, '2006-03-22 00:00:00', '2006-03-22 00:00:00', 51, 40, NULL, NULL, NULL),
(52, 1, '2006-03-22 00:00:00', '2006-03-22 00:00:00', 74, 20, NULL, NULL, NULL),
(53, 1, '2006-03-22 00:00:00', '2006-03-22 00:00:00', 77, 60, NULL, NULL, NULL),
(54, 1, '2006-03-22 00:00:00', '2006-03-22 00:00:00', 3, 100, NULL, NULL, NULL),
(55, 1, '2006-03-22 00:00:00', '2006-03-22 00:00:00', 4, 40, NULL, NULL, NULL),
(56, 1, '2006-03-22 00:00:00', '2006-03-22 00:00:00', 5, 40, NULL, NULL, NULL),
(57, 1, '2006-03-22 00:00:00', '2006-03-22 00:00:00', 65, 40, NULL, NULL, NULL),
(58, 1, '2006-03-22 00:00:00', '2006-03-22 00:00:00', 66, 80, NULL, NULL, NULL),
(59, 1, '2006-03-22 00:00:00', '2006-03-22 00:00:00', 1, 40, NULL, NULL, NULL),
(60, 1, '2006-03-22 00:00:00', '2006-03-22 00:00:00', 34, 60, NULL, NULL, NULL),
(61, 1, '2006-03-22 00:00:00', '2006-03-22 00:00:00', 43, 100, NULL, NULL, NULL),
(62, 1, '2006-03-22 00:00:00', '2006-03-22 00:00:00', 81, 125, NULL, NULL, NULL),
(63, 2, '2006-03-22 00:00:00', '2006-03-24 00:00:00', 80, 30, NULL, NULL, NULL),
(64, 2, '2006-03-22 00:00:00', '2006-03-22 00:00:00', 7, 10, NULL, NULL, NULL),
(65, 2, '2006-03-22 00:00:00', '2006-03-22 00:00:00', 51, 10, NULL, NULL, NULL),
(66, 2, '2006-03-22 00:00:00', '2006-03-22 00:00:00', 80, 10, NULL, NULL, NULL),
(67, 2, '2006-03-22 00:00:00', '2006-03-22 00:00:00', 1, 15, NULL, NULL, NULL),
(68, 2, '2006-03-22 00:00:00', '2006-03-22 00:00:00', 43, 20, NULL, NULL, NULL),
(69, 2, '2006-03-22 00:00:00', '2006-03-24 00:00:00', 19, 20, NULL, NULL, NULL),
(70, 2, '2006-03-22 00:00:00', '2006-03-24 00:00:00', 48, 10, NULL, NULL, NULL),
(71, 2, '2006-03-22 00:00:00', '2006-03-24 00:00:00', 8, 17, NULL, NULL, NULL),
(72, 1, '2006-03-24 00:00:00', '2006-03-24 00:00:00', 81, 200, NULL, NULL, NULL),
(73, 2, '2006-03-24 00:00:00', '2006-03-24 00:00:00', 81, 200, NULL, NULL, 'Fill Back Ordered product, Order #40'),
(74, 1, '2006-03-24 00:00:00', '2006-03-24 00:00:00', 48, 100, NULL, NULL, NULL),
(75, 2, '2006-03-24 00:00:00', '2006-03-24 00:00:00', 48, 100, NULL, NULL, 'Fill Back Ordered product, Order #39'),
(76, 1, '2006-03-24 00:00:00', '2006-03-24 00:00:00', 43, 300, NULL, NULL, NULL),
(77, 2, '2006-03-24 00:00:00', '2006-03-24 00:00:00', 43, 300, NULL, NULL, 'Fill Back Ordered product, Order #38'),
(78, 1, '2006-03-24 00:00:00', '2006-03-24 00:00:00', 41, 200, NULL, NULL, NULL),
(79, 2, '2006-03-24 00:00:00', '2006-03-24 00:00:00', 41, 200, NULL, NULL, 'Fill Back Ordered product, Order #36'),
(80, 1, '2006-03-24 00:00:00', '2006-03-24 00:00:00', 19, 30, NULL, NULL, NULL),
(81, 2, '2006-03-24 00:00:00', '2006-03-24 00:00:00', 19, 30, NULL, NULL, 'Fill Back Ordered product, Order #33'),
(82, 1, '2006-03-24 00:00:00', '2006-03-24 00:00:00', 34, 100, NULL, NULL, NULL),
(83, 2, '2006-03-24 00:00:00', '2006-03-24 00:00:00', 34, 100, NULL, NULL, 'Fill Back Ordered product, Order #30'),
(84, 2, '2006-03-24 00:00:00', '2006-04-04 00:00:00', 6, 10, NULL, NULL, NULL),
(85, 2, '2006-03-24 00:00:00', '2006-04-04 00:00:00', 4, 10, NULL, NULL, NULL),
(86, 3, '2006-03-24 00:00:00', '2006-03-24 00:00:00', 80, 20, NULL, NULL, NULL),
(87, 3, '2006-03-24 00:00:00', '2006-03-24 00:00:00', 81, 50, NULL, NULL, NULL),
(88, 3, '2006-03-24 00:00:00', '2006-03-24 00:00:00', 1, 25, NULL, NULL, NULL),
(89, 3, '2006-03-24 00:00:00', '2006-03-24 00:00:00', 43, 25, NULL, NULL, NULL),
(90, 3, '2006-03-24 00:00:00', '2006-03-24 00:00:00', 81, 25, NULL, NULL, NULL),
(91, 2, '2006-03-24 00:00:00', '2006-04-04 00:00:00', 40, 50, NULL, NULL, NULL),
(92, 2, '2006-03-24 00:00:00', '2006-04-04 00:00:00', 21, 20, NULL, NULL, NULL),
(93, 2, '2006-03-24 00:00:00', '2006-04-04 00:00:00', 5, 25, NULL, NULL, NULL),
(94, 2, '2006-03-24 00:00:00', '2006-04-04 00:00:00', 41, 30, NULL, NULL, NULL),
(95, 2, '2006-03-24 00:00:00', '2006-04-04 00:00:00', 40, 30, NULL, NULL, NULL),
(96, 3, '2006-03-30 00:00:00', '2006-03-30 00:00:00', 34, 12, NULL, NULL, NULL),
(97, 3, '2006-03-30 00:00:00', '2006-03-30 00:00:00', 34, 10, NULL, NULL, NULL),
(98, 3, '2006-03-30 00:00:00', '2006-03-30 00:00:00', 34, 1, NULL, NULL, NULL),
(99, 2, '2006-04-03 00:00:00', '2006-04-03 00:00:00', 48, 10, NULL, NULL, NULL),
(100, 1, '2006-04-04 00:00:00', '2006-04-04 00:00:00', 57, 100, NULL, NULL, NULL),
(101, 2, '2006-04-04 00:00:00', '2006-04-04 00:00:00', 57, 100, NULL, NULL, 'Fill Back Ordered product, Order #46'),
(102, 1, '2006-04-04 00:00:00', '2006-04-04 00:00:00', 34, 50, NULL, NULL, NULL),
(103, 1, '2006-04-04 00:00:00', '2006-04-04 00:00:00', 43, 250, NULL, NULL, NULL),
(104, 3, '2006-04-04 00:00:00', '2006-04-04 00:00:00', 43, 300, NULL, NULL, 'Fill Back Ordered product, Order #41'),
(105, 1, '2006-04-04 00:00:00', '2006-04-04 00:00:00', 8, 25, NULL, NULL, NULL),
(106, 2, '2006-04-04 00:00:00', '2006-04-04 00:00:00', 8, 25, NULL, NULL, 'Fill Back Ordered product, Order #48'),
(107, 1, '2006-04-04 00:00:00', '2006-04-04 00:00:00', 34, 300, NULL, NULL, NULL),
(108, 2, '2006-04-04 00:00:00', '2006-04-04 00:00:00', 34, 300, NULL, NULL, 'Fill Back Ordered product, Order #47'),
(109, 1, '2006-04-04 00:00:00', '2006-04-04 00:00:00', 19, 25, NULL, NULL, NULL),
(110, 2, '2006-04-04 00:00:00', '2006-04-04 00:00:00', 19, 10, NULL, NULL, 'Fill Back Ordered product, Order #42'),
(111, 1, '2006-04-04 00:00:00', '2006-04-04 00:00:00', 19, 10, NULL, NULL, NULL),
(112, 2, '2006-04-04 00:00:00', '2006-04-04 00:00:00', 19, 25, NULL, NULL, 'Fill Back Ordered product, Order #48'),
(113, 1, '2006-04-04 00:00:00', '2006-04-04 00:00:00', 72, 50, NULL, NULL, NULL),
(114, 2, '2006-04-04 00:00:00', '2006-04-04 00:00:00', 72, 50, NULL, NULL, 'Fill Back Ordered product, Order #46'),
(115, 1, '2006-04-04 00:00:00', '2006-04-04 00:00:00', 41, 50, NULL, NULL, NULL),
(116, 2, '2006-04-04 00:00:00', '2006-04-04 00:00:00', 41, 50, NULL, NULL, 'Fill Back Ordered product, Order #45'),
(117, 2, '2006-04-04 00:00:00', '2006-04-04 00:00:00', 34, 87, NULL, NULL, NULL),
(118, 2, '2006-04-04 00:00:00', '2006-04-04 00:00:00', 51, 30, NULL, NULL, NULL),
(119, 2, '2006-04-04 00:00:00', '2006-04-04 00:00:00', 7, 30, NULL, NULL, NULL),
(120, 2, '2006-04-04 00:00:00', '2006-04-04 00:00:00', 17, 40, NULL, NULL, NULL),
(121, 2, '2006-04-04 00:00:00', '2006-04-04 00:00:00', 6, 90, NULL, NULL, NULL),
(122, 2, '2006-04-04 00:00:00', '2006-04-04 00:00:00', 4, 30, NULL, NULL, NULL),
(123, 2, '2006-04-04 00:00:00', '2006-04-04 00:00:00', 48, 40, NULL, NULL, NULL),
(124, 2, '2006-04-04 00:00:00', '2006-04-04 00:00:00', 48, 40, NULL, NULL, NULL),
(125, 2, '2006-04-04 00:00:00', '2006-04-04 00:00:00', 41, 10, NULL, NULL, NULL),
(126, 2, '2006-04-04 00:00:00', '2006-04-04 00:00:00', 43, 5, NULL, NULL, NULL),
(127, 2, '2006-04-04 00:00:00', '2006-04-04 00:00:00', 40, 40, NULL, NULL, NULL),
(128, 2, '2006-04-04 00:00:00', '2006-04-04 00:00:00', 8, 20, NULL, NULL, NULL),
(129, 2, '2006-04-04 00:00:00', '2006-04-04 00:00:00', 80, 15, NULL, NULL, NULL),
(130, 2, '2006-04-04 00:00:00', '2006-04-04 00:00:00', 74, 20, NULL, NULL, NULL),
(131, 2, '2006-04-04 00:00:00', '2006-04-04 00:00:00', 72, 40, NULL, NULL, NULL),
(132, 2, '2006-04-04 00:00:00', '2006-04-04 00:00:00', 3, 50, NULL, NULL, NULL),
(133, 2, '2006-04-04 00:00:00', '2006-04-04 00:00:00', 8, 3, NULL, NULL, NULL),
(134, 2, '2006-04-04 00:00:00', '2006-04-04 00:00:00', 20, 40, NULL, NULL, NULL),
(135, 2, '2006-04-04 00:00:00', '2006-04-04 00:00:00', 52, 40, NULL, NULL, NULL),
(136, 3, '2006-04-25 00:00:00', '2006-04-25 00:00:00', 56, 110, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `inventory_transaction_types`
--

CREATE TABLE `inventory_transaction_types` (
  `id` tinyint(4) NOT NULL,
  `type_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `inventory_transaction_types`
--

INSERT INTO `inventory_transaction_types` (`id`, `type_name`) VALUES
(1, 'Purchased'),
(2, 'Sold'),
(3, 'On Hold'),
(4, 'Waste');

-- --------------------------------------------------------

--
-- Estrutura da tabela `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `invoice_date` datetime DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `tax` decimal(19,4) DEFAULT '0.0000',
  `shipping` decimal(19,4) DEFAULT '0.0000',
  `amount_due` decimal(19,4) DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `invoices`
--

INSERT INTO `invoices` (`id`, `order_id`, `invoice_date`, `due_date`, `tax`, `shipping`, `amount_due`) VALUES
(5, 31, '2006-03-22 00:00:00', NULL, '0.0000', '0.0000', '0.0000'),
(6, 32, '2006-03-22 00:00:00', NULL, '0.0000', '0.0000', '0.0000'),
(7, 40, '2006-03-24 00:00:00', NULL, '0.0000', '0.0000', '0.0000'),
(8, 39, '2006-03-24 00:00:00', NULL, '0.0000', '0.0000', '0.0000'),
(9, 38, '2006-03-24 00:00:00', NULL, '0.0000', '0.0000', '0.0000'),
(10, 37, '2006-03-24 00:00:00', NULL, '0.0000', '0.0000', '0.0000'),
(11, 36, '2006-03-24 00:00:00', NULL, '0.0000', '0.0000', '0.0000'),
(12, 35, '2006-03-24 00:00:00', NULL, '0.0000', '0.0000', '0.0000'),
(13, 34, '2006-03-24 00:00:00', NULL, '0.0000', '0.0000', '0.0000'),
(14, 33, '2006-03-24 00:00:00', NULL, '0.0000', '0.0000', '0.0000'),
(15, 30, '2006-03-24 00:00:00', NULL, '0.0000', '0.0000', '0.0000'),
(16, 56, '2006-04-03 00:00:00', NULL, '0.0000', '0.0000', '0.0000'),
(17, 55, '2006-04-04 00:00:00', NULL, '0.0000', '0.0000', '0.0000'),
(18, 51, '2006-04-04 00:00:00', NULL, '0.0000', '0.0000', '0.0000'),
(19, 50, '2006-04-04 00:00:00', NULL, '0.0000', '0.0000', '0.0000'),
(20, 48, '2006-04-04 00:00:00', NULL, '0.0000', '0.0000', '0.0000'),
(21, 47, '2006-04-04 00:00:00', NULL, '0.0000', '0.0000', '0.0000'),
(22, 46, '2006-04-04 00:00:00', NULL, '0.0000', '0.0000', '0.0000'),
(23, 45, '2006-04-04 00:00:00', NULL, '0.0000', '0.0000', '0.0000'),
(24, 79, '2006-04-04 00:00:00', NULL, '0.0000', '0.0000', '0.0000'),
(25, 78, '2006-04-04 00:00:00', NULL, '0.0000', '0.0000', '0.0000'),
(26, 77, '2006-04-04 00:00:00', NULL, '0.0000', '0.0000', '0.0000'),
(27, 76, '2006-04-04 00:00:00', NULL, '0.0000', '0.0000', '0.0000'),
(28, 75, '2006-04-04 00:00:00', NULL, '0.0000', '0.0000', '0.0000'),
(29, 74, '2006-04-04 00:00:00', NULL, '0.0000', '0.0000', '0.0000'),
(30, 73, '2006-04-04 00:00:00', NULL, '0.0000', '0.0000', '0.0000'),
(31, 72, '2006-04-04 00:00:00', NULL, '0.0000', '0.0000', '0.0000'),
(32, 71, '2006-04-04 00:00:00', NULL, '0.0000', '0.0000', '0.0000'),
(33, 70, '2006-04-04 00:00:00', NULL, '0.0000', '0.0000', '0.0000'),
(34, 69, '2006-04-04 00:00:00', NULL, '0.0000', '0.0000', '0.0000'),
(35, 67, '2006-04-04 00:00:00', NULL, '0.0000', '0.0000', '0.0000'),
(36, 42, '2006-04-04 00:00:00', NULL, '0.0000', '0.0000', '0.0000'),
(37, 60, '2006-04-04 00:00:00', NULL, '0.0000', '0.0000', '0.0000'),
(38, 63, '2006-04-04 00:00:00', NULL, '0.0000', '0.0000', '0.0000'),
(39, 58, '2006-04-04 00:00:00', NULL, '0.0000', '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Estrutura da tabela `movimentacoes`
--

CREATE TABLE `movimentacoes` (
  `product_cod` int(11) DEFAULT NULL,
  `product_name` varchar(144) DEFAULT NULL,
  `qtd_Purchased` int(11) DEFAULT NULL,
  `qtd_Sold` int(11) DEFAULT NULL,
  `qtd_OnHold` int(11) DEFAULT NULL,
  `qtd_Waste` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `shipped_date` datetime DEFAULT NULL,
  `shipper_id` int(11) DEFAULT NULL,
  `ship_name` varchar(50) DEFAULT NULL,
  `ship_address` varchar(250) DEFAULT NULL,
  `ship_city` varchar(50) DEFAULT NULL,
  `ship_state_province` varchar(50) DEFAULT NULL,
  `ship_zip_postal_code` varchar(50) DEFAULT NULL,
  `ship_country_region` varchar(50) DEFAULT NULL,
  `shipping_fee` decimal(19,4) DEFAULT '0.0000',
  `taxes` decimal(19,4) DEFAULT '0.0000',
  `payment_type` varchar(50) DEFAULT NULL,
  `paid_date` datetime DEFAULT NULL,
  `notes` varchar(250) DEFAULT NULL,
  `tax_rate` double DEFAULT '0',
  `tax_status_id` tinyint(4) DEFAULT NULL,
  `status_id` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `orders`
--

INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
(30, 9, 27, '2006-01-15 00:00:00', '2006-01-22 00:00:00', 2, 'Karen Toh', '789 27th Street', 'Las Vegas', 'NV', '99999', 'USA', '200.0000', '0.0000', 'Check', '2006-01-15 00:00:00', NULL, 0, NULL, 3),
(31, 3, 4, '2006-01-20 00:00:00', '2006-01-22 00:00:00', 1, 'Christina Lee', '123 4th Street', 'New York', 'NY', '99999', 'USA', '5.0000', '0.0000', 'Credit Card', '2006-01-20 00:00:00', NULL, 0, NULL, 3),
(32, 4, 12, '2006-01-22 00:00:00', '2006-01-22 00:00:00', 2, 'John Edwards', '123 12th Street', 'Las Vegas', 'NV', '99999', 'USA', '5.0000', '0.0000', 'Credit Card', '2006-01-22 00:00:00', NULL, 0, NULL, 3),
(33, 6, 8, '2006-01-30 00:00:00', '2006-01-31 00:00:00', 3, 'Elizabeth Andersen', '123 8th Street', 'Portland', 'OR', '99999', 'USA', '50.0000', '0.0000', 'Credit Card', '2006-01-30 00:00:00', NULL, 0, NULL, 3),
(34, 9, 4, '2006-02-06 00:00:00', '2006-02-07 00:00:00', 3, 'Christina Lee', '123 4th Street', 'New York', 'NY', '99999', 'USA', '4.0000', '0.0000', 'Check', '2006-02-06 00:00:00', NULL, 0, NULL, 3),
(35, 3, 29, '2006-02-10 00:00:00', '2006-02-12 00:00:00', 2, 'Soo Jung Lee', '789 29th Street', 'Denver', 'CO', '99999', 'USA', '7.0000', '0.0000', 'Check', '2006-02-10 00:00:00', NULL, 0, NULL, 3),
(36, 4, 3, '2006-02-23 00:00:00', '2006-02-25 00:00:00', 2, 'Thomas Axen', '123 3rd Street', 'Los Angelas', 'CA', '99999', 'USA', '7.0000', '0.0000', 'Cash', '2006-02-23 00:00:00', NULL, 0, NULL, 3),
(37, 8, 6, '2006-03-06 00:00:00', '2006-03-09 00:00:00', 2, 'Francisco Pérez-Olaeta', '123 6th Street', 'Milwaukee', 'WI', '99999', 'USA', '12.0000', '0.0000', 'Credit Card', '2006-03-06 00:00:00', NULL, 0, NULL, 3),
(38, 9, 28, '2006-03-10 00:00:00', '2006-03-11 00:00:00', 3, 'Amritansh Raghav', '789 28th Street', 'Memphis', 'TN', '99999', 'USA', '10.0000', '0.0000', 'Check', '2006-03-10 00:00:00', NULL, 0, NULL, 3),
(39, 3, 8, '2006-03-22 00:00:00', '2006-03-24 00:00:00', 3, 'Elizabeth Andersen', '123 8th Street', 'Portland', 'OR', '99999', 'USA', '5.0000', '0.0000', 'Check', '2006-03-22 00:00:00', NULL, 0, NULL, 3),
(40, 4, 10, '2006-03-24 00:00:00', '2006-03-24 00:00:00', 2, 'Roland Wacker', '123 10th Street', 'Chicago', 'IL', '99999', 'USA', '9.0000', '0.0000', 'Credit Card', '2006-03-24 00:00:00', NULL, 0, NULL, 3),
(41, 1, 7, '2006-03-24 00:00:00', NULL, NULL, 'Ming-Yang Xie', '123 7th Street', 'Boise', 'ID', '99999', 'USA', '0.0000', '0.0000', NULL, NULL, NULL, 0, NULL, 0),
(42, 1, 10, '2006-03-24 00:00:00', '2006-04-07 00:00:00', 1, 'Roland Wacker', '123 10th Street', 'Chicago', 'IL', '99999', 'USA', '0.0000', '0.0000', NULL, NULL, NULL, 0, NULL, 2),
(43, 1, 11, '2006-03-24 00:00:00', NULL, 3, 'Peter Krschne', '123 11th Street', 'Miami', 'FL', '99999', 'USA', '0.0000', '0.0000', NULL, NULL, NULL, 0, NULL, 0),
(44, 1, 1, '2006-03-24 00:00:00', NULL, NULL, 'Anna Bedecs', '123 1st Street', 'Seattle', 'WA', '99999', 'USA', '0.0000', '0.0000', NULL, NULL, NULL, 0, NULL, 0),
(45, 1, 28, '2006-04-07 00:00:00', '2006-04-07 00:00:00', 3, 'Amritansh Raghav', '789 28th Street', 'Memphis', 'TN', '99999', 'USA', '40.0000', '0.0000', 'Credit Card', '2006-04-07 00:00:00', NULL, 0, NULL, 3),
(46, 7, 9, '2006-04-05 00:00:00', '2006-04-05 00:00:00', 1, 'Sven Mortensen', '123 9th Street', 'Salt Lake City', 'UT', '99999', 'USA', '100.0000', '0.0000', 'Check', '2006-04-05 00:00:00', NULL, 0, NULL, 3),
(47, 6, 6, '2006-04-08 00:00:00', '2006-04-08 00:00:00', 2, 'Francisco Pérez-Olaeta', '123 6th Street', 'Milwaukee', 'WI', '99999', 'USA', '300.0000', '0.0000', 'Credit Card', '2006-04-08 00:00:00', NULL, 0, NULL, 3),
(48, 4, 8, '2006-04-05 00:00:00', '2006-04-05 00:00:00', 2, 'Elizabeth Andersen', '123 8th Street', 'Portland', 'OR', '99999', 'USA', '50.0000', '0.0000', 'Check', '2006-04-05 00:00:00', NULL, 0, NULL, 3),
(50, 9, 25, '2006-04-05 00:00:00', '2006-04-05 00:00:00', 1, 'John Rodman', '789 25th Street', 'Chicago', 'IL', '99999', 'USA', '5.0000', '0.0000', 'Cash', '2006-04-05 00:00:00', NULL, 0, NULL, 3),
(51, 9, 26, '2006-04-05 00:00:00', '2006-04-05 00:00:00', 3, 'Run Liu', '789 26th Street', 'Miami', 'FL', '99999', 'USA', '60.0000', '0.0000', 'Credit Card', '2006-04-05 00:00:00', NULL, 0, NULL, 3),
(55, 1, 29, '2006-04-05 00:00:00', '2006-04-05 00:00:00', 2, 'Soo Jung Lee', '789 29th Street', 'Denver', 'CO', '99999', 'USA', '200.0000', '0.0000', 'Check', '2006-04-05 00:00:00', NULL, 0, NULL, 3),
(56, 2, 6, '2006-04-03 00:00:00', '2006-04-03 00:00:00', 3, 'Francisco Pérez-Olaeta', '123 6th Street', 'Milwaukee', 'WI', '99999', 'USA', '0.0000', '0.0000', 'Check', '2006-04-03 00:00:00', NULL, 0, NULL, 3),
(57, 9, 27, '2006-04-22 00:00:00', '2006-04-22 00:00:00', 2, 'Karen Toh', '789 27th Street', 'Las Vegas', 'NV', '99999', 'USA', '200.0000', '0.0000', 'Check', '2006-04-22 00:00:00', NULL, 0, NULL, 0),
(58, 3, 4, '2006-04-22 00:00:00', '2006-04-22 00:00:00', 1, 'Christina Lee', '123 4th Street', 'New York', 'NY', '99999', 'USA', '5.0000', '0.0000', 'Credit Card', '2006-04-22 00:00:00', NULL, 0, NULL, 3),
(59, 4, 12, '2006-04-22 00:00:00', '2006-04-22 00:00:00', 2, 'John Edwards', '123 12th Street', 'Las Vegas', 'NV', '99999', 'USA', '5.0000', '0.0000', 'Credit Card', '2006-04-22 00:00:00', NULL, 0, NULL, 0),
(60, 6, 8, '2006-04-30 00:00:00', '2006-04-30 00:00:00', 3, 'Elizabeth Andersen', '123 8th Street', 'Portland', 'OR', '99999', 'USA', '50.0000', '0.0000', 'Credit Card', '2006-04-30 00:00:00', NULL, 0, NULL, 3),
(61, 9, 4, '2006-04-07 00:00:00', '2006-04-07 00:00:00', 3, 'Christina Lee', '123 4th Street', 'New York', 'NY', '99999', 'USA', '4.0000', '0.0000', 'Check', '2006-04-07 00:00:00', NULL, 0, NULL, 0),
(62, 3, 29, '2006-04-12 00:00:00', '2006-04-12 00:00:00', 2, 'Soo Jung Lee', '789 29th Street', 'Denver', 'CO', '99999', 'USA', '7.0000', '0.0000', 'Check', '2006-04-12 00:00:00', NULL, 0, NULL, 0),
(63, 4, 3, '2006-04-25 00:00:00', '2006-04-25 00:00:00', 2, 'Thomas Axen', '123 3rd Street', 'Los Angelas', 'CA', '99999', 'USA', '7.0000', '0.0000', 'Cash', '2006-04-25 00:00:00', NULL, 0, NULL, 3),
(64, 8, 6, '2006-05-09 00:00:00', '2006-05-09 00:00:00', 2, 'Francisco Pérez-Olaeta', '123 6th Street', 'Milwaukee', 'WI', '99999', 'USA', '12.0000', '0.0000', 'Credit Card', '2006-05-09 00:00:00', NULL, 0, NULL, 0),
(65, 9, 28, '2006-05-11 00:00:00', '2006-05-11 00:00:00', 3, 'Amritansh Raghav', '789 28th Street', 'Memphis', 'TN', '99999', 'USA', '10.0000', '0.0000', 'Check', '2006-05-11 00:00:00', NULL, 0, NULL, 0),
(66, 3, 8, '2006-05-24 00:00:00', '2006-05-24 00:00:00', 3, 'Elizabeth Andersen', '123 8th Street', 'Portland', 'OR', '99999', 'USA', '5.0000', '0.0000', 'Check', '2006-05-24 00:00:00', NULL, 0, NULL, 0),
(67, 4, 10, '2006-05-24 00:00:00', '2006-05-24 00:00:00', 2, 'Roland Wacker', '123 10th Street', 'Chicago', 'IL', '99999', 'USA', '9.0000', '0.0000', 'Credit Card', '2006-05-24 00:00:00', NULL, 0, NULL, 3),
(68, 1, 7, '2006-05-24 00:00:00', NULL, NULL, 'Ming-Yang Xie', '123 7th Street', 'Boise', 'ID', '99999', 'USA', '0.0000', '0.0000', NULL, NULL, NULL, 0, NULL, 0),
(69, 1, 10, '2006-05-24 00:00:00', NULL, 1, 'Roland Wacker', '123 10th Street', 'Chicago', 'IL', '99999', 'USA', '0.0000', '0.0000', NULL, NULL, NULL, 0, NULL, 0),
(70, 1, 11, '2006-05-24 00:00:00', NULL, 3, 'Peter Krschne', '123 11th Street', 'Miami', 'FL', '99999', 'USA', '0.0000', '0.0000', NULL, NULL, NULL, 0, NULL, 0),
(71, 1, 1, '2006-05-24 00:00:00', NULL, 3, 'Anna Bedecs', '123 1st Street', 'Seattle', 'WA', '99999', 'USA', '0.0000', '0.0000', NULL, NULL, NULL, 0, NULL, 0),
(72, 1, 28, '2006-06-07 00:00:00', '2006-06-07 00:00:00', 3, 'Amritansh Raghav', '789 28th Street', 'Memphis', 'TN', '99999', 'USA', '40.0000', '0.0000', 'Credit Card', '2006-06-07 00:00:00', NULL, 0, NULL, 3),
(73, 7, 9, '2006-06-05 00:00:00', '2006-06-05 00:00:00', 1, 'Sven Mortensen', '123 9th Street', 'Salt Lake City', 'UT', '99999', 'USA', '100.0000', '0.0000', 'Check', '2006-06-05 00:00:00', NULL, 0, NULL, 3),
(74, 6, 6, '2006-06-08 00:00:00', '2006-06-08 00:00:00', 2, 'Francisco Pérez-Olaeta', '123 6th Street', 'Milwaukee', 'WI', '99999', 'USA', '300.0000', '0.0000', 'Credit Card', '2006-06-08 00:00:00', NULL, 0, NULL, 3),
(75, 4, 8, '2006-06-05 00:00:00', '2006-06-05 00:00:00', 2, 'Elizabeth Andersen', '123 8th Street', 'Portland', 'OR', '99999', 'USA', '50.0000', '0.0000', 'Check', '2006-06-05 00:00:00', NULL, 0, NULL, 3),
(76, 9, 25, '2006-06-05 00:00:00', '2006-06-05 00:00:00', 1, 'John Rodman', '789 25th Street', 'Chicago', 'IL', '99999', 'USA', '5.0000', '0.0000', 'Cash', '2006-06-05 00:00:00', NULL, 0, NULL, 3),
(77, 9, 26, '2006-06-05 00:00:00', '2006-06-05 00:00:00', 3, 'Run Liu', '789 26th Street', 'Miami', 'FL', '99999', 'USA', '60.0000', '0.0000', 'Credit Card', '2006-06-05 00:00:00', NULL, 0, NULL, 3),
(78, 1, 29, '2006-06-05 00:00:00', '2006-06-05 00:00:00', 2, 'Soo Jung Lee', '789 29th Street', 'Denver', 'CO', '99999', 'USA', '200.0000', '0.0000', 'Check', '2006-06-05 00:00:00', NULL, 0, NULL, 3),
(79, 2, 6, '2006-06-23 00:00:00', '2006-06-23 00:00:00', 3, 'Francisco Pérez-Olaeta', '123 6th Street', 'Milwaukee', 'WI', '99999', 'USA', '0.0000', '0.0000', 'Check', '2006-06-23 00:00:00', NULL, 0, NULL, 3),
(80, 2, 4, '2006-04-25 00:00:00', NULL, NULL, 'Christina Lee', '123 4th Street', 'New York', 'NY', '99999', 'USA', '0.0000', '0.0000', NULL, NULL, NULL, 0, NULL, 0),
(81, 2, 3, '2006-04-25 00:00:00', NULL, NULL, 'Thomas Axen', '123 3rd Street', 'Los Angelas', 'CA', '99999', 'USA', '0.0000', '0.0000', NULL, NULL, NULL, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `ordersprocedure`
--

CREATE TABLE `ordersprocedure` (
  `vendedor_id` int(11) DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `PortLand` int(11) DEFAULT NULL,
  `LasVegas` int(11) DEFAULT NULL,
  `Denver` int(11) DEFAULT NULL,
  `LosAngeles` int(11) DEFAULT NULL,
  `NewYork` int(11) DEFAULT NULL,
  `OutrasCidades` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `ordersprocedure`
--

INSERT INTO `ordersprocedure` (`vendedor_id`, `cliente_id`, `PortLand`, `LasVegas`, `Denver`, `LosAngeles`, `NewYork`, `OutrasCidades`) VALUES
(1, 7, 0, 0, 0, 0, 0, 27600),
(4, 10, 0, 0, 0, 0, 0, 2871),
(3, 29, 0, 0, 3034, 0, 0, 3162),
(9, 27, 0, 4095, 3034, 0, 0, 5495),
(4, 3, 0, 4095, 3034, 4480, 0, 6410),
(9, 28, 0, 4095, 3034, 4480, 0, 29233),
(1, 11, 0, 4095, 3034, 4480, 0, 4715),
(8, 6, 0, 4095, 3034, 4480, 0, 8688),
(3, 4, 0, 4095, 3034, 4480, 5249, 8688),
(6, 8, 4959, 4095, 3034, 4480, 5249, 5235),
(7, 9, 4959, 4095, 3034, 4480, 5249, 5737),
(1, 1, 4959, 4095, 3034, 4480, 5249, 2861),
(1, 1, 4959, 4095, 3034, 4480, 5249, 3311);

-- --------------------------------------------------------

--
-- Estrutura da tabela `orders_status`
--

CREATE TABLE `orders_status` (
  `id` tinyint(4) NOT NULL,
  `status_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `orders_status`
--

INSERT INTO `orders_status` (`id`, `status_name`) VALUES
(0, 'New'),
(1, 'Invoiced'),
(2, 'Shipped'),
(3, 'Closed');

-- --------------------------------------------------------

--
-- Estrutura da tabela `orders_tax_status`
--

CREATE TABLE `orders_tax_status` (
  `id` tinyint(4) NOT NULL,
  `tax_status_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `orders_tax_status`
--

INSERT INTO `orders_tax_status` (`id`, `tax_status_name`) VALUES
(0, 'Tax Exempt'),
(1, 'Taxable');

-- --------------------------------------------------------

--
-- Estrutura da tabela `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `unit_price` decimal(19,4) DEFAULT '0.0000',
  `discount` double NOT NULL DEFAULT '0',
  `status_id` int(11) DEFAULT NULL,
  `date_allocated` datetime DEFAULT NULL,
  `purchase_order_id` int(11) DEFAULT NULL,
  `inventory_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
(27, 30, 34, '100.0000', '14.0000', 0, 2, NULL, 96, 83),
(28, 30, 80, '30.0000', '3.5000', 0, 2, NULL, NULL, 63),
(29, 31, 7, '10.0000', '30.0000', 0, 2, NULL, NULL, 64),
(30, 31, 51, '10.0000', '53.0000', 0, 2, NULL, NULL, 65),
(31, 31, 80, '10.0000', '3.5000', 0, 2, NULL, NULL, 66),
(32, 32, 1, '15.0000', '18.0000', 0, 2, NULL, NULL, 67),
(33, 32, 43, '20.0000', '46.0000', 0, 2, NULL, NULL, 68),
(34, 33, 19, '30.0000', '9.2000', 0, 2, NULL, 97, 81),
(35, 34, 19, '20.0000', '9.2000', 0, 2, NULL, NULL, 69),
(36, 35, 48, '10.0000', '12.7500', 0, 2, NULL, NULL, 70),
(37, 36, 41, '200.0000', '9.6500', 0, 2, NULL, 98, 79),
(38, 37, 8, '17.0000', '40.0000', 0, 2, NULL, NULL, 71),
(39, 38, 43, '300.0000', '46.0000', 0, 2, NULL, 99, 77),
(40, 39, 48, '100.0000', '12.7500', 0, 2, NULL, 100, 75),
(41, 40, 81, '200.0000', '2.9900', 0, 2, NULL, 101, 73),
(42, 41, 43, '300.0000', '46.0000', 0, 1, NULL, 102, 104),
(43, 42, 6, '10.0000', '25.0000', 0, 2, NULL, NULL, 84),
(44, 42, 4, '10.0000', '22.0000', 0, 2, NULL, NULL, 85),
(45, 42, 19, '10.0000', '9.2000', 0, 2, NULL, 103, 110),
(46, 43, 80, '20.0000', '3.5000', 0, 1, NULL, NULL, 86),
(47, 43, 81, '50.0000', '2.9900', 0, 1, NULL, NULL, 87),
(48, 44, 1, '25.0000', '18.0000', 0, 1, NULL, NULL, 88),
(49, 44, 43, '25.0000', '46.0000', 0, 1, NULL, NULL, 89),
(50, 44, 81, '25.0000', '2.9900', 0, 1, NULL, NULL, 90),
(51, 45, 41, '50.0000', '9.6500', 0, 2, NULL, 104, 116),
(52, 45, 40, '50.0000', '18.4000', 0, 2, NULL, NULL, 91),
(53, 46, 57, '100.0000', '19.5000', 0, 2, NULL, 105, 101),
(54, 46, 72, '50.0000', '34.8000', 0, 2, NULL, 106, 114),
(55, 47, 34, '300.0000', '14.0000', 0, 2, NULL, 107, 108),
(56, 48, 8, '25.0000', '40.0000', 0, 2, NULL, 108, 106),
(57, 48, 19, '25.0000', '9.2000', 0, 2, NULL, 109, 112),
(59, 50, 21, '20.0000', '10.0000', 0, 2, NULL, NULL, 92),
(60, 51, 5, '25.0000', '21.3500', 0, 2, NULL, NULL, 93),
(61, 51, 41, '30.0000', '9.6500', 0, 2, NULL, NULL, 94),
(62, 51, 40, '30.0000', '18.4000', 0, 2, NULL, NULL, 95),
(66, 56, 48, '10.0000', '12.7500', 0, 2, NULL, 111, 99),
(67, 55, 34, '87.0000', '14.0000', 0, 2, NULL, NULL, 117),
(68, 79, 7, '30.0000', '30.0000', 0, 2, NULL, NULL, 119),
(69, 79, 51, '30.0000', '53.0000', 0, 2, NULL, NULL, 118),
(70, 78, 17, '40.0000', '39.0000', 0, 2, NULL, NULL, 120),
(71, 77, 6, '90.0000', '25.0000', 0, 2, NULL, NULL, 121),
(72, 76, 4, '30.0000', '22.0000', 0, 2, NULL, NULL, 122),
(73, 75, 48, '40.0000', '12.7500', 0, 2, NULL, NULL, 123),
(74, 74, 48, '40.0000', '12.7500', 0, 2, NULL, NULL, 124),
(75, 73, 41, '10.0000', '9.6500', 0, 2, NULL, NULL, 125),
(76, 72, 43, '5.0000', '46.0000', 0, 2, NULL, NULL, 126),
(77, 71, 40, '40.0000', '18.4000', 0, 2, NULL, NULL, 127),
(78, 70, 8, '20.0000', '40.0000', 0, 2, NULL, NULL, 128),
(79, 69, 80, '15.0000', '3.5000', 0, 2, NULL, NULL, 129),
(80, 67, 74, '20.0000', '10.0000', 0, 2, NULL, NULL, 130),
(81, 60, 72, '40.0000', '34.8000', 0, 2, NULL, NULL, 131),
(82, 63, 3, '50.0000', '10.0000', 0, 2, NULL, NULL, 132),
(83, 63, 8, '3.0000', '40.0000', 0, 2, NULL, NULL, 133),
(84, 58, 20, '40.0000', '81.0000', 0, 2, NULL, NULL, 134),
(85, 58, 52, '40.0000', '7.0000', 0, 2, NULL, NULL, 135),
(86, 80, 56, '10.0000', '38.0000', 0, 1, NULL, NULL, 136),
(90, 81, 81, '0.0000', '2.9900', 0, 5, NULL, NULL, NULL),
(91, 81, 56, '0.0000', '38.0000', 0, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `order_details_status`
--

CREATE TABLE `order_details_status` (
  `id` int(11) NOT NULL,
  `status_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `order_details_status`
--

INSERT INTO `order_details_status` (`id`, `status_name`) VALUES
(0, 'None'),
(1, 'Allocated'),
(2, 'Invoiced'),
(3, 'Shipped'),
(4, 'On Order'),
(5, 'No Stock');

-- --------------------------------------------------------

--
-- Estrutura da tabela `procedure_status`
--

CREATE TABLE `procedure_status` (
  `produto_name` varchar(50) DEFAULT NULL,
  `Nonee` int(11) DEFAULT NULL,
  `Allocated` int(11) DEFAULT NULL,
  `Invoiced` int(11) DEFAULT NULL,
  `Shipped` int(11) DEFAULT NULL,
  `On_Order` int(11) DEFAULT NULL,
  `No_Stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `supplier_ids` varchar(250) DEFAULT NULL,
  `product_code` varchar(25) DEFAULT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `standard_cost` decimal(19,4) DEFAULT '0.0000',
  `list_price` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `reorder_level` int(11) DEFAULT NULL,
  `target_level` int(11) DEFAULT NULL,
  `quantity_per_unit` varchar(50) DEFAULT NULL,
  `discontinued` tinyint(4) NOT NULL DEFAULT '0',
  `minimum_reorder_quantity` int(11) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `attachments` longblob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `products`
--

INSERT INTO `products` (`id`, `supplier_ids`, `product_code`, `product_name`, `description`, `standard_cost`, `list_price`, `reorder_level`, `target_level`, `quantity_per_unit`, `discontinued`, `minimum_reorder_quantity`, `category`, `attachments`) VALUES
(1, '4', 'NWTB-1', 'Northwind Traders Chai', NULL, '13.5000', '18.0000', 10, 40, '10 boxes x 20 bags', 0, 10, 'Beverages', ''),
(3, '10', 'NWTCO-3', 'Northwind Traders Syrup', NULL, '7.5000', '10.0000', 25, 100, '12 - 550 ml bottles', 0, 25, 'Condiments', ''),
(4, '10', 'NWTCO-4', 'Northwind Traders Cajun Seasoning', NULL, '16.5000', '22.0000', 10, 40, '48 - 6 oz jars', 0, 10, 'Condiments', ''),
(5, '10', 'NWTO-5', 'Northwind Traders Olive Oil', NULL, '16.2500', '21.3500', 10, 40, '36 boxes', 0, 10, 'Oil', ''),
(6, '26', 'NWTJP-6', 'Northwind Traders Boysenberry Spread', NULL, '18.7500', '25.0000', 25, 100, '12 - 8 oz jars', 0, 25, 'Jams, Preserves', ''),
(7, '2', 'NWTDFN-7', 'Northwind Traders Dried Pears', NULL, '22.5000', '30.0000', 10, 40, '12 - 1 lb pkgs.', 0, 10, 'Dried Fruit & Nuts', ''),
(8, '8', 'NWTS-8', 'Northwind Traders Curry Sauce', NULL, '30.0000', '40.0000', 10, 40, '12 - 12 oz jars', 0, 10, 'Sauces', ''),
(14, '26', 'NWTDFN-14', 'Northwind Traders Walnuts', NULL, '17.7500', '23.2500', 10, 40, '40 - 100 g pkgs.', 0, 10, 'Dried Fruit & Nuts', ''),
(17, '6', 'NWTCFV-17', 'Northwind Traders Fruit Cocktail', NULL, '29.2500', '39.0000', 10, 40, '15.25 OZ', 0, 10, 'Canned Fruit & Vegetables', ''),
(19, '1', 'NWTBGM-19', 'Northwind Traders Chocolate Biscuits Mix', NULL, '6.0000', '9.2000', 5, 20, '10 boxes x 12 pieces', 0, 5, 'Baked Goods & Mixes', ''),
(20, '26', 'NWTJP-6', 'Northwind Traders Marmalade', NULL, '60.7500', '81.0000', 10, 40, '30 gift boxes', 0, 10, 'Jams, Preserves', ''),
(21, '1', 'NWTBGM-21', 'Northwind Traders Scones', NULL, '7.5000', '10.0000', 5, 20, '24 pkgs. x 4 pieces', 0, 5, 'Baked Goods & Mixes', ''),
(34, '4', 'NWTB-34', 'Northwind Traders Beer', NULL, '10.5000', '14.0000', 15, 60, '24 - 12 oz bottles', 0, 15, 'Beverages', ''),
(40, '7', 'NWTCM-40', 'Northwind Traders Crab Meat', NULL, '13.8000', '18.4000', 30, 120, '24 - 4 oz tins', 0, 30, 'Canned Meat', ''),
(41, '6', 'NWTSO-41', 'Northwind Traders Clam Chowder', NULL, '7.7500', '9.6500', 10, 40, '12 - 12 oz cans', 0, 10, 'Soups', ''),
(43, '34', 'NWTB-43', 'Northwind Traders Coffee', NULL, '34.5000', '46.0000', 25, 100, '16 - 500 g tins', 0, 25, 'Beverages', ''),
(48, '10', 'NWTCA-48', 'Northwind Traders Chocolate', NULL, '9.2500', '12.7500', 25, 100, '10 pkgs', 0, 25, 'Candy', ''),
(51, '2', 'NWTDFN-51', 'Northwind Traders Dried Apples', NULL, '39.7500', '53.0000', 10, 40, '50 - 300 g pkgs.', 0, 10, 'Dried Fruit & Nuts', ''),
(52, '1', 'NWTG-52', 'Northwind Traders Long Grain Rice', NULL, '5.2500', '7.0000', 25, 100, '16 - 2 kg boxes', 0, 25, 'Grains', ''),
(56, '1', 'NWTP-56', 'Northwind Traders Gnocchi', NULL, '28.5000', '38.0000', 30, 120, '24 - 250 g pkgs.', 0, 30, 'Pasta', ''),
(57, '1', 'NWTP-57', 'Northwind Traders Ravioli', NULL, '14.2500', '19.5000', 20, 80, '24 - 250 g pkgs.', 0, 20, 'Pasta', ''),
(65, '8', 'NWTS-65', 'Northwind Traders Hot Pepper Sauce', NULL, '15.7500', '21.0500', 10, 40, '32 - 8 oz bottles', 0, 10, 'Sauces', ''),
(66, '8', 'NWTS-66', 'Northwind Traders Tomato Sauce', NULL, '12.7500', '17.0000', 20, 80, '24 - 8 oz jars', 0, 20, 'Sauces', ''),
(72, '5', 'NWTD-72', 'Northwind Traders Mozzarella', NULL, '26.1000', '34.8000', 10, 40, '24 - 200 g pkgs.', 0, 10, 'Dairy products', ''),
(74, '26', 'NWTDFN-74', 'Northwind Traders Almonds', NULL, '7.5000', '10.0000', 5, 20, '5 kg pkg.', 0, 5, 'Dried Fruit & Nuts', ''),
(77, '10', 'NWTCO-77', 'Northwind Traders Mustard', NULL, '9.7500', '13.0000', 15, 60, '12 boxes', 0, 15, 'Condiments', ''),
(80, '2', 'NWTDFN-80', 'Northwind Traders Dried Plums', NULL, '3.0000', '3.5000', 50, 75, '1 lb bag', 0, 25, 'Dried Fruit & Nuts', ''),
(81, '3', 'NWTB-81', 'Northwind Traders Green Tea', NULL, '2.0000', '2.9900', 100, 125, '20 bags per box', 0, 25, 'Beverages', ''),
(82, '1', 'NWTC-82', 'Northwind Traders Granola', NULL, '2.0000', '4.0000', 20, 100, NULL, 0, NULL, 'Cereal', ''),
(83, '9', 'NWTCS-83', 'Northwind Traders Potato Chips', NULL, '0.5000', '1.8000', 30, 200, NULL, 0, NULL, 'Chips, Snacks', ''),
(85, '1', 'NWTBGM-85', 'Northwind Traders Brownie Mix', NULL, '9.0000', '12.4900', 10, 20, '3 boxes', 0, 5, 'Baked Goods & Mixes', ''),
(86, '1', 'NWTBGM-86', 'Northwind Traders Cake Mix', NULL, '10.5000', '15.9900', 10, 20, '4 boxes', 0, 5, 'Baked Goods & Mixes', ''),
(87, '7', 'NWTB-87', 'Northwind Traders Tea', NULL, '2.0000', '40.0000', 20, 50, '100 count per box', 0, NULL, 'Beverages', ''),
(88, '6', 'NWTCFV-88', 'Northwind Traders Pears', NULL, '1.0000', '1.3000', 10, 40, '15.25 OZ', 0, NULL, 'Canned Fruit & Vegetables', ''),
(89, '6', 'NWTCFV-89', 'Northwind Traders Peaches', NULL, '1.0000', '1.5000', 10, 40, '15.25 OZ', 0, NULL, 'Canned Fruit & Vegetables', ''),
(90, '6', 'NWTCFV-90', 'Northwind Traders Pineapple', NULL, '1.0000', '1.8000', 10, 40, '15.25 OZ', 0, NULL, 'Canned Fruit & Vegetables', ''),
(91, '6', 'NWTCFV-91', 'Northwind Traders Cherry Pie Filling', NULL, '1.0000', '2.0000', 10, 40, '15.25 OZ', 0, NULL, 'Canned Fruit & Vegetables', ''),
(92, '6', 'NWTCFV-92', 'Northwind Traders Green Beans', NULL, '1.0000', '1.2000', 10, 40, '14.5 OZ', 0, NULL, 'Canned Fruit & Vegetables', ''),
(93, '6', 'NWTCFV-93', 'Northwind Traders Corn', NULL, '1.0000', '1.2000', 10, 40, '14.5 OZ', 0, NULL, 'Canned Fruit & Vegetables', ''),
(94, '6', 'NWTCFV-94', 'Northwind Traders Peas', NULL, '1.0000', '1.5000', 10, 40, '14.5 OZ', 0, NULL, 'Canned Fruit & Vegetables', ''),
(95, '7', 'NWTCM-95', 'Northwind Traders Tuna Fish', NULL, '0.5000', '2.0000', 30, 50, '5 oz', 0, NULL, 'Canned Meat', ''),
(96, '7', 'NWTCM-96', 'Northwind Traders Smoked Salmon', NULL, '2.0000', '4.0000', 30, 50, '5 oz', 0, NULL, 'Canned Meat', ''),
(97, '1', 'NWTC-82', 'Northwind Traders Hot Cereal', NULL, '3.0000', '5.0000', 50, 200, NULL, 0, NULL, 'Cereal', ''),
(98, '6', 'NWTSO-98', 'Northwind Traders Vegetable Soup', NULL, '1.0000', '1.8900', 100, 200, NULL, 0, NULL, 'Soups', ''),
(99, '6', 'NWTSO-99', 'Northwind Traders Chicken Soup', NULL, '1.0000', '1.9500', 100, 200, NULL, 0, NULL, 'Soups', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos2`
--

CREATE TABLE `produtos2` (
  `id_produto` int(11) NOT NULL,
  `produto` varchar(144) DEFAULT NULL,
  `preco_custo` float DEFAULT NULL,
  `preco_lista` float DEFAULT NULL,
  `qtd_estoque` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produtos2`
--

INSERT INTO `produtos2` (`id_produto`, `produto`, `preco_custo`, `preco_lista`, `qtd_estoque`) VALUES
(3, 'Northwind Traders Syrup', 7.5, 10, '12 - 550 alterado');

-- --------------------------------------------------------

--
-- Estrutura da tabela `purchase_orders`
--

CREATE TABLE `purchase_orders` (
  `id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `submitted_date` datetime DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `status_id` int(11) DEFAULT '0',
  `expected_date` datetime DEFAULT NULL,
  `shipping_fee` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `taxes` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `payment_date` datetime DEFAULT NULL,
  `payment_amount` decimal(19,4) DEFAULT '0.0000',
  `payment_method` varchar(50) DEFAULT NULL,
  `notes` varchar(250) DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `submitted_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `purchase_orders`
--

INSERT INTO `purchase_orders` (`id`, `supplier_id`, `created_by`, `submitted_date`, `creation_date`, `status_id`, `expected_date`, `shipping_fee`, `taxes`, `payment_date`, `payment_amount`, `payment_method`, `notes`, `approved_by`, `approved_date`, `submitted_by`) VALUES
(90, 1, 2, '2006-01-14 00:00:00', '2006-01-22 00:00:00', 2, NULL, '0.0000', '0.0000', NULL, '0.0000', NULL, NULL, 2, '2006-01-22 00:00:00', 2),
(91, 3, 2, '2006-01-14 00:00:00', '2006-01-22 00:00:00', 2, NULL, '0.0000', '0.0000', NULL, '0.0000', NULL, NULL, 2, '2006-01-22 00:00:00', 2),
(92, 2, 2, '2006-01-14 00:00:00', '2006-01-22 00:00:00', 2, NULL, '0.0000', '0.0000', NULL, '0.0000', NULL, NULL, 2, '2006-01-22 00:00:00', 2),
(93, 5, 2, '2006-01-14 00:00:00', '2006-01-22 00:00:00', 2, NULL, '0.0000', '0.0000', NULL, '0.0000', NULL, NULL, 2, '2006-01-22 00:00:00', 2),
(94, 6, 2, '2006-01-14 00:00:00', '2006-01-22 00:00:00', 2, NULL, '0.0000', '0.0000', NULL, '0.0000', NULL, NULL, 2, '2006-01-22 00:00:00', 2),
(95, 4, 2, '2006-01-14 00:00:00', '2006-01-22 00:00:00', 2, NULL, '0.0000', '0.0000', NULL, '0.0000', NULL, NULL, 2, '2006-01-22 00:00:00', 2),
(96, 1, 5, '2006-01-14 00:00:00', '2006-01-22 00:00:00', 2, NULL, '0.0000', '0.0000', NULL, '0.0000', NULL, 'Purchase generated based on Order #30', 2, '2006-01-22 00:00:00', 5),
(97, 2, 7, '2006-01-14 00:00:00', '2006-01-22 00:00:00', 2, NULL, '0.0000', '0.0000', NULL, '0.0000', NULL, 'Purchase generated based on Order #33', 2, '2006-01-22 00:00:00', 7),
(98, 2, 4, '2006-01-14 00:00:00', '2006-01-22 00:00:00', 2, NULL, '0.0000', '0.0000', NULL, '0.0000', NULL, 'Purchase generated based on Order #36', 2, '2006-01-22 00:00:00', 4),
(99, 1, 3, '2006-01-14 00:00:00', '2006-01-22 00:00:00', 2, NULL, '0.0000', '0.0000', NULL, '0.0000', NULL, 'Purchase generated based on Order #38', 2, '2006-01-22 00:00:00', 3),
(100, 2, 9, '2006-01-14 00:00:00', '2006-01-22 00:00:00', 2, NULL, '0.0000', '0.0000', NULL, '0.0000', NULL, 'Purchase generated based on Order #39', 2, '2006-01-22 00:00:00', 9),
(101, 1, 2, '2006-01-14 00:00:00', '2006-01-22 00:00:00', 2, NULL, '0.0000', '0.0000', NULL, '0.0000', NULL, 'Purchase generated based on Order #40', 2, '2006-01-22 00:00:00', 2),
(102, 1, 1, '2006-03-24 00:00:00', '2006-03-24 00:00:00', 2, NULL, '0.0000', '0.0000', NULL, '0.0000', NULL, 'Purchase generated based on Order #41', 2, '2006-04-04 00:00:00', 1),
(103, 2, 1, '2006-03-24 00:00:00', '2006-03-24 00:00:00', 2, NULL, '0.0000', '0.0000', NULL, '0.0000', NULL, 'Purchase generated based on Order #42', 2, '2006-04-04 00:00:00', 1),
(104, 2, 1, '2006-03-24 00:00:00', '2006-03-24 00:00:00', 2, NULL, '0.0000', '0.0000', NULL, '0.0000', NULL, 'Purchase generated based on Order #45', 2, '2006-04-04 00:00:00', 1),
(105, 5, 7, '2006-03-24 00:00:00', '2006-03-24 00:00:00', 2, NULL, '0.0000', '0.0000', NULL, '0.0000', 'Check', 'Purchase generated based on Order #46', 2, '2006-04-04 00:00:00', 7),
(106, 6, 7, '2006-03-24 00:00:00', '2006-03-24 00:00:00', 2, NULL, '0.0000', '0.0000', NULL, '0.0000', NULL, 'Purchase generated based on Order #46', 2, '2006-04-04 00:00:00', 7),
(107, 1, 6, '2006-03-24 00:00:00', '2006-03-24 00:00:00', 2, NULL, '0.0000', '0.0000', NULL, '0.0000', NULL, 'Purchase generated based on Order #47', 2, '2006-04-04 00:00:00', 6),
(108, 2, 4, '2006-03-24 00:00:00', '2006-03-24 00:00:00', 2, NULL, '0.0000', '0.0000', NULL, '0.0000', NULL, 'Purchase generated based on Order #48', 2, '2006-04-04 00:00:00', 4),
(109, 2, 4, '2006-03-24 00:00:00', '2006-03-24 00:00:00', 2, NULL, '0.0000', '0.0000', NULL, '0.0000', NULL, 'Purchase generated based on Order #48', 2, '2006-04-04 00:00:00', 4),
(110, 1, 3, '2006-03-24 00:00:00', '2006-03-24 00:00:00', 2, NULL, '0.0000', '0.0000', NULL, '0.0000', NULL, 'Purchase generated based on Order #49', 2, '2006-04-04 00:00:00', 3),
(111, 1, 2, '2006-03-31 00:00:00', '2006-03-31 00:00:00', 2, NULL, '0.0000', '0.0000', NULL, '0.0000', NULL, 'Purchase generated based on Order #56', 2, '2006-04-04 00:00:00', 2),
(140, 6, 7, '2006-04-25 00:00:00', '2006-04-25 00:00:00', 2, NULL, '0.0000', '0.0000', NULL, '0.0000', NULL, NULL, 2, '2006-04-25 16:00:00', 2),
(141, 8, 7, '2006-04-25 00:00:00', '2006-04-25 00:00:00', 2, NULL, '0.0000', '0.0000', NULL, '0.0000', NULL, NULL, 2, '2006-04-25 17:00:00', 2),
(142, 8, 3, '2006-04-25 00:00:00', '2006-04-25 00:00:00', 2, NULL, '0.0000', '0.0000', NULL, '0.0000', 'Check', NULL, 2, '2006-04-25 17:00:00', 2),
(146, 2, 2, '2006-04-26 00:00:00', '2006-04-26 00:00:00', 1, NULL, '0.0000', '0.0000', NULL, '0.0000', NULL, NULL, NULL, NULL, 2),
(147, 7, 2, '2006-04-26 00:00:00', '2006-04-26 00:00:00', 1, NULL, '0.0000', '0.0000', NULL, '0.0000', NULL, NULL, NULL, NULL, 2),
(148, 5, 2, '2006-04-26 00:00:00', '2006-04-26 00:00:00', 1, NULL, '0.0000', '0.0000', NULL, '0.0000', NULL, NULL, NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `purchase_order_details`
--

CREATE TABLE `purchase_order_details` (
  `id` int(11) NOT NULL,
  `purchase_order_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` decimal(18,4) NOT NULL,
  `unit_cost` decimal(19,4) NOT NULL,
  `date_received` datetime DEFAULT NULL,
  `posted_to_inventory` tinyint(4) NOT NULL DEFAULT '0',
  `inventory_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `purchase_order_details`
--

INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
(238, 90, 1, '40.0000', '14.0000', '2006-01-22 00:00:00', 1, 59),
(239, 91, 3, '100.0000', '8.0000', '2006-01-22 00:00:00', 1, 54),
(240, 91, 4, '40.0000', '16.0000', '2006-01-22 00:00:00', 1, 55),
(241, 91, 5, '40.0000', '16.0000', '2006-01-22 00:00:00', 1, 56),
(242, 92, 6, '100.0000', '19.0000', '2006-01-22 00:00:00', 1, 40),
(243, 92, 7, '40.0000', '22.0000', '2006-01-22 00:00:00', 1, 41),
(244, 92, 8, '40.0000', '30.0000', '2006-01-22 00:00:00', 1, 42),
(245, 92, 14, '40.0000', '17.0000', '2006-01-22 00:00:00', 1, 43),
(246, 92, 17, '40.0000', '29.0000', '2006-01-22 00:00:00', 1, 44),
(247, 92, 19, '20.0000', '7.0000', '2006-01-22 00:00:00', 1, 45),
(248, 92, 20, '40.0000', '61.0000', '2006-01-22 00:00:00', 1, 46),
(249, 92, 21, '20.0000', '8.0000', '2006-01-22 00:00:00', 1, 47),
(250, 90, 34, '60.0000', '10.0000', '2006-01-22 00:00:00', 1, 60),
(251, 92, 40, '120.0000', '14.0000', '2006-01-22 00:00:00', 1, 48),
(252, 92, 41, '40.0000', '7.0000', '2006-01-22 00:00:00', 1, 49),
(253, 90, 43, '100.0000', '34.0000', '2006-01-22 00:00:00', 1, 61),
(254, 92, 48, '100.0000', '10.0000', '2006-01-22 00:00:00', 1, 50),
(255, 92, 51, '40.0000', '40.0000', '2006-01-22 00:00:00', 1, 51),
(256, 93, 52, '100.0000', '5.0000', '2006-01-22 00:00:00', 1, 37),
(257, 93, 56, '120.0000', '28.0000', '2006-01-22 00:00:00', 1, 38),
(258, 93, 57, '80.0000', '15.0000', '2006-01-22 00:00:00', 1, 39),
(259, 91, 65, '40.0000', '16.0000', '2006-01-22 00:00:00', 1, 57),
(260, 91, 66, '80.0000', '13.0000', '2006-01-22 00:00:00', 1, 58),
(261, 94, 72, '40.0000', '26.0000', '2006-01-22 00:00:00', 1, 36),
(262, 92, 74, '20.0000', '8.0000', '2006-01-22 00:00:00', 1, 52),
(263, 92, 77, '60.0000', '10.0000', '2006-01-22 00:00:00', 1, 53),
(264, 95, 80, '75.0000', '3.0000', '2006-01-22 00:00:00', 1, 35),
(265, 90, 81, '125.0000', '2.0000', '2006-01-22 00:00:00', 1, 62),
(266, 96, 34, '100.0000', '10.0000', '2006-01-22 00:00:00', 1, 82),
(267, 97, 19, '30.0000', '7.0000', '2006-01-22 00:00:00', 1, 80),
(268, 98, 41, '200.0000', '7.0000', '2006-01-22 00:00:00', 1, 78),
(269, 99, 43, '300.0000', '34.0000', '2006-01-22 00:00:00', 1, 76),
(270, 100, 48, '100.0000', '10.0000', '2006-01-22 00:00:00', 1, 74),
(271, 101, 81, '200.0000', '2.0000', '2006-01-22 00:00:00', 1, 72),
(272, 102, 43, '300.0000', '34.0000', NULL, 0, NULL),
(273, 103, 19, '10.0000', '7.0000', '2006-04-17 00:00:00', 1, 111),
(274, 104, 41, '50.0000', '7.0000', '2006-04-06 00:00:00', 1, 115),
(275, 105, 57, '100.0000', '15.0000', '2006-04-05 00:00:00', 1, 100),
(276, 106, 72, '50.0000', '26.0000', '2006-04-05 00:00:00', 1, 113),
(277, 107, 34, '300.0000', '10.0000', '2006-04-05 00:00:00', 1, 107),
(278, 108, 8, '25.0000', '30.0000', '2006-04-05 00:00:00', 1, 105),
(279, 109, 19, '25.0000', '7.0000', '2006-04-05 00:00:00', 1, 109),
(280, 110, 43, '250.0000', '34.0000', '2006-04-10 00:00:00', 1, 103),
(281, 90, 1, '40.0000', '14.0000', NULL, 0, NULL),
(282, 92, 19, '20.0000', '7.0000', NULL, 0, NULL),
(283, 111, 34, '50.0000', '10.0000', '2006-04-04 00:00:00', 1, 102),
(285, 91, 3, '50.0000', '8.0000', NULL, 0, NULL),
(286, 91, 4, '40.0000', '16.0000', NULL, 0, NULL),
(288, 140, 85, '10.0000', '9.0000', NULL, 0, NULL),
(289, 141, 6, '10.0000', '18.7500', NULL, 0, NULL),
(290, 142, 1, '1.0000', '13.5000', NULL, 0, NULL),
(292, 146, 20, '40.0000', '60.0000', NULL, 0, NULL),
(293, 146, 51, '40.0000', '39.0000', NULL, 0, NULL),
(294, 147, 40, '120.0000', '13.0000', NULL, 0, NULL),
(295, 148, 72, '40.0000', '26.0000', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `purchase_order_status`
--

CREATE TABLE `purchase_order_status` (
  `id` int(11) NOT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `purchase_order_status`
--

INSERT INTO `purchase_order_status` (`id`, `status`) VALUES
(0, 'New'),
(1, 'Submitted'),
(2, 'Approved'),
(3, 'Closed');

-- --------------------------------------------------------

--
-- Estrutura da tabela `shippers`
--

CREATE TABLE `shippers` (
  `id` int(11) NOT NULL,
  `company` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `email_address` varchar(50) DEFAULT NULL,
  `job_title` varchar(50) DEFAULT NULL,
  `business_phone` varchar(25) DEFAULT NULL,
  `home_phone` varchar(25) DEFAULT NULL,
  `mobile_phone` varchar(25) DEFAULT NULL,
  `fax_number` varchar(25) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state_province` varchar(50) DEFAULT NULL,
  `zip_postal_code` varchar(15) DEFAULT NULL,
  `country_region` varchar(50) DEFAULT NULL,
  `web_page` varchar(250) DEFAULT NULL,
  `notes` varchar(250) DEFAULT NULL,
  `attachments` longblob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `shippers`
--

INSERT INTO `shippers` (`id`, `company`, `last_name`, `first_name`, `email_address`, `job_title`, `business_phone`, `home_phone`, `mobile_phone`, `fax_number`, `address`, `city`, `state_province`, `zip_postal_code`, `country_region`, `web_page`, `notes`, `attachments`) VALUES
(1, 'Shipping Company A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123 Any Street', 'Memphis', 'TN', '99999', 'USA', NULL, NULL, ''),
(2, 'Shipping Company B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123 Any Street', 'Memphis', 'TN', '99999', 'USA', NULL, NULL, ''),
(3, 'Shipping Company C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123 Any Street', 'Memphis', 'TN', '99999', 'USA', NULL, NULL, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `strings`
--

CREATE TABLE `strings` (
  `string_id` int(11) NOT NULL,
  `string_data` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `strings`
--

INSERT INTO `strings` (`string_id`, `string_data`) VALUES
(2, 'Northwind Traders'),
(3, 'Cannot remove posted inventory!'),
(4, 'Back ordered product filled for Order #|'),
(5, 'Discounted price below cost!'),
(6, 'Insufficient inventory.'),
(7, 'Insufficient inventory. Do you want to create a purchase order?'),
(8, 'Purchase orders were successfully created for | products'),
(9, 'There are no products below their respective reorder levels'),
(10, 'Must specify customer name!'),
(11, 'Restocking will generate purchase orders for all products below desired inventory levels.  Do you want to continue?'),
(12, 'Cannot create purchase order.  No suppliers listed for specified product'),
(13, 'Discounted price is below cost!'),
(14, 'Do you want to continue?'),
(15, 'Order is already invoiced. Do you want to print the invoice?'),
(16, 'Order does not contain any line items'),
(17, 'Cannot create invoice!  Inventory has not been allocated for each specified product.'),
(18, 'Sorry, there are no sales in the specified time period'),
(19, 'Product successfully restocked.'),
(21, 'Product does not need restocking! Product is already at desired inventory level.'),
(22, 'Product restocking failed!'),
(23, 'Invalid login specified!'),
(24, 'Must first select reported!'),
(25, 'Changing supplier will remove purchase line items, continue?'),
(26, 'Purchase orders were successfully submitted for | products.  Do you want to view the restocking report?'),
(27, 'There was an error attempting to restock inventory levels.'),
(28, '| product(s) were successfully restocked.  Do you want to view the restocking report?'),
(29, 'You cannot remove purchase line items already posted to inventory!'),
(30, 'There was an error removing one or more purchase line items.'),
(31, 'You cannot modify quantity for purchased product already received or posted to inventory.'),
(32, 'You cannot modify price for purchased product already received or posted to inventory.'),
(33, 'Product has been successfully posted to inventory.'),
(34, 'Sorry, product cannot be successfully posted to inventory.'),
(35, 'There are orders with this product on back order.  Would you like to fill them now?'),
(36, 'Cannot post product to inventory without specifying received date!'),
(37, 'Do you want to post received product to inventory?'),
(38, 'Initialize purchase, orders, and inventory data?'),
(39, 'Must first specify employee name!'),
(40, 'Specified user must be logged in to approve purchase!'),
(41, 'Purchase order must contain completed line items before it can be approved'),
(42, 'Sorry, you do not have permission to approve purchases.'),
(43, 'Purchase successfully approved'),
(44, 'Purchase cannot be approved'),
(45, 'Purchase successfully submitted for approval'),
(46, 'Purchase cannot be submitted for approval'),
(47, 'Sorry, purchase order does not contain line items'),
(48, 'Do you want to cancel this order?'),
(49, 'Canceling an order will permanently delete the order.  Are you sure you want to cancel?'),
(100, 'Your order was successfully canceled.'),
(101, 'Cannot cancel an order that has items received and posted to inventory.'),
(102, 'There was an error trying to cancel this order.'),
(103, 'The invoice for this order has not yet been created.'),
(104, 'Shipping information is not complete.  Please specify all shipping information and try again.'),
(105, 'Cannot mark as shipped.  Order must first be invoiced!'),
(106, 'Cannot cancel an order that has already shipped!'),
(107, 'Must first specify salesperson!'),
(108, 'Order is now marked closed.'),
(109, 'Order must first be marked shipped before closing.'),
(110, 'Must first specify payment information!'),
(111, 'There was an error attempting to restock inventory levels.  | product(s) were successfully restocked.'),
(112, 'You must supply a Unit Cost.'),
(113, 'Fill back ordered product, Order #|'),
(114, 'Purchase generated based on Order #|');

-- --------------------------------------------------------

--
-- Estrutura da tabela `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL,
  `company` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `email_address` varchar(50) DEFAULT NULL,
  `job_title` varchar(50) DEFAULT NULL,
  `business_phone` varchar(25) DEFAULT NULL,
  `home_phone` varchar(25) DEFAULT NULL,
  `mobile_phone` varchar(25) DEFAULT NULL,
  `fax_number` varchar(25) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state_province` varchar(50) DEFAULT NULL,
  `zip_postal_code` varchar(15) DEFAULT NULL,
  `country_region` varchar(50) DEFAULT NULL,
  `web_page` varchar(250) DEFAULT NULL,
  `notes` varchar(250) DEFAULT NULL,
  `attachments` longblob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `suppliers`
--

INSERT INTO `suppliers` (`id`, `company`, `last_name`, `first_name`, `email_address`, `job_title`, `business_phone`, `home_phone`, `mobile_phone`, `fax_number`, `address`, `city`, `state_province`, `zip_postal_code`, `country_region`, `web_page`, `notes`, `attachments`) VALUES
(1, 'Supplier A', 'Andersen', 'Elizabeth A.', NULL, 'Sales Manager', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(2, 'Supplier B', 'Weiler', 'Cornelia', NULL, 'Sales Manager', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(3, 'Supplier C', 'Kelley', 'Madeleine', NULL, 'Sales Representative', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(4, 'Supplier D', 'Sato', 'Naoki', NULL, 'Marketing Manager', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(5, 'Supplier E', 'Hernandez-Echevarria', 'Amaya', NULL, 'Sales Manager', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(6, 'Supplier F', 'Hayakawa', 'Satomi', NULL, 'Marketing Assistant', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(7, 'Supplier G', 'Glasson', 'Stuart', NULL, 'Marketing Manager', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(8, 'Supplier H', 'Dunton', 'Bryn Paul', NULL, 'Sales Representative', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(9, 'Supplier I', 'Sandberg', 'Mikael', NULL, 'Sales Manager', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(10, 'Supplier J', 'Sousa', 'Luis', NULL, 'Sales Manager', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vwbc`
-- (See below for the actual view)
--
CREATE TABLE `vwbc` (
`count(employees.first_name)` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vwcargo`
-- (See below for the actual view)
--
CREATE TABLE `vwcargo` (
`job_title` varchar(50)
,`count(employees.job_title)` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vwcity`
-- (See below for the actual view)
--
CREATE TABLE `vwcity` (
`city` varchar(50)
,`count(employees.city)` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vwexercicio1`
-- (See below for the actual view)
--
CREATE TABLE `vwexercicio1` (
`CodigoProduto` varchar(25)
,`NomeProduto` varchar(50)
,`NomeFornecedor` varchar(50)
,`Custo` decimal(19,4)
,`PrecoVenda` decimal(19,4)
,`Quantidade` varchar(50)
,`TipoTransacao` varchar(50)
,`ID_Transacao` int(11)
,`ID_tipo_Transacao` tinyint(4)
,`QTD_transacao` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vwexercicio2`
-- (See below for the actual view)
--
CREATE TABLE `vwexercicio2` (
`NomeDoFuncionario` varchar(50)
,`IDdoFuncionario` int(11)
,`CargoDoFuncionario` varchar(50)
,`nomeCliente` varchar(50)
,`IDdoCliente` int(11)
,`ship_city` varchar(50)
,`NomeProduto` varchar(50)
,`EmpresaDeTransporte` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vwexercicio3`
-- (See below for the actual view)
--
CREATE TABLE `vwexercicio3` (
`id` int(11)
,`nome` varchar(50)
,`qtd` decimal(18,4)
,`preco` decimal(19,4)
,`total` decimal(59,8)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vwexercicio4a`
-- (See below for the actual view)
--
CREATE TABLE `vwexercicio4a` (
`first_name` varchar(50)
,`totalPreco` decimal(41,4)
,`totalVenda` decimal(59,8)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vwexercicio4b`
-- (See below for the actual view)
--
CREATE TABLE `vwexercicio4b` (
`first_name` varchar(50)
,`totalPreco` decimal(41,4)
,`totalProdutos` decimal(40,4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vwexercicio4c`
-- (See below for the actual view)
--
CREATE TABLE `vwexercicio4c` (
`first_name` varchar(50)
,`totalPreco` decimal(41,4)
,`totalProdutos` decimal(40,4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vwexercicio4d`
-- (See below for the actual view)
--
CREATE TABLE `vwexercicio4d` (
`sum(o.shipping_fee)` decimal(41,4)
,`ship_city` varchar(50)
,`company` varchar(50)
,`first_name` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vwexercicio4e`
-- (See below for the actual view)
--
CREATE TABLE `vwexercicio4e` (
`product_name` varchar(50)
,`category` varchar(50)
,`status_id` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vwexercicio4f`
-- (See below for the actual view)
--
CREATE TABLE `vwexercicio4f` (
`quantity` decimal(18,4)
,`unit_cost` decimal(19,4)
,`total` decimal(59,8)
,`company` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vwexercicio4g`
-- (See below for the actual view)
--
CREATE TABLE `vwexercicio4g` (
`product_name` varchar(50)
,`quantity` decimal(18,4)
,`total` decimal(59,8)
,`date_received` datetime
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vwstate`
-- (See below for the actual view)
--
CREATE TABLE `vwstate` (
`state_province` varchar(50)
,`count(employees.state_province)` bigint(21)
);

-- --------------------------------------------------------

--
-- Structure for view `exercicio1`
--
DROP TABLE IF EXISTS `exercicio1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `exercicio1`  AS  select `c`.`first_name` AS `first_name`,`c`.`id` AS `id`,`o`.`ship_address` AS `ship_address`,`o`.`ship_city` AS `ship_city`,`o`.`ship_state_province` AS `ship_state_province`,`od`.`quantity` AS `quantity`,`p`.`product_name` AS `product_name`,`od`.`product_id` AS `product_id` from (((`customers` `c` join `orders` `o` on((`o`.`customer_id` = `c`.`id`))) join `order_details` `od` on((`od`.`order_id` = `o`.`id`))) join `products` `p` on((`p`.`id` = `od`.`product_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `vwbc`
--
DROP TABLE IF EXISTS `vwbc`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwbc`  AS  select count(`employees`.`first_name`) AS `count(employees.first_name)` from `employees` ;

-- --------------------------------------------------------

--
-- Structure for view `vwcargo`
--
DROP TABLE IF EXISTS `vwcargo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwcargo`  AS  select `employees`.`job_title` AS `job_title`,count(`employees`.`job_title`) AS `count(employees.job_title)` from `employees` group by `employees`.`job_title` ;

-- --------------------------------------------------------

--
-- Structure for view `vwcity`
--
DROP TABLE IF EXISTS `vwcity`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwcity`  AS  select `employees`.`city` AS `city`,count(`employees`.`city`) AS `count(employees.city)` from `employees` group by `employees`.`city` ;

-- --------------------------------------------------------

--
-- Structure for view `vwexercicio1`
--
DROP TABLE IF EXISTS `vwexercicio1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwexercicio1`  AS  select `p`.`product_code` AS `CodigoProduto`,`p`.`product_name` AS `NomeProduto`,`s`.`first_name` AS `NomeFornecedor`,`p`.`standard_cost` AS `Custo`,`p`.`list_price` AS `PrecoVenda`,`p`.`quantity_per_unit` AS `Quantidade`,`itt`.`type_name` AS `TipoTransacao`,`it`.`id` AS `ID_Transacao`,`it`.`transaction_type` AS `ID_tipo_Transacao`,`it`.`quantity` AS `QTD_transacao` from (((`products` `p` join `suppliers` `s` on((`s`.`id` = `p`.`supplier_ids`))) join `inventory_transactions` `it` on((`p`.`id` = `it`.`product_id`))) join `inventory_transaction_types` `itt` on((`itt`.`id` = `it`.`transaction_type`))) order by `p`.`product_code` ;

-- --------------------------------------------------------

--
-- Structure for view `vwexercicio2`
--
DROP TABLE IF EXISTS `vwexercicio2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwexercicio2`  AS  select `e`.`first_name` AS `NomeDoFuncionario`,`e`.`id` AS `IDdoFuncionario`,`e`.`job_title` AS `CargoDoFuncionario`,`c`.`first_name` AS `nomeCliente`,`c`.`id` AS `IDdoCliente`,`o`.`ship_city` AS `ship_city`,`p`.`product_name` AS `NomeProduto`,`s`.`company` AS `EmpresaDeTransporte` from (((((`employees` `e` join `orders` `o` on((`e`.`id` = `o`.`employee_id`))) join `customers` `c` on((`c`.`id` = `o`.`customer_id`))) join `shippers` `s` on((`s`.`id` = `o`.`shipper_id`))) join `order_details` `od` on((`o`.`id` = `od`.`order_id`))) join `products` `p` on((`p`.`id` = `od`.`product_id`))) order by `e`.`id` ;

-- --------------------------------------------------------

--
-- Structure for view `vwexercicio3`
--
DROP TABLE IF EXISTS `vwexercicio3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwexercicio3`  AS  select `e`.`id` AS `id`,`e`.`first_name` AS `nome`,`od`.`quantity` AS `qtd`,`od`.`unit_price` AS `preco`,sum((`od`.`unit_price` * `od`.`quantity`)) AS `total` from ((`employees` `e` join `orders` `o` on((`e`.`id` = `o`.`employee_id`))) join `order_details` `od` on((`o`.`id` = `od`.`order_id`))) group by `e`.`id` ;

-- --------------------------------------------------------

--
-- Structure for view `vwexercicio4a`
--
DROP TABLE IF EXISTS `vwexercicio4a`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwexercicio4a`  AS  select `e`.`first_name` AS `first_name`,sum(`od`.`unit_price`) AS `totalPreco`,sum((`od`.`unit_price` * `od`.`quantity`)) AS `totalVenda` from ((`employees` `e` join `orders` `o` on((`o`.`employee_id` = `e`.`id`))) join `order_details` `od` on((`od`.`order_id` = `o`.`id`))) group by `e`.`first_name` ;

-- --------------------------------------------------------

--
-- Structure for view `vwexercicio4b`
--
DROP TABLE IF EXISTS `vwexercicio4b`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwexercicio4b`  AS  select `e`.`first_name` AS `first_name`,sum(`od`.`unit_price`) AS `totalPreco`,sum(`od`.`quantity`) AS `totalProdutos` from ((`employees` `e` join `orders` `o` on((`o`.`employee_id` = `e`.`id`))) join `order_details` `od` on((`od`.`order_id` = `o`.`id`))) group by `e`.`first_name` ;

-- --------------------------------------------------------

--
-- Structure for view `vwexercicio4c`
--
DROP TABLE IF EXISTS `vwexercicio4c`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwexercicio4c`  AS  select `c`.`first_name` AS `first_name`,sum(`od`.`unit_price`) AS `totalPreco`,sum(`od`.`quantity`) AS `totalProdutos` from ((`customers` `c` join `orders` `o` on((`o`.`customer_id` = `c`.`id`))) join `order_details` `od` on((`od`.`order_id` = `o`.`id`))) group by `c`.`first_name` ;

-- --------------------------------------------------------

--
-- Structure for view `vwexercicio4d`
--
DROP TABLE IF EXISTS `vwexercicio4d`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwexercicio4d`  AS  select sum(`o`.`shipping_fee`) AS `sum(o.shipping_fee)`,`o`.`ship_city` AS `ship_city`,`s`.`company` AS `company`,`e`.`first_name` AS `first_name` from ((`orders` `o` join `shippers` `s` on((`s`.`id` = `o`.`shipper_id`))) join `employees` `e` on((`e`.`id` = `o`.`employee_id`))) group by `o`.`ship_city` ;

-- --------------------------------------------------------

--
-- Structure for view `vwexercicio4e`
--
DROP TABLE IF EXISTS `vwexercicio4e`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwexercicio4e`  AS  select `p`.`product_name` AS `product_name`,`p`.`category` AS `category`,`od`.`status_id` AS `status_id` from ((`products` `p` join `order_details` `od` on((`od`.`product_id` = `p`.`id`))) join `order_details_status` `ods` on((`ods`.`id` = `od`.`status_id`))) group by `od`.`status_id` ;

-- --------------------------------------------------------

--
-- Structure for view `vwexercicio4f`
--
DROP TABLE IF EXISTS `vwexercicio4f`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwexercicio4f`  AS  select `po`.`quantity` AS `quantity`,`po`.`unit_cost` AS `unit_cost`,sum((`po`.`unit_cost` * `po`.`quantity`)) AS `total`,`su`.`company` AS `company` from ((`purchase_order_details` `po` join `purchase_orders` `p` on((`p`.`id` = `po`.`purchase_order_id`))) join `suppliers` `su` on((`su`.`id` = `p`.`supplier_id`))) group by `su`.`company` ;

-- --------------------------------------------------------

--
-- Structure for view `vwexercicio4g`
--
DROP TABLE IF EXISTS `vwexercicio4g`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwexercicio4g`  AS  select `p`.`product_name` AS `product_name`,`pod`.`quantity` AS `quantity`,sum((`pod`.`unit_cost` * `pod`.`quantity`)) AS `total`,`pod`.`date_received` AS `date_received` from ((`products` `p` join `purchase_order_details` `pod` on((`pod`.`product_id` = `p`.`id`))) join `purchase_orders` `po` on((`po`.`id` = `pod`.`purchase_order_id`))) group by `p`.`product_name` ;

-- --------------------------------------------------------

--
-- Structure for view `vwstate`
--
DROP TABLE IF EXISTS `vwstate`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwstate`  AS  select `employees`.`state_province` AS `state_province`,count(`employees`.`state_province`) AS `count(employees.state_province)` from `employees` group by `employees`.`state_province` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_employees_first_name` (`first_name`) COMMENT 'Indice para acelerar o primeiro exemplo.',
  ADD KEY `idx_employees_id` (`id`) COMMENT 'Acelerar busca por id\n';

--
-- Indexes for table `inventory_transactions`
--
ALTER TABLE `inventory_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_inventory_transactions__orders` (`customer_order_id`),
  ADD KEY `fk_inventory_transactions__products` (`product_id`),
  ADD KEY `fk_inventory_transactions__purchase_orders` (`purchase_order_id`),
  ADD KEY `fk_inventory_transactions__inventory_transaction_types` (`transaction_type`);

--
-- Indexes for table `inventory_transaction_types`
--
ALTER TABLE `inventory_transaction_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_invoices__orders` (`order_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_orders__customers` (`customer_id`),
  ADD KEY `fk_orders__employees` (`employee_id`),
  ADD KEY `fk_orders__shippers` (`shipper_id`),
  ADD KEY `fk_orders__orders_tax_status` (`tax_status_id`),
  ADD KEY `fk_orders__orders_status` (`status_id`);

--
-- Indexes for table `orders_status`
--
ALTER TABLE `orders_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders_tax_status`
--
ALTER TABLE `orders_tax_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_order_details__orders` (`order_id`),
  ADD KEY `fk_order_details__products` (`product_id`),
  ADD KEY `fk_order_details__order_details_status` (`status_id`);

--
-- Indexes for table `order_details_status`
--
ALTER TABLE `order_details_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produtos2`
--
ALTER TABLE `produtos2`
  ADD PRIMARY KEY (`id_produto`);

--
-- Indexes for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_purchase_orders__employees` (`created_by`),
  ADD KEY `fk_purchase_orders__suppliers` (`supplier_id`),
  ADD KEY `fk_purchase_orders__purchase_order_status` (`status_id`);

--
-- Indexes for table `purchase_order_details`
--
ALTER TABLE `purchase_order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_purchase_order_details__inventory_transactions` (`inventory_id`),
  ADD KEY `fk_purchase_order_details__products` (`product_id`),
  ADD KEY `fk_purchase_order_details__purchase_orders` (`purchase_order_id`);

--
-- Indexes for table `purchase_order_status`
--
ALTER TABLE `purchase_order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippers`
--
ALTER TABLE `shippers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `strings`
--
ALTER TABLE `strings`
  ADD PRIMARY KEY (`string_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `inventory_transactions`
--
ALTER TABLE `inventory_transactions`
  ADD CONSTRAINT `fk_inventory_transactions__inventory_transaction_types` FOREIGN KEY (`transaction_type`) REFERENCES `inventory_transaction_types` (`id`),
  ADD CONSTRAINT `fk_inventory_transactions__orders` FOREIGN KEY (`customer_order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `fk_inventory_transactions__products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `fk_inventory_transactions__purchase_orders` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_orders` (`id`);

--
-- Limitadores para a tabela `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `fk_invoices__orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Limitadores para a tabela `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders__customers` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `fk_orders__employees` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `fk_orders__orders_status` FOREIGN KEY (`status_id`) REFERENCES `orders_status` (`id`),
  ADD CONSTRAINT `fk_orders__orders_tax_status` FOREIGN KEY (`tax_status_id`) REFERENCES `orders_tax_status` (`id`),
  ADD CONSTRAINT `fk_orders__shippers` FOREIGN KEY (`shipper_id`) REFERENCES `shippers` (`id`);

--
-- Limitadores para a tabela `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `fk_order_details__order_details_status` FOREIGN KEY (`status_id`) REFERENCES `order_details_status` (`id`),
  ADD CONSTRAINT `fk_order_details__orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `fk_order_details__products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Limitadores para a tabela `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD CONSTRAINT `fk_purchase_orders__employees` FOREIGN KEY (`created_by`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `fk_purchase_orders__purchase_order_status` FOREIGN KEY (`status_id`) REFERENCES `purchase_order_status` (`id`),
  ADD CONSTRAINT `fk_purchase_orders__suppliers` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`);

--
-- Limitadores para a tabela `purchase_order_details`
--
ALTER TABLE `purchase_order_details`
  ADD CONSTRAINT `fk_purchase_order_details__inventory_transactions` FOREIGN KEY (`inventory_id`) REFERENCES `inventory_transactions` (`id`),
  ADD CONSTRAINT `fk_purchase_order_details__products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `fk_purchase_order_details__purchase_orders` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_orders` (`id`);
--
-- Database: `objeto`
--
CREATE DATABASE IF NOT EXISTS `objeto` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `objeto`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `cpf` varchar(50) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `genero` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`cpf`, `nome`, `email`, `genero`) VALUES
('666897', 'victor', 'victor@', 'indefinido');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cpf`);
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Database: `trigger_`
--
CREATE DATABASE IF NOT EXISTS `trigger_` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `trigger_`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `log`
--

CREATE TABLE `log` (
  `id` int(3) DEFAULT NULL,
  `data_` varchar(30) DEFAULT NULL,
  `hora` varchar(30) DEFAULT NULL,
  `descricao` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `log`
--

INSERT INTO `log` (`id`, `data_`, `hora`, `descricao`) VALUES
(2, '2017/08/11', '15:00', 'sei');

--
-- Acionadores `log`
--
DELIMITER $$
CREATE TRIGGER `salvaexcluido` BEFORE DELETE ON `log` FOR EACH ROW begin
insert into ocorrencias values (old.id, old.data_, old.hora, old.descricao);
 end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ocorrencias`
--

CREATE TABLE `ocorrencias` (
  `id` int(3) DEFAULT NULL,
  `data_` varchar(30) DEFAULT NULL,
  `hora` varchar(30) DEFAULT NULL,
  `descricao` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `ocorrencias`
--

INSERT INTO `ocorrencias` (`id`, `data_`, `hora`, `descricao`) VALUES
(1, '2018/04/25', '11:00', 'nao sei');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
