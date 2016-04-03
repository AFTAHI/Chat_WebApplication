-- MySQL : 5.6.17
-- PHP : 5.5.12 
-- PHPMyAdmin : 4.1.14


create database chatapp ;
use chatapp;
-- table conversation
CREATE TABLE IF NOT EXISTS `conversation`(
   `idconversation`       int not null AUTO_INCREMENT,
   `iduser`               int not null,
   `use_iduser`           int not null,
   `convname`             varchar(25),
   `convdate`             date not null,
   primary key (`idconversation`)
);

-- table is_friend
CREATE TABLE IF NOT EXISTS `is_friend`(
   `use_iduser`           int not null,
   `iduser`               int not null,
   `friendshipdate`       date not null,
   `friendshipstat`       varchar(255) not null,
   primary key (`use_iduser`, `iduser`)
);

-- table message

CREATE TABLE IF NOT EXISTS `message`
(
   `idmessage`            int not null AUTO_INCREMENT,
   `iduser`               int not null,
   `idconversation`       int not null,
   `msgcontent`           varchar(255) not null,
   `msgdate`              date not null,
   `msgstatus`            varchar(255),
   primary key (`idmessage`)
);

-- table user

CREATE TABLE IF NOT EXISTS `user`
(
   `iduser`               int not null AUTO_INCREMENT,
   `username`             varchar(25) not null UNIQUE,
   `password`             varchar(255) not null,
   `email`                varchar(255) not null UNIQUE,
   `phonenumber`          varchar(12) UNIQUE,
   `photo`                varchar(255),
   primary key (`iduser`)
);

alter table conversation add constraint fk_convuser1 foreign key (use_iduser)
      references user (iduser) on delete restrict on update restrict;

alter table conversation add constraint fk_convuser2 foreign key (iduser)
      references user (iduser) on delete restrict on update restrict;

alter table is_friend add constraint fk_is_friend foreign key (use_iduser)
      references user (iduser) on delete restrict on update restrict;

alter table is_friend add constraint fk_is_friend2 foreign key (iduser)
      references user (iduser) on delete restrict on update restrict;

alter table message add constraint fk_messageconv foreign key (idconversation)
      references conversation (idconversation) on delete restrict on update restrict;

alter table message add constraint fk_relation_6 foreign key (iduser)
      references user (iduser) on delete restrict on update restrict;
