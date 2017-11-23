# Host: localhost  (Version 5.7.19)
# Date: 2017-11-23 13:59:28
# Generator: MySQL-Front 6.0  (Build 2.20)


#
# Structure for table "auth_group"
#

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "auth_group"
#


#
# Structure for table "auth_user"
#

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "auth_user"
#

INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$FvQpmxFquw2r$7n62/Py01psZH9tS15jxrc3OaNCvrJDxwV5VdLLq42g=',X'323031372D31312D32332031333A35373A32302E333236363433',1,'admin','','','admin@icare.com',1,1,X'323031372D31312D31352030373A31323A34372E343033373339');

#
# Structure for table "auth_user_groups"
#

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "auth_user_groups"
#


#
# Structure for table "backend_carbrand"
#

DROP TABLE IF EXISTS `backend_carbrand`;
CREATE TABLE `backend_carbrand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `index_char` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

#
# Data for table "backend_carbrand"
#

INSERT INTO `backend_carbrand` VALUES (1,'奥迪','A'),(2,'奥二','A'),(3,'奥三','A'),(4,'奥四','A'),(5,'奥五','A'),(6,'奥六','A'),(7,'奥七','A'),(8,'奥八','A'),(9,'奔驰','B'),(10,'奔二','B'),(11,'奔三','B'),(12,'奔四','B'),(13,'奔五','B'),(14,'奔六','B'),(15,'奔七','B'),(16,'奔八','B'),(17,'长安','C'),(18,'长二','C'),(19,'长三','C'),(20,'长四','C'),(21,'长五','C'),(22,'长六','C'),(23,'长七','C'),(24,'长八','C');

#
# Structure for table "backend_carmodel"
#

DROP TABLE IF EXISTS `backend_carmodel`;
CREATE TABLE `backend_carmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `brand_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `backend_carmodel_brand_id_72ff5f9e_fk_backend_carbrand_id` (`brand_id`),
  CONSTRAINT `backend_carmodel_brand_id_72ff5f9e_fk_backend_carbrand_id` FOREIGN KEY (`brand_id`) REFERENCES `backend_carbrand` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

#
# Data for table "backend_carmodel"
#

INSERT INTO `backend_carmodel` VALUES (1,'A_1',1),(2,'A_11',1),(3,'A_111',1),(4,'A_1111',1),(5,'A_2',2),(6,'A_22',2),(7,'A_222',2),(8,'A_2222',2),(9,'A_3',3),(10,'A_33',3),(11,'A_333',3),(12,'A_3333',3),(13,'A_4',4),(14,'A_44',4),(15,'A_444',4),(16,'A_4444',4),(17,'B_1',9),(18,'B_11',9),(19,'B_111',9),(20,'B_1111',9),(21,'B_2',10),(22,'B_22',10),(23,'B_222',10),(24,'B_2222',10),(25,'B_3',11),(26,'B_33',11),(27,'B_333',11),(28,'B_3333',11),(29,'B_4',12),(30,'B_44',12),(31,'B_444',12),(32,'B_4444',12),(33,'C_1',17),(34,'C_11',17),(35,'C_111',17),(36,'C_1111',17),(37,'C_2',18),(38,'C_22',18),(39,'C_222',18),(40,'C_2222',18),(41,'C_3',19),(42,'C_33',19),(43,'C_333',19),(44,'C_3333',19),(45,'C_4',20),(46,'C_44',20),(47,'C_444',20),(48,'C_4444',20);

#
# Structure for table "backend_carfeature"
#

DROP TABLE IF EXISTS `backend_carfeature`;
CREATE TABLE `backend_carfeature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `market_year` int(11) NOT NULL,
  `front` varchar(100) NOT NULL,
  `front_photo` varchar(100) NOT NULL,
  `back` varchar(100) NOT NULL,
  `back_photo` varchar(100) NOT NULL,
  `model_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `backend_carfeature_model_id_686434a7_fk_backend_carmodel_id` (`model_id`),
  CONSTRAINT `backend_carfeature_model_id_686434a7_fk_backend_carmodel_id` FOREIGN KEY (`model_id`) REFERENCES `backend_carmodel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8;

#
# Data for table "backend_carfeature"
#

