-- MySQL dump 10.13  Distrib 5.7.20, for macos10.12 (x86_64)
--
-- Host: localhost    Database: evolve
-- ------------------------------------------------------
-- Server version	5.7.20

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` varchar(64) NOT NULL,
  `fk_type` int(11) NOT NULL,
  `salt` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_account_type1_idx` (`fk_type`),
  CONSTRAINT `fk_account_type1` FOREIGN KEY (`fk_type`) REFERENCES `account_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'company@gmail.com','f34cf1190d4467d8c2f45236547c884cf403ab570286cfa348e915c38321fbfa',1,'QdnWEfBn'),(2,'customer@gmail.com','1e29196e6f38ae470e28ef65e2b3f2c0cce81c49fd60e4b4e2b4285e4bdeec47',2,'9khZrlpe'),(3,'assessor@gmail.com','c947ef269aaad447b7f7e8696f4cbe1c5e5124edd3f0d5dc5639ff4763dcb47e',3,'Ck4enSVO'),(6,'test2@gmail.com','603be8e4ee4bf9416d667ab4c21497111c3a0fa2bacf181b465eaa5a166da792',1,'5Z0VJvMv'),(7,'testtest@gmail.com','3b30a12dca838217147e7d908655677e08aec006fdcd58d0dc131c6705e6ff77',1,'JQtb3q03'),(8,'change@gmail.com','7251d53038da851b7f6db1ccffb361941086646ec440f25441a85bf0eb4ec4d6',1,'TUa9mJ4a'),(9,'afdfd@gmail.com','995c08d57a83f59b1948ae39baf65b6c191c43c135c71af2e4fcb819fa4711b6',1,'p3LNtpsq');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_type`
--

DROP TABLE IF EXISTS `account_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_type`
--

LOCK TABLES `account_type` WRITE;
/*!40000 ALTER TABLE `account_type` DISABLE KEYS */;
INSERT INTO `account_type` VALUES (1,'Company'),(2,'Customer'),(3,'Assessor');
/*!40000 ALTER TABLE `account_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment`
--

DROP TABLE IF EXISTS `assessment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `approved` int(11) NOT NULL DEFAULT '0',
  `qvi_score` int(11) DEFAULT NULL,
  `fk_company` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_assessment_company1_idx` (`fk_company`),
  CONSTRAINT `fk_assessment_company1` FOREIGN KEY (`fk_company`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment`
--

LOCK TABLES `assessment` WRITE;
/*!40000 ALTER TABLE `assessment` DISABLE KEYS */;
INSERT INTO `assessment` VALUES (1,'2018-01-05',0,89,1),(2,'2018-01-07',0,64,1),(3,'2018-01-08',0,78,1),(4,'2018-01-09',0,42,1),(5,'2018-01-10',0,26,1);
/*!40000 ALTER TABLE `assessment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `evolve`.`assessment_AFTER_UPDATE`
AFTER UPDATE ON `evolve`.`assessment`
FOR EACH ROW
BEGIN
INSERT into assessmentLog (timeStamps,userLog) VALUES (now(), CURRENT_USER);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `assessmentLog`
--

DROP TABLE IF EXISTS `assessmentLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessmentLog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timeStamps` varchar(40) DEFAULT NULL,
  `userLog` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessmentLog`
--

LOCK TABLES `assessmentLog` WRITE;
/*!40000 ALTER TABLE `assessmentLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessmentLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessor`
--

DROP TABLE IF EXISTS `assessor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `fk_account` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_assessor_account1_idx` (`fk_account`),
  CONSTRAINT `fk_assessor_account1` FOREIGN KEY (`fk_account`) REFERENCES `account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessor`
--

LOCK TABLES `assessor` WRITE;
/*!40000 ALTER TABLE `assessor` DISABLE KEYS */;
INSERT INTO `assessor` VALUES (1,'bob',3);
/*!40000 ALTER TABLE `assessor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessorTopCompanyTopModule`
--

DROP TABLE IF EXISTS `assessorTopCompanyTopModule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessorTopCompanyTopModule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assessorID` int(11) DEFAULT NULL,
  `companyName` varchar(20) DEFAULT NULL,
  `moduleName` varchar(20) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessorTopCompanyTopModule`
--

LOCK TABLES `assessorTopCompanyTopModule` WRITE;
/*!40000 ALTER TABLE `assessorTopCompanyTopModule` DISABLE KEYS */;
INSERT INTO `assessorTopCompanyTopModule` VALUES (1,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `assessorTopCompanyTopModule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badComments`
--

DROP TABLE IF EXISTS `badComments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `badComments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(250) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badComments`
--

LOCK TABLES `badComments` WRITE;
/*!40000 ALTER TABLE `badComments` DISABLE KEYS */;
INSERT INTO `badComments` VALUES (1,'This is a bad comment haha',1),(2,'Low score bad comment please check',1),(3,'im a bad comment',2),(4,'This is a bad comment haha',1),(5,'Low score bad comment please check',1),(6,'im a bad comment',2);
/*!40000 ALTER TABLE `badComments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `fk_assessor` int(11) DEFAULT NULL,
  `fk_account` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_company_assessor1_idx` (`fk_assessor`),
  KEY `fk_company_account1_idx` (`fk_account`),
  CONSTRAINT `fk_company_account1` FOREIGN KEY (`fk_account`) REFERENCES `account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_company_assessor1` FOREIGN KEY (`fk_assessor`) REFERENCES `assessor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'Simon Inc',1,1),(2,'testCompany2',1,6),(3,'testtest',1,7),(4,'change',1,8),(5,'attack\"; DELETE * FROM account WHERE id = 8;',1,9);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `evolve`.`insertModulesForCompany`
