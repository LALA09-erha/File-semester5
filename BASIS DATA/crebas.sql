/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     10/21/2022 10:59:58 PM                       */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_KOMEN_RELATIONS_KEDAI') then
    alter table KOMEN
       delete foreign key FK_KOMEN_RELATIONS_KEDAI
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_MENU_RELATIONS_KEDAI') then
    alter table MENU
       delete foreign key FK_MENU_RELATIONS_KEDAI
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_MENU_RELATIONS_KATEGORI') then
    alter table MENU
       delete foreign key FK_MENU_RELATIONS_KATEGORI
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_RATING_RELATIONS_KEDAI') then
    alter table RATING
       delete foreign key FK_RATING_RELATIONS_KEDAI
end if;

drop index if exists ADMIN.ADMIN_PK;

drop table if exists ADMIN;

drop index if exists KATEGORI_MENU.KATEGORI_MENU_PK;

drop table if exists KATEGORI_MENU;

drop index if exists KEDAI.KEDAI_PK;

drop table if exists KEDAI;

drop index if exists KOMEN.RELATIONSHIP_3_FK;

drop index if exists KOMEN.KOMEN_PK;

drop table if exists KOMEN;

drop index if exists MENU.RELATIONSHIP_2_FK;

drop index if exists MENU.RELATIONSHIP_1_FK;

drop index if exists MENU.MENU_PK;

drop table if exists MENU;

drop index if exists PESAN.PESAN_PK;

drop table if exists PESAN;

drop index if exists RATING.RELATIONSHIP_4_FK;

drop index if exists RATING.RATING_PK;

drop table if exists RATING;

/*==============================================================*/
/* Table: ADMIN                                                 */
/*==============================================================*/
create table ADMIN 
(
   ID_ADMIN             integer                        not null,
   USERNAME             char(100)                      null,
   PASSWORD             varchar(255)                   null,
   constraint PK_ADMIN primary key (ID_ADMIN)
);

/*==============================================================*/
/* Index: ADMIN_PK                                              */
/*==============================================================*/
create unique index ADMIN_PK on ADMIN (
ID_ADMIN ASC
);

/*==============================================================*/
/* Table: KATEGORI_MENU                                         */
/*==============================================================*/
create table KATEGORI_MENU 
(
   ID_KATEGORI          integer                        not null,
   NAMA_KATEGORI        char(100)                      null,
   constraint PK_KATEGORI_MENU primary key (ID_KATEGORI)
);

/*==============================================================*/
/* Index: KATEGORI_MENU_PK                                      */
/*==============================================================*/
create unique index KATEGORI_MENU_PK on KATEGORI_MENU (
ID_KATEGORI ASC
);

/*==============================================================*/
/* Table: KEDAI                                                 */
/*==============================================================*/
create table KEDAI 
(
   ID_KEDAI             integer                        not null,
   NAMA_KEDAI           char(255)                      null,
   DESKRIPSI            varchar(255)                   null,
   JAM_TUTUP            time                           null,
   JAM_BUKA             time                           null,
   STATUS               char(20)                       null,
   TELP                 char(50)                       null,
   FOTO_KEDAI           varchar(100)                   null,
   constraint PK_KEDAI primary key (ID_KEDAI)
);

/*==============================================================*/
/* Index: KEDAI_PK                                              */
/*==============================================================*/
create unique index KEDAI_PK on KEDAI (
ID_KEDAI ASC
);

/*==============================================================*/
/* Table: KOMEN                                                 */
/*==============================================================*/
create table KOMEN 
(
   ID_KOMEN             integer                        not null,
   ID_KEDAI             integer                        null,
   NAMA_KOMENTATOR      char(100)                      null,
   EMAIL_KOMENTATOR     char(100)                      null,
   constraint PK_KOMEN primary key (ID_KOMEN)
);

/*==============================================================*/
/* Index: KOMEN_PK                                              */
/*==============================================================*/
create unique index KOMEN_PK on KOMEN (
ID_KOMEN ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_3_FK on KOMEN (
ID_KEDAI ASC
);

/*==============================================================*/
/* Table: MENU                                                  */
/*==============================================================*/
create table MENU 
(
   ID_MENU              integer                        not null,
   ID_KEDAI             integer                        null,
   ID_KATEGORI          integer                        null,
   NAMA_MENU            char(255)                      null,
   HARGA                integer                        null,
   constraint PK_MENU primary key (ID_MENU)
);

/*==============================================================*/
/* Index: MENU_PK                                               */
/*==============================================================*/
create unique index MENU_PK on MENU (
ID_MENU ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_1_FK on MENU (
ID_KEDAI ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_2_FK on MENU (
ID_KATEGORI ASC
);

/*==============================================================*/
/* Table: PESAN                                                 */
/*==============================================================*/
create table PESAN 
(
   ID_PESAN             integer                        not null,
   NAMA_PESAN           char(100)                      null,
   EMAIL_PESAN          char(100)                      null,
   PESAN_KEINGINAN      varchar(255)                   null,
   constraint PK_PESAN primary key (ID_PESAN)
);

/*==============================================================*/
/* Index: PESAN_PK                                              */
/*==============================================================*/
create unique index PESAN_PK on PESAN (
ID_PESAN ASC
);

/*==============================================================*/
/* Table: RATING                                                */
/*==============================================================*/
create table RATING 
(
   ID_RATING            integer                        not null,
   ID_KEDAI             integer                        null,
   NAMA_PENGIRIM        char(100)                      null,
   NILAI_RATING         integer                        null,
   EMAIL_RATING         char(100)                      null,
   constraint PK_RATING primary key (ID_RATING)
);

/*==============================================================*/
/* Index: RATING_PK                                             */
/*==============================================================*/
create unique index RATING_PK on RATING (
ID_RATING ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_4_FK on RATING (
ID_KEDAI ASC
);

alter table KOMEN
   add constraint FK_KOMEN_RELATIONS_KEDAI foreign key (ID_KEDAI)
      references KEDAI (ID_KEDAI)
      on update restrict
      on delete restrict;

alter table MENU
   add constraint FK_MENU_RELATIONS_KEDAI foreign key (ID_KEDAI)
      references KEDAI (ID_KEDAI)
      on update restrict
      on delete restrict;

alter table MENU
   add constraint FK_MENU_RELATIONS_KATEGORI foreign key (ID_KATEGORI)
      references KATEGORI_MENU (ID_KATEGORI)
      on update restrict
      on delete restrict;

alter table RATING
   add constraint FK_RATING_RELATIONS_KEDAI foreign key (ID_KEDAI)
      references KEDAI (ID_KEDAI)
      on update restrict
      on delete restrict;