INSERT INTO `backend_carfeature` VALUES (1,2011,'前','/static/images/1.png','后','/static/images/2.png',1),(2,2012,'前','/static/images/1.png','后','/static/images/2.png',1),(3,2013,'前','/static/images/1.png','后','/static/images/2.png',1),(21,2031,'前','/static/images/3.png','后','/static/images/4.png',2),(22,2032,'前','/static/images/3.png','后','/static/images/4.png',2),(23,2033,'前','/static/images/3.png','后','/static/images/4.png',2),(41,2051,'前','/static/images/5.png','后','/static/images/6.png',3),(42,2052,'前','/static/images/5.png','后','/static/images/6.png',3),(43,2053,'前','/static/images/5.png','后','/static/images/6.png',3),(61,2071,'前','/static/images/5.png','后','/static/images/6.png',4),(62,2072,'前','/static/images/5.png','后','/static/images/6.png',4),(63,2073,'前','/static/images/5.png','后','/static/images/6.png',4),(81,2091,'前','/static/images/1.png','后','/static/images/2.png',17),(82,2092,'前','/static/images/1.png','后','/static/images/2.png',17),(83,2093,'前','/static/images/1.png','后','/static/images/2.png',17),(101,2111,'前','/static/images/1.png','后','/static/images/2.png',18),(102,2112,'前','/static/images/1.png','后','/static/images/2.png',18),(103,2113,'前','/static/images/1.png','后','/static/images/2.png',18),(121,2131,'前','/static/images/5.png','后','/static/images/6.png',20),(122,2132,'前','/static/images/5.png','后','/static/images/6.png',20),(123,2133,'前','/static/images/5.png','后','/static/images/6.png',20),(124,2134,'前','/static/images/5.png','后','/static/images/6.png',20),(125,2135,'前','/static/images/5.png','后','/static/images/6.png',20),(126,2136,'前','/static/images/5.png','后','/static/images/6.png',20),(127,2137,'前','/static/images/5.png','后','/static/images/6.png',20),(128,2138,'前','/static/images/5.png','后','/static/images/6.png',20),(129,2139,'前','/static/images/5.png','后','/static/images/6.png',20),(130,2140,'前','/static/images/5.png','后','/static/images/6.png',20),(131,2141,'前','/static/images/5.png','后','/static/images/6.png',20),(132,2142,'前','/static/images/5.png','后','/static/images/6.png',20),(133,2143,'前','/static/images/5.png','后','/static/images/6.png',20),(141,2151,'前','/static/images/5.png','后','/static/images/6.png',33),(142,2152,'前','/static/images/5.png','后','/static/images/6.png',33),(143,2153,'前','/static/images/5.png','后','/static/images/6.png',33),(144,2154,'前','/static/images/5.png','后','/static/images/6.png',33),(145,2155,'前','/static/images/5.png','后','/static/images/6.png',33),(146,2156,'前','/static/images/5.png','后','/static/images/6.png',33),(147,2157,'前','/static/images/5.png','后','/static/images/6.png',33),(148,2158,'前','/static/images/5.png','后','/static/images/6.png',33),(149,2159,'前','/static/images/5.png','后','/static/images/6.png',33),(150,2160,'前','/static/images/5.png','后','/static/images/6.png',33),(151,2161,'前','/static/images/5.png','后','/static/images/6.png',33),(152,2162,'前','/static/images/5.png','后','/static/images/6.png',33),(153,2163,'前','/static/images/5.png','后','/static/images/6.png',33),(154,2164,'前','/static/images/5.png','后','/static/images/6.png',33),(155,2165,'前','/static/images/5.png','后','/static/images/6.png',33);

#
# Structure for table "backend_marktask"
#

DROP TABLE IF EXISTS `backend_marktask`;
CREATE TABLE `backend_marktask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "backend_marktask"
#


#
# Structure for table "backend_markfile"
#

DROP TABLE IF EXISTS `backend_markfile`;
CREATE TABLE `backend_markfile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_path` varchar(500) NOT NULL,
  `task_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `backend_markfile_task_id_a06901a8_fk_backend_marktask_id` (`task_id`),
  CONSTRAINT `backend_markfile_task_id_a06901a8_fk_backend_marktask_id` FOREIGN KEY (`task_id`) REFERENCES `backend_marktask` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "backend_markfile"
#


#
# Structure for table "backend_markobject"
#