AFTER INSERT ON `evolve`.`company`
FOR EACH ROW
BEGIN
INSERT INTO module (fk_company, fk_module, deleted) VALUES (NEW.id, 1, 0);
INSERT INTO module (fk_company, fk_module, deleted) VALUES (NEW.id, 2, 0);
INSERT INTO module (fk_company, fk_module, deleted) VALUES (NEW.id, 3, 0);
INSERT INTO module (fk_company, fk_module, deleted) VALUES (NEW.id, 4, 0);
INSERT INTO module (fk_company, fk_module, deleted) VALUES (NEW.id, 5, 0);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `module`
--

DROP TABLE IF EXISTS `module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_company` int(11) NOT NULL,
  `fk_module` int(11) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_module_company1_idx` (`fk_company`),
  KEY `fk_module_moduleType1_idx` (`fk_module`),
  CONSTRAINT `fk_module_company1` FOREIGN KEY (`fk_company`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_module_moduleType1` FOREIGN KEY (`fk_module`) REFERENCES `moduletype` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module`
--

LOCK TABLES `module` WRITE;
/*!40000 ALTER TABLE `module` DISABLE KEYS */;
INSERT INTO `module` VALUES (1,1,1,0),(2,1,2,0),(3,1,3,0),(4,1,4,0),(5,1,5,0),(6,2,1,0),(7,2,2,0),(8,2,3,0),(9,2,4,0),(10,2,5,0),(11,3,1,0),(12,3,2,0),(13,3,3,0),(14,3,4,0),(15,3,5,0),(16,4,1,0),(17,4,2,0),(18,4,3,0),(19,4,4,0),(20,4,5,0),(21,5,1,0),(22,5,2,0),(23,5,3,0),(24,5,4,0),(25,5,5,0);
/*!40000 ALTER TABLE `module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moduletype`
--

DROP TABLE IF EXISTS `moduletype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moduletype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moduletype`
--

LOCK TABLES `moduletype` WRITE;
/*!40000 ALTER TABLE `moduletype` DISABLE KEYS */;
INSERT INTO `moduletype` VALUES (1,'Clients'),(2,'People'),(3,'Value'),(4,'FM Excellence'),(5,'FM Standards');
/*!40000 ALTER TABLE `moduletype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `people` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `fk_company` int(11) NOT NULL,
  `fk_account` int(11) NOT NULL,
  `fk_type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_people_company_idx` (`fk_company`),
  KEY `fk_people_account1_idx` (`fk_account`),
  KEY `fk_people_people_type1_idx` (`fk_type`),
  CONSTRAINT `fk_people_account1` FOREIGN KEY (`fk_account`) REFERENCES `account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_people_company` FOREIGN KEY (`fk_company`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_people_people_type1` FOREIGN KEY (`fk_type`) REFERENCES `people_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` VALUES (1,'Mac','Tho',1,2,3);
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people_type`
--

DROP TABLE IF EXISTS `people_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `people_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people_type`
--

LOCK TABLES `people_type` WRITE;
/*!40000 ALTER TABLE `people_type` DISABLE KEYS */;
INSERT INTO `people_type` VALUES (1,'Client'),(2,'Employee'),(3,'Manager');
/*!40000 ALTER TABLE `people_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionnaire`
--

DROP TABLE IF EXISTS `questionnaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questionnaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `fk_module` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_questionnaire_moduleType1_idx` (`fk_module`),
  CONSTRAINT `fk_questionnaire_moduleType1` FOREIGN KEY (`fk_module`) REFERENCES `moduletype` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionnaire`
--

LOCK TABLES `questionnaire` WRITE;
/*!40000 ALTER TABLE `questionnaire` DISABLE KEYS */;
INSERT INTO `questionnaire` VALUES (1,'Clients',1),(2,'People',2),(3,'Value',3),(4,'FM Excellence',4),(5,'FM Standards',5);
/*!40000 ALTER TABLE `questionnaire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(400) NOT NULL,
  `fk_questionnaire` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_questions_questionnaire1_idx` (`fk_questionnaire`),
  CONSTRAINT `fk_questions_questionnaire1` FOREIGN KEY (`fk_questionnaire`) REFERENCES `questionnaire` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'Accessibility: Availability',1),(2,'Accessibility: Easily Contactable',1),(3,'Responsiveness: Telephone answered promptly',1),(4,'Responsiveness: Prompt response to correspondence',1),(5,'Responsiveness: Attending to the issue',1),(6,'Reliability: Communicate timescales',1),(7,'Reliability: Meet Agreed timescales',1),(8,'Reliability: Provision of right service',1),(9,'Competence: Demonstrable processes',1),(10,'Competence: Demonstrable well trained staff',1),(11,'Credibility: General confidence in behaviour and approach',1),(12,'Credibility: Honesty',1),(13,'Understanding: Demonstrate clear understanding of requirements',1),(14,'Understanding: Understanding needs and requirements',1),(15,'Understanding: Sympathetic to customer problems and contraints',1),(16,'Communication: Recieve regular progress reports',1),(17,'Communication: Explain the impact of works',1),(18,'Communication: Communicate in an understandable way',1),(19,'Communication: Listen to customer',1),(20,'Communication: Communicate on-going progress of works/jobs',1),(21,'Communication: Communicate job closure',1),(22,'Courtesy: Courteous staff',1),(23,'Courtesy: Helpful staff',1),(24,'Courtesy: Presentable staff',1),(25,'Facilities: Hygiene (Cleaning)',1),(26,'Facilities: Waste',1),(27,'Facilities: Security',1),(28,'Facilities: Catering and vending',1),(29,'Facilities: Maintenance',1),(30,'Facilities: Mailroom',1),(31,'Facilities: Help desk',1),(32,'I am familiar with the Job Description for the service that I am expected to deliver and my actual roles and responsibilities closely match this',2),(33,'A Personal Development Review process (staff appraisal) exists and occurs on a regular basis (12-monthly minimum)',2),(34,'My own PDR is fair and reasonable as are the objectives set',2),(35,'Training plans exist and these are updated on a regular basis. I am familiar with the TP and I am content with the level of training that I receive.',2),(36,'There is strong leadership and management of the service (including company briefings). It works well at all levels',2),(37,'I am aware of my Health & Safety and Environmental obligations',2),(38,'Clear work instructions and procedures exist and I can refer to them to carry out my work',2),(39,'In my opinion, the service(s) being delivered are to a high standard and the client is content with the level of service delivered',2),(40,'I receive regular feedback on my performance. Good performance is recognised',2),(41,'I am able to feedback my views and comments to the management team and these are considered accordingly',2),(42,'Innovation is encouraged from above and I am encouraged to propose innovative ideas. I am incentivised to work efficiently and offer innovative ideas',2),(43,'I am given sufficient time to carry out my role and perform my tasks as per my job specification',2),(44,'I am motivated, empowered and feel part of the team',2),(45,'I receive job satisfaction',2),(46,'Do you have a clear FM strategy for the FM services being delivered and how does this strategy ensure value?',4),(47,'Are all stakeholders aware of your Service delivery strategy? How is this communicated to all stakeholders?',4),(48,'How do you revise your standard policies to meet the requirements of the Client\'s policies concerning the FM services?',4),(49,'I feel that the company values me',3),(50,'In my opinion I feel that my thoughts and input are heard',3),(51,'The company has moral values',3),(52,'I know the process for reporting any misconduct',3),(53,'I am aware of the standards the company has for products',5),(54,'All tests on products are done thoroughly',5),(55,'I know how to report faulty products',5),(56,'I know how to work safely in my enviornment',5),(57,'I would like additional training on safety measures',5);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qviChange`
--

DROP TABLE IF EXISTS `qviChange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qviChange` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `difference` int(11) DEFAULT NULL,
  `companyID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qviChange`
--

LOCK TABLES `qviChange` WRITE;
/*!40000 ALTER TABLE `qviChange` DISABLE KEYS */;
INSERT INTO `qviChange` VALUES (1,NULL,0);
/*!40000 ALTER TABLE `qviChange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `result` (
  `fk_assessment` int(11) NOT NULL,
  `fk_module` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `fk_company` int(11) DEFAULT NULL,
  PRIMARY KEY (`fk_assessment`,`fk_module`),
  KEY `fk_assessment_has_module_module1_idx` (`fk_module`),
  KEY `fk_assessment_has_module_assessment1_idx` (`fk_assessment`),
  CONSTRAINT `fk_assessment_has_module_assessment1` FOREIGN KEY (`fk_assessment`) REFERENCES `assessment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_assessment_has_module_module1` FOREIGN KEY (`fk_module`) REFERENCES `module` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result`
--

LOCK TABLES `result` WRITE;
/*!40000 ALTER TABLE `result` DISABLE KEYS */;
INSERT INTO `result` VALUES (1,1,60,1),(1,2,70,1),(1,3,70,1),(2,1,60,1),(3,2,80,1);
/*!40000 ALTER TABLE `result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scores`
--

DROP TABLE IF EXISTS `scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` varchar(45) NOT NULL,
  `comment` varchar(45) DEFAULT NULL,
  `fk_question` int(11) NOT NULL,
  `fk_module` int(11) NOT NULL,
  `fk_result` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_scores_questions1_idx` (`fk_question`),
  KEY `fk_scores_module1_idx` (`fk_module`),
  CONSTRAINT `fk_scores_module1` FOREIGN KEY (`fk_module`) REFERENCES `module` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_scores_questions1` FOREIGN KEY (`fk_question`) REFERENCES `questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scores`
--

LOCK TABLES `scores` WRITE;
/*!40000 ALTER TABLE `scores` DISABLE KEYS */;
INSERT INTO `scores` VALUES (1,'1','This is a bad comment haha',1,1,1),(2,'1','Low score bad comment please check',2,1,1),(3,'2','im a bad comment',1,1,1),(4,'5','good comment',3,1,1);
/*!40000 ALTER TABLE `scores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-06 12:36:09
