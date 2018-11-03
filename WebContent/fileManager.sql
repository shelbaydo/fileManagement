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
  PRIMARY KEY (`answerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `answer` */

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
  PRIMARY KEY (`courseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `course` */

/*Table structure for table `event` */

CREATE TABLE `event` (
  `EventId` int(11) NOT NULL AUTO_INCREMENT COMMENT '事件编号',
  `userId` int(11) NOT NULL COMMENT '用户编号',
  `name` varchar(20) NOT NULL COMMENT '事件名',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '事件创建时间',
  `endTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '事件结束时间',
  `isExpired` tinyint(1) DEFAULT '0' COMMENT '事件是否过期',
  PRIMARY KEY (`EventId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `event` */

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
  PRIMARY KEY (`FileId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `file` */

/*Table structure for table `folder` */

CREATE TABLE `folder` (
  `folderId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `courseId` int(11) NOT NULL,
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

/*Table structure for table `note` */

CREATE TABLE `note` (
  `NoteId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(40) NOT NULL,
  `content` varchar(800) NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isPublic` tinyint(1) DEFAULT '1',
  `courseId` int(11) NOT NULL,
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
  `QuesttionId` int(11) NOT NULL AUTO_INCREMENT,
  `askerId` int(11) NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`QuesttionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `question` */

/*Table structure for table `questiontag` */

CREATE TABLE `questiontag` (
  `QuestionTagId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `refNum` int(11) NOT NULL DEFAULT '0' COMMENT '标签被引用的次数',
  `QuestionId` int(11) NOT NULL,
  PRIMARY KEY (`QuestionTagId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `questiontag` */

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
  `phone` varchar(11) NOT NULL,
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
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`userId`,`username`,`phone`,`major`,`school`,`messageNum`,`age`,`password`,`fanNum`,`expIndex`,`followNum`,`CourseNum`,`semester`,`signature`,`ed`) values (2,'shelbaydo','18322910597',NULL,NULL,NULL,NULL,'c6583107ss',NULL,0,NULL,0,NULL,NULL,NULL);
insert  into `user`(`userId`,`username`,`phone`,`major`,`school`,`messageNum`,`age`,`password`,`fanNum`,`expIndex`,`followNum`,`CourseNum`,`semester`,`signature`,`ed`) values (3,'12333','15362',NULL,NULL,NULL,NULL,'c6583107ss',NULL,0,NULL,0,NULL,NULL,NULL);
insert  into `user`(`userId`,`username`,`phone`,`major`,`school`,`messageNum`,`age`,`password`,`fanNum`,`expIndex`,`followNum`,`CourseNum`,`semester`,`signature`,`ed`) values (4,'99','13588889999',NULL,NULL,NULL,NULL,'999',NULL,0,NULL,0,NULL,NULL,NULL);
insert  into `user`(`userId`,`username`,`phone`,`major`,`school`,`messageNum`,`age`,`password`,`fanNum`,`expIndex`,`followNum`,`CourseNum`,`semester`,`signature`,`ed`) values (5,'88','13588889999',NULL,NULL,NULL,NULL,'88',NULL,0,NULL,0,NULL,NULL,NULL);
insert  into `user`(`userId`,`username`,`phone`,`major`,`school`,`messageNum`,`age`,`password`,`fanNum`,`expIndex`,`followNum`,`CourseNum`,`semester`,`signature`,`ed`) values (6,'334','55555',NULL,NULL,NULL,NULL,'444',NULL,0,NULL,0,NULL,NULL,NULL);
insert  into `user`(`userId`,`username`,`phone`,`major`,`school`,`messageNum`,`age`,`password`,`fanNum`,`expIndex`,`followNum`,`CourseNum`,`semester`,`signature`,`ed`) values (7,'5567','0987',NULL,NULL,NULL,NULL,'67889',NULL,0,NULL,0,NULL,NULL,NULL);
insert  into `user`(`userId`,`username`,`phone`,`major`,`school`,`messageNum`,`age`,`password`,`fanNum`,`expIndex`,`followNum`,`CourseNum`,`semester`,`signature`,`ed`) values (8,'66666','98',NULL,NULL,NULL,NULL,'63',NULL,0,NULL,0,NULL,NULL,NULL);
insert  into `user`(`userId`,`username`,`phone`,`major`,`school`,`messageNum`,`age`,`password`,`fanNum`,`expIndex`,`followNum`,`CourseNum`,`semester`,`signature`,`ed`) values (9,'78','9',NULL,NULL,NULL,NULL,'00',NULL,0,NULL,0,NULL,NULL,NULL);
insert  into `user`(`userId`,`username`,`phone`,`major`,`school`,`messageNum`,`age`,`password`,`fanNum`,`expIndex`,`followNum`,`CourseNum`,`semester`,`signature`,`ed`) values (10,'00','7',NULL,NULL,NULL,NULL,'00',NULL,0,NULL,0,NULL,NULL,NULL);
insert  into `user`(`userId`,`username`,`phone`,`major`,`school`,`messageNum`,`age`,`password`,`fanNum`,`expIndex`,`followNum`,`CourseNum`,`semester`,`signature`,`ed`) values (11,'334','33',NULL,NULL,NULL,NULL,'33',NULL,0,NULL,0,NULL,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
