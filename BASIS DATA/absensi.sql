/*==============================================================*/
/* Table: ABSEN                                                 */
/*==============================================================*/
create table ABSEN 
(
   IDABSEN              integer                        not null,
   IDUSER               integer                        null,
   IDSISWA              char(50)                       null,
   IDPELAJARAN          integer                        null,
   TANGGAL              timestamp                      null,
   constraint PK_ABSEN primary key (IDABSEN)
);

/*==============================================================*/
/* Index: ABSEN_PK                                              */
/*==============================================================*/
create unique index ABSEN_PK on ABSEN (
IDABSEN ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_1_FK on ABSEN (
IDUSER ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_2_FK on ABSEN (
IDPELAJARAN ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_3_FK on ABSEN (
IDSISWA ASC
);

/*==============================================================*/
/* Table: PELAJARAN                                             */
/*==============================================================*/
create table PELAJARAN 
(
   IDPELAJARAN          integer                        not null,
   IDUSER               integer                        null,
   NAMAPELAJARAN        varchar(255)                   null,
   constraint PK_PELAJARAN primary key (IDPELAJARAN)
);

/*==============================================================*/
/* Index: PELAJARAN_PK                                          */
/*==============================================================*/
create unique index PELAJARAN_PK on PELAJARAN (
IDPELAJARAN ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_4_FK on PELAJARAN (
IDUSER ASC
);

/*==============================================================*/
/* Table: SISWA                                                 */
/*==============================================================*/
create table SISWA 
(
   IDSISWA              char(50)                       not null,
   IDUSER               integer                        null,
   NAMASISWA            varchar(255)                   null,
   constraint PK_SISWA primary key (IDSISWA)
);

/*==============================================================*/
/* Index: SISWA_PK                                              */
/*==============================================================*/
create unique index SISWA_PK on SISWA (
IDSISWA ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_5_FK on SISWA (
IDUSER ASC
);

/*==============================================================*/
/* Table: "USER"                                                */
/*==============================================================*/
create table USER
(
   IDUSER               integer                        not null,
   ROLE                 char(20)                       null,
   USERNAME             char(20)                       null,
   EMAIL                char(20)                       null,
   PASSWORD             varchar(255)                   null,
   constraint PK_USER primary key (IDUSER)
);

/*==============================================================*/
/* Index: USER_PK                                               */
/*==============================================================*/
create unique index USER_PK on USER (
IDUSER ASC
);

alter table ABSEN
   add constraint FK_ABSEN_RELATIONS_USER foreign key (IDUSER)
      references USER (IDUSER)
      on update restrict
      on delete restrict;

alter table ABSEN
   add constraint FK_ABSEN_RELATIONS_PELAJARA foreign key (IDPELAJARAN)
      references PELAJARAN (IDPELAJARAN)
      on update restrict
      on delete restrict;

alter table ABSEN
   add constraint FK_ABSEN_RELATIONS_SISWA foreign key (IDSISWA)
      references SISWA (IDSISWA)
      on update restrict
      on delete restrict;

alter table PELAJARAN
   add constraint FK_PELAJARA_RELATIONS_USER foreign key (IDUSER)
      references USER (IDUSER)
      on update restrict
      on delete restrict;

alter table SISWA
   add constraint FK_SISWA_RELATIONS_USER foreign key (IDUSER)
      references USER (IDUSER)
      on update restrict
      on delete restrict;

