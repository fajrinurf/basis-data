/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     15/01/2021 22:56:30                          */
/*==============================================================*/


drop table if exists M_CATEGORY;

drop table if exists M_CUSTOMER;

drop table if exists M_LOKASI;

drop table if exists M_PRODUCT;

drop table if exists M_PROFILE;

drop table if exists M_ROLE;

drop table if exists M_SUPPLIER;

drop table if exists M_TRANSACTION;

drop table if exists M_TRANSACTIONS_DETAILS;

drop table if exists M_USER;

/*==============================================================*/
/* Table: M_CATEGORY                                            */
/*==============================================================*/
create table M_CATEGORY
(
   ID_CATEGORY          int not null,
   NAMA_CATEGORY        varchar(100),
   primary key (ID_CATEGORY)
);

/*==============================================================*/
/* Table: M_CUSTOMER                                            */
/*==============================================================*/
create table M_CUSTOMER
(
   ID_TRANS             int,
   ID_CUSTOMER          int,
   FIRST_NAME           varchar(100),
   LAST_NAME            varchar(100),
   PHONE_NUMBER         varchar(15)
);

/*==============================================================*/
/* Table: M_LOKASI                                              */
/*==============================================================*/
create table M_LOKASI
(
   ID_LOKASI            bigint not null,
   NAMALOKASI           varchar(100),
   primary key (ID_LOKASI)
);

/*==============================================================*/
/* Table: M_PRODUCT                                             */
/*==============================================================*/
create table M_PRODUCT
(
   ID_PRODUCT           int not null,
   ID_SUPPLIER          int,
   ID_CATEGORY          int,
   CODE_PRODUCT         varchar(20),
   NAMA                 varchar(100),
   DESKRIPSI            varchar(250),
   STOCK                int(250),
   TERJUAL              int(250),
   HARGA                int(250),
   TANGGAL_STOCK_MASUK  varchar(50),
   primary key (ID_PRODUCT)
);

/*==============================================================*/
/* Table: M_PROFILE                                             */
/*==============================================================*/
create table M_PROFILE
(
   ID_PROFILE           bigint not null,
   NAMA_DEPAN           varchar(50),
   NAMA_BELAKANG        varchar(50),
   GENDER               varchar(50),
   EMAIL                varchar(100),
   NOMORHP              int(15) not null,
   ID_LOKASI            bigint,
   HIRED_DATE           varchar(50),
   POTO                 varchar(255),
   primary key (ID_PROFILE)
);

/*==============================================================*/
/* Table: M_ROLE                                                */
/*==============================================================*/
create table M_ROLE
(
   ID_ROLE              bigint not null,
   ROLE                 varchar(50),
   primary key (ID_ROLE)
);

/*==============================================================*/
/* Table: M_SUPPLIER                                            */
/*==============================================================*/
create table M_SUPPLIER
(
   ID_SUPPLIER          int not null,
   ID_LOKASI            bigint,
   NAMA_PERUSAHAAN      varchar(100),
   NOMORHP              varchar(15),
   primary key (ID_SUPPLIER)
);

/*==============================================================*/
/* Table: M_TRANSACTION                                         */
/*==============================================================*/
create table M_TRANSACTION
(
   ID_TRANS             int not null,
   ID                   int,
   NUMOFITEMS           varchar(250),
   SUBTOTAL             varchar(250),
   LESSVAT              varchar(250),
   NETVAT               varchar(250),
   ADDVAT               varchar(250),
   CASH                 varchar(250),
   DATE                 date,
   primary key (ID_TRANS)
);

/*==============================================================*/
/* Table: M_TRANSACTIONS_DETAILS                                */
/*==============================================================*/
create table M_TRANSACTIONS_DETAILS
(
   ID                   int not null,
   PRODUCT              varchar(0),
   QTY                  varchar(0),
   PRICE                varchar(0),
   primary key (ID)
);

/*==============================================================*/
/* Table: M_USER                                                */
/*==============================================================*/
create table M_USER
(
   ID_USER              bigint not null,
   ID_PROFILE           bigint,
   ID_ROLE              bigint,
   NAMA                 varchar(100),
   USERNAME             varchar(50),
   PASSWORD             varchar(50),
   primary key (ID_USER)
);

alter table M_CUSTOMER add constraint FK_REFERENCE_5 foreign key (ID_TRANS)
      references M_TRANSACTION (ID_TRANS) on delete restrict on update restrict;

alter table M_PRODUCT add constraint FK_REFERENCE_2 foreign key (ID_SUPPLIER)
      references M_SUPPLIER (ID_SUPPLIER) on delete restrict on update restrict;

alter table M_PRODUCT add constraint FK_REFERENCE_3 foreign key (ID_CATEGORY)
      references M_CATEGORY (ID_CATEGORY) on delete restrict on update restrict;

alter table M_PROFILE add constraint FK_REFERENCE_1 foreign key (ID_LOKASI)
      references M_LOKASI (ID_LOKASI) on delete restrict on update restrict;

alter table M_SUPPLIER add constraint FK_REFERENCE_6 foreign key (ID_LOKASI)
      references M_LOKASI (ID_LOKASI) on delete restrict on update restrict;

alter table M_TRANSACTION add constraint FK_REFERENCE_4 foreign key (ID)
      references M_TRANSACTIONS_DETAILS (ID) on delete restrict on update restrict;

alter table M_USER add constraint FK_REFERENCE_7 foreign key (ID_PROFILE)
      references M_PROFILE (ID_PROFILE) on delete restrict on update restrict;

alter table M_USER add constraint FK_REFERENCE_8 foreign key (ID_ROLE)
      references M_ROLE (ID_ROLE) on delete restrict on update restrict;

