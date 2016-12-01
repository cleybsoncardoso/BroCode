-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dsoutlet
-- ------------------------------------------------------
-- Server version	5.7.16-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `IDCliente` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CPF` varchar(14) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Nascimento` date NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `EnderecoIDEndereco` int(10) unsigned NOT NULL,
  PRIMARY KEY (`IDCliente`,`CPF`,`EnderecoIDEndereco`),
  KEY `fk_Cliente_Endereco1_idx` (`EnderecoIDEndereco`),
  CONSTRAINT `fk_Cliente_Endereco1` FOREIGN KEY (`EnderecoIDEndereco`) REFERENCES `endereco` (`ID_Endereco`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `divida`
--

DROP TABLE IF EXISTS `divida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `divida` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Valor` decimal(5,2) NOT NULL,
  `ParcelasAPagar` int(11) DEFAULT NULL,
  `Vencimento` date DEFAULT NULL,
  `Cliente_IDCliente` int(10) unsigned NOT NULL,
  `Cliente_CPF` varchar(14) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Divida_Cliente1_idx` (`Cliente_IDCliente`,`Cliente_CPF`),
  CONSTRAINT `fk_Divida_Cliente1` FOREIGN KEY (`Cliente_IDCliente`, `Cliente_CPF`) REFERENCES `cliente` (`IDCliente`, `CPF`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `divida`
--

LOCK TABLES `divida` WRITE;
/*!40000 ALTER TABLE `divida` DISABLE KEYS */;
/*!40000 ALTER TABLE `divida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endereco` (
  `ID_Endereco` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Cep` varchar(9) NOT NULL,
  `Logradouro` varchar(80) NOT NULL,
  `Numero` int(11) NOT NULL,
  `UF` varchar(2) NOT NULL,
  `Telefone` varchar(14) NOT NULL,
  PRIMARY KEY (`ID_Endereco`,`Cep`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `linha_de_venda`
--

DROP TABLE IF EXISTS `linha_de_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `linha_de_venda` (
  `Produto_IDProduto` int(10) unsigned NOT NULL,
  `Venda_IDVenda` int(10) unsigned NOT NULL,
  KEY `fk_Linha_De_Venda_Produto1_idx` (`Produto_IDProduto`),
  KEY `fk_Linha_De_Venda_Venda1_idx` (`Venda_IDVenda`),
  CONSTRAINT `fk_Linha_De_Venda_Produto1` FOREIGN KEY (`Produto_IDProduto`) REFERENCES `produto` (`IDProduto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Linha_De_Venda_Venda1` FOREIGN KEY (`Venda_IDVenda`) REFERENCES `venda` (`IDVenda`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linha_de_venda`
--

LOCK TABLES `linha_de_venda` WRITE;
/*!40000 ALTER TABLE `linha_de_venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `linha_de_venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loja`
--

DROP TABLE IF EXISTS `loja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loja` (
  `IDLoja` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `EnderecoIDEndereco` int(10) unsigned NOT NULL,
  PRIMARY KEY (`IDLoja`,`EnderecoIDEndereco`),
  KEY `fk_Loja_Endereco1_idx` (`EnderecoIDEndereco`),
  CONSTRAINT `fk_Loja_Endereco1` FOREIGN KEY (`EnderecoIDEndereco`) REFERENCES `endereco` (`ID_Endereco`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loja`
--

LOCK TABLES `loja` WRITE;
/*!40000 ALTER TABLE `loja` DISABLE KEYS */;
/*!40000 ALTER TABLE `loja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `IDProduto` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Marca` varchar(45) NOT NULL,
  `Modelo` varchar(45) NOT NULL,
  `Tamanho` varchar(3) NOT NULL,
  `Quantidade` int(11) NOT NULL,
  `PrecoEntrada` decimal(5,2) DEFAULT NULL,
  `PrecoSaidaPadrao` decimal(5,2) DEFAULT NULL,
  `Max` int(11) DEFAULT NULL,
  `Min` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_entrada`
--

DROP TABLE IF EXISTS `registro_entrada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registro_entrada` (
  `IDRegistro` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Quantidade` int(11) NOT NULL,
  `Tempo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LojaIDLoja` int(10) unsigned NOT NULL,
  `ProdutoIDProduto` int(10) unsigned NOT NULL,
  `Usuario_IDUsuario` int(10) unsigned NOT NULL,
  PRIMARY KEY (`IDRegistro`),
  KEY `fk_Registro_Entrada_Loja1_idx` (`LojaIDLoja`),
  KEY `fk_Registro_Entrada_Produto1_idx` (`ProdutoIDProduto`),
  KEY `fk_Registro_Entrada_Usuario1_idx` (`Usuario_IDUsuario`),
  CONSTRAINT `fk_Registro_Entrada_Loja1` FOREIGN KEY (`LojaIDLoja`) REFERENCES `loja` (`IDLoja`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Registro_Entrada_Produto1` FOREIGN KEY (`ProdutoIDProduto`) REFERENCES `produto` (`IDProduto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Registro_Entrada_Usuario1` FOREIGN KEY (`Usuario_IDUsuario`) REFERENCES `usuario` (`IDUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_entrada`
--

LOCK TABLES `registro_entrada` WRITE;
/*!40000 ALTER TABLE `registro_entrada` DISABLE KEYS */;
/*!40000 ALTER TABLE `registro_entrada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_saida`
--

DROP TABLE IF EXISTS `registro_saida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registro_saida` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Tempo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LojaIDLoja` int(10) unsigned NOT NULL,
  `Usuario_IDUsuario` int(10) unsigned NOT NULL,
  `Venda_IDVenda` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Registro_Saida_Loja1_idx` (`LojaIDLoja`),
  KEY `fk_Registro_Saida_Usuario1_idx` (`Usuario_IDUsuario`),
  KEY `fk_Registro_Saida_Venda1_idx` (`Venda_IDVenda`),
  CONSTRAINT `fk_Registro_Saida_Loja1` FOREIGN KEY (`LojaIDLoja`) REFERENCES `loja` (`IDLoja`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Registro_Saida_Usuario1` FOREIGN KEY (`Usuario_IDUsuario`) REFERENCES `usuario` (`IDUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Registro_Saida_Venda1` FOREIGN KEY (`Venda_IDVenda`) REFERENCES `venda` (`IDVenda`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_saida`
--

LOCK TABLES `registro_saida` WRITE;
/*!40000 ALTER TABLE `registro_saida` DISABLE KEYS */;
/*!40000 ALTER TABLE `registro_saida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `IDUsuario` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nome` varchar(80) NOT NULL,
  `Login` varchar(45) NOT NULL,
  `Senha` varchar(45) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Acesso` enum('A','C') NOT NULL,
  PRIMARY KEY (`IDUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda`
--

DROP TABLE IF EXISTS `venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venda` (
  `IDVenda` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Valor` decimal(5,2) NOT NULL,
  `TipoDePagamento` enum('debito','credito','dinheiro','fiado','cheque') NOT NULL,
  `Usuario_IDUsuario` int(10) unsigned NOT NULL,
  `Cliente_IDCliente` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`IDVenda`),
  KEY `fk_Venda_Usuario1_idx` (`Usuario_IDUsuario`),
  KEY `fk_Venda_Cliente1_idx` (`Cliente_IDCliente`),
  CONSTRAINT `fk_Venda_Cliente1` FOREIGN KEY (`Cliente_IDCliente`) REFERENCES `cliente` (`IDCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venda_Usuario1` FOREIGN KEY (`Usuario_IDUsuario`) REFERENCES `usuario` (`IDUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-01  3:40:18
