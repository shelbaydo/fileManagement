/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 5.7.21-log : Database - filemanager
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `answer` */

CREATE TABLE `answer` (
  `answerId` int(11) NOT NULL AUTO_INCREMENT COMMENT '回答编号',
  `questionId` int(11) NOT NULL COMMENT '所回答的问题编号',
  `content` varchar(800) NOT NULL COMMENT '回答的内容',
  `answerTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '回答的时间',
  `answerManId` int(11) NOT NULL COMMENT '回答者编号',
  `isAskerBrowse` tinyint(1) DEFAULT '0',
  `isBestAnswer` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`answerId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `answer` */

insert  into `answer`(`answerId`,`questionId`,`content`,`answerTime`,`answerManId`,`isAskerBrowse`,`isBestAnswer`) values (1,9,'fd','2018-11-28 21:57:11',1,0,0);
insert  into `answer`(`answerId`,`questionId`,`content`,`answerTime`,`answerManId`,`isAskerBrowse`,`isBestAnswer`) values (2,9,'太热','2018-11-28 21:57:13',1,0,0);
insert  into `answer`(`answerId`,`questionId`,`content`,`answerTime`,`answerManId`,`isAskerBrowse`,`isBestAnswer`) values (3,9,'妈耶','2018-11-28 21:57:15',1,0,0);
insert  into `answer`(`answerId`,`questionId`,`content`,`answerTime`,`answerManId`,`isAskerBrowse`,`isBestAnswer`) values (4,9,'','2018-11-28 21:57:17',1,0,0);
insert  into `answer`(`answerId`,`questionId`,`content`,`answerTime`,`answerManId`,`isAskerBrowse`,`isBestAnswer`) values (5,9,'','2018-11-28 21:57:19',1,0,0);
insert  into `answer`(`answerId`,`questionId`,`content`,`answerTime`,`answerManId`,`isAskerBrowse`,`isBestAnswer`) values (6,9,'','2018-11-28 21:57:21',1,0,0);
insert  into `answer`(`answerId`,`questionId`,`content`,`answerTime`,`answerManId`,`isAskerBrowse`,`isBestAnswer`) values (7,9,'','2018-11-28 21:57:24',1,0,0);
insert  into `answer`(`answerId`,`questionId`,`content`,`answerTime`,`answerManId`,`isAskerBrowse`,`isBestAnswer`) values (8,9,'','2018-11-28 21:57:26',1,0,0);
insert  into `answer`(`answerId`,`questionId`,`content`,`answerTime`,`answerManId`,`isAskerBrowse`,`isBestAnswer`) values (9,9,'','2018-11-28 21:57:29',1,0,0);
insert  into `answer`(`answerId`,`questionId`,`content`,`answerTime`,`answerManId`,`isAskerBrowse`,`isBestAnswer`) values (10,9,'','2018-11-28 21:57:31',1,0,0);
insert  into `answer`(`answerId`,`questionId`,`content`,`answerTime`,`answerManId`,`isAskerBrowse`,`isBestAnswer`) values (11,9,'','2018-11-28 21:57:35',1,0,0);
insert  into `answer`(`answerId`,`questionId`,`content`,`answerTime`,`answerManId`,`isAskerBrowse`,`isBestAnswer`) values (12,9,'','2018-11-28 21:49:21',1,1,0);
insert  into `answer`(`answerId`,`questionId`,`content`,`answerTime`,`answerManId`,`isAskerBrowse`,`isBestAnswer`) values (13,9,'','2018-11-28 21:56:10',1,1,0);
insert  into `answer`(`answerId`,`questionId`,`content`,`answerTime`,`answerManId`,`isAskerBrowse`,`isBestAnswer`) values (14,9,'df','2018-11-28 20:53:15',1,0,0);
insert  into `answer`(`answerId`,`questionId`,`content`,`answerTime`,`answerManId`,`isAskerBrowse`,`isBestAnswer`) values (15,9,'dsfsada','2018-11-28 21:49:23',1,0,1);

/*Table structure for table `comment` */

CREATE TABLE `comment` (
  `commentTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '评论的时间',
  `content` varchar(800) NOT NULL COMMENT '评论的内容',
  `senderId` int(11) NOT NULL COMMENT '评论者编号',
  `noteId` int(11) NOT NULL COMMENT '笔记编号',
  `commentId` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论编号',
  PRIMARY KEY (`commentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `comment` */

/*Table structure for table `commentreply` */

CREATE TABLE `commentreply` (
  `commentReplyId` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论回复编号',
  `content` varchar(800) NOT NULL COMMENT '回复内容',
  `commentId` int(11) NOT NULL COMMENT '评论编号',
  `replyTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '回复时间',
  PRIMARY KEY (`commentReplyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `commentreply` */

/*Table structure for table `course` */

CREATE TABLE `course` (
  `courseId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `noteNum` int(11) DEFAULT '0' COMMENT '笔记数目',
  `ffolderNum` int(11) DEFAULT '0' COMMENT '收藏夹数目',
  `folderNum` int(11) DEFAULT '0' COMMENT '文件夹数目',
  `name` varchar(12) NOT NULL COMMENT '课程名',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`courseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `course` */

/*Table structure for table `event` */

CREATE TABLE `event` (
  `EventId` int(11) NOT NULL AUTO_INCREMENT COMMENT '事件编号',
  `userId` int(11) NOT NULL COMMENT '用户编号',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '事件创建时间',
  `endTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '事件结束时间',
  `isExpired` tinyint(1) DEFAULT '0' COMMENT '事件是否过期',
  `content` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`EventId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `event` */

insert  into `event`(`EventId`,`userId`,`createTime`,`endTime`,`isExpired`,`content`) values (1,1,'2018-11-16 15:11:06','2018-11-18 19:00:00',1,'fdas');
insert  into `event`(`EventId`,`userId`,`createTime`,`endTime`,`isExpired`,`content`) values (2,1,'2018-11-16 15:13:23','2018-11-10 13:00:00',0,'aaa');
insert  into `event`(`EventId`,`userId`,`createTime`,`endTime`,`isExpired`,`content`) values (3,1,'2018-11-17 16:58:31','2018-10-11 01:30:00',0,'tt');
insert  into `event`(`EventId`,`userId`,`createTime`,`endTime`,`isExpired`,`content`) values (4,1,'2018-11-24 19:19:22','2018-10-31 15:10:00',0,'nihao');

/*Table structure for table `favorite` */

CREATE TABLE `favorite` (
  `recommendId` int(11) NOT NULL,
  `ffolderId` int(11) NOT NULL,
  PRIMARY KEY (`recommendId`,`ffolderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `favorite` */

/*Table structure for table `ffolder` */

CREATE TABLE `ffolder` (
  `name` varchar(10) NOT NULL,
  `courseId` int(11) NOT NULL,
  `favoriteNum` int(11) DEFAULT '0',
  `ffolderId` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ffolderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ffolder` */

/*Table structure for table `file` */

CREATE TABLE `file` (
  `FileId` int(11) NOT NULL AUTO_INCREMENT,
  `fileName` varchar(20) NOT NULL,
  `isDownloadable` tinyint(1) DEFAULT '1',
  `uploadTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `folderId` int(11) NOT NULL,
  `size` float NOT NULL,
  `location` varchar(100) NOT NULL,
  `fileType` varchar(22) DEFAULT NULL,
  PRIMARY KEY (`FileId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `file` */

/*Table structure for table `folder` */

CREATE TABLE `folder` (
  `folderId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`folderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `folder` */

/*Table structure for table `follow` */

CREATE TABLE `follow` (
  `followerId` int(11) NOT NULL,
  `followeeId` int(11) NOT NULL,
  PRIMARY KEY (`followerId`,`followeeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `follow` */

/*Table structure for table `message` */

CREATE TABLE `message` (
  `messageId` int(11) NOT NULL AUTO_INCREMENT,
  `senderId` int(11) NOT NULL,
  `targetId` int(11) NOT NULL,
  `content` varchar(800) NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`messageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `message` */

/*Table structure for table `messagereply` */

CREATE TABLE `messagereply` (
  `MessageReplyId` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(800) NOT NULL,
  `messageId` int(11) NOT NULL,
  `replyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`MessageReplyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `messagereply` */

/*Table structure for table `myfile` */

CREATE TABLE `myfile` (
  `FileId` int(11) NOT NULL AUTO_INCREMENT,
  `fileName` varchar(800) NOT NULL,
  `isDownloadable` tinyint(1) DEFAULT '1',
  `uploadTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `folderId` int(11) NOT NULL,
  `size` float NOT NULL,
  `location` varchar(100) NOT NULL,
  `fileType` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`FileId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `myfile` */

insert  into `myfile`(`FileId`,`fileName`,`isDownloadable`,`uploadTime`,`folderId`,`size`,`location`,`fileType`) values (1,'322820_300.jpg',0,'2018-11-24 21:08:40',12,54832,'E:\\tomcat9\\apache-tomcat-9.0.12-windows-x64\\apache-tomcat-9.0.12\\webapps\\fileManagement\\upload\\12','jpg');
insert  into `myfile`(`FileId`,`fileName`,`isDownloadable`,`uploadTime`,`folderId`,`size`,`location`,`fileType`) values (2,'第7章_Java_Web常用开发模式.ppt',0,'2018-11-25 19:27:33',11,619520,'E:\\tomcat9\\apache-tomcat-9.0.12-windows-x64\\apache-tomcat-9.0.12\\webapps\\fileManagement\\upload\\11','ppt');
insert  into `myfile`(`FileId`,`fileName`,`isDownloadable`,`uploadTime`,`folderId`,`size`,`location`,`fileType`) values (3,'第6章_Servlet技术.ppt',0,'2018-11-25 19:28:49',13,511488,'E:\\tomcat9\\apache-tomcat-9.0.12-windows-x64\\apache-tomcat-9.0.12\\webapps\\fileManagement\\upload\\13','ppt');
insert  into `myfile`(`FileId`,`fileName`,`isDownloadable`,`uploadTime`,`folderId`,`size`,`location`,`fileType`) values (4,'第1章_Java_Web应用开发技术1.ppt',0,'2018-11-25 19:31:45',11,529920,'E:\\tomcat9\\apache-tomcat-9.0.12-windows-x64\\apache-tomcat-9.0.12\\webapps\\fileManagement\\upload\\11','ppt');

/*Table structure for table `note` */

CREATE TABLE `note` (
  `NoteId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(40) NOT NULL,
  `content` varchar(800) NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isPublic` tinyint(1) DEFAULT '1',
  `courseId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`NoteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `note` */

/*Table structure for table `notification` */

CREATE TABLE `notification` (
  `notificationId` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(800) NOT NULL,
  `title` varchar(200) NOT NULL,
  `targetId` int(11) NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`notificationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `notification` */

/*Table structure for table `question` */

CREATE TABLE `question` (
  `content` varchar(800) NOT NULL,
  `questionId` int(11) NOT NULL AUTO_INCREMENT,
  `askerId` int(11) NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tagContent` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `browseNum` int(11) DEFAULT '0',
  PRIMARY KEY (`questionId`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `question` */

insert  into `question`(`content`,`questionId`,`askerId`,`createTime`,`tagContent`,`title`,`browseNum`) values ('ew',9,1,'2018-11-19 16:21:03','ee','fd',107);
insert  into `question`(`content`,`questionId`,`askerId`,`createTime`,`tagContent`,`title`,`browseNum`) values ('fasdfa',10,1,'2018-11-19 16:32:09','ew&rr&tt&yy&uu','fas',4);
insert  into `question`(`content`,`questionId`,`askerId`,`createTime`,`tagContent`,`title`,`browseNum`) values ('fasfd',11,1,'2018-11-19 16:32:30','tr&tt&ii&oo&l','rer',7);
insert  into `question`(`content`,`questionId`,`askerId`,`createTime`,`tagContent`,`title`,`browseNum`) values ('fdag',12,1,'2018-11-19 16:33:11','tt&yy&mm&b&c','uu',3);
insert  into `question`(`content`,`questionId`,`askerId`,`createTime`,`tagContent`,`title`,`browseNum`) values ('暄昭什么意思',13,1,'2018-11-26 14:28:07','词语解释','暄昭什么意思',1);
insert  into `question`(`content`,`questionId`,`askerId`,`createTime`,`tagContent`,`title`,`browseNum`) values ('咿呀呀',14,1,'2018-11-26 14:36:58','','咿呀呀',0);
insert  into `question`(`content`,`questionId`,`askerId`,`createTime`,`tagContent`,`title`,`browseNum`) values ('中国',15,1,'2018-11-26 14:39:31','zzzz','中国',0);
insert  into `question`(`content`,`questionId`,`askerId`,`createTime`,`tagContent`,`title`,`browseNum`) values ('夏天',16,1,'2018-11-26 14:41:37','夏天','夏天',0);
insert  into `question`(`content`,`questionId`,`askerId`,`createTime`,`tagContent`,`title`,`browseNum`) values ('发多少',17,1,'2018-11-26 14:44:21','发沙','发生的',0);
insert  into `question`(`content`,`questionId`,`askerId`,`createTime`,`tagContent`,`title`,`browseNum`) values ('发的',18,1,'2018-11-26 14:44:46','发的','分大',2);
insert  into `question`(`content`,`questionId`,`askerId`,`createTime`,`tagContent`,`title`,`browseNum`) values ('你是谁',19,1,'2018-11-26 14:46:33','你是','你是谁',2);
insert  into `question`(`content`,`questionId`,`askerId`,`createTime`,`tagContent`,`title`,`browseNum`) values ('课程',20,1,'2018-11-26 14:48:17','课程','课程',2);
insert  into `question`(`content`,`questionId`,`askerId`,`createTime`,`tagContent`,`title`,`browseNum`) values ('诗诗',21,1,'2018-11-26 14:49:26','诗诗','诗诗',4);
insert  into `question`(`content`,`questionId`,`askerId`,`createTime`,`tagContent`,`title`,`browseNum`) values ('好6啊',22,1,'2018-11-26 14:55:53','666','好6啊啊',6);
insert  into `question`(`content`,`questionId`,`askerId`,`createTime`,`tagContent`,`title`,`browseNum`) values ('好困呀',23,1,'2018-11-26 14:59:29','困','好困呀，怎么办',2);
insert  into `question`(`content`,`questionId`,`askerId`,`createTime`,`tagContent`,`title`,`browseNum`) values ('妈咪你在哪里',24,1,'2018-11-26 15:02:21','找人','妈咪你在哪里',5);
insert  into `question`(`content`,`questionId`,`askerId`,`createTime`,`tagContent`,`title`,`browseNum`) values ('天气好热',25,1,'2018-11-29 08:02:23','天气','天气好热怎么办',4);

/*Table structure for table `questiontag` */

CREATE TABLE `questiontag` (
  `QuestionTagId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `QuestionId` int(11) NOT NULL,
  PRIMARY KEY (`QuestionTagId`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

/*Data for the table `questiontag` */

insert  into `questiontag`(`QuestionTagId`,`name`,`QuestionId`) values (20,'ee',9);
insert  into `questiontag`(`QuestionTagId`,`name`,`QuestionId`) values (21,'ew',10);
insert  into `questiontag`(`QuestionTagId`,`name`,`QuestionId`) values (22,'rr',10);
insert  into `questiontag`(`QuestionTagId`,`name`,`QuestionId`) values (23,'tt',10);
insert  into `questiontag`(`QuestionTagId`,`name`,`QuestionId`) values (24,'yy',10);
insert  into `questiontag`(`QuestionTagId`,`name`,`QuestionId`) values (25,'uu',10);
insert  into `questiontag`(`QuestionTagId`,`name`,`QuestionId`) values (26,'tr',11);
insert  into `questiontag`(`QuestionTagId`,`name`,`QuestionId`) values (27,'tt',11);
insert  into `questiontag`(`QuestionTagId`,`name`,`QuestionId`) values (28,'ii',11);
insert  into `questiontag`(`QuestionTagId`,`name`,`QuestionId`) values (29,'oo',11);
insert  into `questiontag`(`QuestionTagId`,`name`,`QuestionId`) values (30,'l',11);
insert  into `questiontag`(`QuestionTagId`,`name`,`QuestionId`) values (31,'tt',12);
insert  into `questiontag`(`QuestionTagId`,`name`,`QuestionId`) values (32,'yy',12);
insert  into `questiontag`(`QuestionTagId`,`name`,`QuestionId`) values (33,'mm',12);
insert  into `questiontag`(`QuestionTagId`,`name`,`QuestionId`) values (34,'b',12);
insert  into `questiontag`(`QuestionTagId`,`name`,`QuestionId`) values (35,'c',12);
insert  into `questiontag`(`QuestionTagId`,`name`,`QuestionId`) values (36,'词语解释',13);
insert  into `questiontag`(`QuestionTagId`,`name`,`QuestionId`) values (37,'',14);
insert  into `questiontag`(`QuestionTagId`,`name`,`QuestionId`) values (38,'zzzz',15);
insert  into `questiontag`(`QuestionTagId`,`name`,`QuestionId`) values (39,'夏天',16);
insert  into `questiontag`(`QuestionTagId`,`name`,`QuestionId`) values (40,'发沙',17);
insert  into `questiontag`(`QuestionTagId`,`name`,`QuestionId`) values (41,'发的',18);
insert  into `questiontag`(`QuestionTagId`,`name`,`QuestionId`) values (42,'你是',19);
insert  into `questiontag`(`QuestionTagId`,`name`,`QuestionId`) values (43,'课程',20);
insert  into `questiontag`(`QuestionTagId`,`name`,`QuestionId`) values (44,'诗诗',21);
insert  into `questiontag`(`QuestionTagId`,`name`,`QuestionId`) values (45,'666',22);
insert  into `questiontag`(`QuestionTagId`,`name`,`QuestionId`) values (46,'困',23);
insert  into `questiontag`(`QuestionTagId`,`name`,`QuestionId`) values (47,'找人',24);
insert  into `questiontag`(`QuestionTagId`,`name`,`QuestionId`) values (48,'天气',25);

/*Table structure for table `recommend` */

CREATE TABLE `recommend` (
  `address` varchar(800) DEFAULT NULL,
  `recommendId` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(800) NOT NULL,
  `title` varchar(400) NOT NULL,
  `digestFrom` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`recommendId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `recommend` */

/*Table structure for table `reference` */

CREATE TABLE `reference` (
  `questionId` int(11) NOT NULL,
  `questionTagId` int(11) NOT NULL,
  PRIMARY KEY (`questionId`,`questionTagId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `reference` */

/*Table structure for table `user` */

CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `phone` int(11) NOT NULL,
  `major` varchar(40) DEFAULT NULL,
  `school` varchar(40) DEFAULT NULL,
  `messageNum` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  `fanNum` int(11) DEFAULT NULL,
  `expIndex` int(11) DEFAULT '0' COMMENT '用户的经验值',
  `followNum` int(11) DEFAULT NULL,
  `CourseNum` int(11) DEFAULT '0',
  `semester` varchar(20) DEFAULT NULL,
  `signature` varchar(50) DEFAULT NULL,
  `ed` varchar(20) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
