/*==============================================================*/
/* ibouig ## ibouig@gmail.com                                   */
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  4/2/2016 11:29:47 PM                     */
/*==============================================================*/
drop database if exists chatapp;
create database chatapp ;
use chatapp;

drop table if exists conversation;

drop table if exists is_friend;

drop table if exists message;

drop table if exists user;

/*==============================================================*/
/* Table : conversation                                         */
/*==============================================================*/
create table conversation
(
   idconversation       decimal not null,
   iduser               decimal not null,
   use_iduser           decimal not null,
   convname             text,
   convdate             date not null,
   primary key (idconversation)
);

/*==============================================================*/
/* Table : is_friend                                            */
/*==============================================================*/
create table is_friend
(
   use_iduser           decimal not null,
   iduser               decimal not null,
   friendshipdate       date not null,
   friendshipstat       text not null,
   primary key (use_iduser, iduser)
);

/*==============================================================*/
/* Table : message                                              */
/*==============================================================*/
create table message
(
   idmessage            decimal not null,
   iduser               decimal not null,
   idconversation       decimal not null,
   msgcontent           text not null,
   msgdate              date not null,
   msgstatus            text,
   primary key (idmessage)
);

/*==============================================================*/
/* Table : user                                                 */
/*==============================================================*/
create table user
(
   iduser               decimal not null,
   username             text not null,
   password             text not null,
   email                text not null,
   phonenumber          text not null,
   photo                text not null,
   primary key (iduser)
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

