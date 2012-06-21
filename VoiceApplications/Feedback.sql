-- MySQL dump 10.13  Distrib 5.1.62, for debian-linux-gnu (i486)
--
-- Host: localhost    Database: PhonePeti
-- ------------------------------------------------------
-- Server version	5.1.62-0ubuntu0.10.04.1

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
-- Table structure for table `Feedback_response`
--

DROP TABLE IF EXISTS `Feedback_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Feedback_response` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `call_id` int(11) NOT NULL,
  `filePath` varchar(100) NOT NULL,
  `title` varchar(32) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `duration` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Feedback_response_5831e140` (`call_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Feedback_response`
--

LOCK TABLES `Feedback_response` WRITE;
/*!40000 ALTER TABLE `Feedback_response` DISABLE KEYS */;
INSERT INTO `Feedback_response` VALUES (7,8,'/home/piyush/Documents/JobPortal/Record/22-05-2012/Feedback--22-05-2012---17:22:23.mp3','Title 7-7-7','App for doing survey and taking feedback',NULL),(2,3,'/home/piyush/Documents/JobPortal/Record/21-05-2012/Feedback--21-05-2012---13:15:39.wav','title 2','To get only feedback from callers',NULL),(3,4,'/home/piyush/Documents/JobPortal/Record/21-05-2012/Feedback--21-05-2012---13:30:20.wav','title 44','App for doing survey and taking feedback',NULL),(4,5,'/home/piyush/Documents/JobPortal/Record/21-05-2012/Feedback--21-05-2012---16:10:27.wav','title 55 ','',NULL),(5,6,'/home/piyush/Documents/JobPortal/Record/21-05-2012/Feedback--21-05-2012---16:11:53.wav','title five','desc 5',NULL),(6,7,'/home/piyush/Documents/JobPortal/Record/21-05-2012/Feedback--21-05-2012---16:12:48.wav','Title 6566','',NULL);
/*!40000 ALTER TABLE `Feedback_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PhonePeti_appinstance`
--

DROP TABLE IF EXISTS `PhonePeti_appinstance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhonePeti_appinstance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` int(11) NOT NULL,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `options` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `PhonePeti_appinstance_269da59a` (`app_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PhonePeti_appinstance`
--

LOCK TABLES `PhonePeti_appinstance` WRITE;
/*!40000 ALTER TABLE `PhonePeti_appinstance` DISABLE KEYS */;
INSERT INTO `PhonePeti_appinstance` VALUES (1,1,NULL,NULL,'Feedback only');
/*!40000 ALTER TABLE `PhonePeti_appinstance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PhonePeti_application`
--

DROP TABLE IF EXISTS `PhonePeti_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhonePeti_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PhonePeti_application`
--

LOCK TABLES `PhonePeti_application` WRITE;
/*!40000 ALTER TABLE `PhonePeti_application` DISABLE KEYS */;
INSERT INTO `PhonePeti_application` VALUES (1,'Feedback','For taking feedback from callers');
/*!40000 ALTER TABLE `PhonePeti_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PhonePeti_call`
--

DROP TABLE IF EXISTS `PhonePeti_call`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhonePeti_call` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phoneNo_id` int(11) NOT NULL,
  `caller_id` int(11) DEFAULT NULL,
  `startTime` datetime NOT NULL,
  `endTime` datetime NOT NULL,
  `appInstance_id` int(11) NOT NULL,
  `monitorFile` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `PhonePeti_call_28b0d86a` (`phoneNo_id`),
  KEY `PhonePeti_call_8be43a3` (`caller_id`),
  KEY `PhonePeti_call_781aa1ad` (`appInstance_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PhonePeti_call`
--

LOCK TABLES `PhonePeti_call` WRITE;
/*!40000 ALTER TABLE `PhonePeti_call` DISABLE KEYS */;
INSERT INTO `PhonePeti_call` VALUES (6,4,48,'2012-05-21 16:11:53','2012-05-21 16:12:25',1,'/home/piyush/Documents/JobPortal/Record/21-05-2012/Complete--21-05-2012---16:11:53.wav'),(5,3,48,'2012-05-21 16:10:27','2012-05-21 16:10:57',1,'/home/piyush/Documents/JobPortal/Record/21-05-2012/Complete--21-05-2012---16:10:27.wav'),(3,3,37,'2012-05-21 13:15:39','2012-05-21 13:16:11',1,'/home/piyush/Documents/JobPortal/Record/21-05-2012/Complete--21-05-2012---13:15:39.wav'),(4,3,NULL,'2012-05-21 13:30:20','2012-05-21 13:30:52',1,'/home/piyush/Documents/JobPortal/Record/21-05-2012/Complete--21-05-2012---13:30:20.wav'),(7,5,56,'2012-05-21 16:12:48','2012-05-21 16:13:21',1,'/home/piyush/Documents/JobPortal/Record/21-05-2012/Complete--21-05-2012---16:12:48.wav'),(8,5,NULL,'2012-05-22 17:22:23','2012-05-22 17:22:40',1,'/home/piyush/Documents/JobPortal/Record/22-05-2012/Complete--22-05-2012---17:22:23.mp3');
/*!40000 ALTER TABLE `PhonePeti_call` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PhonePeti_caller`
--