DROP TABLE IF EXISTS `backend_markobject`;
CREATE TABLE `backend_markobject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `file_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `backend_markobject_file_id_b3263f7f_fk_backend_markfile_id` (`file_id`),
  CONSTRAINT `backend_markobject_file_id_b3263f7f_fk_backend_markfile_id` FOREIGN KEY (`file_id`) REFERENCES `backend_markfile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "backend_markobject"
#


#
# Structure for table "backend_markfeature"
#

DROP TABLE IF EXISTS `backend_markfeature`;
CREATE TABLE `backend_markfeature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `object_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `backend_markfeature_object_id_1abfcd8b_fk_backend_markobject_id` (`object_id`),
  CONSTRAINT `backend_markfeature_object_id_1abfcd8b_fk_backend_markobject_id` FOREIGN KEY (`object_id`) REFERENCES `backend_markobject` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "backend_markfeature"
#


#
# Structure for table "backend_markusertask"
#

DROP TABLE IF EXISTS `backend_markusertask`;
CREATE TABLE `backend_markusertask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `backend_markusertask_task_id_50d721da_fk_backend_marktask_id` (`task_id`),
  KEY `backend_markusertask_user_id_ccee6e23_fk_auth_user_id` (`user_id`),
  CONSTRAINT `backend_markusertask_task_id_50d721da_fk_backend_marktask_id` FOREIGN KEY (`task_id`) REFERENCES `backend_marktask` (`id`),
  CONSTRAINT `backend_markusertask_user_id_ccee6e23_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "backend_markusertask"
#


#
# Structure for table "backend_userinfo"
#

DROP TABLE IF EXISTS `backend_userinfo`;
CREATE TABLE `backend_userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `backend_userinfo_user_id_a2a1bd43_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "backend_userinfo"
#

INSERT INTO `backend_userinfo` VALUES (1,'AAA',1);

#
# Structure for table "django_content_type"
#

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

#
# Data for table "django_content_type"
#

INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','permission'),(3,'auth','group'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'backend','carbrand'),(8,'backend','carfeature'),(9,'backend','carmodel'),(10,'backend','markfeature'),(11,'backend','markfile'),(12,'backend','markobject'),(13,'backend','marktask'),(14,'backend','markusertask'),(15,'backend','userinfo');

#
# Structure for table "django_admin_log"
#

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "django_admin_log"
#


#
# Structure for table "auth_permission"
#

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

#
# Data for table "auth_permission"
#

INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add car brand',7,'add_carbrand'),(20,'Can change car brand',7,'change_carbrand'),(21,'Can delete car brand',7,'delete_carbrand'),(22,'Can add car feature',8,'add_carfeature'),(23,'Can change car feature',8,'change_carfeature'),(24,'Can delete car feature',8,'delete_carfeature'),(25,'Can add car model',9,'add_carmodel'),(26,'Can change car model',9,'change_carmodel'),(27,'Can delete car model',9,'delete_carmodel'),(28,'Can add mark feature',10,'add_markfeature'),(29,'Can change mark feature',10,'change_markfeature'),(30,'Can delete mark feature',10,'delete_markfeature'),(31,'Can add mark file',11,'add_markfile'),(32,'Can change mark file',11,'change_markfile'),(33,'Can delete mark file',11,'delete_markfile'),(34,'Can add mark object',12,'add_markobject'),(35,'Can change mark object',12,'change_markobject'),(36,'Can delete mark object',12,'delete_markobject'),(37,'Can add mark task',13,'add_marktask'),(38,'Can change mark task',13,'change_marktask'),(39,'Can delete mark task',13,'delete_marktask'),(40,'Can add mark user task',14,'add_markusertask'),(41,'Can change mark user task',14,'change_markusertask'),(42,'Can delete mark user task',14,'delete_markusertask'),(43,'Can add user info',15,'add_userinfo'),(44,'Can change user info',15,'change_userinfo'),(45,'Can delete user info',15,'delete_userinfo');

#
# Structure for table "auth_user_user_permissions"
#

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "auth_user_user_permissions"
#


#
# Structure for table "auth_group_permissions"
#

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "auth_group_permissions"
#


#
# Structure for table "django_migrations"
#

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

#
# Data for table "django_migrations"
#

INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial',X'323031372D31312D32332031333A34383A33362E373730393436'),(2,'auth','0001_initial',X'323031372D31312D32332031333A34383A34332E383733393232'),(3,'admin','0001_initial',X'323031372D31312D32332031333A34383A34342E393333313732'),(4,'admin','0002_logentry_remove_auto_add',X'323031372D31312D32332031333A34383A34342E393739363637'),(5,'contenttypes','0002_remove_content_type_name',X'323031372D31312D32332031333A34383A34362E363031333434'),(6,'auth','0002_alter_permission_name_max_length',X'323031372D31312D32332031333A34383A34372E353034393735'),(7,'auth','0003_alter_user_email_max_length',X'323031372D31312D32332031333A34383A34382E333531313636'),(8,'auth','0004_alter_user_username_opts',X'323031372D31312D32332031333A34383A34382E333933313737'),(9,'auth','0005_alter_user_last_login_null',X'323031372D31312D32332031333A34383A34392E303630353533'),(10,'auth','0006_require_contenttypes_0002',X'323031372D31312D32332031333A34383A34392E313034333636'),(11,'auth','0007_alter_validators_add_error_messages',X'323031372D31312D32332031333A34383A34392E313637363130'),(12,'auth','0008_alter_user_username_max_length',X'323031372D31312D32332031333A34383A35302E303532313536'),(13,'backend','0001_initial',X'323031372D31312D32332031333A34383A35392E303935373234'),(14,'sessions','0001_initial',X'323031372D31312D32332031333A34393A30302E323230343236');

#
# Structure for table "django_session"
#

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "django_session"
#

INSERT INTO `django_session` VALUES ('79cqvdubs1es1kfvxyvw42897ifqbf2x','M2NkYzcxOTQyMDc5MGM4NmNkOTMzMmZiY2JlZGVhZmE5ZmIzN2MwNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4OTlmNGM3ODliODM4MTI5YzhmOTgzMGMxNmY4ZTgxMDhhNGJlZWUyIn0=',X'323031372D31322D30372031333A35373A32302E333933363932');