DROP TABLE IF EXISTS `PhonePeti_caller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhonePeti_caller` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` varchar(1) NOT NULL,
  `address` varchar(32) NOT NULL,
  `profession` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PhonePeti_caller`
--

LOCK TABLES `PhonePeti_caller` WRITE;
/*!40000 ALTER TABLE `PhonePeti_caller` DISABLE KEYS */;
INSERT INTO `PhonePeti_caller` VALUES (1,'Piyush',NULL,'','',''),(2,'Piyush Aggarwal',NULL,'','',''),(36,'name 222',NULL,'','add 2','prof 2222222222222222'),(35,'name 222',NULL,'','add 2','prof 2'),(15,'test',11,'','delhi',''),(16,'Final',12,'','NCR',''),(17,'',NULL,'','',''),(18,'',NULL,'','',''),(19,'',NULL,'','',''),(22,'My Caller',NULL,'','Delhi','Employee'),(21,'TestCaller',NULL,'','',''),(23,'',NULL,'','',''),(24,'',NULL,'','',''),(25,'',NULL,'','',''),(26,'',NULL,'','',''),(27,'Test2',NULL,'','test2','test2'),(28,'',NULL,'','',''),(29,'test 6',NULL,'','Address 6','prof 6'),(30,'name 2',NULL,'','add 2','prof 2'),(31,'name 3',NULL,'','add 3','prof 3'),(34,'name 4',NULL,'','add 4','prof 4'),(37,'name 37 id 2',NULL,'','add 37','prof 373737'),(38,'',NULL,'','',''),(39,'name 34',NULL,'','add 34','prof 4'),(40,'',NULL,'','',''),(41,'',NULL,'','',''),(42,'name id 5',NULL,'','add id 5','prof id 5'),(43,'',NULL,'','',''),(44,'',NULL,'','',''),(45,'',NULL,'','',''),(46,'',NULL,'','',''),(47,'',NULL,'','',''),(48,'name id 5',NULL,'','',''),(49,'id name 4',NULL,'','',''),(50,'name id 6',NULL,'','',''),(54,'test names',NULL,'','test addresses',''),(53,'test name',NULL,'','test address',''),(55,'',NULL,'','',''),(56,'test name 6',NULL,'','test addres 6','');
/*!40000 ALTER TABLE `PhonePeti_caller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PhonePeti_phoneno`
--

DROP TABLE IF EXISTS `PhonePeti_phoneno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhonePeti_phoneno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phoneNo` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PhonePeti_phoneno`
--

LOCK TABLES `PhonePeti_phoneno` WRITE;
/*!40000 ALTER TABLE `PhonePeti_phoneno` DISABLE KEYS */;
INSERT INTO `PhonePeti_phoneno` VALUES (3,'Piyush'),(4,'Piyush Aggarwal'),(5,'P.Aggarwal');
/*!40000 ALTER TABLE `PhonePeti_phoneno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PhonePeti_prompt`
--

DROP TABLE IF EXISTS `PhonePeti_prompt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhonePeti_prompt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` varchar(128) NOT NULL,
  `filePath` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `PhonePeti_prompt_269da59a` (`app_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PhonePeti_prompt`
--

LOCK TABLES `PhonePeti_prompt` WRITE;
/*!40000 ALTER TABLE `PhonePeti_prompt` DISABLE KEYS */;
/*!40000 ALTER TABLE `PhonePeti_prompt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PhonePeti_promptinstance`
--

DROP TABLE IF EXISTS `PhonePeti_promptinstance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhonePeti_promptinstance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prompt_id` int(11) NOT NULL,
  `appInstance_id` int(11) NOT NULL,
  `filePath` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `PhonePeti_promptinstance_215c836c` (`prompt_id`),
  KEY `PhonePeti_promptinstance_781aa1ad` (`appInstance_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PhonePeti_promptinstance`
--

LOCK TABLES `PhonePeti_promptinstance` WRITE;
/*!40000 ALTER TABLE `PhonePeti_promptinstance` DISABLE KEYS */;
/*!40000 ALTER TABLE `PhonePeti_promptinstance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PhonePeti_tags`
--

DROP TABLE IF EXISTS `PhonePeti_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhonePeti_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tagName` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tagName` (`tagName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PhonePeti_tags`
--

LOCK TABLES `PhonePeti_tags` WRITE;
/*!40000 ALTER TABLE `PhonePeti_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `PhonePeti_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PhonePeti_tags_call`
--

DROP TABLE IF EXISTS `PhonePeti_tags_call`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PhonePeti_tags_call` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tags_id` int(11) NOT NULL,
  `call_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_id` (`tags_id`,`call_id`),
  KEY `PhonePeti_tags_call_618b4d49` (`tags_id`),
  KEY `PhonePeti_tags_call_5831e140` (`call_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PhonePeti_tags_call`
--

LOCK TABLES `PhonePeti_tags_call` WRITE;
/*!40000 ALTER TABLE `PhonePeti_tags_call` DISABLE KEYS */;
/*!40000 ALTER TABLE `PhonePeti_tags_call` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Survey_answer`
--

DROP TABLE IF EXISTS `Survey_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Survey_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `call_id` int(11) NOT NULL,
  `answer` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Survey_answer_1f92e550` (`question_id`),
  KEY `Survey_answer_5831e140` (`call_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Survey_answer`
--

LOCK TABLES `Survey_answer` WRITE;
/*!40000 ALTER TABLE `Survey_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `Survey_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Survey_answerchoices`
--

DROP TABLE IF EXISTS `Survey_answerchoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Survey_answerchoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `choice1` varchar(32) NOT NULL,
  `choice2` varchar(32) NOT NULL,
  `choice3` varchar(32) NOT NULL,
  `choice4` varchar(32) NOT NULL,
  `choice5` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Survey_answerchoices_1f92e550` (`question_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Survey_answerchoices`
--

LOCK TABLES `Survey_answerchoices` WRITE;
/*!40000 ALTER TABLE `Survey_answerchoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `Survey_answerchoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Survey_answertype`
--

DROP TABLE IF EXISTS `Survey_answertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Survey_answertype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ansType` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Survey_answertype`
--

LOCK TABLES `Survey_answertype` WRITE;
/*!40000 ALTER TABLE `Survey_answertype` DISABLE KEYS */;
/*!40000 ALTER TABLE `Survey_answertype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Survey_callstatus`
--

DROP TABLE IF EXISTS `Survey_callstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Survey_callstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `call_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Survey_callstatus_5831e140` (`call_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Survey_callstatus`
--

LOCK TABLES `Survey_callstatus` WRITE;
/*!40000 ALTER TABLE `Survey_callstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `Survey_callstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Survey_feedback`
--

DROP TABLE IF EXISTS `Survey_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Survey_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filePath` varchar(100) NOT NULL,
  `call_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Survey_feedback_5831e140` (`call_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Survey_feedback`
--

LOCK TABLES `Survey_feedback` WRITE;
/*!40000 ALTER TABLE `Survey_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `Survey_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Survey_question`
--

DROP TABLE IF EXISTS `Survey_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Survey_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questionNo` int(11) NOT NULL,
  `answerType_id` int(11) NOT NULL,
  `promptInstance_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Survey_question_7494495c` (`answerType_id`),
  KEY `Survey_question_69223859` (`promptInstance_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Survey_question`
--

LOCK TABLES `Survey_question` WRITE;
/*!40000 ALTER TABLE `Survey_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `Survey_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_425ae3c4` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_1bb8f392` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add phone no',7,'add_phoneno'),(20,'Can change phone no',7,'change_phoneno'),(21,'Can delete phone no',7,'delete_phoneno'),(22,'Can add caller',8,'add_caller'),(23,'Can change caller',8,'change_caller'),(24,'Can delete caller',8,'delete_caller'),(25,'Can add application',9,'add_application'),(26,'Can change application',9,'change_application'),(27,'Can delete application',9,'delete_application'),(28,'Can add app instance',10,'add_appinstance'),(29,'Can change app instance',10,'change_appinstance'),(30,'Can delete app instance',10,'delete_appinstance'),(31,'Can add call',11,'add_call'),(32,'Can change call',11,'change_call'),(33,'Can delete call',11,'delete_call'),(34,'Can add prompt',12,'add_prompt'),(35,'Can change prompt',12,'change_prompt'),(36,'Can delete prompt',12,'delete_prompt'),(37,'Can add prompt instance',13,'add_promptinstance'),(38,'Can change prompt instance',13,'change_promptinstance'),(39,'Can delete prompt instance',13,'delete_promptinstance'),(40,'Can add answer type',14,'add_answertype'),(41,'Can change answer type',14,'change_answertype'),(42,'Can delete answer type',14,'delete_answertype'),(43,'Can add question',15,'add_question'),(44,'Can change question',15,'change_question'),(45,'Can delete question',15,'delete_question'),(46,'Can add answer',16,'add_answer'),(47,'Can change answer',16,'change_answer'),(48,'Can delete answer',16,'delete_answer'),(49,'Can add feedback',17,'add_feedback'),(50,'Can change feedback',17,'change_feedback'),(51,'Can delete feedback',17,'delete_feedback'),(52,'Can add answer choices',18,'add_answerchoices'),(53,'Can change answer choices',18,'change_answerchoices'),(54,'Can delete answer choices',18,'delete_answerchoices'),(58,'Can add call status',20,'add_callstatus'),(59,'Can change call status',20,'change_callstatus'),(60,'Can delete call status',20,'delete_callstatus'),(61,'Can add response',21,'add_response'),(62,'Can change response',21,'change_response'),(63,'Can delete response',21,'delete_response'),(64,'Can add tags',22,'add_tags'),(65,'Can change tags',22,'change_tags'),(66,'Can delete tags',22,'delete_tags');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'piyush','','','me.piyushaggarwal@gmail.com','pbkdf2_sha256$10000$h5Uvt1ZNpmfa$q3xze1XixqTsN5DS26sna87E+YIbHDE6LDzt1vnkbJQ=',1,1,1,'2012-06-06 06:14:59','2012-05-08 11:09:14');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_403f60f` (`user_id`),
  KEY `auth_user_groups_425ae3c4` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_403f60f` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'site','sites','site'),(7,'phone no','PhonePeti','phoneno'),(8,'caller','PhonePeti','caller'),(9,'application','PhonePeti','application'),(10,'app instance','PhonePeti','appinstance'),(11,'call','PhonePeti','call'),(12,'prompt','PhonePeti','prompt'),(13,'prompt instance','PhonePeti','promptinstance'),(14,'answer type','Survey','answertype'),(15,'question','Survey','question'),(16,'answer','Survey','answer'),(17,'feedback','Survey','feedback'),(18,'answer choices','Survey','answerchoices'),(20,'call status','Survey','callstatus'),(21,'response','Feedback','response'),(22,'tags','PhonePeti','tags');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_3da3d3d8` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('559e6fd2598615903d6bd54c3cf0902f','MmRhOGZhNGY2MjJkNzE0NTNmMzlmNWRjMDExNWNkNDUwZDgzY2NmZDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-06-04 08:40:27'),('6b39997c639e9eb5cd2ec293fdcb70f5','MmRhOGZhNGY2MjJkNzE0NTNmMzlmNWRjMDExNWNkNDUwZDgzY2NmZDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-06-05 12:38:59'),('65970c971cd9b20d1943f1dfd2b7898a','MmRhOGZhNGY2MjJkNzE0NTNmMzlmNWRjMDExNWNkNDUwZDgzY2NmZDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-06-20 06:14:59'),('d7f0e921f143d4d72521a33d4d2edfa4','MmRhOGZhNGY2MjJkNzE0NTNmMzlmNWRjMDExNWNkNDUwZDgzY2NmZDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-06-11 14:13:25');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-06-06 14:17:02
