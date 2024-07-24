prompt PL/SQL Developer Export Tables for user EFROTH@LABDBWIN
prompt Created by efroth on éåí çîéùé 25 éåìé 2024
set feedback off
set define off

prompt Dropping PARTICIPANTS...
drop table PARTICIPANTS cascade constraints;
prompt Dropping COURSES...
drop table COURSES cascade constraints;
prompt Dropping LECTURERS...
drop table LECTURERS cascade constraints;
prompt Dropping LOCATION...
drop table LOCATION cascade constraints;
prompt Dropping ROOM...
drop table ROOM cascade constraints;
prompt Dropping STUDENTSGROUP...
drop table STUDENTSGROUP cascade constraints;
prompt Dropping BELONGS...
drop table BELONGS cascade constraints;
prompt Dropping CATEGORY...
drop table CATEGORY cascade constraints;
prompt Dropping DONOR...
drop table DONOR cascade constraints;
prompt Dropping ITEM...
drop table ITEM cascade constraints;
prompt Dropping DONATION...
drop table DONATION cascade constraints;
prompt Dropping DONOR_COURSES...
drop table DONOR_COURSES cascade constraints;
prompt Dropping EQUIPMENT...
drop table EQUIPMENT cascade constraints;
prompt Dropping MAINTENANCE...
drop table MAINTENANCE cascade constraints;
prompt Dropping OPERATOR...
drop table OPERATOR cascade constraints;
prompt Dropping OPERATION...
drop table OPERATION cascade constraints;
prompt Dropping OPERATORCOURSE...
drop table OPERATORCOURSE cascade constraints;
prompt Dropping TEACHES_THE...
drop table TEACHES_THE cascade constraints;
prompt Dropping USES...
drop table USES cascade constraints;
prompt Creating PARTICIPANTS...
create table PARTICIPANTS
(
  p_name VARCHAR2(30) not null,
  p_date DATE not null,
  p_id   NUMBER(10) not null,
  p_role VARCHAR2(30) not null,
  gender VARCHAR2(30) not null,
  age    NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PARTICIPANTS
  add primary key (P_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PARTICIPANTS
  add constraint CHK_P_ROLE_VALUES
  check (p_role IN ('Certified Nurse','First Responder','EMT','Paramedic'));

prompt Creating COURSES...
create table COURSES
(
  c_name     VARCHAR2(30) not null,
  c_id       NUMBER(10) not null,
  categories VARCHAR2(30) not null,
  presence   VARCHAR2(30) not null,
  pre_course VARCHAR2(30) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table COURSES
  add primary key (C_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating LECTURERS...
create table LECTURERS
(
  l_id      NUMBER(10) not null,
  l_name    VARCHAR2(30) not null,
  l_date    DATE not null,
  seniority VARCHAR2(30) not null,
  training  VARCHAR2(30) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table LECTURERS
  add primary key (L_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table LECTURERS
  add constraint CHK_L_DATE_BEFORE_2025
  check (l_date < TO_DATE('2025-01-01','YYYY-MM-DD'));

prompt Creating LOCATION...
create table LOCATION
(
  phonenumber  NUMBER(10) not null,
  address      VARCHAR2(100) not null,
  instructions VARCHAR2(100) not null,
  capacity     INTEGER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table LOCATION
  add primary key (PHONENUMBER)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating ROOM...
create table ROOM
(
  r_id        NUMBER(10) not null,
  numplace    NUMBER(5) not null,
  r_type      VARCHAR2(30) not null,
  phonenumber NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROOM
  add primary key (R_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROOM
  add constraint FK_ROOM_LOCATION foreign key (PHONENUMBER)
  references LOCATION (PHONENUMBER);

prompt Creating STUDENTSGROUP...
create table STUDENTSGROUP
(
  g_id   NUMBER(10) not null,
  max_p  NUMBER(15) not null,
  g_hour NUMBER(5) not null,
  g_day  NUMBER(5) not null,
  r_id   NUMBER(10) not null,
  c_id   NUMBER(10) not null,
  l_id   NUMBER(10) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table STUDENTSGROUP
  add primary key (G_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table STUDENTSGROUP
  add foreign key (R_ID)
  references ROOM (R_ID);
alter table STUDENTSGROUP
  add foreign key (C_ID)
  references COURSES (C_ID);
alter table STUDENTSGROUP
  add foreign key (L_ID)
  references LECTURERS (L_ID);

prompt Creating BELONGS...
create table BELONGS
(
  g_id NUMBER(10) not null,
  p_id NUMBER(10) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table BELONGS
  add primary key (G_ID, P_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table BELONGS
  add foreign key (G_ID)
  references STUDENTSGROUP (G_ID);
alter table BELONGS
  add foreign key (P_ID)
  references PARTICIPANTS (P_ID);

prompt Creating CATEGORY...
create table CATEGORY
(
  categoryid     NUMBER(10) not null,
  name           VARCHAR2(100) not null,
  emergencylevel NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CATEGORY
  add primary key (CATEGORYID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating DONOR...
create table DONOR
(
  donorid     NUMBER(10) not null,
  name        VARCHAR2(100) not null,
  isactive    CHAR(1) not null,
  designation VARCHAR2(100) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DONOR
  add primary key (DONORID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating ITEM...
create table ITEM
(
  itemid      NUMBER not null,
  name        VARCHAR2(100) not null,
  description VARCHAR2(100) not null,
  quantity    NUMBER not null,
  status      NUMBER not null,
  categoryid  NUMBER not null,
  phonenumber NUMBER(10) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ITEM
  add primary key (ITEMID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ITEM
  add foreign key (PHONENUMBER)
  references LOCATION (PHONENUMBER);
alter table ITEM
  add constraint CK_ITEM_QUANTITY
  check (Quantity >= 0);

prompt Creating DONATION...
create table DONATION
(
  donationid   NUMBER not null,
  donationdate DATE not null,
  itemid       NUMBER not null,
  donorid      NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DONATION
  add primary key (DONATIONID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DONATION
  add foreign key (ITEMID)
  references ITEM (ITEMID);
alter table DONATION
  add foreign key (DONORID)
  references DONOR (DONORID);

prompt Creating DONOR_COURSES...
create table DONOR_COURSES
(
  donation_id NUMBER not null,
  donorid     NUMBER,
  courseid    NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DONOR_COURSES
  add primary key (DONATION_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DONOR_COURSES
  add constraint FK_COURSE foreign key (COURSEID)
  references COURSES (C_ID);
alter table DONOR_COURSES
  add constraint FK_DONOR foreign key (DONORID)
  references DONOR (DONORID);

prompt Creating EQUIPMENT...
create table EQUIPMENT
(
  e_date  DATE not null,
  e_id    NUMBER(10) not null,
  amount  NUMBER(5) not null,
  item_id NUMBER(20) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EQUIPMENT
  add constraint EQUIPMENT_PK primary key (ITEM_ID, E_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EQUIPMENT
  add constraint FK_EQUIPMENT_ITEM foreign key (ITEM_ID)
  references ITEM (ITEMID);

prompt Creating MAINTENANCE...
create table MAINTENANCE
(
  maintenanceid   NUMBER not null,
  maintenancedate DATE not null,
  description     VARCHAR2(100) not null,
  itemid          NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MAINTENANCE
  add primary key (MAINTENANCEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MAINTENANCE
  add foreign key (ITEMID)
  references ITEM (ITEMID);

prompt Creating OPERATOR...
create table OPERATOR
(
  operatorid     NUMBER(10) not null,
  name           VARCHAR2(100) not null,
  expirationdate DATE not null,
  adress         VARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table OPERATOR
  add primary key (OPERATORID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating OPERATION...
create table OPERATION
(
  itemid     NUMBER not null,
  operatorid NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table OPERATION
  add primary key (ITEMID, OPERATORID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table OPERATION
  add foreign key (ITEMID)
  references ITEM (ITEMID);
alter table OPERATION
  add foreign key (OPERATORID)
  references OPERATOR (OPERATORID);

prompt Creating OPERATORCOURSE...
create table OPERATORCOURSE
(
  operatorid NUMBER not null,
  g_id       NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table OPERATORCOURSE
  add primary key (OPERATORID, G_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table OPERATORCOURSE
  add foreign key (OPERATORID)
  references OPERATOR (OPERATORID);
alter table OPERATORCOURSE
  add foreign key (G_ID)
  references STUDENTSGROUP (G_ID);

prompt Creating TEACHES_THE...
create table TEACHES_THE
(
  l_id NUMBER(10) not null,
  c_id NUMBER(10) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TEACHES_THE
  add primary key (L_ID, C_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TEACHES_THE
  add foreign key (L_ID)
  references LECTURERS (L_ID);
alter table TEACHES_THE
  add foreign key (C_ID)
  references COURSES (C_ID);

prompt Creating USES...
create table USES
(
  c_id NUMBER(10) not null,
  e_id NUMBER(10) not null,
  i_id NUMBER(10)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table USES
  add foreign key (C_ID)
  references COURSES (C_ID);
alter table USES
  add foreign key (E_ID, I_ID)
  references EQUIPMENT (ITEM_ID, E_ID);

prompt Disabling triggers for PARTICIPANTS...
alter table PARTICIPANTS disable all triggers;
prompt Disabling triggers for COURSES...
alter table COURSES disable all triggers;
prompt Disabling triggers for LECTURERS...
alter table LECTURERS disable all triggers;
prompt Disabling triggers for LOCATION...
alter table LOCATION disable all triggers;
prompt Disabling triggers for ROOM...
alter table ROOM disable all triggers;
prompt Disabling triggers for STUDENTSGROUP...
alter table STUDENTSGROUP disable all triggers;
prompt Disabling triggers for BELONGS...
alter table BELONGS disable all triggers;
prompt Disabling triggers for CATEGORY...
alter table CATEGORY disable all triggers;
prompt Disabling triggers for DONOR...
alter table DONOR disable all triggers;
prompt Disabling triggers for ITEM...
alter table ITEM disable all triggers;
prompt Disabling triggers for DONATION...
alter table DONATION disable all triggers;
prompt Disabling triggers for DONOR_COURSES...
alter table DONOR_COURSES disable all triggers;
prompt Disabling triggers for EQUIPMENT...
alter table EQUIPMENT disable all triggers;
prompt Disabling triggers for MAINTENANCE...
alter table MAINTENANCE disable all triggers;
prompt Disabling triggers for OPERATOR...
alter table OPERATOR disable all triggers;
prompt Disabling triggers for OPERATION...
alter table OPERATION disable all triggers;
prompt Disabling triggers for OPERATORCOURSE...
alter table OPERATORCOURSE disable all triggers;
prompt Disabling triggers for TEACHES_THE...
alter table TEACHES_THE disable all triggers;
prompt Disabling triggers for USES...
alter table USES disable all triggers;
prompt Disabling foreign key constraints for ROOM...
alter table ROOM disable constraint FK_ROOM_LOCATION;
prompt Disabling foreign key constraints for STUDENTSGROUP...
alter table STUDENTSGROUP disable constraint SYS_C00725889;
alter table STUDENTSGROUP disable constraint SYS_C00725890;
alter table STUDENTSGROUP disable constraint SYS_C00725891;
prompt Disabling foreign key constraints for BELONGS...
alter table BELONGS disable constraint SYS_C00725895;
alter table BELONGS disable constraint SYS_C00725896;
prompt Disabling foreign key constraints for ITEM...
alter table ITEM disable constraint SYS_C00717208;
prompt Disabling foreign key constraints for DONATION...
alter table DONATION disable constraint SYS_C00717214;
alter table DONATION disable constraint SYS_C00717215;
prompt Disabling foreign key constraints for DONOR_COURSES...
alter table DONOR_COURSES disable constraint FK_COURSE;
alter table DONOR_COURSES disable constraint FK_DONOR;
prompt Disabling foreign key constraints for EQUIPMENT...
alter table EQUIPMENT disable constraint FK_EQUIPMENT_ITEM;
prompt Disabling foreign key constraints for MAINTENANCE...
alter table MAINTENANCE disable constraint SYS_C00717221;
prompt Disabling foreign key constraints for OPERATION...
alter table OPERATION disable constraint SYS_C00717229;
alter table OPERATION disable constraint SYS_C00717230;
prompt Disabling foreign key constraints for OPERATORCOURSE...
alter table OPERATORCOURSE disable constraint SYS_C00725956;
alter table OPERATORCOURSE disable constraint SYS_C00725957;
prompt Disabling foreign key constraints for TEACHES_THE...
alter table TEACHES_THE disable constraint SYS_C00725906;
alter table TEACHES_THE disable constraint SYS_C00725907;
prompt Disabling foreign key constraints for USES...
alter table USES disable constraint SYS_C00725911;
alter table USES disable constraint SYS_C00725962;
prompt Loading PARTICIPANTS...
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Davy McGovern', to_date('04-05-1999', 'dd-mm-yyyy'), 641, 'Certified Nurse', 'male', 25);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kenny Heche', to_date('19-01-1984', 'dd-mm-yyyy'), 642, 'First Responder', 'male', 40);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Colm Michaels', to_date('13-06-1997', 'dd-mm-yyyy'), 643, 'Paramedic', 'female', 27);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Caroline Irving', to_date('24-08-1988', 'dd-mm-yyyy'), 644, 'EMT', 'male', 36);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Murray Hawke', to_date('22-02-1974', 'dd-mm-yyyy'), 645, 'First Responder', 'male', 50);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Juan Mandrell', to_date('17-07-1992', 'dd-mm-yyyy'), 646, 'EMT', 'female', 32);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Josh Tillis', to_date('21-10-1981', 'dd-mm-yyyy'), 647, 'Paramedic', 'male', 43);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Jamie Jessee', to_date('25-09-1977', 'dd-mm-yyyy'), 648, 'Paramedic', 'female', 47);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Carole Bugnon', to_date('29-12-1979', 'dd-mm-yyyy'), 649, 'EMT', 'female', 45);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Tal Alexander', to_date('12-06-1996', 'dd-mm-yyyy'), 650, 'Certified Nurse', 'male', 28);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Annie Diggs', to_date('03-12-1998', 'dd-mm-yyyy'), 651, 'EMT', 'male', 26);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Wally Waite', to_date('03-02-1982', 'dd-mm-yyyy'), 652, 'Paramedic', 'female', 42);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Sissy Levert', to_date('05-07-1996', 'dd-mm-yyyy'), 653, 'First Responder', 'male', 28);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Sara Macy', to_date('13-10-1995', 'dd-mm-yyyy'), 654, 'Paramedic', 'male', 29);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Boz Tilly', to_date('15-08-1980', 'dd-mm-yyyy'), 655, 'Certified Nurse', 'female', 44);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Swoosie Tippe', to_date('11-05-1974', 'dd-mm-yyyy'), 656, 'Paramedic', 'male', 50);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Ted Aykroyd', to_date('29-07-1973', 'dd-mm-yyyy'), 657, 'Certified Nurse', 'female', 51);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Lucinda Conway', to_date('07-04-1995', 'dd-mm-yyyy'), 658, 'Paramedic', 'male', 29);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Jared Rickman', to_date('25-04-1990', 'dd-mm-yyyy'), 659, 'EMT', 'male', 34);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kurtwood Sainte-Marie', to_date('19-10-1970', 'dd-mm-yyyy'), 660, 'Certified Nurse', 'female', 54);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kenny Goldblum', to_date('27-01-1994', 'dd-mm-yyyy'), 661, 'Paramedic', 'male', 30);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Boyd Sutherland', to_date('14-03-1976', 'dd-mm-yyyy'), 662, 'Certified Nurse', 'male', 48);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Victoria Mann', to_date('16-06-1978', 'dd-mm-yyyy'), 663, 'First Responder', 'female', 46);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('France Gallagher', to_date('10-10-1984', 'dd-mm-yyyy'), 664, 'First Responder', 'male', 40);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Heath Kingsley', to_date('02-12-1981', 'dd-mm-yyyy'), 665, 'EMT', 'male', 43);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Miles Woodard', to_date('13-04-1975', 'dd-mm-yyyy'), 666, 'EMT', 'male', 49);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Lynn Fender', to_date('29-11-1983', 'dd-mm-yyyy'), 667, 'Paramedic', 'female', 41);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Liam Kelly', to_date('12-05-1974', 'dd-mm-yyyy'), 668, 'Certified Nurse', 'male', 50);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Javon Dunaway', to_date('15-01-1971', 'dd-mm-yyyy'), 669, 'Certified Nurse', 'male', 53);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Candice Carmen', to_date('11-09-1986', 'dd-mm-yyyy'), 670, 'EMT', 'female', 38);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Tamala McFadden', to_date('09-10-1970', 'dd-mm-yyyy'), 671, 'Certified Nurse', 'male', 54);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kiefer Roberts', to_date('15-04-1999', 'dd-mm-yyyy'), 672, 'EMT', 'female', 25);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Sam Wagner', to_date('31-08-1978', 'dd-mm-yyyy'), 673, 'Paramedic', 'female', 46);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Burton Condition', to_date('19-06-1981', 'dd-mm-yyyy'), 674, 'Paramedic', 'male', 43);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Dar Brown', to_date('11-09-1997', 'dd-mm-yyyy'), 675, 'EMT', 'male', 27);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Lenny Miller', to_date('15-11-1999', 'dd-mm-yyyy'), 676, 'Paramedic', 'male', 25);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Adina El-Saher', to_date('11-09-1973', 'dd-mm-yyyy'), 677, 'Paramedic', 'male', 51);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Martin Rodriguez', to_date('19-05-1985', 'dd-mm-yyyy'), 678, 'First Responder', 'male', 39);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Vickie Crystal', to_date('29-03-1984', 'dd-mm-yyyy'), 679, 'Certified Nurse', 'female', 40);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Jodie Berkoff', to_date('08-02-1998', 'dd-mm-yyyy'), 680, 'Certified Nurse', 'male', 26);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Garth Dunn', to_date('26-05-1988', 'dd-mm-yyyy'), 681, 'Paramedic', 'male', 36);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Neneh Gallant', to_date('28-06-1984', 'dd-mm-yyyy'), 682, 'Paramedic', 'male', 40);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Joanna Mathis', to_date('02-04-1996', 'dd-mm-yyyy'), 683, 'Certified Nurse', 'male', 28);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Harrison Gano', to_date('02-07-1998', 'dd-mm-yyyy'), 684, 'Paramedic', 'female', 26);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Ernie Mandrell', to_date('05-04-1979', 'dd-mm-yyyy'), 685, 'First Responder', 'female', 45);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Tobey Lonsdale', to_date('05-07-1974', 'dd-mm-yyyy'), 686, 'First Responder', 'male', 50);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Embeth Haysbert', to_date('05-11-1999', 'dd-mm-yyyy'), 687, 'EMT', 'male', 25);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kimberly Atkins', to_date('26-11-1983', 'dd-mm-yyyy'), 688, 'Paramedic', 'female', 41);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Anna Bragg', to_date('18-03-1980', 'dd-mm-yyyy'), 689, 'Paramedic', 'female', 44);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Gabrielle Spader', to_date('28-01-1998', 'dd-mm-yyyy'), 690, 'Paramedic', 'female', 26);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Carlos Fierstein', to_date('30-12-1990', 'dd-mm-yyyy'), 691, 'EMT', 'male', 34);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('William Scheider', to_date('08-12-1988', 'dd-mm-yyyy'), 692, 'EMT', 'female', 36);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Jackie Holliday', to_date('04-02-1989', 'dd-mm-yyyy'), 693, 'Paramedic', 'female', 35);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Janice Lachey', to_date('08-04-1991', 'dd-mm-yyyy'), 694, 'EMT', 'male', 33);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Radney Fariq', to_date('15-04-1975', 'dd-mm-yyyy'), 695, 'Paramedic', 'male', 49);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Bryan Wong', to_date('05-03-1971', 'dd-mm-yyyy'), 696, 'First Responder', 'female', 53);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Denzel Vaughan', to_date('30-07-1995', 'dd-mm-yyyy'), 697, 'Paramedic', 'male', 29);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Zooey Rush', to_date('27-03-1988', 'dd-mm-yyyy'), 698, 'Paramedic', 'male', 36);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Hope Cumming', to_date('23-10-1999', 'dd-mm-yyyy'), 699, 'Paramedic', 'female', 25);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Eileen Drive', to_date('29-09-1987', 'dd-mm-yyyy'), 700, 'First Responder', 'male', 37);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Emerson Sylvian', to_date('24-04-1996', 'dd-mm-yyyy'), 701, 'EMT', 'female', 28);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Lara Berenger', to_date('15-06-1980', 'dd-mm-yyyy'), 702, 'Paramedic', 'female', 44);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Lindsay Malone', to_date('25-10-1996', 'dd-mm-yyyy'), 703, 'EMT', 'female', 28);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Christmas Murphy', to_date('10-07-1992', 'dd-mm-yyyy'), 704, 'Paramedic', 'male', 32);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Earl Scheider', to_date('03-09-1970', 'dd-mm-yyyy'), 705, 'Certified Nurse', 'female', 54);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Helen Harris', to_date('21-05-1994', 'dd-mm-yyyy'), 706, 'EMT', 'female', 30);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Junior Rain', to_date('21-01-1986', 'dd-mm-yyyy'), 707, 'EMT', 'female', 38);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Rodney Collie', to_date('20-07-1986', 'dd-mm-yyyy'), 708, 'First Responder', 'male', 38);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Maggie Tate', to_date('01-10-1977', 'dd-mm-yyyy'), 709, 'First Responder', 'male', 47);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Frederic Quinn', to_date('16-01-1999', 'dd-mm-yyyy'), 710, 'Certified Nurse', 'male', 25);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Horace Tate', to_date('09-06-1990', 'dd-mm-yyyy'), 711, 'Paramedic', 'female', 34);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Ruth Collie', to_date('26-10-1971', 'dd-mm-yyyy'), 712, 'Certified Nurse', 'male', 53);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Austin Haggard', to_date('05-01-1973', 'dd-mm-yyyy'), 713, 'First Responder', 'female', 51);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Sally Lynskey', to_date('04-05-1982', 'dd-mm-yyyy'), 714, 'EMT', 'male', 42);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Chely Burns', to_date('12-12-1986', 'dd-mm-yyyy'), 715, 'First Responder', 'male', 38);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Stellan Stamp', to_date('19-02-1976', 'dd-mm-yyyy'), 716, 'EMT', 'female', 48);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Edwin Visnjic', to_date('21-04-1970', 'dd-mm-yyyy'), 717, 'Paramedic', 'male', 54);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kiefer Oakenfold', to_date('04-08-1972', 'dd-mm-yyyy'), 718, 'Certified Nurse', 'male', 52);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Liquid Love', to_date('13-06-1982', 'dd-mm-yyyy'), 719, 'Certified Nurse', 'female', 42);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Charlize Rossellini', to_date('07-03-1974', 'dd-mm-yyyy'), 720, 'Paramedic', 'male', 50);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Stewart Platt', to_date('03-07-1982', 'dd-mm-yyyy'), 721, 'Certified Nurse', 'female', 42);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Bridgette Belles', to_date('27-02-1999', 'dd-mm-yyyy'), 722, 'Certified Nurse', 'female', 25);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Ryan Nugent', to_date('19-04-1981', 'dd-mm-yyyy'), 723, 'First Responder', 'female', 43);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Gwyneth Goldberg', to_date('24-05-1987', 'dd-mm-yyyy'), 724, 'First Responder', 'male', 37);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Trick Hayek', to_date('30-08-1991', 'dd-mm-yyyy'), 725, 'EMT', 'male', 33);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Frances Balin', to_date('18-07-1993', 'dd-mm-yyyy'), 726, 'Certified Nurse', 'female', 31);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Amy Tate', to_date('27-05-1979', 'dd-mm-yyyy'), 727, 'First Responder', 'female', 45);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Radney Heatherly', to_date('29-11-1992', 'dd-mm-yyyy'), 728, 'Paramedic', 'male', 32);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Helen McCoy', to_date('30-10-1996', 'dd-mm-yyyy'), 729, 'Certified Nurse', 'female', 28);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Jonathan Moreno', to_date('30-11-1999', 'dd-mm-yyyy'), 730, 'Paramedic', 'female', 25);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Shawn Colton', to_date('29-08-1976', 'dd-mm-yyyy'), 731, 'First Responder', 'female', 48);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Ron Macy', to_date('26-02-1999', 'dd-mm-yyyy'), 732, 'First Responder', 'male', 25);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Brian Fox', to_date('29-05-1985', 'dd-mm-yyyy'), 733, 'EMT', 'female', 39);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Jonny Gellar', to_date('04-06-1991', 'dd-mm-yyyy'), 734, 'EMT', 'male', 33);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Vienna Conway', to_date('29-05-1977', 'dd-mm-yyyy'), 735, 'Paramedic', 'female', 47);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Robin Sevenfold', to_date('31-03-1993', 'dd-mm-yyyy'), 736, 'Paramedic', 'male', 31);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Thora Goldwyn', to_date('09-04-1981', 'dd-mm-yyyy'), 737, 'EMT', 'male', 43);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Luis Ranger', to_date('09-04-1976', 'dd-mm-yyyy'), 738, 'Paramedic', 'male', 48);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Eddie Hauser', to_date('27-10-1985', 'dd-mm-yyyy'), 739, 'Paramedic', 'female', 39);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Lee Rivers', to_date('26-11-1982', 'dd-mm-yyyy'), 740, 'EMT', 'male', 42);
commit;
prompt 100 records committed...
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Dom Spears', to_date('25-06-1970', 'dd-mm-yyyy'), 741, 'First Responder', 'male', 54);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Dorry Eat World', to_date('11-11-1974', 'dd-mm-yyyy'), 742, 'Paramedic', 'male', 50);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Jerry Cobbs', to_date('05-11-1980', 'dd-mm-yyyy'), 743, 'Paramedic', 'female', 44);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Paula Bragg', to_date('28-12-1972', 'dd-mm-yyyy'), 744, 'EMT', 'female', 52);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Gerald Grant', to_date('30-10-1992', 'dd-mm-yyyy'), 745, 'EMT', 'female', 32);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Ricardo Gayle', to_date('31-12-1996', 'dd-mm-yyyy'), 746, 'Certified Nurse', 'male', 28);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Julianna Jonze', to_date('11-09-1982', 'dd-mm-yyyy'), 747, 'First Responder', 'male', 42);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Ronnie Lachey', to_date('06-05-1994', 'dd-mm-yyyy'), 748, 'Paramedic', 'female', 30);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Laura Dalton', to_date('10-01-1975', 'dd-mm-yyyy'), 749, 'EMT', 'female', 49);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Nathan Niven', to_date('15-07-1975', 'dd-mm-yyyy'), 750, 'First Responder', 'female', 49);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Ossie Vassar', to_date('30-05-1970', 'dd-mm-yyyy'), 751, 'EMT', 'female', 54);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Franco Darren', to_date('23-01-1980', 'dd-mm-yyyy'), 752, 'First Responder', 'male', 44);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Stanley Wahlberg', to_date('14-10-1998', 'dd-mm-yyyy'), 753, 'First Responder', 'male', 26);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Vin Fehr', to_date('30-04-1980', 'dd-mm-yyyy'), 754, 'Paramedic', 'male', 44);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Tracy Lineback', to_date('22-07-1987', 'dd-mm-yyyy'), 755, 'EMT', 'male', 37);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Alannah Mahoney', to_date('18-11-1981', 'dd-mm-yyyy'), 756, 'Certified Nurse', 'male', 43);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Nile Clarkson', to_date('16-08-1994', 'dd-mm-yyyy'), 757, 'EMT', 'female', 30);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Lila Arden', to_date('21-12-1993', 'dd-mm-yyyy'), 758, 'EMT', 'female', 31);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Joan Ribisi', to_date('22-07-1970', 'dd-mm-yyyy'), 759, 'EMT', 'male', 54);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kurtwood Del Toro', to_date('10-11-1996', 'dd-mm-yyyy'), 760, 'EMT', 'female', 28);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Leonardo Winslet', to_date('10-08-1989', 'dd-mm-yyyy'), 761, 'Certified Nurse', 'female', 35);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Anthony Polito', to_date('07-03-1978', 'dd-mm-yyyy'), 762, 'First Responder', 'male', 46);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Edwin Guilfoyle', to_date('07-09-1981', 'dd-mm-yyyy'), 763, 'Paramedic', 'male', 43);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Vivica Loggia', to_date('07-12-1971', 'dd-mm-yyyy'), 764, 'Paramedic', 'female', 53);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Demi Busey', to_date('19-11-1974', 'dd-mm-yyyy'), 765, 'Certified Nurse', 'male', 50);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Sinead Broderick', to_date('20-03-1977', 'dd-mm-yyyy'), 766, 'First Responder', 'male', 47);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Maria Aiken', to_date('27-04-1976', 'dd-mm-yyyy'), 767, 'First Responder', 'female', 48);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Roberta Koteas', to_date('24-07-1991', 'dd-mm-yyyy'), 768, 'Certified Nurse', 'male', 33);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Percy Allan', to_date('22-03-1996', 'dd-mm-yyyy'), 769, 'EMT', 'male', 28);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Allison Bacharach', to_date('18-04-1982', 'dd-mm-yyyy'), 770, 'Paramedic', 'male', 42);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kristin Brandt', to_date('14-05-1981', 'dd-mm-yyyy'), 771, 'First Responder', 'male', 43);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Gabrielle Leachman', to_date('19-02-1971', 'dd-mm-yyyy'), 772, 'Paramedic', 'male', 53);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Sinead Saucedo', to_date('29-05-1998', 'dd-mm-yyyy'), 773, 'Paramedic', 'male', 26);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Stewart Beatty', to_date('18-05-1978', 'dd-mm-yyyy'), 774, 'EMT', 'female', 46);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Gino Brown', to_date('09-07-1979', 'dd-mm-yyyy'), 775, 'Paramedic', 'male', 45);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Aida Garza', to_date('27-03-1986', 'dd-mm-yyyy'), 776, 'Certified Nurse', 'male', 38);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Carl Ticotin', to_date('10-09-1981', 'dd-mm-yyyy'), 777, 'Paramedic', 'female', 43);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kim Warden', to_date('17-03-1972', 'dd-mm-yyyy'), 778, 'EMT', 'male', 52);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Celia Squier', to_date('09-04-1971', 'dd-mm-yyyy'), 779, 'Paramedic', 'male', 53);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Stephen Cartlidge', to_date('13-06-1975', 'dd-mm-yyyy'), 780, 'Paramedic', 'female', 49);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Liam Kane', to_date('28-02-1986', 'dd-mm-yyyy'), 781, 'Paramedic', 'male', 38);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Remy Matarazzo', to_date('27-01-1988', 'dd-mm-yyyy'), 782, 'Certified Nurse', 'male', 36);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Leo Mazar', to_date('20-04-1974', 'dd-mm-yyyy'), 783, 'Paramedic', 'female', 50);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Molly Buckingham', to_date('21-11-1991', 'dd-mm-yyyy'), 784, 'Certified Nurse', 'male', 33);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Taye Broza', to_date('30-03-1997', 'dd-mm-yyyy'), 785, 'Certified Nurse', 'female', 27);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Udo Chaplin', to_date('13-02-1995', 'dd-mm-yyyy'), 786, 'EMT', 'male', 29);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Marley Reilly', to_date('13-03-1997', 'dd-mm-yyyy'), 787, 'Certified Nurse', 'male', 27);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Christopher Adler', to_date('01-02-1996', 'dd-mm-yyyy'), 788, 'EMT', 'male', 28);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kevin McPherson', to_date('03-03-1993', 'dd-mm-yyyy'), 789, 'First Responder', 'female', 31);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Ricardo Reynolds', to_date('16-09-1977', 'dd-mm-yyyy'), 790, 'Certified Nurse', 'male', 47);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Garland Coleman', to_date('04-02-1972', 'dd-mm-yyyy'), 791, 'Paramedic', 'female', 52);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Freddie Gough', to_date('09-05-1990', 'dd-mm-yyyy'), 792, 'Certified Nurse', 'female', 34);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Joanna Iglesias', to_date('01-09-1972', 'dd-mm-yyyy'), 793, 'Certified Nurse', 'male', 52);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Dave Sirtis', to_date('19-08-1977', 'dd-mm-yyyy'), 794, 'First Responder', 'male', 47);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Cornell Meniketti', to_date('20-03-1998', 'dd-mm-yyyy'), 795, 'Certified Nurse', 'male', 26);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Stanley Garcia', to_date('14-05-1982', 'dd-mm-yyyy'), 796, 'Certified Nurse', 'male', 42);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Nicolas Griffin', to_date('20-08-1988', 'dd-mm-yyyy'), 797, 'Paramedic', 'female', 36);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Veruca Schiff', to_date('02-09-1974', 'dd-mm-yyyy'), 798, 'First Responder', 'male', 50);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Cary Williams', to_date('02-12-1995', 'dd-mm-yyyy'), 799, 'First Responder', 'male', 29);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Miki Krumholtz', to_date('16-01-1993', 'dd-mm-yyyy'), 800, 'Paramedic', 'female', 31);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Brad Kimball', to_date('16-02-1981', 'dd-mm-yyyy'), 801, 'EMT', 'male', 43);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Wayne Caviezel', to_date('10-05-1989', 'dd-mm-yyyy'), 802, 'Certified Nurse', 'female', 35);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Chi Yorn', to_date('04-03-1978', 'dd-mm-yyyy'), 803, 'First Responder', 'female', 46);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Leelee Watley', to_date('31-05-1971', 'dd-mm-yyyy'), 804, 'Paramedic', 'female', 53);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Mel Harper', to_date('25-05-1990', 'dd-mm-yyyy'), 805, 'EMT', 'male', 34);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Jet Margulies', to_date('13-05-1989', 'dd-mm-yyyy'), 806, 'EMT', 'female', 35);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Tilda Parker', to_date('04-02-1994', 'dd-mm-yyyy'), 807, 'Certified Nurse', 'female', 30);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Breckin Neil', to_date('12-08-1996', 'dd-mm-yyyy'), 808, 'First Responder', 'female', 28);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Gaby Jeter', to_date('17-04-1988', 'dd-mm-yyyy'), 809, 'Certified Nurse', 'female', 36);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kirk Dafoe', to_date('01-06-1998', 'dd-mm-yyyy'), 810, 'Certified Nurse', 'male', 26);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Brian Crowe', to_date('20-07-1976', 'dd-mm-yyyy'), 811, 'Certified Nurse', 'male', 48);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Cole Ness', to_date('21-09-1984', 'dd-mm-yyyy'), 812, 'EMT', 'male', 40);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Johnnie Eckhart', to_date('14-10-1983', 'dd-mm-yyyy'), 813, 'First Responder', 'male', 41);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Hookah Sayer', to_date('23-02-1974', 'dd-mm-yyyy'), 814, 'Paramedic', 'female', 50);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Vincent Springfield', to_date('15-04-1973', 'dd-mm-yyyy'), 815, 'First Responder', 'male', 51);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Beth Tilly', to_date('23-06-1985', 'dd-mm-yyyy'), 816, 'Certified Nurse', 'female', 39);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Frank Robards', to_date('23-11-1985', 'dd-mm-yyyy'), 817, 'First Responder', 'male', 39);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Burton Eder', to_date('16-10-1988', 'dd-mm-yyyy'), 818, 'Certified Nurse', 'female', 36);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Sylvester Foster', to_date('28-09-1988', 'dd-mm-yyyy'), 819, 'EMT', 'female', 36);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Vince Quaid', to_date('28-08-1971', 'dd-mm-yyyy'), 820, 'EMT', 'female', 53);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Hal Negbaur', to_date('03-11-1984', 'dd-mm-yyyy'), 821, 'Certified Nurse', 'male', 40);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('George Herrmann', to_date('16-02-1994', 'dd-mm-yyyy'), 822, 'Paramedic', 'female', 30);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Juliette Feliciano', to_date('15-12-1990', 'dd-mm-yyyy'), 823, 'First Responder', 'male', 34);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Merrilee Spector', to_date('12-03-1981', 'dd-mm-yyyy'), 824, 'Paramedic', 'female', 43);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Nikka Bale', to_date('17-08-1999', 'dd-mm-yyyy'), 825, 'EMT', 'male', 25);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Vienna Gyllenhaal', to_date('29-07-1989', 'dd-mm-yyyy'), 826, 'EMT', 'female', 35);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Lennie Gershon', to_date('03-09-1985', 'dd-mm-yyyy'), 827, 'Paramedic', 'male', 39);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Brad Bachman', to_date('26-09-1979', 'dd-mm-yyyy'), 828, 'EMT', 'female', 45);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Elle Osborne', to_date('01-12-1977', 'dd-mm-yyyy'), 829, 'Certified Nurse', 'female', 47);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Davis Eat World', to_date('05-11-1979', 'dd-mm-yyyy'), 830, 'First Responder', 'male', 45);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Daryl Holm', to_date('04-03-1977', 'dd-mm-yyyy'), 831, 'Paramedic', 'male', 47);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Adrien Hersh', to_date('28-09-1988', 'dd-mm-yyyy'), 832, 'Paramedic', 'male', 36);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Rebeka Playboys', to_date('07-06-1971', 'dd-mm-yyyy'), 833, 'First Responder', 'female', 53);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Raymond Adler', to_date('26-01-1986', 'dd-mm-yyyy'), 834, 'Paramedic', 'female', 38);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Rufus Hershey', to_date('20-10-1972', 'dd-mm-yyyy'), 835, 'EMT', 'male', 52);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Lloyd Byrd', to_date('13-11-1981', 'dd-mm-yyyy'), 836, 'EMT', 'male', 43);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Taryn Dunaway', to_date('26-08-1997', 'dd-mm-yyyy'), 837, 'EMT', 'male', 27);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Terrence Cara', to_date('21-10-1991', 'dd-mm-yyyy'), 838, 'Certified Nurse', 'male', 33);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Lois Rodriguez', to_date('25-10-1985', 'dd-mm-yyyy'), 839, 'Paramedic', 'female', 39);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Carlos Vaughn', to_date('02-09-1989', 'dd-mm-yyyy'), 840, 'First Responder', 'male', 35);
commit;
prompt 200 records committed...
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Roberta Day', to_date('28-02-1996', 'dd-mm-yyyy'), 841, 'Certified Nurse', 'female', 28);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Roberta Lofgren', to_date('16-10-1982', 'dd-mm-yyyy'), 842, 'First Responder', 'female', 42);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Nicole Alda', to_date('02-07-1998', 'dd-mm-yyyy'), 843, 'Certified Nurse', 'male', 26);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Crystal Shue', to_date('05-06-1990', 'dd-mm-yyyy'), 844, 'Paramedic', 'female', 34);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Bret Reynolds', to_date('24-04-1995', 'dd-mm-yyyy'), 845, 'Certified Nurse', 'female', 29);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Holland Benson', to_date('04-12-1976', 'dd-mm-yyyy'), 846, 'First Responder', 'male', 48);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Tracy Macy', to_date('18-02-1975', 'dd-mm-yyyy'), 847, 'Certified Nurse', 'male', 49);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Joey Rowlands', to_date('08-02-1982', 'dd-mm-yyyy'), 848, 'Paramedic', 'female', 42);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Sophie Rubinek', to_date('11-08-1982', 'dd-mm-yyyy'), 849, 'Certified Nurse', 'female', 42);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kirsten Holden', to_date('26-04-1978', 'dd-mm-yyyy'), 850, 'Certified Nurse', 'male', 46);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Mary-Louise Gere', to_date('23-10-1991', 'dd-mm-yyyy'), 851, 'Certified Nurse', 'male', 33);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Jean-Claude De Almeida', to_date('19-03-1978', 'dd-mm-yyyy'), 852, 'First Responder', 'female', 46);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Jonny Coyote', to_date('05-07-1999', 'dd-mm-yyyy'), 853, 'EMT', 'female', 25);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Garth Walken', to_date('29-10-1976', 'dd-mm-yyyy'), 854, 'Certified Nurse', 'female', 48);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Isaac Cromwell', to_date('05-09-1987', 'dd-mm-yyyy'), 855, 'EMT', 'female', 37);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Nile Alda', to_date('27-08-1977', 'dd-mm-yyyy'), 856, 'Paramedic', 'female', 47);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Terrence Murdock', to_date('07-12-1998', 'dd-mm-yyyy'), 857, 'EMT', 'male', 26);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Roger Douglas', to_date('15-01-1972', 'dd-mm-yyyy'), 858, 'First Responder', 'female', 52);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Lynn Ontiveros', to_date('28-07-1999', 'dd-mm-yyyy'), 859, 'Certified Nurse', 'male', 25);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kyra Parsons', to_date('08-04-1996', 'dd-mm-yyyy'), 860, 'EMT', 'female', 28);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Hilary Chan', to_date('26-04-1971', 'dd-mm-yyyy'), 861, 'EMT', 'female', 53);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Hope Miller', to_date('04-01-1978', 'dd-mm-yyyy'), 862, 'EMT', 'male', 46);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Martha Benet', to_date('20-08-1979', 'dd-mm-yyyy'), 863, 'EMT', 'female', 45);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Marianne Lachey', to_date('04-03-1985', 'dd-mm-yyyy'), 864, 'Paramedic', 'male', 39);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Bernie Vince', to_date('03-06-1982', 'dd-mm-yyyy'), 865, 'Certified Nurse', 'female', 42);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Patrick Nugent', to_date('07-10-1972', 'dd-mm-yyyy'), 866, 'EMT', 'female', 52);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Barbara Rispoli', to_date('03-12-1982', 'dd-mm-yyyy'), 867, 'EMT', 'female', 42);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Mark Kadison', to_date('10-08-1978', 'dd-mm-yyyy'), 868, 'First Responder', 'female', 46);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Denzel Candy', to_date('23-09-1983', 'dd-mm-yyyy'), 869, 'First Responder', 'female', 41);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Armin Suvari', to_date('26-11-1973', 'dd-mm-yyyy'), 870, 'EMT', 'male', 51);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Eric Carrere', to_date('05-07-1989', 'dd-mm-yyyy'), 871, 'Certified Nurse', 'male', 35);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Saffron Gill', to_date('30-05-1981', 'dd-mm-yyyy'), 872, 'Certified Nurse', 'male', 43);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Ike Cross', to_date('01-09-1983', 'dd-mm-yyyy'), 873, 'Certified Nurse', 'female', 41);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Stewart Tambor', to_date('21-03-1979', 'dd-mm-yyyy'), 874, 'Certified Nurse', 'male', 45);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Maria Isaak', to_date('08-03-1983', 'dd-mm-yyyy'), 875, 'EMT', 'male', 41);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Robert Kidman', to_date('13-10-1983', 'dd-mm-yyyy'), 876, 'Paramedic', 'male', 41);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Alannah Lopez', to_date('03-07-1975', 'dd-mm-yyyy'), 877, 'Paramedic', 'female', 49);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Taylor Harry', to_date('16-10-1998', 'dd-mm-yyyy'), 878, 'Certified Nurse', 'female', 26);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kurtwood Shaw', to_date('09-03-1986', 'dd-mm-yyyy'), 879, 'Certified Nurse', 'female', 38);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Tony Metcalf', to_date('09-07-1988', 'dd-mm-yyyy'), 880, 'Certified Nurse', 'male', 36);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Sharon Downey', to_date('05-02-1985', 'dd-mm-yyyy'), 881, 'Certified Nurse', 'male', 39);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Emerson Harry', to_date('21-05-1992', 'dd-mm-yyyy'), 882, 'EMT', 'female', 32);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Jude Brandt', to_date('08-02-1997', 'dd-mm-yyyy'), 883, 'EMT', 'male', 27);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Josh Hunter', to_date('06-05-1973', 'dd-mm-yyyy'), 884, 'EMT', 'female', 51);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Dionne Creek', to_date('27-05-1979', 'dd-mm-yyyy'), 885, 'First Responder', 'female', 45);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Meredith Creek', to_date('15-08-1983', 'dd-mm-yyyy'), 886, 'Paramedic', 'male', 41);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Bernie Sheen', to_date('20-05-1996', 'dd-mm-yyyy'), 887, 'Paramedic', 'male', 28);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Geoff Feliciano', to_date('23-06-1988', 'dd-mm-yyyy'), 888, 'EMT', 'female', 36);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Mary-Louise Shorter', to_date('20-11-1983', 'dd-mm-yyyy'), 889, 'First Responder', 'male', 41);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Richard Allison', to_date('09-10-1999', 'dd-mm-yyyy'), 890, 'Certified Nurse', 'male', 25);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Swoosie Franklin', to_date('07-07-1981', 'dd-mm-yyyy'), 891, 'Certified Nurse', 'female', 43);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kyra Eat World', to_date('06-03-1997', 'dd-mm-yyyy'), 892, 'Paramedic', 'male', 27);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Crispin Holly', to_date('07-10-1984', 'dd-mm-yyyy'), 893, 'EMT', 'female', 40);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kazem Fariq', to_date('30-08-1973', 'dd-mm-yyyy'), 894, 'First Responder', 'male', 51);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Darren Allison', to_date('16-06-1971', 'dd-mm-yyyy'), 895, 'EMT', 'female', 53);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Jackson Quatro', to_date('27-04-1974', 'dd-mm-yyyy'), 896, 'First Responder', 'male', 50);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Nicole Noseworthy', to_date('27-03-1979', 'dd-mm-yyyy'), 897, 'First Responder', 'male', 45);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Davey Crouse', to_date('02-07-1991', 'dd-mm-yyyy'), 898, 'First Responder', 'male', 33);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Cyndi Ojeda', to_date('14-04-1987', 'dd-mm-yyyy'), 899, 'EMT', 'female', 37);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Antonio Satriani', to_date('20-06-1972', 'dd-mm-yyyy'), 500, 'Paramedic', 'female', 52);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Percy Bonham', to_date('18-07-1976', 'dd-mm-yyyy'), 501, 'First Responder', 'male', 48);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('James Hall', to_date('30-06-1981', 'dd-mm-yyyy'), 502, 'Paramedic', 'female', 43);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Nicole Pleasure', to_date('08-11-1993', 'dd-mm-yyyy'), 503, 'Certified Nurse', 'male', 31);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Sean Applegate', to_date('30-05-1985', 'dd-mm-yyyy'), 504, 'Paramedic', 'male', 39);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kate Head', to_date('25-05-1979', 'dd-mm-yyyy'), 505, 'First Responder', 'female', 45);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Emmylou Orlando', to_date('23-01-1976', 'dd-mm-yyyy'), 506, 'First Responder', 'female', 48);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Maria Giamatti', to_date('05-01-1972', 'dd-mm-yyyy'), 507, 'Certified Nurse', 'male', 52);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Jake Krumholtz', to_date('15-02-1979', 'dd-mm-yyyy'), 508, 'EMT', 'female', 45);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Avenged Gambon', to_date('18-06-1986', 'dd-mm-yyyy'), 509, 'Certified Nurse', 'female', 38);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Tommy Lunch', to_date('31-08-1984', 'dd-mm-yyyy'), 510, 'EMT', 'male', 40);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Carol Mueller-Stahl', to_date('11-02-1978', 'dd-mm-yyyy'), 511, 'EMT', 'female', 46);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Martin Trejo', to_date('13-05-1984', 'dd-mm-yyyy'), 512, 'Certified Nurse', 'female', 40);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Freddie Hartnett', to_date('23-01-1985', 'dd-mm-yyyy'), 513, 'First Responder', 'male', 39);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Angela Bedelia', to_date('07-06-1990', 'dd-mm-yyyy'), 514, 'First Responder', 'male', 34);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Roberta Hauser', to_date('19-02-1970', 'dd-mm-yyyy'), 515, 'Certified Nurse', 'male', 54);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Parker Herndon', to_date('18-07-1982', 'dd-mm-yyyy'), 516, 'EMT', 'male', 42);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Herbie English', to_date('15-06-1999', 'dd-mm-yyyy'), 517, 'First Responder', 'female', 25);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Harris Kenoly', to_date('02-07-1990', 'dd-mm-yyyy'), 518, 'First Responder', 'female', 34);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Woody Sossamon', to_date('25-04-1976', 'dd-mm-yyyy'), 519, 'Paramedic', 'female', 48);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Eugene Moss', to_date('10-05-1973', 'dd-mm-yyyy'), 520, 'First Responder', 'male', 51);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Samantha Kattan', to_date('01-12-1997', 'dd-mm-yyyy'), 521, 'First Responder', 'female', 27);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Anna Loring', to_date('12-03-1977', 'dd-mm-yyyy'), 522, 'Paramedic', 'male', 47);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Terrence Hatfield', to_date('25-10-1982', 'dd-mm-yyyy'), 523, 'EMT', 'male', 42);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Sam Cherry', to_date('18-09-1975', 'dd-mm-yyyy'), 524, 'First Responder', 'male', 49);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Nigel Levert', to_date('01-10-1987', 'dd-mm-yyyy'), 525, 'EMT', 'male', 37);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kirsten Wheel', to_date('24-11-1976', 'dd-mm-yyyy'), 526, 'Certified Nurse', 'female', 48);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Desmond Aiken', to_date('20-09-1998', 'dd-mm-yyyy'), 527, 'Certified Nurse', 'female', 26);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Leon Conners', to_date('24-05-1977', 'dd-mm-yyyy'), 528, 'First Responder', 'female', 47);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Miriam Shaw', to_date('24-05-1971', 'dd-mm-yyyy'), 529, 'First Responder', 'male', 53);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Domingo Isaacs', to_date('08-07-1990', 'dd-mm-yyyy'), 530, 'Certified Nurse', 'female', 34);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kid Osborne', to_date('27-05-1975', 'dd-mm-yyyy'), 531, 'First Responder', 'male', 49);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Ani Fiennes', to_date('17-01-1996', 'dd-mm-yyyy'), 532, 'Paramedic', 'female', 28);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Hank Crowe', to_date('10-07-1984', 'dd-mm-yyyy'), 533, 'Certified Nurse', 'female', 40);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Lily Satriani', to_date('06-12-1986', 'dd-mm-yyyy'), 534, 'First Responder', 'male', 38);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kiefer Reilly', to_date('01-10-1984', 'dd-mm-yyyy'), 535, 'EMT', 'male', 40);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Seth Studi', to_date('09-09-1971', 'dd-mm-yyyy'), 536, 'Paramedic', 'male', 53);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Lenny Gore', to_date('12-05-1994', 'dd-mm-yyyy'), 537, 'Paramedic', 'female', 30);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Howard Crouse', to_date('08-05-1988', 'dd-mm-yyyy'), 538, 'First Responder', 'male', 36);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Jet Christie', to_date('22-05-1988', 'dd-mm-yyyy'), 539, 'Paramedic', 'female', 36);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Mena Buckingham', to_date('02-06-1998', 'dd-mm-yyyy'), 540, 'Certified Nurse', 'female', 26);
commit;
prompt 300 records committed...
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Lari Hyde', to_date('28-12-1983', 'dd-mm-yyyy'), 541, 'Paramedic', 'male', 41);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Richard Hubbard', to_date('04-01-1994', 'dd-mm-yyyy'), 542, 'Certified Nurse', 'male', 30);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Joseph Tsettos', to_date('17-04-1977', 'dd-mm-yyyy'), 543, 'First Responder', 'male', 47);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Nigel Wariner', to_date('29-05-1970', 'dd-mm-yyyy'), 544, 'Paramedic', 'male', 54);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Fats Zane', to_date('10-12-1985', 'dd-mm-yyyy'), 545, 'Certified Nurse', 'female', 39);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Fred Paul', to_date('13-01-1976', 'dd-mm-yyyy'), 546, 'EMT', 'female', 48);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Coley Fiennes', to_date('04-12-1978', 'dd-mm-yyyy'), 547, 'Certified Nurse', 'male', 46);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Maceo Latifah', to_date('24-11-1974', 'dd-mm-yyyy'), 548, 'EMT', 'female', 50);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('William Caviezel', to_date('20-11-1985', 'dd-mm-yyyy'), 549, 'Certified Nurse', 'female', 39);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Terry Kinnear', to_date('17-12-1978', 'dd-mm-yyyy'), 550, 'First Responder', 'male', 46);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Pierce Randal', to_date('25-05-1976', 'dd-mm-yyyy'), 551, 'First Responder', 'male', 48);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Armin Hidalgo', to_date('03-05-1982', 'dd-mm-yyyy'), 552, 'First Responder', 'female', 42);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Toni Osment', to_date('22-08-1984', 'dd-mm-yyyy'), 553, 'First Responder', 'female', 40);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Pamela Hiatt', to_date('13-10-1971', 'dd-mm-yyyy'), 554, 'Paramedic', 'male', 53);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Annie Brody', to_date('02-09-1971', 'dd-mm-yyyy'), 555, 'Paramedic', 'male', 53);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Chant×? Howard', to_date('21-04-1971', 'dd-mm-yyyy'), 556, 'EMT', 'male', 53);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Clive Levine', to_date('26-04-1974', 'dd-mm-yyyy'), 557, 'First Responder', 'female', 50);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Vern Brooks', to_date('03-12-1978', 'dd-mm-yyyy'), 558, 'First Responder', 'female', 46);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Stewart Cassel', to_date('05-05-1982', 'dd-mm-yyyy'), 559, 'EMT', 'male', 42);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Percy Farrow', to_date('22-05-1983', 'dd-mm-yyyy'), 560, 'First Responder', 'male', 41);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Devon Ronstadt', to_date('22-11-1981', 'dd-mm-yyyy'), 561, 'EMT', 'male', 43);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Nicole Kidman', to_date('19-01-1974', 'dd-mm-yyyy'), 562, 'Paramedic', 'male', 50);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Debra Cervine', to_date('24-01-1979', 'dd-mm-yyyy'), 563, 'EMT', 'male', 45);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kiefer Humphrey', to_date('05-09-1970', 'dd-mm-yyyy'), 564, 'First Responder', 'female', 54);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Miranda Bosco', to_date('18-12-1980', 'dd-mm-yyyy'), 565, 'Certified Nurse', 'female', 44);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Maury Bright', to_date('29-02-1988', 'dd-mm-yyyy'), 566, 'Certified Nurse', 'male', 36);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Val Blair', to_date('29-01-1988', 'dd-mm-yyyy'), 567, 'Paramedic', 'female', 36);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Andre Cornell', to_date('02-01-1996', 'dd-mm-yyyy'), 568, 'First Responder', 'female', 28);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kimberly DeVita', to_date('21-12-1989', 'dd-mm-yyyy'), 569, 'EMT', 'male', 35);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Lari Hatosy', to_date('12-10-1990', 'dd-mm-yyyy'), 570, 'Paramedic', 'female', 34);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Lois Rispoli', to_date('17-12-1990', 'dd-mm-yyyy'), 571, 'Paramedic', 'male', 34);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Ramsey Mohr', to_date('13-08-1973', 'dd-mm-yyyy'), 572, 'Paramedic', 'male', 51);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Sam Dempsey', to_date('12-09-1992', 'dd-mm-yyyy'), 573, 'Certified Nurse', 'male', 32);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Henry Stanley', to_date('02-10-1980', 'dd-mm-yyyy'), 574, 'First Responder', 'male', 44);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Anne Weller', to_date('16-01-1981', 'dd-mm-yyyy'), 575, 'EMT', 'male', 43);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Busta Benet', to_date('03-06-1975', 'dd-mm-yyyy'), 576, 'Certified Nurse', 'male', 49);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Randall Campbell', to_date('13-04-1984', 'dd-mm-yyyy'), 577, 'Paramedic', 'female', 40);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Gin Pacino', to_date('30-06-1980', 'dd-mm-yyyy'), 578, 'First Responder', 'male', 44);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Franco DeVito', to_date('13-08-1973', 'dd-mm-yyyy'), 579, 'First Responder', 'female', 51);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Liv Tisdale', to_date('20-06-1975', 'dd-mm-yyyy'), 580, 'EMT', 'male', 49);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Teri Henstridge', to_date('22-07-1973', 'dd-mm-yyyy'), 581, 'Certified Nurse', 'female', 51);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Taryn Condition', to_date('11-02-1995', 'dd-mm-yyyy'), 582, 'First Responder', 'female', 29);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Lucy Caviezel', to_date('09-05-1984', 'dd-mm-yyyy'), 583, 'Certified Nurse', 'male', 40);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Rob Hyde', to_date('23-10-1982', 'dd-mm-yyyy'), 584, 'Paramedic', 'male', 42);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Arnold Secada', to_date('01-01-1990', 'dd-mm-yyyy'), 585, 'First Responder', 'male', 34);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Bonnie Elizondo', to_date('23-04-1975', 'dd-mm-yyyy'), 586, 'Certified Nurse', 'male', 49);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Hank Ali', to_date('30-01-1998', 'dd-mm-yyyy'), 587, 'Paramedic', 'female', 26);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Cyndi Margulies', to_date('02-06-1990', 'dd-mm-yyyy'), 588, 'First Responder', 'male', 34);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Faye Rispoli', to_date('25-01-1971', 'dd-mm-yyyy'), 589, 'Certified Nurse', 'female', 53);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Elijah Raye', to_date('14-06-1980', 'dd-mm-yyyy'), 590, 'EMT', 'female', 44);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Jesus Herndon', to_date('13-05-1987', 'dd-mm-yyyy'), 591, 'First Responder', 'female', 37);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Courtney Sinise', to_date('20-04-1985', 'dd-mm-yyyy'), 592, 'First Responder', 'male', 39);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Franz Ricci', to_date('21-02-1983', 'dd-mm-yyyy'), 593, 'Certified Nurse', 'female', 41);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Elias Santana', to_date('10-10-1995', 'dd-mm-yyyy'), 594, 'Paramedic', 'male', 29);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Rascal Avital', to_date('13-12-1987', 'dd-mm-yyyy'), 595, 'EMT', 'male', 37);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Janice Brosnan', to_date('17-06-1972', 'dd-mm-yyyy'), 596, 'Certified Nurse', 'female', 52);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Desmond Lindley', to_date('30-12-1976', 'dd-mm-yyyy'), 597, 'Paramedic', 'female', 48);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Mae Michael', to_date('15-01-1975', 'dd-mm-yyyy'), 598, 'First Responder', 'female', 49);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Roger Mirren', to_date('16-08-1975', 'dd-mm-yyyy'), 599, 'First Responder', 'female', 49);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Jann McDonnell', to_date('20-11-1972', 'dd-mm-yyyy'), 600, 'Paramedic', 'female', 52);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Harvey Ripley', to_date('06-12-1995', 'dd-mm-yyyy'), 601, 'EMT', 'female', 29);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Burt Magnuson', to_date('17-08-1997', 'dd-mm-yyyy'), 602, 'EMT', 'male', 27);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Maura Chappelle', to_date('25-06-1986', 'dd-mm-yyyy'), 603, 'EMT', 'female', 38);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Lynn Jane', to_date('16-03-1993', 'dd-mm-yyyy'), 604, 'EMT', 'male', 31);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Ricardo Pollack', to_date('06-06-1992', 'dd-mm-yyyy'), 605, 'EMT', 'female', 32);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Geena Gold', to_date('01-06-1986', 'dd-mm-yyyy'), 606, 'Certified Nurse', 'female', 38);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Wang Griggs', to_date('05-03-1970', 'dd-mm-yyyy'), 607, 'EMT', 'female', 54);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Karon Swank', to_date('04-03-1972', 'dd-mm-yyyy'), 608, 'Paramedic', 'male', 52);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Harvey Steenburgen', to_date('14-08-1976', 'dd-mm-yyyy'), 609, 'Certified Nurse', 'female', 48);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Geraldine Holm', to_date('27-05-1970', 'dd-mm-yyyy'), 610, 'Certified Nurse', 'female', 54);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Ben Lindo', to_date('14-02-1983', 'dd-mm-yyyy'), 611, 'EMT', 'male', 41);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Praga Joli', to_date('11-08-1986', 'dd-mm-yyyy'), 612, 'EMT', 'female', 38);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Brian Mortensen', to_date('05-04-1997', 'dd-mm-yyyy'), 613, 'Paramedic', 'male', 27);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Victor Bragg', to_date('02-06-1993', 'dd-mm-yyyy'), 614, 'EMT', 'male', 31);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Sean Patrick', to_date('07-04-1986', 'dd-mm-yyyy'), 615, 'Paramedic', 'female', 38);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Claire Dafoe', to_date('13-01-1987', 'dd-mm-yyyy'), 616, 'EMT', 'female', 37);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Ian Renfro', to_date('19-08-1973', 'dd-mm-yyyy'), 617, 'EMT', 'female', 51);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Katrin Lane', to_date('29-11-1977', 'dd-mm-yyyy'), 618, 'Certified Nurse', 'female', 47);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Teri Cockburn', to_date('13-05-1989', 'dd-mm-yyyy'), 619, 'Certified Nurse', 'male', 35);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Rachid Pitney', to_date('15-07-1990', 'dd-mm-yyyy'), 620, 'EMT', 'female', 34);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Will Richter', to_date('05-01-1974', 'dd-mm-yyyy'), 621, 'Certified Nurse', 'male', 50);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Joshua Forrest', to_date('14-02-1980', 'dd-mm-yyyy'), 622, 'EMT', 'male', 44);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Gilberto Snow', to_date('23-05-1971', 'dd-mm-yyyy'), 623, 'EMT', 'female', 53);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Simon Benet', to_date('19-02-1986', 'dd-mm-yyyy'), 624, 'Certified Nurse', 'male', 38);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Keanu Richter', to_date('06-02-1984', 'dd-mm-yyyy'), 625, 'EMT', 'male', 40);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Taryn Midler', to_date('16-08-1990', 'dd-mm-yyyy'), 626, 'First Responder', 'female', 34);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Daryl Kirshner', to_date('06-01-1974', 'dd-mm-yyyy'), 627, 'Paramedic', 'male', 50);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kurtwood Mould', to_date('26-03-1985', 'dd-mm-yyyy'), 628, 'First Responder', 'female', 39);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Scott Gates', to_date('04-02-1986', 'dd-mm-yyyy'), 629, 'First Responder', 'female', 38);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Don Lopez', to_date('17-08-1971', 'dd-mm-yyyy'), 630, 'Paramedic', 'male', 53);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Juliet Culkin', to_date('03-10-1992', 'dd-mm-yyyy'), 631, 'Paramedic', 'male', 32);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Patricia Warburton', to_date('28-04-1997', 'dd-mm-yyyy'), 632, 'Certified Nurse', 'male', 27);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Angelina Howard', to_date('13-10-1976', 'dd-mm-yyyy'), 633, 'Paramedic', 'female', 48);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Alannah McGowan', to_date('20-11-1989', 'dd-mm-yyyy'), 634, 'Paramedic', 'male', 35);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Laura Tippe', to_date('25-10-1987', 'dd-mm-yyyy'), 635, 'EMT', 'male', 37);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Geoff Webb', to_date('24-08-1988', 'dd-mm-yyyy'), 636, 'Paramedic', 'female', 36);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Tcheky Harrelson', to_date('14-05-1980', 'dd-mm-yyyy'), 637, 'Paramedic', 'male', 44);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Kim Posener', to_date('28-09-1981', 'dd-mm-yyyy'), 638, 'Certified Nurse', 'female', 43);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Junior Caan', to_date('01-02-1984', 'dd-mm-yyyy'), 639, 'Paramedic', 'male', 40);
insert into PARTICIPANTS (p_name, p_date, p_id, p_role, gender, age)
values ('Miguel Robinson', to_date('22-11-1978', 'dd-mm-yyyy'), 640, 'Certified Nurse', 'female', 46);
commit;
prompt 400 records loaded
prompt Loading COURSES...
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 133, 'Medical', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 134, 'Safety', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 135, 'Medical', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 136, 'Medical', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 137, 'Safety', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 138, 'Safety', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 139, 'Safety', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 140, 'Management', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 141, 'Medical', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 142, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 143, 'Medical', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 144, 'Medical', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 145, 'Safety', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 146, 'Medical', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 147, 'Management', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 148, 'Medical', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 149, 'Medical', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 150, 'Management', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 151, 'Safety', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 152, 'Medical', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 153, 'Management', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 154, 'Medical', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 155, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 156, 'Medical', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 157, 'Management', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 158, 'Medical', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 159, 'Management', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 160, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 161, 'Medical', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 162, 'Medical', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 163, 'Safety', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 164, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 165, 'Management', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 166, 'Medical', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 167, 'Management', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 168, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 169, 'Medical', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 170, 'Medical', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 171, 'Medical', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 172, 'Management', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 173, 'Medical', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 174, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 175, 'Medical', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 176, 'Management', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 177, 'Management', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 178, 'Management', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 179, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 180, 'Management', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 181, 'Management', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 182, 'Management', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 183, 'Management', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 184, 'Medical', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 185, 'Medical', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 186, 'Safety', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 187, 'Safety', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 188, 'Safety', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 189, 'Safety', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 190, 'Medical', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 191, 'Safety', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 192, 'Management', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 193, 'Medical', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 194, 'Management', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 195, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 196, 'Management', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 197, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 198, 'Management', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 199, 'Management', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 200, 'Management', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 201, 'Medical', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 202, 'Safety', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 203, 'Management', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 204, 'Safety', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 205, 'Management', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 206, 'Medical', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 207, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 208, 'Safety', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 209, 'Safety', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 210, 'Safety', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 211, 'Safety', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 212, 'Medical', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 213, 'Management', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 214, 'Management', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 215, 'Management', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 216, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 217, 'Medical', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 218, 'Medical', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 219, 'Management', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 220, 'Safety', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 221, 'Management', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 222, 'Safety', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 223, 'Management', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 224, 'Medical', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 225, 'Management', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 226, 'Safety', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 227, 'Management', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 228, 'Medical', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 229, 'Medical', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 230, 'Medical', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 231, 'Safety', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 232, 'Management', 'Required', 'CPR');
commit;
prompt 100 records committed...
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 233, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 234, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 235, 'Safety', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 236, 'Medical', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 237, 'Management', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 238, 'Management', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 239, 'Management', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 240, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 241, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 242, 'Medical', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 243, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 244, 'Safety', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 245, 'Safety', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 246, 'Safety', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 247, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 248, 'Medical', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 249, 'Safety', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 250, 'Management', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 251, 'Safety', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 252, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 253, 'Safety', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 254, 'Safety', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 255, 'Safety', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 256, 'Medical', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 257, 'Management', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 258, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 259, 'Safety', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 260, 'Safety', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 261, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 262, 'Safety', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 263, 'Safety', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 264, 'Medical', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 265, 'Management', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 266, 'Medical', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 267, 'Safety', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 268, 'Safety', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 269, 'Medical', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 270, 'Safety', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 271, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 272, 'Management', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 273, 'Medical', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 274, 'Management', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 275, 'Safety', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 276, 'Medical', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 277, 'Management', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 278, 'Medical', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 279, 'Safety', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 280, 'Medical', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 281, 'Safety', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 282, 'Management', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 283, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 284, 'Safety', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 285, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 286, 'Medical', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 287, 'Management', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 288, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 289, 'Management', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 290, 'Management', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 291, 'Safety', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 292, 'Medical', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 293, 'Medical', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 294, 'Management', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 295, 'Medical', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 296, 'Safety', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 297, 'Management', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 298, 'Safety', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 299, 'Safety', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 300, 'Safety', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 301, 'Medical', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 302, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 303, 'Medical', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 304, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 305, 'Safety', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 306, 'Safety', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 307, 'Management', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 308, 'Medical', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 309, 'Management', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 310, 'Management', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 311, 'Medical', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 312, 'Management', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 313, 'Safety', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 314, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 315, 'Medical', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 316, 'Management', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 317, 'Safety', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 318, 'Safety', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 319, 'Safety', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 320, 'Medical', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 321, 'Management', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 322, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 323, 'Management', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 324, 'Medical', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 325, 'Management', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 326, 'Medical', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 327, 'Management', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 328, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 329, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 330, 'Management', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 331, 'Management', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 332, 'Medical', 'Optional', 'Emergency Response');
commit;
prompt 200 records committed...
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 333, 'Medical', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 334, 'Management', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 335, 'Management', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 336, 'Safety', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 337, 'Safety', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 338, 'Management', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 339, 'Medical', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 340, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 341, 'Management', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 342, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 343, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 344, 'Safety', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 345, 'Management', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 346, 'Medical', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 347, 'Safety', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 348, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 349, 'Safety', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 350, 'Management', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 351, 'Safety', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 352, 'Management', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 353, 'Safety', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 354, 'Safety', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 355, 'Management', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 356, 'Management', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 357, 'Safety', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 358, 'Medical', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 359, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 360, 'Medical', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 361, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 362, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 363, 'Management', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 364, 'Management', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 365, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 366, 'Safety', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 367, 'Safety', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 368, 'Management', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 369, 'Safety', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 370, 'Management', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 371, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 372, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 373, 'Management', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 374, 'Medical', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 375, 'Safety', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 376, 'Management', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 377, 'Safety', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 378, 'Safety', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 379, 'Safety', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 380, 'Management', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 381, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 382, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 383, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 384, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 385, 'Medical', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 386, 'Safety', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 387, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 388, 'Management', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 389, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 390, 'Medical', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 391, 'Safety', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 392, 'Safety', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 393, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 394, 'Safety', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 395, 'Management', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 396, 'Safety', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 397, 'Medical', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 398, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 399, 'Medical', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 400, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 1, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 2, 'Management', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 3, 'Safety', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 4, 'Management', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 5, 'Management', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 6, 'Medical', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 7, 'Medical', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 8, 'Safety', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 9, 'Safety', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 10, 'Medical', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 11, 'Safety', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 12, 'Management', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 13, 'Medical', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 14, 'Management', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 15, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 16, 'Safety', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 17, 'Medical', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 18, 'Medical', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 19, 'Management', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 20, 'Safety', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 21, 'Medical', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 22, 'Management', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 23, 'Management', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 24, 'Medical', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 25, 'Safety', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 26, 'Safety', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 27, 'Medical', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 28, 'Safety', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 29, 'Management', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 30, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 31, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 32, 'Management', 'Optional', 'None');
commit;
prompt 300 records committed...
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 33, 'Medical', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 34, 'Medical', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 35, 'Management', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 36, 'Management', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 37, 'Management', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 38, 'Management', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 39, 'Safety', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 40, 'Management', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 41, 'Management', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 42, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 43, 'Management', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 44, 'Management', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 45, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 46, 'Medical', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 47, 'Management', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 48, 'Management', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 49, 'Safety', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 50, 'Medical', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 51, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 52, 'Medical', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 53, 'Management', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 54, 'Management', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 55, 'Safety', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 56, 'Medical', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 57, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 58, 'Management', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 59, 'Management', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 60, 'Medical', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 61, 'Medical', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 62, 'Management', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 63, 'Safety', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 64, 'Management', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 65, 'Management', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 66, 'Management', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 67, 'Management', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 68, 'Management', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 69, 'Medical', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 70, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 71, 'Management', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 72, 'Safety', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 73, 'Management', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 74, 'Medical', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 75, 'Safety', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 76, 'Medical', 'Optional', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 77, 'Medical', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 78, 'Medical', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 79, 'Medical', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 80, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 81, 'Medical', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 82, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 83, 'Medical', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 84, 'Medical', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 85, 'Management', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 86, 'Management', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 87, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 88, 'Management', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 89, 'Medical', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 90, 'Management', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 91, 'Medical', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 92, 'Medical', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 93, 'Management', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 94, 'Safety', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 95, 'Medical', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 96, 'Medical', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 97, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 98, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 99, 'Management', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 100, 'Medical', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 101, 'Management', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 102, 'Medical', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 103, 'Medical', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 104, 'Safety', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 105, 'Medical', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 106, 'Medical', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 107, 'Management', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 108, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 109, 'Medical', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 110, 'Medical', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Pediatric Care', 111, 'Medical', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 112, 'Medical', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 113, 'Management', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Health and Safety', 114, 'Management', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 115, 'Management', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 116, 'Medical', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 117, 'Medical', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 118, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 119, 'Management', 'Optional', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 120, 'Management', 'Optional', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('CPR', 121, 'Management', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 122, 'Medical', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 123, 'Safety', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Advanced Life Support', 124, 'Safety', 'Optional', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 125, 'Management', 'Required', 'CPR');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 126, 'Safety', 'Required', 'Emergency Response');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Basic First Aid', 127, 'Medical', 'Required', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Disaster Management', 128, 'Safety', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Wilderness First Aid', 129, 'Safety', 'Required', 'None');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Infection Control', 130, 'Management', 'Optional', 'Health and Safety');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Emergency Response', 131, 'Medical', 'Required', 'Basic First Aid');
insert into COURSES (c_name, c_id, categories, presence, pre_course)
values ('Trauma Care', 132, 'Medical', 'Required', 'Health and Safety');
commit;
prompt 400 records loaded
prompt Loading LECTURERS...
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (247, 'Taye McGovern', to_date('20-12-1982', 'dd-mm-yyyy'), '9', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (248, 'Pamela Knight', to_date('26-10-1984', 'dd-mm-yyyy'), '8', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (249, 'Ted Marshall', to_date('01-07-1996', 'dd-mm-yyyy'), '6', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (250, 'Kevin Turturro', to_date('23-02-1993', 'dd-mm-yyyy'), '1', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (251, 'Delroy Carter', to_date('01-08-1982', 'dd-mm-yyyy'), '19', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (252, 'Gran Hopkins', to_date('19-12-1981', 'dd-mm-yyyy'), '26', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (253, 'Mitchell Underwood', to_date('26-12-1984', 'dd-mm-yyyy'), '4', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (254, 'Mira Shaw', to_date('15-12-1992', 'dd-mm-yyyy'), '6', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (255, 'Gailard Burmester', to_date('24-03-1974', 'dd-mm-yyyy'), '9', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (256, 'Ty Chao', to_date('21-05-1993', 'dd-mm-yyyy'), '16', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (257, 'Joely Wiedlin', to_date('17-11-1971', 'dd-mm-yyyy'), '12', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (258, 'Ron Craven', to_date('30-05-1986', 'dd-mm-yyyy'), '15', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (259, 'Naomi Branch', to_date('03-10-1990', 'dd-mm-yyyy'), '20', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (260, 'Meg McGregor', to_date('04-04-1975', 'dd-mm-yyyy'), '23', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (261, 'Rhona Oakenfold', to_date('20-08-1997', 'dd-mm-yyyy'), '19', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (262, 'Chad Roundtree', to_date('03-01-1991', 'dd-mm-yyyy'), '16', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (263, 'Fred Williamson', to_date('06-12-1971', 'dd-mm-yyyy'), '27', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (264, 'Adam Rispoli', to_date('28-07-1999', 'dd-mm-yyyy'), '18', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (265, 'Marina Delta', to_date('22-01-1978', 'dd-mm-yyyy'), '7', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (266, 'Stellan Brandt', to_date('18-06-1974', 'dd-mm-yyyy'), '22', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (267, 'Rutger Idol', to_date('25-06-1992', 'dd-mm-yyyy'), '28', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (268, 'Jeanne Chan', to_date('27-06-1997', 'dd-mm-yyyy'), '19', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (269, 'Cyndi O''Neal', to_date('01-09-1975', 'dd-mm-yyyy'), '17', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (270, 'Nicolas Delta', to_date('23-09-1973', 'dd-mm-yyyy'), '12', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (271, 'Hazel Rowlands', to_date('26-07-1986', 'dd-mm-yyyy'), '28', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (272, 'Arnold Meniketti', to_date('02-08-1989', 'dd-mm-yyyy'), '12', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (273, 'Sheryl Quaid', to_date('03-02-1999', 'dd-mm-yyyy'), '27', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (274, 'Isabella Herndon', to_date('17-12-1977', 'dd-mm-yyyy'), '24', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (275, 'Marina Albright', to_date('14-09-1978', 'dd-mm-yyyy'), '25', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (276, 'Avenged Phoenix', to_date('13-05-1981', 'dd-mm-yyyy'), '26', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (277, 'Tal McDonald', to_date('25-05-1999', 'dd-mm-yyyy'), '20', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (278, 'Billy Lowe', to_date('20-05-1987', 'dd-mm-yyyy'), '7', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (279, 'Stevie Arjona', to_date('27-11-1978', 'dd-mm-yyyy'), '3', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (280, 'Rodney Isaacs', to_date('01-10-1999', 'dd-mm-yyyy'), '17', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (281, 'Timothy Wright', to_date('31-08-1989', 'dd-mm-yyyy'), '4', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (282, 'Allison Walsh', to_date('07-08-1977', 'dd-mm-yyyy'), '23', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (283, 'Heather DeVita', to_date('16-02-1997', 'dd-mm-yyyy'), '8', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (284, 'Boz Blackmore', to_date('17-11-1973', 'dd-mm-yyyy'), '12', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (285, 'Laurence Kristofferson', to_date('06-11-1981', 'dd-mm-yyyy'), '11', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (286, 'Bruce Viterelli', to_date('12-06-1986', 'dd-mm-yyyy'), '29', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (287, 'Murray Bradford', to_date('16-09-1979', 'dd-mm-yyyy'), '20', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (288, 'Faye Kenoly', to_date('16-12-1980', 'dd-mm-yyyy'), '25', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (289, 'Allison Creek', to_date('12-03-1982', 'dd-mm-yyyy'), '9', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (290, 'Goldie Rydell', to_date('18-10-1977', 'dd-mm-yyyy'), '18', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (291, 'Elisabeth Braugher', to_date('28-11-1987', 'dd-mm-yyyy'), '7', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (292, 'Lena Cage', to_date('24-06-1975', 'dd-mm-yyyy'), '16', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (293, 'Freddie Astin', to_date('29-03-1994', 'dd-mm-yyyy'), '28', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (294, 'Todd MacLachlan', to_date('24-06-1984', 'dd-mm-yyyy'), '5', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (295, 'Orlando McDowell', to_date('25-04-1986', 'dd-mm-yyyy'), '16', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (296, 'Tzi Rio', to_date('15-07-1987', 'dd-mm-yyyy'), '14', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (297, 'Rascal LaPaglia', to_date('21-09-1985', 'dd-mm-yyyy'), '12', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (298, 'Scarlett Lineback', to_date('02-10-1989', 'dd-mm-yyyy'), '4', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (299, 'Miranda Dunn', to_date('14-02-1996', 'dd-mm-yyyy'), '11', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (300, 'Jason Emmerich', to_date('09-08-1983', 'dd-mm-yyyy'), '16', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (301, 'Edward Hurley', to_date('03-05-1993', 'dd-mm-yyyy'), '7', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (302, 'Andie Iglesias', to_date('22-05-1974', 'dd-mm-yyyy'), '22', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (303, 'Sally Winter', to_date('02-02-1996', 'dd-mm-yyyy'), '18', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (304, 'Alfred Ferrell', to_date('17-06-1970', 'dd-mm-yyyy'), '26', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (305, 'Louise Costner', to_date('26-09-1976', 'dd-mm-yyyy'), '17', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (306, 'Katie Morrison', to_date('29-11-1993', 'dd-mm-yyyy'), '26', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (307, 'Neneh Portman', to_date('12-03-1981', 'dd-mm-yyyy'), '30', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (308, 'Jim Mirren', to_date('09-08-1970', 'dd-mm-yyyy'), '20', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (309, 'Gerald Finn', to_date('12-09-1970', 'dd-mm-yyyy'), '12', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (310, 'Andre Reinhold', to_date('14-01-1978', 'dd-mm-yyyy'), '10', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (311, 'Julio Knight', to_date('06-10-1996', 'dd-mm-yyyy'), '6', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (312, 'Faye Li', to_date('12-12-1984', 'dd-mm-yyyy'), '30', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (313, 'Nicole Michael', to_date('01-11-1981', 'dd-mm-yyyy'), '26', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (314, 'Emilio Stills', to_date('08-10-1971', 'dd-mm-yyyy'), '11', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (315, 'Reese Lofgren', to_date('25-02-1973', 'dd-mm-yyyy'), '10', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (316, 'Don Hopkins', to_date('04-01-1976', 'dd-mm-yyyy'), '24', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (317, 'Sal Darren', to_date('15-10-1983', 'dd-mm-yyyy'), '6', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (318, 'Grace Torn', to_date('10-04-1985', 'dd-mm-yyyy'), '2', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (319, 'Merle Gates', to_date('24-08-1973', 'dd-mm-yyyy'), '12', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (320, 'Cathy Li', to_date('11-06-1972', 'dd-mm-yyyy'), '10', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (321, 'Neve Webb', to_date('13-04-1982', 'dd-mm-yyyy'), '10', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (322, 'Jessica Sartain', to_date('15-01-1977', 'dd-mm-yyyy'), '30', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (323, 'Eric Bacon', to_date('12-10-1975', 'dd-mm-yyyy'), '7', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (324, 'Ramsey Henstridge', to_date('11-03-1983', 'dd-mm-yyyy'), '22', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (325, 'Leon Chestnut', to_date('19-12-1978', 'dd-mm-yyyy'), '12', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (326, 'Mos Stiers', to_date('17-04-1992', 'dd-mm-yyyy'), '24', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (327, 'Mia Griffith', to_date('06-09-1993', 'dd-mm-yyyy'), '26', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (328, 'Rhea Popper', to_date('16-12-1986', 'dd-mm-yyyy'), '8', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (329, 'Martha Shaye', to_date('08-06-1970', 'dd-mm-yyyy'), '13', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (330, 'Mili Duchovny', to_date('10-04-1976', 'dd-mm-yyyy'), '12', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (331, 'Debby Fehr', to_date('17-08-1976', 'dd-mm-yyyy'), '29', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (332, 'Alfie Holland', to_date('01-06-1970', 'dd-mm-yyyy'), '20', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (333, 'Henry Place', to_date('06-05-1976', 'dd-mm-yyyy'), '18', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (334, 'Christmas Houston', to_date('24-05-1989', 'dd-mm-yyyy'), '10', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (335, 'Donal Sorvino', to_date('09-06-1976', 'dd-mm-yyyy'), '25', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (336, 'Ben Chandler', to_date('16-10-1995', 'dd-mm-yyyy'), '6', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (337, 'Minnie Molina', to_date('14-01-1978', 'dd-mm-yyyy'), '22', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (338, 'Teri Adler', to_date('02-10-1998', 'dd-mm-yyyy'), '15', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (339, 'Wade Stuermer', to_date('30-11-1973', 'dd-mm-yyyy'), '19', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (340, 'Chant×? Roy Parnell', to_date('25-03-1986', 'dd-mm-yyyy'), '28', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (341, 'Kurtwood Clooney', to_date('16-07-1986', 'dd-mm-yyyy'), '12', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (342, 'Lindsay Mewes', to_date('12-02-1988', 'dd-mm-yyyy'), '24', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (343, 'Mac Polito', to_date('01-12-1991', 'dd-mm-yyyy'), '18', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (344, 'Gates Eastwood', to_date('18-08-1974', 'dd-mm-yyyy'), '4', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (345, 'Javon Ramirez', to_date('28-05-1986', 'dd-mm-yyyy'), '1', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (346, 'Derrick Goldwyn', to_date('30-10-1995', 'dd-mm-yyyy'), '1', 'CPR');
commit;
prompt 100 records committed...
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (347, 'Chaka Whitmore', to_date('17-04-1990', 'dd-mm-yyyy'), '13', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (348, 'Ricardo Cassidy', to_date('09-04-1979', 'dd-mm-yyyy'), '14', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (349, 'Gabrielle Gagnon', to_date('05-04-1989', 'dd-mm-yyyy'), '24', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (350, 'Carrie-Anne Calle', to_date('24-09-1997', 'dd-mm-yyyy'), '23', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (351, 'Halle Allan', to_date('09-04-1975', 'dd-mm-yyyy'), '2', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (352, 'Nicolas Holeman', to_date('08-01-1997', 'dd-mm-yyyy'), '22', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (353, 'Miriam McFerrin', to_date('20-06-1988', 'dd-mm-yyyy'), '17', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (354, 'Dwight Tyler', to_date('09-08-1979', 'dd-mm-yyyy'), '22', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (355, 'Jamie Randal', to_date('02-07-1983', 'dd-mm-yyyy'), '25', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (356, 'Renee Stevens', to_date('25-05-1982', 'dd-mm-yyyy'), '15', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (357, 'Joy Cruz', to_date('30-10-1973', 'dd-mm-yyyy'), '1', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (358, 'Derek Sisto', to_date('18-02-1981', 'dd-mm-yyyy'), '25', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (359, 'Tara Reiner', to_date('20-05-1998', 'dd-mm-yyyy'), '1', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (360, 'Pete Paymer', to_date('23-03-1988', 'dd-mm-yyyy'), '8', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (361, 'Patricia Jackman', to_date('14-09-1992', 'dd-mm-yyyy'), '22', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (362, 'Leon Heron', to_date('03-01-1991', 'dd-mm-yyyy'), '26', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (363, 'Kid Bracco', to_date('13-11-1983', 'dd-mm-yyyy'), '14', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (364, 'Chalee Brosnan', to_date('04-04-1991', 'dd-mm-yyyy'), '15', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (365, 'Beth Lange', to_date('07-07-1981', 'dd-mm-yyyy'), '14', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (366, 'Wayman Hawthorne', to_date('31-01-1970', 'dd-mm-yyyy'), '29', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (367, 'Joaquim Anderson', to_date('29-04-1988', 'dd-mm-yyyy'), '5', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (368, 'Forest Linney', to_date('07-06-1983', 'dd-mm-yyyy'), '19', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (369, 'Jean-Luc Atkinson', to_date('07-12-1998', 'dd-mm-yyyy'), '2', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (370, 'Sammy Holy', to_date('27-03-1987', 'dd-mm-yyyy'), '19', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (371, 'Cyndi O''Keefe', to_date('21-09-1978', 'dd-mm-yyyy'), '25', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (372, 'Hector Donovan', to_date('02-03-1987', 'dd-mm-yyyy'), '22', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (373, 'Vendetta Streep', to_date('16-10-1999', 'dd-mm-yyyy'), '4', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (374, 'Johnnie Rudd', to_date('07-11-1979', 'dd-mm-yyyy'), '5', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (375, 'Joely Hatosy', to_date('07-09-1972', 'dd-mm-yyyy'), '30', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (376, 'Patricia Richter', to_date('09-05-1990', 'dd-mm-yyyy'), '13', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (377, 'Lee Ammons', to_date('30-12-1975', 'dd-mm-yyyy'), '13', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (378, 'Tom Ifans', to_date('24-07-1978', 'dd-mm-yyyy'), '24', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (379, 'Gates Cusack', to_date('28-08-1993', 'dd-mm-yyyy'), '27', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (380, 'Carrie Chaykin', to_date('03-06-1984', 'dd-mm-yyyy'), '11', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (381, 'Ramsey Brosnan', to_date('12-06-1978', 'dd-mm-yyyy'), '7', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (382, 'Trey Branch', to_date('13-03-1993', 'dd-mm-yyyy'), '25', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (383, 'Sylvester Ponty', to_date('12-10-1981', 'dd-mm-yyyy'), '17', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (384, 'Jody Evett', to_date('17-03-1996', 'dd-mm-yyyy'), '7', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (385, 'Taryn Dunaway', to_date('21-04-1991', 'dd-mm-yyyy'), '25', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (386, 'Kristin Raitt', to_date('12-07-1994', 'dd-mm-yyyy'), '7', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (387, 'Zooey Dawson', to_date('02-09-1980', 'dd-mm-yyyy'), '12', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (388, 'Bebe Pfeiffer', to_date('10-12-1981', 'dd-mm-yyyy'), '8', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (389, 'Leelee Vega', to_date('22-07-1997', 'dd-mm-yyyy'), '11', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (390, 'Randy Crystal', to_date('12-10-1983', 'dd-mm-yyyy'), '18', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (391, 'Ned Church', to_date('25-09-1997', 'dd-mm-yyyy'), '27', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (392, 'Rawlins Dooley', to_date('26-01-1999', 'dd-mm-yyyy'), '19', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (393, 'Vanessa Tinsley', to_date('06-04-1982', 'dd-mm-yyyy'), '1', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (394, 'Shannyn Janney', to_date('09-07-1999', 'dd-mm-yyyy'), '22', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (395, 'Paula Thomson', to_date('09-03-1993', 'dd-mm-yyyy'), '3', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (396, 'Connie Chandler', to_date('22-04-1999', 'dd-mm-yyyy'), '2', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (397, 'Steve Suvari', to_date('18-05-1987', 'dd-mm-yyyy'), '21', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (398, 'Christopher Parker', to_date('19-11-1978', 'dd-mm-yyyy'), '29', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (399, 'Cyndi Malkovich', to_date('08-06-1980', 'dd-mm-yyyy'), '13', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (400, 'Allison Shorter', to_date('28-07-1973', 'dd-mm-yyyy'), '21', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (401, 'Vonda Devine', to_date('02-08-1979', 'dd-mm-yyyy'), '28', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (402, 'Bernard Oates', to_date('14-09-1997', 'dd-mm-yyyy'), '17', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (403, 'Red Ifans', to_date('17-12-1987', 'dd-mm-yyyy'), '19', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (404, 'Gino Skaggs', to_date('06-03-1987', 'dd-mm-yyyy'), '6', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (405, 'Loren Raitt', to_date('18-01-1990', 'dd-mm-yyyy'), '17', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (406, 'Rik McFadden', to_date('26-07-1981', 'dd-mm-yyyy'), '3', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (407, 'Parker Chapman', to_date('17-05-1970', 'dd-mm-yyyy'), '2', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (408, 'Ben Mazar', to_date('08-01-1981', 'dd-mm-yyyy'), '8', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (409, 'Richard Hobson', to_date('11-06-1972', 'dd-mm-yyyy'), '3', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (410, 'Josh Martinez', to_date('02-05-1997', 'dd-mm-yyyy'), '12', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (411, 'Gates Mohr', to_date('28-10-1973', 'dd-mm-yyyy'), '13', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (412, 'Carole Nielsen', to_date('25-01-1972', 'dd-mm-yyyy'), '5', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (413, 'Wesley Tucker', to_date('27-03-1973', 'dd-mm-yyyy'), '15', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (414, 'Christian King', to_date('24-02-1992', 'dd-mm-yyyy'), '17', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (415, 'Clarence Leoni', to_date('05-05-1998', 'dd-mm-yyyy'), '4', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (416, 'Art Farrell', to_date('15-11-1973', 'dd-mm-yyyy'), '9', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (417, 'Carla Weaver', to_date('20-07-1985', 'dd-mm-yyyy'), '19', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (418, 'Loretta Postlethwaite', to_date('17-06-1984', 'dd-mm-yyyy'), '5', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (419, 'Woody Polley', to_date('12-05-1997', 'dd-mm-yyyy'), '8', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (420, 'Andrea Sobieski', to_date('05-07-1985', 'dd-mm-yyyy'), '13', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (421, 'Randy Osment', to_date('10-08-1975', 'dd-mm-yyyy'), '11', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (422, 'Rhea Glenn', to_date('09-02-1979', 'dd-mm-yyyy'), '14', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (423, 'Marie Wainwright', to_date('06-01-1982', 'dd-mm-yyyy'), '8', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (424, 'Kay LaSalle', to_date('25-07-1984', 'dd-mm-yyyy'), '12', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (425, 'Harrison Broderick', to_date('20-01-1978', 'dd-mm-yyyy'), '4', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (426, 'Walter Emmett', to_date('25-12-1995', 'dd-mm-yyyy'), '27', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (427, 'Daryl Peterson', to_date('27-05-1995', 'dd-mm-yyyy'), '21', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (428, 'Aaron Moraz', to_date('05-08-1987', 'dd-mm-yyyy'), '2', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (429, 'Harold Askew', to_date('09-03-1984', 'dd-mm-yyyy'), '1', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (430, 'Dionne Rollins', to_date('26-04-1979', 'dd-mm-yyyy'), '2', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (431, 'Cameron Arden', to_date('03-06-1999', 'dd-mm-yyyy'), '22', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (432, 'Patty Kinski', to_date('30-09-1978', 'dd-mm-yyyy'), '12', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (433, 'Cesar Ticotin', to_date('12-05-1984', 'dd-mm-yyyy'), '14', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (434, 'Victor Hauer', to_date('05-02-1992', 'dd-mm-yyyy'), '24', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (435, 'Petula Rudd', to_date('05-06-1994', 'dd-mm-yyyy'), '7', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (436, 'Coley Carrey', to_date('15-11-1994', 'dd-mm-yyyy'), '21', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (437, 'Thin Mellencamp', to_date('13-08-1993', 'dd-mm-yyyy'), '6', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (438, 'Will Witt', to_date('06-09-1997', 'dd-mm-yyyy'), '4', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (439, 'Jodie Marx', to_date('03-04-1979', 'dd-mm-yyyy'), '4', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (440, 'Lindsay Serbedzija', to_date('18-11-1972', 'dd-mm-yyyy'), '26', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (441, 'Cevin Del Toro', to_date('22-10-1986', 'dd-mm-yyyy'), '7', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (442, 'Azucar McBride', to_date('10-02-1978', 'dd-mm-yyyy'), '12', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (443, 'Emm Duchovny', to_date('03-11-1996', 'dd-mm-yyyy'), '14', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (444, 'Brent Bryson', to_date('25-08-1992', 'dd-mm-yyyy'), '4', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (445, 'Rhea Dayne', to_date('01-04-1977', 'dd-mm-yyyy'), '17', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (446, 'Ving Boyle', to_date('26-02-1976', 'dd-mm-yyyy'), '23', 'Emergency Response');
commit;
prompt 200 records committed...
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (447, 'Alec Trevino', to_date('03-02-1978', 'dd-mm-yyyy'), '11', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (448, 'Gladys McDowell', to_date('20-03-1996', 'dd-mm-yyyy'), '26', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (449, 'Rob Kutcher', to_date('13-03-1970', 'dd-mm-yyyy'), '4', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (450, 'Gaby Diesel', to_date('20-08-1985', 'dd-mm-yyyy'), '11', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (451, 'Alessandro Nelligan', to_date('10-02-1974', 'dd-mm-yyyy'), '28', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (452, 'Anne Atkins', to_date('20-08-1991', 'dd-mm-yyyy'), '22', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (453, 'Meg Frakes', to_date('21-02-1980', 'dd-mm-yyyy'), '11', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (454, 'Busta Ferrer', to_date('30-01-1982', 'dd-mm-yyyy'), '23', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (455, 'Miguel Hopper', to_date('27-06-1994', 'dd-mm-yyyy'), '20', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (456, 'Famke Bandy', to_date('16-02-1987', 'dd-mm-yyyy'), '16', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (457, 'Gwyneth DeGraw', to_date('31-03-1978', 'dd-mm-yyyy'), '5', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (458, 'Henry Conners', to_date('25-02-1973', 'dd-mm-yyyy'), '29', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (459, 'Hector Child', to_date('14-10-1996', 'dd-mm-yyyy'), '21', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (460, 'Shannyn Taha', to_date('24-12-1988', 'dd-mm-yyyy'), '26', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (461, 'Bridget Clooney', to_date('02-12-1973', 'dd-mm-yyyy'), '4', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (462, 'Lila Favreau', to_date('29-12-1985', 'dd-mm-yyyy'), '18', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (463, 'Olympia Harrison', to_date('26-11-1979', 'dd-mm-yyyy'), '18', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (464, 'Chris Sutherland', to_date('02-11-1983', 'dd-mm-yyyy'), '2', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (465, 'Leon Laurie', to_date('13-11-1991', 'dd-mm-yyyy'), '14', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (466, 'Jesse Coltrane', to_date('14-12-1975', 'dd-mm-yyyy'), '6', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (467, 'Richie Knight', to_date('26-05-1991', 'dd-mm-yyyy'), '26', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (468, 'Wesley King', to_date('16-09-1983', 'dd-mm-yyyy'), '18', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (469, 'Warren Vannelli', to_date('12-07-1983', 'dd-mm-yyyy'), '26', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (470, 'Ray Mann', to_date('19-09-1978', 'dd-mm-yyyy'), '29', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (471, 'Barry Crowell', to_date('23-07-1986', 'dd-mm-yyyy'), '16', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (472, 'Connie Brooks', to_date('11-07-1979', 'dd-mm-yyyy'), '12', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (473, 'Sally Brock', to_date('11-05-1989', 'dd-mm-yyyy'), '8', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (474, 'Victor Paymer', to_date('14-06-1995', 'dd-mm-yyyy'), '3', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (475, 'Jose Thomson', to_date('22-03-1994', 'dd-mm-yyyy'), '29', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (476, 'Rory Detmer', to_date('17-06-1986', 'dd-mm-yyyy'), '6', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (477, 'Adina MacIsaac', to_date('25-10-1975', 'dd-mm-yyyy'), '12', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (478, 'Heath Springfield', to_date('14-11-1977', 'dd-mm-yyyy'), '23', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (479, 'Charlie Sweeney', to_date('20-02-1972', 'dd-mm-yyyy'), '3', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (480, 'Ike Guest', to_date('18-10-1981', 'dd-mm-yyyy'), '6', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (481, 'Daryl Levy', to_date('13-06-1978', 'dd-mm-yyyy'), '9', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (482, 'Daryle Manning', to_date('20-11-1987', 'dd-mm-yyyy'), '2', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (483, 'Gabriel Nash', to_date('05-12-1971', 'dd-mm-yyyy'), '28', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (484, 'Javon Porter', to_date('08-09-1993', 'dd-mm-yyyy'), '25', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (485, 'Clay Gray', to_date('18-01-1990', 'dd-mm-yyyy'), '9', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (486, 'Tea Polley', to_date('06-10-1983', 'dd-mm-yyyy'), '27', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (487, 'Crispin Stamp', to_date('13-05-1981', 'dd-mm-yyyy'), '17', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (488, 'Collin Adkins', to_date('09-07-1976', 'dd-mm-yyyy'), '26', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (489, 'Leslie Snipes', to_date('21-03-1970', 'dd-mm-yyyy'), '11', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (490, 'Melanie Schneider', to_date('21-05-1982', 'dd-mm-yyyy'), '13', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (491, 'Saul Mortensen', to_date('03-02-1989', 'dd-mm-yyyy'), '3', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (492, 'Kitty Lyonne', to_date('08-03-1986', 'dd-mm-yyyy'), '15', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (493, 'Minnie Metcalf', to_date('09-04-1970', 'dd-mm-yyyy'), '21', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (494, 'Frances Aaron', to_date('18-08-1974', 'dd-mm-yyyy'), '12', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (495, 'Jeffrey Brock', to_date('18-06-1984', 'dd-mm-yyyy'), '25', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (496, 'Curt Kretschmann', to_date('24-01-1976', 'dd-mm-yyyy'), '13', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (497, 'Marina Gooding', to_date('27-11-1984', 'dd-mm-yyyy'), '14', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (498, 'Angie Keeslar', to_date('23-05-1998', 'dd-mm-yyyy'), '23', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (499, 'Denzel Leto', to_date('12-08-1972', 'dd-mm-yyyy'), '27', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (100, 'Nils Heche', to_date('14-02-1982', 'dd-mm-yyyy'), '16', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (101, 'Jill Mellencamp', to_date('28-04-1976', 'dd-mm-yyyy'), '13', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (102, 'Wallace Heche', to_date('02-05-1971', 'dd-mm-yyyy'), '12', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (103, 'Owen Bryson', to_date('23-06-1990', 'dd-mm-yyyy'), '18', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (104, 'Jose Bonneville', to_date('21-02-1982', 'dd-mm-yyyy'), '24', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (105, 'Sophie Rivers', to_date('30-12-1992', 'dd-mm-yyyy'), '9', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (106, 'Josh Caine', to_date('08-10-1983', 'dd-mm-yyyy'), '12', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (107, 'Taye Bloch', to_date('10-06-1984', 'dd-mm-yyyy'), '30', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (108, 'Johnnie Tempest', to_date('19-08-1989', 'dd-mm-yyyy'), '12', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (109, 'Freddie Shand', to_date('10-02-1999', 'dd-mm-yyyy'), '24', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (110, 'Vin Pony', to_date('06-07-1975', 'dd-mm-yyyy'), '15', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (111, 'Robby Kadison', to_date('26-02-1974', 'dd-mm-yyyy'), '12', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (112, 'Clive Herndon', to_date('08-07-1981', 'dd-mm-yyyy'), '11', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (113, 'Steven Chapman', to_date('06-03-1973', 'dd-mm-yyyy'), '2', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (114, 'Alfie Pullman', to_date('04-10-1996', 'dd-mm-yyyy'), '27', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (115, 'Hank Hurt', to_date('06-02-1987', 'dd-mm-yyyy'), '13', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (116, 'Collective Presley', to_date('07-10-1977', 'dd-mm-yyyy'), '4', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (117, 'Roy Rizzo', to_date('05-10-1980', 'dd-mm-yyyy'), '1', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (118, 'Lupe Hurt', to_date('10-11-1973', 'dd-mm-yyyy'), '24', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (119, 'Kazem Brooke', to_date('19-02-1995', 'dd-mm-yyyy'), '24', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (120, 'Hilary Senior', to_date('09-07-1970', 'dd-mm-yyyy'), '23', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (121, 'Vonda Alexander', to_date('11-07-1998', 'dd-mm-yyyy'), '19', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (122, 'Kitty Diddley', to_date('16-08-1999', 'dd-mm-yyyy'), '15', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (123, 'Mykelti Brosnan', to_date('10-10-1987', 'dd-mm-yyyy'), '23', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (124, 'Isaac Singletary', to_date('30-09-1982', 'dd-mm-yyyy'), '27', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (125, 'Laurence Pressly', to_date('13-04-1979', 'dd-mm-yyyy'), '15', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (126, 'Annette Drive', to_date('11-12-1984', 'dd-mm-yyyy'), '19', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (127, 'Wes Pollak', to_date('08-03-1971', 'dd-mm-yyyy'), '5', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (128, 'Kevin DiCaprio', to_date('07-10-1970', 'dd-mm-yyyy'), '7', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (129, 'Dustin Robards', to_date('14-05-1979', 'dd-mm-yyyy'), '22', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (130, 'Cliff Dern', to_date('21-02-1976', 'dd-mm-yyyy'), '14', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (131, 'Elisabeth Crowell', to_date('01-02-1973', 'dd-mm-yyyy'), '13', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (132, 'Bruce McConaughey', to_date('28-10-1978', 'dd-mm-yyyy'), '14', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (133, 'Oro Love', to_date('08-05-1997', 'dd-mm-yyyy'), '24', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (134, 'Chrissie MacDowell', to_date('06-02-1990', 'dd-mm-yyyy'), '28', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (135, 'Chaka Hanley', to_date('24-03-1991', 'dd-mm-yyyy'), '8', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (136, 'Tori Coburn', to_date('04-08-1971', 'dd-mm-yyyy'), '30', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (137, 'Rosco Palin', to_date('22-05-1990', 'dd-mm-yyyy'), '30', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (138, 'Danny Waits', to_date('21-10-1996', 'dd-mm-yyyy'), '6', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (139, 'Robert Murphy', to_date('22-06-1980', 'dd-mm-yyyy'), '16', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (140, 'Martin Waits', to_date('14-10-1977', 'dd-mm-yyyy'), '5', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (141, 'Jonatha Gray', to_date('10-03-1972', 'dd-mm-yyyy'), '9', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (142, 'Davy Burton', to_date('29-02-1996', 'dd-mm-yyyy'), '24', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (143, 'Catherine Travers', to_date('09-05-1981', 'dd-mm-yyyy'), '29', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (144, 'Caroline Holmes', to_date('10-10-1985', 'dd-mm-yyyy'), '14', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (145, 'Stellan Phillippe', to_date('18-12-1983', 'dd-mm-yyyy'), '10', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (146, 'Glen Harary', to_date('09-10-1993', 'dd-mm-yyyy'), '1', 'Health and Safety');
commit;
prompt 300 records committed...
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (147, 'Joan Gleeson', to_date('21-01-1990', 'dd-mm-yyyy'), '19', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (148, 'David Gill', to_date('16-05-1999', 'dd-mm-yyyy'), '29', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (149, 'Jeffery Coward', to_date('17-04-1977', 'dd-mm-yyyy'), '16', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (150, 'Juliette Broderick', to_date('11-08-1987', 'dd-mm-yyyy'), '9', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (151, 'Sonny McAnally', to_date('15-08-1987', 'dd-mm-yyyy'), '1', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (152, 'Casey Lewis', to_date('26-08-1979', 'dd-mm-yyyy'), '17', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (153, 'Kid Devine', to_date('21-04-1985', 'dd-mm-yyyy'), '9', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (154, 'Azucar Khan', to_date('01-03-1995', 'dd-mm-yyyy'), '29', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (155, 'Cuba Waits', to_date('09-06-1983', 'dd-mm-yyyy'), '17', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (156, 'Tyrone Andrews', to_date('21-01-1976', 'dd-mm-yyyy'), '19', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (157, 'Campbell Day-Lewis', to_date('18-01-1976', 'dd-mm-yyyy'), '10', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (158, 'Ming-Na Vaughan', to_date('26-01-1978', 'dd-mm-yyyy'), '7', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (159, 'Mira Blaine', to_date('04-10-1995', 'dd-mm-yyyy'), '11', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (160, 'Gordie MacPherson', to_date('24-07-1977', 'dd-mm-yyyy'), '9', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (161, 'William Mills', to_date('11-07-1989', 'dd-mm-yyyy'), '1', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (162, 'Lin Flack', to_date('07-10-1978', 'dd-mm-yyyy'), '13', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (163, 'Debbie Mathis', to_date('25-04-1989', 'dd-mm-yyyy'), '5', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (164, 'Shelby Turturro', to_date('15-03-1982', 'dd-mm-yyyy'), '27', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (165, 'Miko Balaban', to_date('20-03-1997', 'dd-mm-yyyy'), '28', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (166, 'Adrien Gertner', to_date('11-03-1981', 'dd-mm-yyyy'), '5', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (167, 'Sara Sinatra', to_date('04-10-1977', 'dd-mm-yyyy'), '17', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (168, 'Merrill Murphy', to_date('18-09-1980', 'dd-mm-yyyy'), '3', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (169, 'Lupe Houston', to_date('26-07-1980', 'dd-mm-yyyy'), '9', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (170, 'Norm Hewitt', to_date('02-02-1975', 'dd-mm-yyyy'), '16', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (171, 'Gina Chung', to_date('11-01-1996', 'dd-mm-yyyy'), '16', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (172, 'Kasey Diddley', to_date('10-08-1977', 'dd-mm-yyyy'), '18', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (173, 'Emerson Mann', to_date('20-04-1982', 'dd-mm-yyyy'), '17', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (174, 'Heather Hawn', to_date('24-11-1990', 'dd-mm-yyyy'), '9', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (175, 'Keith Pantoliano', to_date('05-05-1985', 'dd-mm-yyyy'), '18', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (176, 'Nicholas von Sydow', to_date('30-05-1970', 'dd-mm-yyyy'), '11', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (177, 'Brian Orbit', to_date('29-12-1981', 'dd-mm-yyyy'), '4', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (178, 'Mickey Brandt', to_date('26-10-1999', 'dd-mm-yyyy'), '21', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (179, 'Larry Todd', to_date('10-12-1970', 'dd-mm-yyyy'), '12', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (180, 'Mira Jay', to_date('29-05-1995', 'dd-mm-yyyy'), '8', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (181, 'Curtis Stills', to_date('14-10-1994', 'dd-mm-yyyy'), '14', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (182, 'Buffy Nicks', to_date('11-01-1971', 'dd-mm-yyyy'), '15', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (183, 'Fairuza Posener', to_date('08-04-1990', 'dd-mm-yyyy'), '4', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (184, 'Rascal Evans', to_date('17-08-1995', 'dd-mm-yyyy'), '3', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (185, 'Pablo Pastore', to_date('02-09-1989', 'dd-mm-yyyy'), '12', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (186, 'Fats Starr', to_date('18-08-1995', 'dd-mm-yyyy'), '28', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (187, 'Karon Costello', to_date('15-09-1986', 'dd-mm-yyyy'), '30', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (188, 'Marie Taylor', to_date('11-05-1994', 'dd-mm-yyyy'), '8', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (189, 'Colleen Schreiber', to_date('31-03-1981', 'dd-mm-yyyy'), '26', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (190, 'Lois Goldberg', to_date('28-04-1974', 'dd-mm-yyyy'), '9', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (191, 'Dionne Moody', to_date('23-07-1981', 'dd-mm-yyyy'), '27', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (192, 'Nora Duschel', to_date('02-01-1985', 'dd-mm-yyyy'), '16', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (193, 'Oliver Waite', to_date('28-04-1996', 'dd-mm-yyyy'), '3', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (194, 'Mena Twilley', to_date('13-05-1993', 'dd-mm-yyyy'), '25', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (195, 'Domingo Negbaur', to_date('03-06-1974', 'dd-mm-yyyy'), '5', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (196, 'Jamie Addy', to_date('05-07-1975', 'dd-mm-yyyy'), '9', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (197, 'Maureen Hauer', to_date('04-05-1984', 'dd-mm-yyyy'), '16', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (198, 'Nicky Palin', to_date('25-10-1970', 'dd-mm-yyyy'), '10', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (199, 'Nils Coleman', to_date('30-07-1989', 'dd-mm-yyyy'), '13', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (200, 'Gavin Willard', to_date('10-03-1973', 'dd-mm-yyyy'), '29', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (201, 'Jeanne McNarland', to_date('11-12-1987', 'dd-mm-yyyy'), '20', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (202, 'Sheena O''Donnell', to_date('16-08-1982', 'dd-mm-yyyy'), '27', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (203, 'Seann Parm', to_date('21-08-1973', 'dd-mm-yyyy'), '23', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (204, 'Raul Albright', to_date('21-03-1973', 'dd-mm-yyyy'), '30', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (205, 'Courtney Balaban', to_date('01-09-1997', 'dd-mm-yyyy'), '21', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (206, 'Clea Belles', to_date('01-08-1985', 'dd-mm-yyyy'), '5', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (207, 'Gerald Carlyle', to_date('25-12-1976', 'dd-mm-yyyy'), '3', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (208, 'Whoopi Dutton', to_date('20-07-1991', 'dd-mm-yyyy'), '11', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (209, 'Andy Thomas', to_date('11-02-1972', 'dd-mm-yyyy'), '18', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (210, 'Diamond Ferrell', to_date('07-09-1971', 'dd-mm-yyyy'), '16', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (211, 'Crystal Dupree', to_date('09-04-1979', 'dd-mm-yyyy'), '11', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (212, 'Alicia Downey', to_date('30-07-1980', 'dd-mm-yyyy'), '11', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (213, 'Al Napolitano', to_date('07-07-1972', 'dd-mm-yyyy'), '3', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (214, 'Lesley Malone', to_date('16-11-1975', 'dd-mm-yyyy'), '26', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (215, 'Benjamin Hynde', to_date('25-07-1986', 'dd-mm-yyyy'), '23', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (216, 'Matthew McPherson', to_date('16-04-1983', 'dd-mm-yyyy'), '10', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (217, 'Pablo Goldberg', to_date('27-02-1978', 'dd-mm-yyyy'), '21', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (218, 'Sissy Levin', to_date('27-10-1996', 'dd-mm-yyyy'), '20', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (219, 'Pelvic White', to_date('05-05-1985', 'dd-mm-yyyy'), '12', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (220, 'Leelee Blaine', to_date('15-03-1989', 'dd-mm-yyyy'), '16', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (221, 'Johnnie Harrelson', to_date('16-06-1976', 'dd-mm-yyyy'), '11', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (222, 'Cliff Gano', to_date('13-08-1987', 'dd-mm-yyyy'), '2', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (223, 'First Phoenix', to_date('10-12-1975', 'dd-mm-yyyy'), '30', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (224, 'Andrew Imbruglia', to_date('24-11-1982', 'dd-mm-yyyy'), '3', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (225, 'Lloyd Roundtree', to_date('20-03-1999', 'dd-mm-yyyy'), '7', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (226, 'Don Curfman', to_date('08-01-1991', 'dd-mm-yyyy'), '23', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (227, 'Juan Hiatt', to_date('28-08-1985', 'dd-mm-yyyy'), '10', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (228, 'Jody Cotton', to_date('15-05-1993', 'dd-mm-yyyy'), '10', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (229, 'Kyra Jenkins', to_date('11-11-1993', 'dd-mm-yyyy'), '26', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (230, 'Rick Broderick', to_date('15-04-1991', 'dd-mm-yyyy'), '21', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (231, 'Whoopi Apple', to_date('26-02-1999', 'dd-mm-yyyy'), '20', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (232, 'Ice Connick', to_date('08-01-1990', 'dd-mm-yyyy'), '8', 'Pediatric Care''''Disaster Manag');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (233, 'Sara Campbell', to_date('27-02-1996', 'dd-mm-yyyy'), '20', 'First Aid');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (234, 'Loreena Diddley', to_date('06-01-1992', 'dd-mm-yyyy'), '18', 'Health and Safety');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (235, 'Rolando Weisz', to_date('20-04-1991', 'dd-mm-yyyy'), '17', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (236, 'Leon Preston', to_date('29-07-1988', 'dd-mm-yyyy'), '5', 'Emergency Response');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (237, 'Miriam Knight', to_date('28-03-1998', 'dd-mm-yyyy'), '21', 'CPR');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (238, 'Chet Rea', to_date('05-03-1997', 'dd-mm-yyyy'), '4', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (239, 'Sylvester Blackmore', to_date('14-02-1985', 'dd-mm-yyyy'), '22', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (240, 'Elizabeth Plummer', to_date('02-09-1987', 'dd-mm-yyyy'), '1', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (241, 'Tyrone Borden', to_date('20-05-1993', 'dd-mm-yyyy'), '20', 'Medical');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (242, 'Ahmad Gambon', to_date('27-09-1999', 'dd-mm-yyyy'), '15', 'Trauma Care');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (243, 'Malcolm Root', to_date('14-01-1975', 'dd-mm-yyyy'), '8', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (244, 'Neil Rhames', to_date('08-06-1994', 'dd-mm-yyyy'), '21', 'Infection Control');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (245, 'Eileen Suvari', to_date('24-06-1996', 'dd-mm-yyyy'), '3', 'Advanced Life Support');
insert into LECTURERS (l_id, l_name, l_date, seniority, training)
values (246, 'Eugene Visnjic', to_date('04-01-1970', 'dd-mm-yyyy'), '28', 'Infection Control');
commit;
prompt 400 records loaded
prompt Loading LOCATION...
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999092, 'Shosanim 100, NY', 'permission from organization head', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999095, '36 Josh Ave', 'permission from chief security officer', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999096, '965 Matarazzo Road', 'permission from organization head', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999097, '80 Howard Road', 'permission from chief security officer', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999098, '89 Chalee Street', 'permission from organization head', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999099, '51 Heath Road', 'permission from organization head', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999100, '75 Wetzlar', 'permission from manager', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999101, '732 Cozier Road', 'permission from security', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999102, '93 Sao roque Street', 'permission from security', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999103, '37 Lionel Ave', 'permission from manager', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999104, '60 Tambor Road', 'permission from manager', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999106, '82 Van Helden Drive', 'permission from security', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999107, '4 Haggard Blvd', 'permission from security', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999108, '5 Porto alegre Road', 'permission from security', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999109, '30 Schaumburg Blvd', 'permission from security', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999110, '851 Avalon Road', 'permission from security', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999111, '16 Tinsley Street', 'permission from manager', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999112, '1 Miles Street', 'permission from security', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999114, '8 Vincent Blvd', 'permission from manager', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999116, '38 Padova', 'permission from manager', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999117, '89 Chandler Ave', 'permission from security', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999118, '48 Astin Road', 'permission from security', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999119, '8 West Launceston Street', 'permission from security', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999120, '75 Dempsey Road', 'permission from security', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999121, '87 Aniston Street', 'permission from manager', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999122, '50 Arlington', 'permission from security', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999123, '577 Traralgon Road', 'permission from security', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999124, '886 Huston Drive', 'permission from security', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999125, '724 Cassidy', 'permission from security', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999126, '91 Carla Road', 'permission from security', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999127, '41 Angelina', 'permission from manager', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999128, '30 Head Drive', 'permission from manager', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999129, '71 Keitel Blvd', 'permission from security', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999132, '22 Manaus Ave', 'permission from manager', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999133, '23rd Street', 'permission from security', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999134, '61 Keeslar Street', 'permission from manager', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999136, '17 Grand Rapids', 'permission from manager', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999137, '61 Bingham Farms Street', 'permission from manager', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999138, '70 Benicio Street', 'permission from manager', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999139, '42 Frampton Drive', 'permission from manager', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999140, '18 Cuba Street', 'permission from security', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999141, '245 Shand Road', 'permission from security', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999143, '523 Bale Road', 'permission from manager', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999144, '535 Indianapolis', 'permission from security', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999146, '18 Richie', 'permission from manager', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999148, '35 Sinatra Drive', 'permission from security', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999150, '679 Lapointe Ave', 'permission from manager', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999153, '5 Linney Road', 'permission from security', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999154, '82nd Street', 'permission from manager', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999155, '32nd Street', 'permission from security', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999156, '30 Vendetta Blvd', 'permission from manager', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999157, '38 Kenoly Street', 'permission from security', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999160, '90 Llewelyn Drive', 'permission from manager', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999163, '63rd Street', 'permission from security', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999165, '626 Carlingford Drive', 'permission from security', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999167, '99 Lila Drive', 'permission from manager', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999168, '22 Zagreb Ave', 'permission from manager', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999170, '70 Nathan Ave', 'permission from security', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999172, '491 Miki Drive', 'permission from security', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999174, '84 Cochran Drive', 'permission from security', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999175, '97 Jaime Street', 'permission from security', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999176, '676 Janeane Ave', 'permission from manager', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999177, '88 Dermot Ave', 'permission from manager', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999178, '87 Eileen Street', 'permission from manager', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999180, '17 Breslin', 'permission from security', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999182, '49 Trejo Ave', 'permission from security', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999183, '45 Kid', 'permission from security', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999185, '86 Elijah', 'permission from manager', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999186, '82 Gryner Blvd', 'permission from manager', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999191, '78 Chapeco', 'permission from manager', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999192, '96 Naha Street', 'permission from manager', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999193, '23 Haysbert Drive', 'permission from manager', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999194, '904 Brothers', 'permission from manager', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999195, '2 Olin Drive', 'permission from manager', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999196, '93 North Yorkshire Street', 'permission from security', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999197, '35 Sedaka Blvd', 'permission from security', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999198, '25 Nicosia Road', 'permission from security', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999199, '86 Borgnine Street', 'permission from manager', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999200, '92 Wehrheim Blvd', 'permission from organization head', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999201, '23 Boothe Road', 'permission from organization head', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999202, '25 Puckett Street', 'ID is required', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999205, '99 Tualatin Drive', 'ID is required', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999206, '80 Chely Road', 'permission from organization head', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999207, '86 Pleasure Drive', 'ID is required', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999208, '31st Street', 'permission from organization head', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999210, '45 Bend Street', 'permission from organization head', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999211, '776 Hawke', 'ID is required', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999212, '83 Duchovny Drive', 'permission from organization head', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999213, '93 Gibbons Road', 'permission from organization head', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999215, '72 Schneider Road', 'ID is required', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999216, '74 Owen Drive', 'ID is required', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999217, '76 Browne Road', 'permission from organization head', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999218, '52nd Street', 'permission from organization head', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999220, '134 Zuerich Street', 'ID is required', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999222, '59 Moraz Street', 'ID is required', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999223, '21 Elias Blvd', 'ID is required', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999225, '99 Carson City', 'permission from organization head', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999227, '89 Gatlin Ave', 'ID is required', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999228, '21st Street', 'permission from organization head', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999229, '62 Concordville Drive', 'permission from organization head', 0);
commit;
prompt 100 records committed...
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999230, '9 Barry Street', 'permission from organization head', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999231, '55 Dysart Street', 'permission from organization head', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999232, '74 Vaughn Drive', 'permission from organization head', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999233, '89 Luzern Street', 'permission from organization head', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999800, 'heretz 9', 'permission from chief security officer', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999235, '59 O''fallon Drive', 'permission from organization head', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999801, 'Yosef 19', 'permission from organization head', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999900, 'Yosef 50', 'permission from security', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999238, '17 Seth Blvd', 'permission from organization head', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999901, 'Moshe 30', 'permission from security', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999240, '667 Holts Summit Road', 'permission from organization head', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999241, '100 Ripley Drive', 'ID is required', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999242, '11 Belle Street', 'ID is required', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999243, '35 Annie Road', 'ID is required', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999244, '154 Madonna Road', 'permission from organization head', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999245, '73rd Street', 'ID is required', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999246, '729 Drogenbos Street', 'ID is required', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999248, '63 Johnson Blvd', 'permission from organization head', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999249, '52 Matt Street', 'ID is required', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999250, '97 Crete Road', 'ID is required', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999251, '20 Apple', 'permission from organization head', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999252, '42 Port Macquarie Road', 'ID is required', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999253, '58 Frances Road', 'ID is required', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (541234567, '123 Herzl St', ' premisson from manager', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (543456789, '789 Dizengoff St', ' premisson from supervisor', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (544567890, '101 Allenby St', ' premisson from building owner', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (545678901, '202 Jaffa Rd', ' premisson from tenant', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (546789012, '303 Ben Yehuda St', ' premisson from landlord', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (548901234, '505 Ibn Gvirol St', ' premisson from property manager', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (541098765, '808 HaNeviim St', ' premisson from site manager', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (543098765, '111 Weizmann St', ' premisson from department head', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (544098765, '222 Begin Blvd', ' premisson from company', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (545098765, '333 Yefet St', ' premisson from local authorities', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (546098765, '444 Derech Hashalom', ' premisson from neighborhood committee', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (547098765, '555 Agron St', ' premisson from site coordinator', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (549098765, '777 Jabotinsky St', ' premisson from organization head', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999254, '80 Wincott Blvd', 'ID is required', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999050, '872 Marina Street', 'permission from organization head', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999051, '33rd Street', 'permission from chief security officer', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999052, '799 Neill Street', 'permission from chief security officer', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999054, '196 Rosanna Road', 'permission from chief security officer', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999055, '1 Whitman Road', 'permission from organization head', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999058, '95 Caan', 'permission from organization head', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999060, '19 Keeslar Blvd', 'permission from chief security officer', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999061, '51 Wakayama Road', 'permission from organization head', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999062, '94 Augst Drive', 'permission from organization head', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999064, '73rd Street', 'permission from chief security officer', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999065, '65 Emmerich', 'permission from organization head', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999067, '43 Pitney Road', 'permission from organization head', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999068, '91st Street', 'permission from organization head', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999070, '636 Dallas Road', 'permission from chief security officer', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999071, '54 Dabney Road', 'permission from organization head', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999072, '1 Betty Road', 'permission from organization head', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999073, '92 Andrew Street', 'permission from organization head', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999074, '22 Eugene Blvd', 'permission from chief security officer', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999075, '16 Crudup Drive', 'permission from chief security officer', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999076, '56 Longueuil Road', 'permission from chief security officer', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999078, '883 Oshkosh Road', 'permission from organization head', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999080, '25 Worrell Blvd', 'permission from organization head', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999081, '80 Hughes Road', 'permission from chief security officer', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999082, '13 George Drive', 'permission from chief security officer', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999083, '50 Santana', 'permission from organization head', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999085, '52 Key Biscayne Drive', 'permission from organization head', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999087, '13rd Street', 'permission from chief security officer', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999088, '11 Stephanie Street', 'permission from organization head', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999089, '7 Terence Drive', 'permission from chief security officer', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999090, '80 Grier Drive', 'permission from chief security officer', 768);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999091, '34 Coltrane Drive', 'permission from chief security officer', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999256, '89 Varzea grande Street', 'ID is required', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999258, '96 Oakenfold Drive', 'ID is required', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999260, '27 Moreno Road', 'permission from organization head', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999261, '31 Ruiz Road', 'permission from organization head', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999262, '340 Lakewood Road', 'ID is required', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999263, '66 Gagnon Street', 'permission from organization head', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999265, '759 Rowan Street', 'permission from organization head', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999266, '8 Arquette Street', 'ID is required', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999268, '49 Guy Ave', 'permission from organization head', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999269, '11 Susan Ave', 'permission from organization head', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999270, '3 Tramaine Street', 'permission from organization head', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999271, '48 Nikka Blvd', 'ID is required', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999273, '60 Livermore Street', 'ID is required', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999274, '91 Gabriel Drive', 'ID is required', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999278, '610 Hannah', 'ID is required', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999279, '96 Getty Ave', 'ID is required', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999280, '11 Choice Blvd', 'ID is required', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999281, '51 Seoul Drive', 'ID is required', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999285, '831 David Road', 'ID is required', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999288, '49 Paquin Drive', 'permission from organization head', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999290, '64 Duisburg Street', 'ID is required', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999291, '289 Tilda Ave', 'ID is required', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999293, '418 Cooper Road', 'ID is required', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999294, '82 Vega Road', 'ID is required', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999296, '83 Pepper Street', 'permission from organization head', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999298, '60 Hawn Blvd', 'permission from organization head', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999299, '67 Los Angeles Blvd', 'ID is required', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999300, '85 Day-Lewis Blvd', 'permission from building owner', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999301, '65 McDowall', '''permission from tenant', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999303, '79 Pointe-claire', '''permission from tenant', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999304, '31 Friedrichshafe Road', 'permission from building owner', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999305, '361 El Paso Road', 'permission from building owner', 1000);
commit;
prompt 200 records committed...
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999306, '96 Cheadle Drive', 'permission from building owner', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999310, '51 Clarence Road', '''permission from tenant', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999312, '521 Rhames Road', 'permission from building owner', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999313, '99 Wilder Drive', 'permission from building owner', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999315, '89 Santiago Street', 'permission from building owner', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999316, '14 Melanie', '''permission from tenant', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999317, '73rd Street', 'permission from building owner', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999319, '45 Spall Street', 'permission from building owner', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999321, '527 Ethan Street', 'permission from building owner', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999322, '520 Li Road', 'permission from building owner', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999323, '78 McGriff', 'permission from building owner', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999325, '98 Hoskins Drive', '''permission from tenant', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999326, '8 Ceasar Drive', '''permission from tenant', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999330, '39 Spring City Road', '''permission from tenant', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999331, '91 Bassett Road', '''permission from tenant', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999333, '85 Seann Road', '''permission from tenant', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999334, '63rd Street', '''permission from tenant', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999335, '64 Bogguss Street', '''permission from tenant', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999337, '23rd Street', 'permission from building owner', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999339, '60 Charlize Road', 'permission from building owner', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999340, '488 Yavne Street', 'permission from building owner', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999341, '95 Merillee Road', '''permission from tenant', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999342, '29 Saint Paul Street', 'permission from building owner', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999357, '97 Leipzig Drive', '''permission from tenant', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999358, '73rd Street', '''permission from tenant', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999359, '2 Washington Blvd', 'permission from building owner', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999360, '77 Corona Street', 'permission from building owner', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999361, '19 Ferraz  vasconcelos Street', 'permission from building owner', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999362, '75 Hong Kong Street', 'permission from building owner', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999363, '1 Beck Road', 'permission from building owner', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999364, '68 Carrack', 'permission from building owner', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999343, '44 Bryson Ave', '''permission from tenant', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999345, '301 Lynne Drive', 'permission from building owner', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999346, '33 Hampton Drive', '''permission from tenant', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999347, '48 Holts Summit', 'permission from building owner', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999349, '98 Issaquah', '''permission from tenant', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999350, '53 Joinville Ave', 'permission from building owner', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999351, '18 Wolf Road', '''permission from tenant', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999352, '82 Nicole Drive', '''permission from tenant', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999353, '36 B?nes Road', '''permission from tenant', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999354, '38 Davison Road', '''permission from tenant', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999369, '43rd Street', '''permission from tenant', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999370, '371 Rod Drive', 'permission from building owner', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999373, '6 Cuba Street', '''permission from tenant', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999374, '22 Gdansk Drive', '''permission from tenant', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999375, '74 Nyn?shamn Road', 'permission from building owner', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999377, '71 Jim Blvd', 'permission from building owner', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999378, '12 Patrick Road', 'permission from building owner', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999379, '81 Nielsen Street', '''permission from tenant', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999380, '28 Victoria Drive', '''permission from tenant', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999381, '49 Miami Drive', 'permission from building owner', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999382, '26 Amarillo Street', '''permission from tenant', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999383, '40 Reykjavik Road', 'permission from building owner', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999384, '783 Barbara Road', '''permission from tenant', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999385, '267 Westerberg Blvd', 'permission from building owner', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999389, '99 Robby Street', '''permission from tenant', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999000, '38 Tilly Drive', '"permission from facility manager"', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999001, '26 Gunton Street', '"permission from tenant"', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999002, '31st Street', 'permission from organization head', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999003, '758 Bryan Street', 'permission from chief security officer', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999004, '29 Tlalpan Street', 'permission from organization head', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999006, '6 Pasadena', 'permission from chief security officer', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999007, '242 Lavigne Street', 'permission from organization head', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999008, '32 Peter Road', 'permission from organization head', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999009, '32 Newton-le-willows Road', 'permission from organization head', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999010, '73 Bellevue Road', 'permission from chief security officer', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999011, '64 Phillippe Drive', 'permission from organization head', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999012, '95 Quinn Road', 'permission from chief security officer', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999013, '16 Yolanda Blvd', 'permission from chief security officer', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999014, '8 Hayes', 'permission from chief security officer', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999015, '35 Gambon Street', 'permission from chief security officer', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999016, '994 Wesley Road', 'permission from organization head', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999018, '82 Hawke Drive', 'permission from organization head', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999019, '79 Warrington Drive', 'permission from chief security officer', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999020, '79 Domingo Drive', 'permission from organization head', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999021, '83rd Street', 'permission from organization head', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999022, '7 Aracruz Road', 'permission from organization head', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999023, '18 Darren Street', 'permission from chief security officer', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999025, '60 Roberts Ave', 'permission from organization head', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999027, '72 Rosas Street', 'permission from chief security officer', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999028, '21 Peterson Road', 'permission from chief security officer', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999029, '430 Carlton Drive', 'permission from organization head', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999030, '14 Day Street', 'permission from chief security officer', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999031, '42nd Street', 'permission from chief security officer', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999032, '42 Trieste Drive', 'permission from chief security officer', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999033, '74 Day Ave', 'permission from chief security officer', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999035, '71st Street', 'permission from chief security officer', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999036, '80 Calcutta Blvd', 'permission from chief security officer', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999037, '4 Patrick Blvd', 'permission from chief security officer', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999039, '79 Kenoly Ave', 'permission from organization head', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999043, '89 Burns Road', 'permission from chief security officer', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999044, '10 Sizemore Road', 'permission from organization head', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999045, '87 Schlieren Blvd', 'permission from chief security officer', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999046, '7 Johansson Drive', 'permission from organization head', 1000);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999049, '18 Wayman Street', 'permission from chief security officer', 1000);
commit;
prompt 295 records loaded
prompt Loading ROOM...
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (150, 79, 'Conference Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (166, 31, 'Auditorium', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (167, 66, 'Workshop Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (168, 51, 'Auditorium', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (169, 100, 'Seminar Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (170, 73, 'Auditorium', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (171, 100, 'Training Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (172, 72, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (173, 75, 'Conference Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (174, 32, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (175, 46, 'Discussion Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (176, 39, 'Discussion Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (177, 75, 'Lecture Hall', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (178, 59, 'Conference Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (179, 39, 'Discussion Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (180, 34, 'Workshop Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (181, 91, 'Lecture Hall', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (182, 99, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (183, 93, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (184, 50, 'Discussion Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (185, 82, 'Conference Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (186, 63, 'Training Center', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (187, 66, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (188, 30, 'Seminar Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (189, 76, 'Seminar Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (190, 73, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (191, 41, 'Workshop Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (192, 34, 'Lecture Hall', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (193, 60, 'Discussion Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (194, 65, 'Training Center', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (195, 75, 'Lecture Hall', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (196, 59, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (197, 81, 'Discussion Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (198, 36, 'Training Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (199, 89, 'Training Center', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (200, 73, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (201, 64, 'Workshop Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (202, 71, 'Lecture Hall', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (203, 39, 'Seminar Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (204, 42, 'Lecture Hall', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (205, 58, 'Discussion Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (206, 96, 'Workshop Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (207, 91, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (208, 33, 'Conference Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (209, 53, 'Workshop Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (210, 45, 'Seminar Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (211, 83, 'Discussion Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (212, 34, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (213, 80, 'Workshop Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (214, 37, 'Discussion Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (215, 54, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (216, 52, 'Workshop Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (217, 31, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (218, 49, 'Conference Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (219, 60, 'Seminar Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (220, 80, 'Training Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (221, 47, 'Lecture Hall', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (222, 93, 'Seminar Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (223, 65, 'Conference Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (224, 50, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (225, 49, 'Conference Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (226, 30, 'Training Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (227, 43, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (228, 80, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (229, 52, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (230, 31, 'Training Center', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (231, 79, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (232, 79, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (233, 59, 'Conference Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (234, 36, 'Auditorium', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (235, 46, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (236, 63, 'Seminar Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (237, 87, 'Discussion Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (238, 72, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (239, 62, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (240, 42, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (241, 60, 'Training Center', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (242, 70, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (243, 93, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (244, 53, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (245, 51, 'Training Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (246, 38, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (247, 59, 'Seminar Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (248, 48, 'Seminar Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (249, 98, 'Conference Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (250, 92, 'Auditorium', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (251, 75, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (252, 67, 'Lecture Hall', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (253, 98, 'Lecture Hall', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (254, 62, 'Conference Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (255, 57, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (256, 56, 'Training Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (257, 47, 'Auditorium', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (258, 89, 'Lecture Hall', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (259, 36, 'Discussion Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (260, 41, 'Lecture Hall', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (261, 75, 'Seminar Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (262, 92, 'Discussion Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (263, 50, 'Auditorium', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (264, 88, 'Workshop Room', null);
commit;
prompt 100 records committed...
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (265, 45, 'Discussion Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (266, 78, 'Training Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (267, 100, 'Training Center', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (268, 48, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (269, 86, 'Discussion Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (270, 35, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (271, 43, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (272, 87, 'Discussion Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (273, 57, 'Workshop Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (274, 31, 'Workshop Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (275, 46, 'Discussion Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (276, 78, 'Workshop Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (277, 70, 'Training Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (278, 36, 'Training Center', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (279, 52, 'Training Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (280, 59, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (281, 99, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (282, 90, 'Seminar Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (283, 90, 'Auditorium', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (284, 47, 'Lecture Hall', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (285, 80, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (286, 55, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (287, 30, 'Auditorium', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (288, 74, 'Lecture Hall', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (289, 86, 'Training Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (290, 69, 'Training Center', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (291, 32, 'Auditorium', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (292, 73, 'Training Center', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (293, 72, 'Seminar Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (294, 81, 'Auditorium', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (295, 84, 'Training Center', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (296, 52, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (297, 51, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (298, 95, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (299, 35, 'Training Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (300, 54, 'Lecture Hall', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (301, 50, 'Auditorium', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (302, 59, 'Workshop Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (303, 47, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (304, 47, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (305, 74, 'Discussion Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (306, 39, 'Auditorium', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (307, 61, 'Lecture Hall', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (308, 95, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (309, 62, 'Lecture Hall', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (310, 34, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (311, 43, 'Seminar Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (312, 35, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (313, 65, 'Auditorium', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (314, 82, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (315, 82, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (316, 77, 'Training Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (317, 60, 'Auditorium', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (318, 76, 'Workshop Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (319, 68, 'Auditorium', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (320, 54, 'Seminar Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (321, 53, 'Discussion Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (322, 79, 'Seminar Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (323, 79, 'Seminar Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (324, 89, 'Auditorium', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (325, 40, 'Seminar Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (326, 72, 'Conference Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (327, 54, 'Training Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (328, 64, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (329, 39, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (330, 54, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (331, 42, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (332, 69, 'Conference Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (333, 46, 'Auditorium', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (334, 78, 'Discussion Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (335, 86, 'Auditorium', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (336, 87, 'Conference Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (337, 70, 'Workshop Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (338, 61, 'Lecture Hall', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (339, 45, 'Training Center', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (340, 90, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (341, 93, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (342, 36, 'Lecture Hall', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (343, 47, 'Lecture Hall', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (344, 69, 'Discussion Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (345, 99, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (346, 36, 'Auditorium', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (347, 99, 'Auditorium', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (348, 73, 'Training Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (349, 33, 'Auditorium', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (350, 57, 'Lecture Hall', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (351, 42, 'Training Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (352, 88, 'Seminar Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (353, 50, 'Auditorium', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (354, 88, 'Training Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (355, 82, 'Discussion Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (356, 76, 'Seminar Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (357, 44, 'Workshop Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (358, 69, 'Conference Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (359, 42, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (360, 73, 'Lecture Hall', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (361, 37, 'Training Center', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (362, 67, 'Auditorium', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (363, 98, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (364, 78, 'Classroom', null);
commit;
prompt 200 records committed...
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (365, 66, 'Auditorium', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (366, 95, 'Conference Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (367, 32, 'Training Center', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (368, 86, 'Training Center', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (369, 76, 'Auditorium', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (370, 66, 'Training Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (371, 45, 'Training Center', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (372, 48, 'Seminar Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (373, 87, 'Conference Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (374, 46, 'Workshop Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (375, 76, 'Auditorium', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (376, 42, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (377, 87, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (378, 63, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (379, 46, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (380, 91, 'Auditorium', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (381, 65, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (382, 75, 'Training Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (383, 34, 'Lecture Hall', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (384, 57, 'Workshop Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (385, 37, 'Seminar Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (386, 64, 'Seminar Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (387, 91, 'Seminar Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (388, 92, 'Lecture Hall', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (389, 79, 'Workshop Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (390, 75, 'Discussion Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (391, 62, 'Auditorium', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (392, 31, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (393, 77, 'Training Center', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (394, 30, 'Training Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (395, 38, 'Training Center', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (396, 67, 'Conference Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (397, 37, 'Training Center', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (398, 42, 'Lecture Hall', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (399, 40, 'Seminar Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (400, 66, 'Lecture Hall', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (151, 94, 'Conference Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (152, 91, 'Training Center', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (153, 78, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (154, 95, 'Discussion Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (155, 47, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (156, 71, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (157, 47, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (158, 69, 'Workshop Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (159, 44, 'Training Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (160, 56, 'Training Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (161, 50, 'Workshop Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (162, 83, 'Workshop Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (163, 84, 'Conference Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (164, 65, 'Lecture Hall', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (165, 94, 'Workshop Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (1, 63, 'Conference Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (2, 39, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (3, 85, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (4, 54, 'Auditorium', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (5, 42, 'Discussion Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (6, 83, 'Training Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (7, 84, 'Conference Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (8, 54, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (9, 32, 'Workshop Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (10, 49, 'Seminar Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (11, 38, 'Discussion Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (12, 98, 'Lecture Hall', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (13, 100, 'Seminar Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (14, 95, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (15, 48, 'Workshop Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (16, 98, 'Discussion Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (17, 62, 'Seminar Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (18, 38, 'Discussion Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (19, 98, 'Auditorium', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (20, 31, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (21, 62, 'Workshop Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (22, 91, 'Lecture Hall', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (23, 92, 'Workshop Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (24, 34, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (25, 34, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (26, 43, 'Auditorium', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (27, 90, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (28, 86, 'Training Center', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (29, 88, 'Training Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (30, 69, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (31, 64, 'Seminar Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (32, 37, 'Lecture Hall', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (33, 43, 'Discussion Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (34, 55, 'Training Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (35, 62, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (36, 63, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (37, 99, 'Training Center', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (38, 52, 'Lecture Hall', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (39, 34, 'Lecture Hall', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (40, 63, 'Seminar Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (41, 86, 'Training Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (42, 94, 'Auditorium', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (43, 71, 'Workshop Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (44, 39, 'Training Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (45, 63, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (46, 91, 'Discussion Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (47, 84, 'Training Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (48, 60, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (49, 64, 'Discussion Room', null);
commit;
prompt 300 records committed...
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (50, 67, 'Auditorium', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (51, 44, 'Conference Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (52, 80, 'Workshop Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (53, 63, 'Discussion Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (54, 54, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (55, 90, 'Seminar Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (56, 39, 'Conference Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (57, 67, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (58, 48, 'Lecture Hall', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (59, 58, 'Lecture Hall', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (60, 35, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (61, 86, 'Workshop Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (62, 46, 'Discussion Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (63, 83, 'Training Center', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (64, 73, 'Conference Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (65, 87, 'Auditorium', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (66, 71, 'Conference Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (67, 59, 'Conference Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (68, 97, 'Lecture Hall', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (69, 95, 'Discussion Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (70, 62, 'Training Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (71, 30, 'Training Center', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (72, 88, 'Training Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (73, 89, 'Auditorium', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (74, 52, 'Conference Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (75, 74, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (76, 99, 'Workshop Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (77, 96, 'Seminar Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (78, 51, 'Workshop Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (79, 53, 'Training Center', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (80, 70, 'Training Center', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (81, 86, 'Training Center', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (82, 80, 'Discussion Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (83, 69, 'Seminar Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (84, 76, 'Discussion Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (85, 71, 'Workshop Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (86, 60, 'Discussion Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (87, 70, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (88, 71, 'Workshop Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (89, 65, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (90, 56, 'Training Center', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (91, 91, 'Seminar Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (92, 60, 'Discussion Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (93, 47, 'Workshop Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (94, 95, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (95, 77, 'Seminar Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (96, 62, 'Training Center', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (97, 58, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (98, 54, 'Training Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (99, 54, 'Training Center', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (100, 70, 'Auditorium', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (101, 96, 'Conference Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (102, 48, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (103, 85, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (104, 80, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (105, 72, 'Workshop Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (106, 32, 'Training Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (107, 95, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (108, 50, 'Training Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (109, 53, 'Lecture Hall', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (110, 48, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (111, 40, 'Workshop Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (112, 79, 'Conference Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (113, 87, 'Lecture Hall', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (114, 44, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (115, 80, 'Training Center', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (116, 77, 'Conference Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (117, 82, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (118, 43, 'Conference Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (119, 43, 'Auditorium', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (120, 81, 'Discussion Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (121, 59, 'Conference Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (122, 35, 'Computer Lab', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (123, 94, 'Lecture Hall', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (124, 77, 'Training Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (125, 35, 'Conference Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (126, 78, 'Seminar Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (127, 60, 'Lecture Hall', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (128, 97, 'Conference Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (129, 60, 'Training Center', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (130, 46, 'Conference Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (131, 93, 'Auditorium', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (132, 41, 'Auditorium', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (133, 98, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (134, 83, 'Conference Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (135, 69, 'Discussion Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (136, 60, 'Training Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (137, 65, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (138, 73, 'Training Center', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (139, 41, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (140, 93, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (141, 72, 'Auditorium', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (142, 88, 'Discussion Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (143, 57, 'Workshop Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (144, 38, 'Seminar Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (145, 96, 'Workshop Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (146, 72, 'Training Center', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (147, 54, 'Classroom', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (148, 67, 'Seminar Room', null);
insert into ROOM (r_id, numplace, r_type, phonenumber)
values (149, 90, 'Seminar Room', null);
commit;
prompt 400 records loaded
prompt Loading STUDENTSGROUP...
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (251, 69, 18, 3, 364, 71, 436);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (252, 55, 20, 5, 49, 332, 254);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (253, 83, 20, 3, 158, 14, 249);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (254, 71, 16, 4, 169, 180, 482);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (255, 43, 14, 2, 368, 135, 194);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (256, 62, 18, 2, 256, 110, 358);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (257, 89, 14, 4, 123, 139, 395);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (258, 81, 13, 4, 343, 45, 385);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (259, 47, 13, 5, 281, 351, 352);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (260, 91, 16, 1, 347, 313, 428);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (261, 92, 12, 1, 89, 342, 309);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (262, 100, 19, 5, 369, 280, 125);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (263, 60, 11, 1, 310, 290, 271);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (264, 58, 19, 2, 92, 63, 245);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (265, 44, 12, 5, 296, 72, 102);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (266, 73, 14, 5, 203, 356, 283);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (267, 53, 16, 3, 192, 2, 235);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (268, 32, 10, 5, 70, 355, 473);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (269, 44, 8, 1, 347, 21, 233);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (270, 84, 15, 1, 11, 209, 493);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (271, 81, 13, 1, 117, 231, 115);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (272, 36, 9, 3, 175, 176, 454);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (273, 88, 19, 1, 343, 205, 296);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (274, 57, 12, 2, 183, 323, 246);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (275, 81, 13, 5, 276, 151, 463);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (276, 100, 14, 5, 140, 345, 228);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (277, 85, 16, 1, 246, 360, 218);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (278, 35, 8, 5, 173, 336, 332);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (279, 80, 20, 5, 235, 229, 425);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (280, 44, 19, 4, 97, 289, 385);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (281, 84, 10, 1, 262, 270, 289);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (282, 74, 19, 4, 171, 171, 497);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (283, 35, 19, 3, 131, 216, 489);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (284, 59, 9, 1, 351, 130, 135);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (285, 46, 16, 5, 252, 18, 418);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (286, 71, 8, 2, 386, 95, 127);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (287, 85, 11, 3, 94, 258, 442);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (288, 45, 10, 2, 385, 114, 406);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (289, 45, 11, 3, 167, 162, 212);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (290, 46, 13, 5, 372, 102, 360);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (291, 83, 10, 5, 298, 337, 171);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (292, 97, 16, 4, 291, 144, 369);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (293, 87, 18, 4, 306, 233, 277);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (294, 99, 18, 2, 360, 215, 422);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (295, 35, 18, 4, 30, 30, 473);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (296, 95, 17, 3, 223, 262, 182);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (297, 68, 17, 3, 207, 366, 347);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (298, 92, 14, 4, 231, 125, 185);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (299, 98, 12, 4, 189, 202, 298);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (300, 93, 18, 4, 275, 33, 363);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (301, 66, 13, 2, 151, 44, 244);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (302, 73, 13, 2, 107, 142, 153);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (303, 73, 11, 3, 9, 213, 415);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (304, 99, 16, 1, 384, 69, 193);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (305, 55, 14, 4, 98, 380, 447);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (306, 79, 17, 5, 161, 279, 473);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (307, 85, 9, 2, 8, 266, 307);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (308, 80, 10, 1, 262, 76, 330);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (309, 34, 14, 5, 52, 316, 304);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (310, 31, 9, 5, 68, 262, 167);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (311, 51, 19, 2, 356, 59, 283);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (312, 68, 14, 5, 147, 219, 466);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (313, 69, 20, 1, 240, 345, 260);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (314, 83, 14, 5, 63, 58, 198);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (315, 47, 14, 3, 279, 182, 420);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (316, 71, 20, 2, 385, 218, 391);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (317, 34, 13, 1, 327, 167, 105);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (318, 63, 17, 4, 38, 134, 349);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (319, 33, 18, 3, 77, 226, 331);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (320, 81, 14, 4, 228, 169, 496);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (321, 59, 14, 5, 48, 262, 459);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (322, 77, 19, 4, 256, 237, 336);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (323, 55, 20, 3, 172, 23, 157);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (324, 99, 17, 5, 272, 287, 496);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (325, 99, 20, 4, 69, 192, 275);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (326, 67, 15, 3, 92, 304, 346);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (327, 84, 10, 5, 384, 8, 380);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (328, 47, 10, 3, 102, 376, 374);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (329, 73, 12, 5, 274, 25, 364);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (330, 37, 11, 5, 400, 293, 190);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (331, 46, 8, 1, 224, 309, 469);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (332, 48, 15, 1, 377, 224, 355);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (333, 47, 16, 2, 271, 88, 154);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (334, 77, 15, 4, 305, 138, 295);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (335, 64, 19, 3, 220, 157, 342);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (336, 98, 13, 4, 129, 121, 306);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (337, 55, 12, 2, 133, 240, 466);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (338, 61, 15, 3, 19, 236, 110);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (339, 36, 20, 2, 266, 28, 261);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (340, 41, 13, 3, 98, 305, 157);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (341, 52, 10, 1, 151, 278, 318);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (342, 83, 15, 4, 83, 46, 345);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (343, 58, 14, 2, 188, 105, 345);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (344, 60, 19, 2, 79, 132, 147);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (345, 57, 9, 3, 28, 255, 154);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (346, 47, 14, 4, 232, 30, 225);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (347, 54, 20, 5, 149, 266, 115);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (348, 60, 12, 1, 306, 169, 499);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (349, 80, 16, 4, 279, 338, 300);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (350, 77, 15, 4, 286, 103, 181);
commit;
prompt 100 records committed...
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (351, 95, 17, 2, 68, 397, 458);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (352, 62, 12, 5, 55, 14, 118);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (353, 32, 12, 3, 275, 180, 240);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (354, 89, 19, 2, 270, 220, 360);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (355, 76, 16, 1, 68, 230, 419);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (356, 55, 19, 4, 270, 240, 310);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (357, 40, 17, 1, 98, 221, 321);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (358, 92, 11, 5, 150, 278, 154);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (359, 82, 15, 1, 349, 308, 416);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (360, 79, 17, 3, 222, 67, 335);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (361, 54, 20, 3, 228, 115, 282);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (362, 95, 9, 3, 6, 154, 369);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (363, 32, 20, 1, 87, 71, 285);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (364, 52, 13, 3, 182, 354, 375);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (365, 64, 12, 1, 254, 281, 208);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (366, 96, 8, 4, 217, 257, 402);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (367, 94, 8, 2, 153, 271, 144);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (368, 40, 20, 1, 129, 319, 334);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (369, 35, 17, 5, 204, 176, 310);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (370, 34, 9, 2, 81, 212, 456);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (371, 89, 8, 2, 65, 110, 484);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (372, 56, 12, 4, 78, 383, 460);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (373, 94, 17, 5, 115, 100, 326);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (374, 36, 15, 3, 56, 69, 373);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (375, 91, 8, 4, 357, 304, 286);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (376, 88, 17, 1, 34, 342, 193);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (377, 86, 13, 4, 208, 117, 153);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (378, 54, 10, 5, 26, 29, 298);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (379, 91, 19, 4, 378, 67, 362);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (380, 87, 14, 2, 370, 60, 438);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (381, 93, 17, 4, 103, 111, 498);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (382, 89, 20, 5, 391, 310, 358);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (383, 70, 18, 1, 318, 32, 323);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (384, 42, 11, 1, 231, 287, 461);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (385, 97, 8, 4, 256, 156, 360);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (386, 88, 18, 3, 386, 319, 176);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (387, 62, 12, 2, 249, 281, 369);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (388, 80, 13, 4, 365, 5, 214);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (389, 54, 9, 4, 14, 24, 132);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (390, 64, 10, 3, 22, 369, 206);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (391, 63, 13, 3, 203, 314, 305);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (392, 87, 9, 2, 374, 299, 481);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (393, 94, 12, 4, 305, 203, 330);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (394, 42, 11, 3, 50, 302, 493);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (395, 64, 20, 4, 68, 135, 184);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (396, 67, 16, 5, 394, 349, 451);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (397, 72, 9, 2, 144, 52, 347);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (398, 81, 11, 4, 355, 253, 456);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (399, 75, 17, 5, 110, 66, 171);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (400, 93, 8, 1, 399, 351, 315);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (1, 75, 8, 1, 320, 339, 490);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (2, 35, 11, 2, 249, 329, 140);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (3, 46, 20, 4, 261, 351, 195);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (4, 87, 12, 5, 307, 190, 338);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (5, 42, 12, 2, 109, 201, 158);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (6, 91, 14, 1, 134, 337, 311);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (7, 58, 17, 5, 365, 123, 187);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (8, 70, 10, 1, 243, 41, 405);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (9, 58, 17, 3, 11, 341, 483);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (10, 39, 12, 5, 136, 276, 100);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (11, 75, 16, 2, 281, 15, 302);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (12, 84, 17, 5, 332, 184, 375);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (13, 53, 18, 3, 21, 174, 461);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (14, 83, 14, 1, 181, 86, 363);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (15, 32, 9, 5, 47, 11, 222);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (16, 56, 18, 3, 302, 383, 288);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (17, 74, 16, 5, 365, 332, 372);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (18, 45, 12, 5, 169, 207, 365);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (19, 91, 18, 1, 253, 78, 459);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (20, 54, 15, 1, 275, 188, 233);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (21, 75, 10, 1, 77, 318, 178);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (22, 72, 20, 3, 17, 179, 419);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (23, 68, 10, 5, 214, 225, 273);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (24, 65, 17, 5, 117, 104, 198);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (25, 65, 14, 1, 187, 34, 357);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (26, 100, 14, 2, 124, 183, 344);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (27, 56, 19, 3, 364, 96, 409);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (28, 87, 13, 5, 19, 87, 142);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (29, 32, 16, 2, 329, 29, 353);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (30, 39, 9, 2, 261, 289, 151);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (31, 39, 16, 4, 83, 79, 269);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (32, 100, 10, 4, 301, 157, 292);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (33, 67, 19, 1, 378, 79, 258);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (34, 59, 18, 1, 92, 246, 151);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (35, 58, 9, 2, 143, 346, 298);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (36, 59, 17, 5, 40, 352, 466);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (37, 41, 16, 2, 307, 83, 114);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (38, 43, 13, 5, 110, 182, 493);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (39, 87, 10, 4, 178, 220, 405);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (40, 47, 17, 5, 127, 389, 420);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (41, 61, 10, 3, 276, 91, 443);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (42, 52, 10, 4, 206, 241, 122);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (43, 100, 8, 1, 388, 254, 400);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (44, 33, 11, 4, 340, 265, 423);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (45, 53, 10, 5, 139, 255, 400);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (46, 42, 16, 2, 263, 339, 366);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (47, 60, 15, 4, 253, 254, 465);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (48, 67, 14, 1, 53, 173, 452);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (49, 43, 8, 1, 382, 306, 352);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (50, 91, 17, 3, 367, 46, 344);
commit;
prompt 200 records committed...
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (51, 34, 10, 3, 291, 13, 442);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (52, 83, 15, 1, 165, 147, 415);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (53, 74, 9, 2, 80, 150, 484);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (54, 82, 13, 5, 251, 189, 205);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (55, 82, 12, 2, 21, 371, 351);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (56, 69, 18, 4, 249, 231, 200);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (57, 30, 15, 1, 286, 400, 223);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (58, 48, 11, 3, 362, 190, 182);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (59, 64, 10, 3, 165, 212, 131);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (60, 53, 18, 2, 136, 376, 348);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (61, 98, 14, 4, 35, 22, 498);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (62, 46, 8, 1, 154, 322, 283);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (63, 65, 17, 5, 273, 168, 206);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (64, 35, 10, 5, 316, 58, 149);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (65, 67, 17, 2, 188, 314, 415);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (66, 43, 12, 4, 400, 87, 198);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (67, 38, 14, 2, 166, 263, 476);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (68, 88, 15, 1, 369, 21, 364);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (69, 43, 17, 2, 284, 4, 361);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (70, 52, 13, 5, 335, 326, 235);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (71, 62, 13, 3, 10, 275, 137);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (72, 56, 20, 5, 217, 148, 175);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (73, 84, 16, 2, 30, 278, 334);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (74, 61, 19, 5, 26, 252, 481);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (75, 94, 20, 4, 218, 23, 316);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (76, 43, 18, 1, 204, 257, 357);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (77, 34, 8, 4, 208, 129, 299);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (78, 68, 17, 1, 358, 204, 185);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (79, 64, 10, 1, 364, 381, 344);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (80, 93, 20, 4, 400, 219, 274);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (81, 49, 19, 3, 213, 36, 161);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (82, 62, 9, 2, 254, 132, 170);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (83, 95, 8, 4, 340, 217, 443);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (84, 85, 14, 1, 328, 201, 304);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (85, 56, 20, 2, 212, 360, 175);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (86, 94, 13, 2, 315, 202, 268);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (87, 75, 20, 1, 122, 57, 443);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (88, 87, 18, 2, 321, 238, 487);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (89, 38, 16, 3, 328, 74, 172);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (90, 93, 12, 3, 87, 329, 180);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (91, 60, 9, 3, 171, 69, 126);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (92, 94, 16, 3, 99, 327, 192);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (93, 31, 11, 2, 53, 209, 411);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (94, 56, 20, 1, 153, 233, 160);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (95, 40, 16, 1, 55, 383, 390);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (96, 65, 11, 4, 173, 246, 422);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (97, 30, 13, 1, 279, 38, 465);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (98, 43, 18, 4, 246, 23, 326);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (99, 96, 20, 1, 94, 123, 441);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (100, 61, 19, 3, 74, 298, 334);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (101, 31, 12, 2, 363, 367, 114);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (102, 63, 14, 1, 197, 104, 196);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (103, 69, 14, 5, 38, 374, 208);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (104, 45, 12, 3, 207, 181, 384);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (105, 51, 19, 5, 207, 367, 286);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (106, 39, 13, 2, 93, 3, 448);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (107, 49, 19, 5, 360, 268, 388);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (108, 58, 11, 4, 131, 386, 103);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (109, 72, 18, 5, 173, 325, 400);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (110, 92, 18, 1, 75, 137, 103);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (111, 84, 17, 3, 180, 200, 109);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (112, 70, 18, 4, 60, 108, 495);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (113, 38, 14, 3, 16, 314, 153);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (114, 58, 15, 4, 153, 85, 337);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (115, 77, 9, 3, 215, 163, 223);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (116, 59, 13, 3, 395, 101, 255);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (117, 50, 17, 4, 42, 2, 120);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (118, 96, 10, 4, 46, 201, 117);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (119, 34, 13, 3, 346, 15, 223);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (120, 40, 12, 3, 77, 38, 222);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (121, 56, 17, 2, 98, 371, 383);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (122, 39, 8, 3, 246, 141, 459);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (123, 83, 8, 4, 223, 65, 382);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (124, 55, 8, 2, 165, 14, 448);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (125, 93, 13, 4, 378, 170, 386);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (126, 45, 9, 5, 318, 328, 115);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (127, 47, 9, 1, 81, 384, 322);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (128, 31, 9, 2, 240, 158, 300);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (129, 89, 12, 1, 59, 293, 413);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (130, 65, 16, 2, 6, 324, 281);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (131, 79, 15, 1, 193, 49, 402);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (132, 95, 17, 5, 36, 383, 377);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (133, 78, 16, 3, 163, 76, 293);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (134, 40, 8, 4, 381, 145, 335);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (135, 72, 20, 5, 139, 301, 341);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (136, 54, 16, 1, 290, 252, 261);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (137, 46, 17, 2, 240, 326, 128);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (138, 50, 12, 4, 206, 89, 194);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (139, 46, 14, 1, 305, 38, 250);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (140, 39, 20, 4, 25, 175, 490);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (141, 52, 10, 1, 81, 270, 246);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (142, 63, 13, 4, 328, 295, 103);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (143, 32, 10, 3, 4, 22, 107);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (144, 96, 18, 3, 251, 328, 353);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (145, 45, 12, 5, 49, 31, 384);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (146, 57, 16, 3, 90, 25, 241);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (147, 80, 18, 5, 229, 224, 445);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (148, 96, 17, 1, 96, 96, 317);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (149, 30, 14, 1, 42, 229, 487);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (150, 95, 11, 4, 179, 267, 160);
commit;
prompt 300 records committed...
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (151, 40, 11, 2, 218, 283, 265);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (152, 84, 11, 4, 159, 45, 270);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (153, 71, 17, 4, 278, 307, 338);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (154, 63, 18, 5, 289, 73, 440);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (155, 43, 18, 3, 258, 295, 185);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (156, 85, 13, 4, 288, 13, 396);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (157, 70, 20, 5, 305, 382, 415);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (158, 78, 8, 5, 10, 213, 181);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (159, 44, 12, 2, 304, 330, 399);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (160, 73, 15, 4, 185, 133, 274);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (161, 40, 8, 1, 234, 219, 365);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (162, 59, 13, 4, 151, 157, 309);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (163, 62, 16, 1, 27, 262, 273);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (164, 39, 17, 5, 34, 376, 196);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (165, 61, 9, 4, 204, 134, 314);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (166, 32, 17, 2, 74, 381, 309);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (167, 51, 12, 4, 290, 342, 360);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (168, 69, 20, 1, 357, 222, 321);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (169, 99, 13, 5, 62, 220, 190);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (170, 30, 10, 1, 265, 3, 390);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (171, 41, 16, 5, 41, 78, 439);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (172, 35, 13, 3, 290, 51, 443);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (173, 84, 9, 1, 76, 294, 280);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (174, 90, 9, 5, 126, 135, 269);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (175, 55, 17, 1, 238, 256, 388);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (176, 70, 8, 1, 290, 267, 389);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (177, 53, 9, 4, 269, 178, 209);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (178, 56, 8, 2, 188, 169, 179);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (179, 84, 14, 3, 398, 70, 268);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (180, 91, 19, 4, 61, 138, 243);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (181, 62, 20, 4, 381, 295, 342);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (182, 44, 11, 5, 353, 182, 104);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (183, 45, 10, 1, 166, 193, 442);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (184, 36, 16, 4, 110, 370, 396);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (185, 85, 19, 1, 51, 200, 416);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (186, 76, 14, 2, 164, 268, 444);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (187, 83, 13, 5, 317, 158, 121);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (188, 64, 13, 4, 123, 198, 212);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (189, 48, 18, 3, 30, 225, 189);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (190, 95, 15, 3, 292, 396, 493);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (191, 79, 14, 3, 374, 80, 321);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (192, 67, 18, 3, 173, 208, 132);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (193, 51, 12, 2, 15, 258, 126);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (194, 66, 19, 4, 56, 392, 355);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (195, 69, 19, 2, 60, 285, 464);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (196, 45, 15, 4, 348, 79, 393);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (197, 89, 10, 2, 309, 46, 496);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (198, 38, 11, 2, 162, 45, 276);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (199, 76, 15, 4, 167, 80, 188);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (200, 94, 12, 3, 1, 56, 379);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (201, 45, 11, 4, 107, 215, 103);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (202, 77, 19, 2, 269, 139, 207);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (203, 78, 16, 1, 58, 38, 393);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (204, 43, 12, 2, 233, 140, 190);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (205, 86, 17, 3, 5, 25, 244);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (206, 86, 20, 3, 182, 13, 384);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (207, 30, 17, 4, 184, 213, 301);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (208, 56, 17, 1, 396, 213, 441);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (209, 60, 17, 3, 337, 245, 283);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (210, 67, 15, 5, 270, 37, 145);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (211, 85, 20, 5, 36, 275, 154);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (212, 98, 18, 4, 220, 277, 286);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (213, 83, 17, 3, 131, 353, 454);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (214, 57, 10, 5, 302, 227, 159);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (215, 93, 10, 1, 317, 380, 329);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (216, 84, 20, 1, 371, 27, 464);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (217, 52, 18, 5, 300, 64, 297);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (218, 80, 20, 1, 320, 169, 491);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (219, 80, 11, 2, 139, 351, 476);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (220, 35, 19, 5, 225, 146, 172);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (221, 59, 11, 4, 249, 376, 303);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (222, 53, 16, 4, 325, 283, 482);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (223, 75, 12, 2, 45, 395, 286);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (224, 46, 12, 5, 75, 121, 163);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (225, 94, 13, 2, 308, 151, 401);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (226, 72, 9, 5, 396, 398, 465);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (227, 68, 9, 4, 56, 141, 287);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (228, 71, 9, 3, 159, 191, 470);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (229, 75, 20, 4, 397, 214, 455);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (230, 73, 19, 2, 31, 67, 495);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (231, 91, 17, 3, 348, 1, 251);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (232, 77, 13, 4, 115, 215, 349);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (233, 94, 20, 2, 107, 177, 397);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (234, 94, 15, 3, 315, 192, 114);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (235, 79, 17, 5, 145, 64, 446);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (236, 79, 19, 5, 58, 266, 458);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (237, 65, 13, 4, 214, 391, 381);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (238, 54, 20, 2, 106, 385, 331);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (239, 67, 8, 5, 42, 101, 493);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (240, 59, 14, 1, 85, 153, 450);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (241, 83, 14, 3, 8, 223, 160);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (242, 51, 15, 1, 260, 49, 236);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (243, 97, 10, 1, 157, 312, 265);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (244, 48, 15, 1, 203, 262, 397);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (245, 52, 19, 1, 62, 257, 490);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (246, 52, 11, 2, 263, 385, 232);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (247, 31, 16, 3, 98, 381, 399);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (248, 83, 17, 5, 286, 129, 439);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (249, 79, 10, 2, 10, 15, 161);
insert into STUDENTSGROUP (g_id, max_p, g_hour, g_day, r_id, c_id, l_id)
values (250, 91, 16, 3, 106, 122, 301);
commit;
prompt 400 records loaded
prompt Loading BELONGS...
insert into BELONGS (g_id, p_id)
values (1, 575);
insert into BELONGS (g_id, p_id)
values (1, 631);
insert into BELONGS (g_id, p_id)
values (3, 523);
insert into BELONGS (g_id, p_id)
values (3, 685);
insert into BELONGS (g_id, p_id)
values (3, 756);
insert into BELONGS (g_id, p_id)
values (6, 581);
insert into BELONGS (g_id, p_id)
values (6, 768);
insert into BELONGS (g_id, p_id)
values (7, 746);
insert into BELONGS (g_id, p_id)
values (7, 803);
insert into BELONGS (g_id, p_id)
values (9, 688);
insert into BELONGS (g_id, p_id)
values (11, 807);
insert into BELONGS (g_id, p_id)
values (13, 512);
insert into BELONGS (g_id, p_id)
values (13, 790);
insert into BELONGS (g_id, p_id)
values (14, 897);
insert into BELONGS (g_id, p_id)
values (15, 573);
insert into BELONGS (g_id, p_id)
values (18, 683);
insert into BELONGS (g_id, p_id)
values (18, 728);
insert into BELONGS (g_id, p_id)
values (20, 644);
insert into BELONGS (g_id, p_id)
values (20, 716);
insert into BELONGS (g_id, p_id)
values (20, 783);
insert into BELONGS (g_id, p_id)
values (22, 680);
insert into BELONGS (g_id, p_id)
values (23, 624);
insert into BELONGS (g_id, p_id)
values (23, 794);
insert into BELONGS (g_id, p_id)
values (24, 844);
insert into BELONGS (g_id, p_id)
values (26, 786);
insert into BELONGS (g_id, p_id)
values (27, 615);
insert into BELONGS (g_id, p_id)
values (27, 635);
insert into BELONGS (g_id, p_id)
values (27, 856);
insert into BELONGS (g_id, p_id)
values (31, 584);
insert into BELONGS (g_id, p_id)
values (31, 599);
insert into BELONGS (g_id, p_id)
values (32, 652);
insert into BELONGS (g_id, p_id)
values (32, 730);
insert into BELONGS (g_id, p_id)
values (34, 642);
insert into BELONGS (g_id, p_id)
values (39, 545);
insert into BELONGS (g_id, p_id)
values (40, 829);
insert into BELONGS (g_id, p_id)
values (41, 680);
insert into BELONGS (g_id, p_id)
values (41, 874);
insert into BELONGS (g_id, p_id)
values (42, 664);
insert into BELONGS (g_id, p_id)
values (42, 668);
insert into BELONGS (g_id, p_id)
values (42, 848);
insert into BELONGS (g_id, p_id)
values (43, 836);
insert into BELONGS (g_id, p_id)
values (44, 638);
insert into BELONGS (g_id, p_id)
values (45, 876);
insert into BELONGS (g_id, p_id)
values (45, 884);
insert into BELONGS (g_id, p_id)
values (46, 563);
insert into BELONGS (g_id, p_id)
values (47, 634);
insert into BELONGS (g_id, p_id)
values (47, 727);
insert into BELONGS (g_id, p_id)
values (47, 881);
insert into BELONGS (g_id, p_id)
values (48, 611);
insert into BELONGS (g_id, p_id)
values (48, 613);
insert into BELONGS (g_id, p_id)
values (48, 616);
insert into BELONGS (g_id, p_id)
values (49, 577);
insert into BELONGS (g_id, p_id)
values (50, 649);
insert into BELONGS (g_id, p_id)
values (53, 840);
insert into BELONGS (g_id, p_id)
values (53, 871);
insert into BELONGS (g_id, p_id)
values (55, 624);
insert into BELONGS (g_id, p_id)
values (55, 633);
insert into BELONGS (g_id, p_id)
values (56, 888);
insert into BELONGS (g_id, p_id)
values (60, 777);
insert into BELONGS (g_id, p_id)
values (60, 876);
insert into BELONGS (g_id, p_id)
values (61, 575);
insert into BELONGS (g_id, p_id)
values (61, 865);
insert into BELONGS (g_id, p_id)
values (63, 579);
insert into BELONGS (g_id, p_id)
values (63, 897);
insert into BELONGS (g_id, p_id)
values (64, 704);
insert into BELONGS (g_id, p_id)
values (65, 691);
insert into BELONGS (g_id, p_id)
values (66, 800);
insert into BELONGS (g_id, p_id)
values (67, 850);
insert into BELONGS (g_id, p_id)
values (68, 651);
insert into BELONGS (g_id, p_id)
values (71, 838);
insert into BELONGS (g_id, p_id)
values (72, 801);
insert into BELONGS (g_id, p_id)
values (74, 683);
insert into BELONGS (g_id, p_id)
values (74, 850);
insert into BELONGS (g_id, p_id)
values (77, 648);
insert into BELONGS (g_id, p_id)
values (78, 585);
insert into BELONGS (g_id, p_id)
values (78, 813);
insert into BELONGS (g_id, p_id)
values (78, 884);
insert into BELONGS (g_id, p_id)
values (79, 701);
insert into BELONGS (g_id, p_id)
values (82, 571);
insert into BELONGS (g_id, p_id)
values (83, 812);
insert into BELONGS (g_id, p_id)
values (84, 646);
insert into BELONGS (g_id, p_id)
values (86, 780);
insert into BELONGS (g_id, p_id)
values (87, 685);
insert into BELONGS (g_id, p_id)
values (87, 874);
insert into BELONGS (g_id, p_id)
values (88, 797);
insert into BELONGS (g_id, p_id)
values (90, 706);
insert into BELONGS (g_id, p_id)
values (91, 722);
insert into BELONGS (g_id, p_id)
values (91, 771);
insert into BELONGS (g_id, p_id)
values (91, 891);
insert into BELONGS (g_id, p_id)
values (92, 872);
insert into BELONGS (g_id, p_id)
values (93, 667);
insert into BELONGS (g_id, p_id)
values (94, 645);
insert into BELONGS (g_id, p_id)
values (95, 640);
insert into BELONGS (g_id, p_id)
values (95, 891);
insert into BELONGS (g_id, p_id)
values (96, 822);
insert into BELONGS (g_id, p_id)
values (96, 885);
insert into BELONGS (g_id, p_id)
values (97, 509);
insert into BELONGS (g_id, p_id)
values (97, 823);
insert into BELONGS (g_id, p_id)
values (98, 699);
insert into BELONGS (g_id, p_id)
values (100, 825);
commit;
prompt 100 records committed...
insert into BELONGS (g_id, p_id)
values (101, 863);
insert into BELONGS (g_id, p_id)
values (102, 559);
insert into BELONGS (g_id, p_id)
values (102, 630);
insert into BELONGS (g_id, p_id)
values (102, 754);
insert into BELONGS (g_id, p_id)
values (104, 553);
insert into BELONGS (g_id, p_id)
values (109, 854);
insert into BELONGS (g_id, p_id)
values (110, 827);
insert into BELONGS (g_id, p_id)
values (111, 522);
insert into BELONGS (g_id, p_id)
values (112, 734);
insert into BELONGS (g_id, p_id)
values (113, 601);
insert into BELONGS (g_id, p_id)
values (118, 679);
insert into BELONGS (g_id, p_id)
values (119, 739);
insert into BELONGS (g_id, p_id)
values (119, 784);
insert into BELONGS (g_id, p_id)
values (120, 889);
insert into BELONGS (g_id, p_id)
values (121, 859);
insert into BELONGS (g_id, p_id)
values (123, 765);
insert into BELONGS (g_id, p_id)
values (124, 843);
insert into BELONGS (g_id, p_id)
values (125, 587);
insert into BELONGS (g_id, p_id)
values (125, 707);
insert into BELONGS (g_id, p_id)
values (126, 641);
insert into BELONGS (g_id, p_id)
values (126, 869);
insert into BELONGS (g_id, p_id)
values (127, 743);
insert into BELONGS (g_id, p_id)
values (128, 563);
insert into BELONGS (g_id, p_id)
values (131, 620);
insert into BELONGS (g_id, p_id)
values (134, 659);
insert into BELONGS (g_id, p_id)
values (136, 608);
insert into BELONGS (g_id, p_id)
values (136, 747);
insert into BELONGS (g_id, p_id)
values (138, 620);
insert into BELONGS (g_id, p_id)
values (139, 707);
insert into BELONGS (g_id, p_id)
values (139, 790);
insert into BELONGS (g_id, p_id)
values (140, 576);
insert into BELONGS (g_id, p_id)
values (142, 825);
insert into BELONGS (g_id, p_id)
values (150, 624);
insert into BELONGS (g_id, p_id)
values (150, 640);
insert into BELONGS (g_id, p_id)
values (151, 863);
insert into BELONGS (g_id, p_id)
values (152, 851);
insert into BELONGS (g_id, p_id)
values (153, 613);
insert into BELONGS (g_id, p_id)
values (153, 780);
insert into BELONGS (g_id, p_id)
values (155, 845);
insert into BELONGS (g_id, p_id)
values (156, 816);
insert into BELONGS (g_id, p_id)
values (156, 821);
insert into BELONGS (g_id, p_id)
values (158, 653);
insert into BELONGS (g_id, p_id)
values (158, 823);
insert into BELONGS (g_id, p_id)
values (160, 729);
insert into BELONGS (g_id, p_id)
values (161, 530);
insert into BELONGS (g_id, p_id)
values (161, 559);
insert into BELONGS (g_id, p_id)
values (161, 571);
insert into BELONGS (g_id, p_id)
values (162, 867);
insert into BELONGS (g_id, p_id)
values (164, 506);
insert into BELONGS (g_id, p_id)
values (166, 768);
insert into BELONGS (g_id, p_id)
values (167, 818);
insert into BELONGS (g_id, p_id)
values (168, 693);
insert into BELONGS (g_id, p_id)
values (169, 561);
insert into BELONGS (g_id, p_id)
values (170, 506);
insert into BELONGS (g_id, p_id)
values (170, 594);
insert into BELONGS (g_id, p_id)
values (170, 822);
insert into BELONGS (g_id, p_id)
values (171, 846);
insert into BELONGS (g_id, p_id)
values (174, 887);
insert into BELONGS (g_id, p_id)
values (175, 788);
insert into BELONGS (g_id, p_id)
values (178, 762);
insert into BELONGS (g_id, p_id)
values (180, 695);
insert into BELONGS (g_id, p_id)
values (182, 819);
insert into BELONGS (g_id, p_id)
values (183, 777);
insert into BELONGS (g_id, p_id)
values (183, 872);
insert into BELONGS (g_id, p_id)
values (185, 683);
insert into BELONGS (g_id, p_id)
values (186, 553);
insert into BELONGS (g_id, p_id)
values (186, 836);
insert into BELONGS (g_id, p_id)
values (186, 851);
insert into BELONGS (g_id, p_id)
values (187, 653);
insert into BELONGS (g_id, p_id)
values (189, 510);
insert into BELONGS (g_id, p_id)
values (189, 546);
insert into BELONGS (g_id, p_id)
values (189, 828);
insert into BELONGS (g_id, p_id)
values (190, 781);
insert into BELONGS (g_id, p_id)
values (190, 862);
insert into BELONGS (g_id, p_id)
values (191, 545);
insert into BELONGS (g_id, p_id)
values (192, 612);
insert into BELONGS (g_id, p_id)
values (194, 558);
insert into BELONGS (g_id, p_id)
values (194, 620);
insert into BELONGS (g_id, p_id)
values (195, 562);
insert into BELONGS (g_id, p_id)
values (195, 633);
insert into BELONGS (g_id, p_id)
values (195, 758);
insert into BELONGS (g_id, p_id)
values (197, 521);
insert into BELONGS (g_id, p_id)
values (197, 874);
insert into BELONGS (g_id, p_id)
values (198, 722);
insert into BELONGS (g_id, p_id)
values (199, 845);
insert into BELONGS (g_id, p_id)
values (199, 847);
insert into BELONGS (g_id, p_id)
values (200, 876);
insert into BELONGS (g_id, p_id)
values (202, 592);
insert into BELONGS (g_id, p_id)
values (202, 755);
insert into BELONGS (g_id, p_id)
values (202, 865);
insert into BELONGS (g_id, p_id)
values (203, 506);
insert into BELONGS (g_id, p_id)
values (203, 651);
insert into BELONGS (g_id, p_id)
values (203, 757);
insert into BELONGS (g_id, p_id)
values (203, 832);
insert into BELONGS (g_id, p_id)
values (205, 647);
insert into BELONGS (g_id, p_id)
values (205, 700);
insert into BELONGS (g_id, p_id)
values (205, 851);
insert into BELONGS (g_id, p_id)
values (206, 650);
insert into BELONGS (g_id, p_id)
values (206, 673);
insert into BELONGS (g_id, p_id)
values (206, 702);
commit;
prompt 200 records committed...
insert into BELONGS (g_id, p_id)
values (210, 603);
insert into BELONGS (g_id, p_id)
values (210, 706);
insert into BELONGS (g_id, p_id)
values (211, 755);
insert into BELONGS (g_id, p_id)
values (212, 753);
insert into BELONGS (g_id, p_id)
values (213, 565);
insert into BELONGS (g_id, p_id)
values (213, 642);
insert into BELONGS (g_id, p_id)
values (214, 830);
insert into BELONGS (g_id, p_id)
values (214, 837);
insert into BELONGS (g_id, p_id)
values (215, 730);
insert into BELONGS (g_id, p_id)
values (216, 724);
insert into BELONGS (g_id, p_id)
values (219, 729);
insert into BELONGS (g_id, p_id)
values (219, 892);
insert into BELONGS (g_id, p_id)
values (221, 834);
insert into BELONGS (g_id, p_id)
values (224, 655);
insert into BELONGS (g_id, p_id)
values (227, 731);
insert into BELONGS (g_id, p_id)
values (228, 578);
insert into BELONGS (g_id, p_id)
values (228, 678);
insert into BELONGS (g_id, p_id)
values (228, 748);
insert into BELONGS (g_id, p_id)
values (229, 601);
insert into BELONGS (g_id, p_id)
values (229, 643);
insert into BELONGS (g_id, p_id)
values (230, 838);
insert into BELONGS (g_id, p_id)
values (231, 689);
insert into BELONGS (g_id, p_id)
values (232, 567);
insert into BELONGS (g_id, p_id)
values (232, 643);
insert into BELONGS (g_id, p_id)
values (234, 505);
insert into BELONGS (g_id, p_id)
values (234, 874);
insert into BELONGS (g_id, p_id)
values (238, 852);
insert into BELONGS (g_id, p_id)
values (239, 704);
insert into BELONGS (g_id, p_id)
values (240, 620);
insert into BELONGS (g_id, p_id)
values (240, 838);
insert into BELONGS (g_id, p_id)
values (241, 661);
insert into BELONGS (g_id, p_id)
values (241, 806);
insert into BELONGS (g_id, p_id)
values (242, 684);
insert into BELONGS (g_id, p_id)
values (242, 806);
insert into BELONGS (g_id, p_id)
values (245, 605);
insert into BELONGS (g_id, p_id)
values (246, 828);
insert into BELONGS (g_id, p_id)
values (247, 725);
insert into BELONGS (g_id, p_id)
values (248, 640);
insert into BELONGS (g_id, p_id)
values (250, 644);
insert into BELONGS (g_id, p_id)
values (251, 715);
insert into BELONGS (g_id, p_id)
values (252, 557);
insert into BELONGS (g_id, p_id)
values (252, 824);
insert into BELONGS (g_id, p_id)
values (254, 646);
insert into BELONGS (g_id, p_id)
values (254, 829);
insert into BELONGS (g_id, p_id)
values (256, 503);
insert into BELONGS (g_id, p_id)
values (257, 899);
insert into BELONGS (g_id, p_id)
values (260, 629);
insert into BELONGS (g_id, p_id)
values (260, 745);
insert into BELONGS (g_id, p_id)
values (260, 822);
insert into BELONGS (g_id, p_id)
values (261, 848);
insert into BELONGS (g_id, p_id)
values (262, 573);
insert into BELONGS (g_id, p_id)
values (263, 797);
insert into BELONGS (g_id, p_id)
values (263, 802);
insert into BELONGS (g_id, p_id)
values (265, 642);
insert into BELONGS (g_id, p_id)
values (266, 886);
insert into BELONGS (g_id, p_id)
values (267, 675);
insert into BELONGS (g_id, p_id)
values (267, 695);
insert into BELONGS (g_id, p_id)
values (267, 725);
insert into BELONGS (g_id, p_id)
values (267, 899);
insert into BELONGS (g_id, p_id)
values (270, 817);
insert into BELONGS (g_id, p_id)
values (271, 584);
insert into BELONGS (g_id, p_id)
values (272, 829);
insert into BELONGS (g_id, p_id)
values (274, 525);
insert into BELONGS (g_id, p_id)
values (275, 550);
insert into BELONGS (g_id, p_id)
values (275, 618);
insert into BELONGS (g_id, p_id)
values (277, 788);
insert into BELONGS (g_id, p_id)
values (279, 620);
insert into BELONGS (g_id, p_id)
values (280, 533);
insert into BELONGS (g_id, p_id)
values (284, 753);
insert into BELONGS (g_id, p_id)
values (284, 757);
insert into BELONGS (g_id, p_id)
values (287, 509);
insert into BELONGS (g_id, p_id)
values (288, 752);
insert into BELONGS (g_id, p_id)
values (289, 739);
insert into BELONGS (g_id, p_id)
values (291, 611);
insert into BELONGS (g_id, p_id)
values (291, 747);
insert into BELONGS (g_id, p_id)
values (291, 777);
insert into BELONGS (g_id, p_id)
values (291, 806);
insert into BELONGS (g_id, p_id)
values (294, 577);
insert into BELONGS (g_id, p_id)
values (294, 753);
insert into BELONGS (g_id, p_id)
values (298, 667);
insert into BELONGS (g_id, p_id)
values (298, 760);
insert into BELONGS (g_id, p_id)
values (302, 863);
insert into BELONGS (g_id, p_id)
values (303, 845);
insert into BELONGS (g_id, p_id)
values (304, 519);
insert into BELONGS (g_id, p_id)
values (305, 841);
insert into BELONGS (g_id, p_id)
values (306, 523);
insert into BELONGS (g_id, p_id)
values (306, 890);
insert into BELONGS (g_id, p_id)
values (306, 894);
insert into BELONGS (g_id, p_id)
values (308, 825);
insert into BELONGS (g_id, p_id)
values (310, 642);
insert into BELONGS (g_id, p_id)
values (310, 822);
insert into BELONGS (g_id, p_id)
values (311, 691);
insert into BELONGS (g_id, p_id)
values (311, 756);
insert into BELONGS (g_id, p_id)
values (314, 637);
insert into BELONGS (g_id, p_id)
values (314, 733);
insert into BELONGS (g_id, p_id)
values (315, 612);
insert into BELONGS (g_id, p_id)
values (315, 754);
insert into BELONGS (g_id, p_id)
values (316, 540);
insert into BELONGS (g_id, p_id)
values (316, 615);
insert into BELONGS (g_id, p_id)
values (316, 729);
commit;
prompt 300 records committed...
insert into BELONGS (g_id, p_id)
values (317, 831);
insert into BELONGS (g_id, p_id)
values (318, 776);
insert into BELONGS (g_id, p_id)
values (318, 801);
insert into BELONGS (g_id, p_id)
values (320, 658);
insert into BELONGS (g_id, p_id)
values (320, 672);
insert into BELONGS (g_id, p_id)
values (323, 685);
insert into BELONGS (g_id, p_id)
values (323, 689);
insert into BELONGS (g_id, p_id)
values (323, 840);
insert into BELONGS (g_id, p_id)
values (323, 888);
insert into BELONGS (g_id, p_id)
values (327, 526);
insert into BELONGS (g_id, p_id)
values (327, 703);
insert into BELONGS (g_id, p_id)
values (327, 889);
insert into BELONGS (g_id, p_id)
values (330, 511);
insert into BELONGS (g_id, p_id)
values (332, 831);
insert into BELONGS (g_id, p_id)
values (333, 780);
insert into BELONGS (g_id, p_id)
values (333, 844);
insert into BELONGS (g_id, p_id)
values (335, 700);
insert into BELONGS (g_id, p_id)
values (336, 609);
insert into BELONGS (g_id, p_id)
values (337, 745);
insert into BELONGS (g_id, p_id)
values (338, 701);
insert into BELONGS (g_id, p_id)
values (339, 651);
insert into BELONGS (g_id, p_id)
values (339, 844);
insert into BELONGS (g_id, p_id)
values (343, 810);
insert into BELONGS (g_id, p_id)
values (345, 758);
insert into BELONGS (g_id, p_id)
values (349, 661);
insert into BELONGS (g_id, p_id)
values (349, 734);
insert into BELONGS (g_id, p_id)
values (349, 814);
insert into BELONGS (g_id, p_id)
values (350, 724);
insert into BELONGS (g_id, p_id)
values (350, 739);
insert into BELONGS (g_id, p_id)
values (351, 668);
insert into BELONGS (g_id, p_id)
values (352, 784);
insert into BELONGS (g_id, p_id)
values (354, 525);
insert into BELONGS (g_id, p_id)
values (356, 522);
insert into BELONGS (g_id, p_id)
values (356, 709);
insert into BELONGS (g_id, p_id)
values (357, 798);
insert into BELONGS (g_id, p_id)
values (358, 881);
insert into BELONGS (g_id, p_id)
values (360, 829);
insert into BELONGS (g_id, p_id)
values (361, 672);
insert into BELONGS (g_id, p_id)
values (362, 548);
insert into BELONGS (g_id, p_id)
values (362, 592);
insert into BELONGS (g_id, p_id)
values (363, 665);
insert into BELONGS (g_id, p_id)
values (363, 882);
insert into BELONGS (g_id, p_id)
values (364, 619);
insert into BELONGS (g_id, p_id)
values (364, 680);
insert into BELONGS (g_id, p_id)
values (364, 752);
insert into BELONGS (g_id, p_id)
values (364, 768);
insert into BELONGS (g_id, p_id)
values (365, 813);
insert into BELONGS (g_id, p_id)
values (366, 675);
insert into BELONGS (g_id, p_id)
values (368, 559);
insert into BELONGS (g_id, p_id)
values (369, 883);
insert into BELONGS (g_id, p_id)
values (371, 540);
insert into BELONGS (g_id, p_id)
values (375, 510);
insert into BELONGS (g_id, p_id)
values (377, 664);
insert into BELONGS (g_id, p_id)
values (378, 792);
insert into BELONGS (g_id, p_id)
values (379, 765);
insert into BELONGS (g_id, p_id)
values (383, 748);
insert into BELONGS (g_id, p_id)
values (384, 710);
insert into BELONGS (g_id, p_id)
values (384, 721);
insert into BELONGS (g_id, p_id)
values (386, 808);
insert into BELONGS (g_id, p_id)
values (387, 545);
insert into BELONGS (g_id, p_id)
values (387, 832);
insert into BELONGS (g_id, p_id)
values (389, 850);
insert into BELONGS (g_id, p_id)
values (392, 581);
insert into BELONGS (g_id, p_id)
values (392, 675);
insert into BELONGS (g_id, p_id)
values (396, 618);
insert into BELONGS (g_id, p_id)
values (400, 500);
insert into BELONGS (g_id, p_id)
values (400, 520);
insert into BELONGS (g_id, p_id)
values (400, 641);
insert into BELONGS (g_id, p_id)
values (400, 683);
insert into BELONGS (g_id, p_id)
values (400, 718);
insert into BELONGS (g_id, p_id)
values (400, 722);
insert into BELONGS (g_id, p_id)
values (400, 756);
insert into BELONGS (g_id, p_id)
values (400, 765);
insert into BELONGS (g_id, p_id)
values (400, 802);
insert into BELONGS (g_id, p_id)
values (400, 845);
insert into BELONGS (g_id, p_id)
values (400, 850);
insert into BELONGS (g_id, p_id)
values (400, 854);
insert into BELONGS (g_id, p_id)
values (400, 872);
insert into BELONGS (g_id, p_id)
values (400, 891);
commit;
prompt 379 records loaded
prompt Loading CATEGORY...
insert into CATEGORY (categoryid, name, emergencylevel)
values (403, 'EEG Machines (Electroencephalogram)', 7);
insert into CATEGORY (categoryid, name, emergencylevel)
values (404, 'EMG Machines (Electromyography)', 6);
insert into CATEGORY (categoryid, name, emergencylevel)
values (405, 'EKG Machines (Electrocardiogram)', 8);
insert into CATEGORY (categoryid, name, emergencylevel)
values (406, 'Holter Monitors', 5);
insert into CATEGORY (categoryid, name, emergencylevel)
values (407, 'Defibrillator Monitors', 9);
insert into CATEGORY (categoryid, name, emergencylevel)
values (408, 'Pacemakers', 8);
insert into CATEGORY (categoryid, name, emergencylevel)
values (409, 'Pulse Oximeters (Continuous Monitoring)', 7);
insert into CATEGORY (categoryid, name, emergencylevel)
values (410, 'Capnography Monitors', 8);
insert into CATEGORY (categoryid, name, emergencylevel)
values (411, 'Blood Gas Analyzers', 8);
insert into CATEGORY (categoryid, name, emergencylevel)
values (412, 'Coagulation Analyzers', 7);
insert into CATEGORY (categoryid, name, emergencylevel)
values (413, 'Centrifuges', 5);
insert into CATEGORY (categoryid, name, emergencylevel)
values (414, 'Microscopes', 4);
insert into CATEGORY (categoryid, name, emergencylevel)
values (415, 'Blood Banking Equipment', 6);
insert into CATEGORY (categoryid, name, emergencylevel)
values (416, 'Blood Warmers', 5);
insert into CATEGORY (categoryid, name, emergencylevel)
values (417, 'Infusion Pumps (Large Volume)', 7);
insert into CATEGORY (categoryid, name, emergencylevel)
values (418, 'Enteral Feeding Pumps', 5);
insert into CATEGORY (categoryid, name, emergencylevel)
values (419, 'Patient Lifts', 4);
insert into CATEGORY (categoryid, name, emergencylevel)
values (420, 'Patient Transfer Sheets', 3);
insert into CATEGORY (categoryid, name, emergencylevel)
values (421, 'Nebulizers (Portable)', 6);
insert into CATEGORY (categoryid, name, emergencylevel)
values (422, 'Peak Flow Meters', 4);
insert into CATEGORY (categoryid, name, emergencylevel)
values (423, 'Spirometers', 5);
commit;
prompt 21 records loaded
prompt Loading DONOR...
insert into DONOR (donorid, name, isactive, designation)
values (95, 'MarlonCharles', 'n', 'For the memory of the family -Charles');
insert into DONOR (donorid, name, isactive, designation)
values (96, 'MarleyWahlberg', 'n', 'For the memory of the family -Wahlberg');
insert into DONOR (donorid, name, isactive, designation)
values (99, 'CeliaBoyle', 'n', 'For the memory of the family -Boyle');
insert into DONOR (donorid, name, isactive, designation)
values (107, 'MekhiCobbs', 'n', 'For the memory of the family -Cobbs');
insert into DONOR (donorid, name, isactive, designation)
values (110, 'BalthazarHong', 'n', 'For the memory of the family -Hong');
insert into DONOR (donorid, name, isactive, designation)
values (117, 'RoscoLi', 'n', 'For the memory of the family -Li');
insert into DONOR (donorid, name, isactive, designation)
values (139, 'FrancesHatchet', 'y', 'For the memory of the family -Hatchet');
insert into DONOR (donorid, name, isactive, designation)
values (161, 'TaylorChandler', 'y', 'For the memory of the family -Chandler');
insert into DONOR (donorid, name, isactive, designation)
values (169, 'JohnetteMetcalf', 'n', 'For the memory of the family -Metcalf');
insert into DONOR (donorid, name, isactive, designation)
values (179, 'AzucarColtrane', 'n', 'For the memory of the family -Coltrane');
insert into DONOR (donorid, name, isactive, designation)
values (181, 'CheechEngland', 'n', 'For the memory of the family -England');
insert into DONOR (donorid, name, isactive, designation)
values (187, 'BeverleyLindo', 'n', 'For the memory of the family -Lindo');
insert into DONOR (donorid, name, isactive, designation)
values (195, 'LariGarner', 'n', 'For the memory of the family -Garner');
insert into DONOR (donorid, name, isactive, designation)
values (197, 'JimmieFonda', 'n', 'For the memory of the family -Fonda');
insert into DONOR (donorid, name, isactive, designation)
values (199, 'KevnSampson', 'y', 'For the memory of the family -Sampson');
insert into DONOR (donorid, name, isactive, designation)
values (219, 'MelJudd', 'n', 'For the memory of the family -Judd');
insert into DONOR (donorid, name, isactive, designation)
values (227, 'ToriCarlyle', 'n', 'For the memory of the family -Carlyle');
insert into DONOR (donorid, name, isactive, designation)
values (228, 'AndraeAvalon', 'y', 'For the memory of the family -Avalon');
insert into DONOR (donorid, name, isactive, designation)
values (253, 'ColmBurstyn', 'n', 'For the memory of the family -Burstyn');
insert into DONOR (donorid, name, isactive, designation)
values (262, 'CliveFender', 'n', 'For the memory of the family -Fender');
insert into DONOR (donorid, name, isactive, designation)
values (1001, 'Shlomo Y', 'n', 'For memory of Shlomo');
insert into DONOR (donorid, name, isactive, designation)
values (1002, 'Shlomo Y', 'n', 'For memory of Shlomo');
insert into DONOR (donorid, name, isactive, designation)
values (1003, 'Shlomo Y', 'n', 'For memory of Shlomo');
insert into DONOR (donorid, name, isactive, designation)
values (334, 'JohnnyLynskey', 'n', 'For the memory of the family -Lynskey');
insert into DONOR (donorid, name, isactive, designation)
values (338, 'NikkiFolds', 'y', 'For the memory of the family -Folds');
insert into DONOR (donorid, name, isactive, designation)
values (346, 'GenaConnery', 'n', 'For the memory of the family -Connery');
insert into DONOR (donorid, name, isactive, designation)
values (349, 'ElisabethMidler', 'n', 'For the memory of the family -Midler');
insert into DONOR (donorid, name, isactive, designation)
values (351, 'BonnieMoraz', 'n', 'For the memory of the family -Moraz');
insert into DONOR (donorid, name, isactive, designation)
values (355, 'RhettO''Sullivan', 'n', 'For the memory of the family -O''Sullivan');
insert into DONOR (donorid, name, isactive, designation)
values (1000, 'Aharon Moshe', 'n', 'For memory of family Moshe');
insert into DONOR (donorid, name, isactive, designation)
values (363, 'JoannaZellweger', 'n', 'For the memory of the family -Zellweger');
insert into DONOR (donorid, name, isactive, designation)
values (375, 'JefferyLiotta', 'n', 'For the memory of the family -Liotta');
insert into DONOR (donorid, name, isactive, designation)
values (377, 'DaveyBailey', 'n', 'For the memory of the family -Bailey');
insert into DONOR (donorid, name, isactive, designation)
values (54, 'CrispinRedford', 'n', 'For the memory of the family -Redford');
insert into DONOR (donorid, name, isactive, designation)
values (57, 'JeanMacDonald', 'n', 'For the memory of the family -MacDonald');
insert into DONOR (donorid, name, isactive, designation)
values (60, 'PamelaCoburn', 'n', 'For the memory of the family -Coburn');
insert into DONOR (donorid, name, isactive, designation)
values (1010, 'LiamRhodes', 'n', 'Rhodes');
commit;
prompt 37 records loaded
prompt Loading ITEM...
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (218, 'Medical Ventilator Circuits', 'A device used to assist or replace spontaneous breathing in patients.', 0, 0, 414, 999999369);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (219, 'Tracheostomy Tube Holders', 'Bins used for the safe disposal of medical waste such as used needles syringes and dressings.', 0, 0, 409, 999999022);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (220, 'Tourniquet', 'A dressing used to cover and protect burns.', 0, 0, 407, 999999278);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (221, 'Portable Defibrillators', 'A device used to administer a measured dose of epinephrine in cases of severe allergic reactions.', 0, 0, 423, 999999261);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (222, 'First Aid Kit', 'Masks used to deliver anesthesia gases or oxygen to patients during surgery or procedures.', 0, 0, 414, 999999316);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (223, 'Medical Sterilization Pouches', 'A device that measures and displays the electrical activity of the heart.', 0, 0, 423, 999999242);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (224, 'Suture Kit', 'Devices used to secure tracheostomy tubes in place to prevent accidental removal.', 0, 0, 413, 999999347);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (225, 'Defibrillator pads', 'Strips used with a glucose meter to test the level of glucose in the blood.', 0, 0, 409, 999999176);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (226, 'Laryngeal Mask Airways', 'Syringes designed for single use to administer medication or draw blood.', 0, 0, 418, 999999099);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (227, 'Hemostatic Dressing', 'A device used to remove mucus blood or other fluids from the body.', 0, 0, 409, 999999362);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (228, 'Nebulizer', 'Needles used for injections or drawing blood samples.', 0, 1, 420, 999999055);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (229, 'Feeding Tube Extensions', 'Defibrillators designed for easy transport and use in various settings.', 0, 0, 404, 999999160);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (230, 'Orthopedic External Fixators', 'A type of adhesive tape used to secure dressings or bandages in place.', 0, 0, 417, 999999210);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (231, 'Hypodermic Needles', 'Scales used to measure the weight of patients.', 0, 0, 404, 545678901);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (232, 'Intravenous Catheter', 'Gloves worn by healthcare professionals to prevent contamination and protect against infection.', 0, 1, 403, 999999385);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (233, 'Disinfectant Wipes', 'A device used to apply pressure to a limb or extremity in order to control bleeding.', 0, 0, 420, 999999279);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (234, 'Laryngeal Mask Airways', 'Gloves designed for single use to prevent contamination and infection.', 0, 1, 418, 999999167);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (235, 'Enteral Feeding Tubes', 'Gloves worn by healthcare professionals to prevent contamination and protect against infection.', 0, 1, 407, 999999363);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (236, 'Portable Defibrillators', 'A device that turns liquid medicine into a fine mist that can be inhaled into the lungs.', 0, 0, 406, 999999322);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (237, 'Pulse Oximeter', 'Kits containing supplies for cleaning and maintaining tracheostomy tubes.', 0, 1, 411, 999999101);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (238, 'Burn Dressing', 'A device used to measure the pressure of the blood in the arteries.', 0, 0, 413, 999999244);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (239, 'Medical Feeding Pumps', 'A device used to cover penetrating chest wounds and prevent air from entering the chest cavity.', 0, 0, 416, 999999023);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (240, 'Orthopedic Walker', 'Materials used to create casts for immobilizing and supporting fractures or injuries.', 0, 1, 409, 999999082);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (241, 'Nasogastric Tubes', 'Materials used to create custom splints for immobilizing and supporting fractures or injuries.', 0, 0, 411, 999999087);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (242, 'IV Fluid Warmers', 'Sets used to administer intravenous fluids or medication from IV bags to patients.', 0, 0, 410, 999999248);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (243, 'Splinter Forceps', 'Braces used to support and stabilize joints or limbs.', 0, 0, 403, 999999075);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (244, 'Chest Seal', 'Stretchers designed for use in ambulances for transporting patients.', 0, 0, 421, 999999168);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (245, 'Neck Brace', 'Boots designed to immobilize and protect the foot and ankle.', 0, 0, 416, 999999241);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (246, 'Urinary Catheters', 'Materials used to immobilize and support fractures or injuries.', 0, 0, 408, 999999285);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (247, 'Medical Sterilization Pouches', 'Pouches used to hold and sterilize medical instruments and supplies.', 0, 1, 416, 999999128);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (248, 'Cardiac Monitor', 'Circuits used to connect patients to mechanical ventilators for assisted breathing.', 0, 1, 413, 999999341);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (249, 'IV Start Kit', 'A device used to measure the oxygen saturation of the blood.', 0, 0, 420, 999999114);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (250, 'Medical Feeding Pumps', 'Devices used to stabilize and support fractured bones externally.', 0, 0, 409, 999999202);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (251, 'Intravenous Administration Sets', 'Devices inserted into the throat to maintain an open airway during anesthesia or resuscitation.', 0, 0, 405, 999999109);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (252, 'Medical Ventilator Circuits', 'Splints used to stabilize and immobilize fractured femurs or lower limbs.', 0, 1, 412, 999999160);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (253, 'Burn Dressing', 'A kit containing devices used to establish or maintain a patient''s airway.', 0, 0, 407, 999999174);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (254, 'Anesthesia Masks', 'A device used to administer a measured dose of epinephrine in cases of severe allergic reactions.', 0, 0, 409, 999999195);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (255, 'Tracheostomy Care Kits', 'Stands used to support bags of intravenous fluids during administration to patients.', 0, 1, 415, 999999156);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (256, 'Epinephrine Auto-Injector', 'Medication used to relieve pain.', 0, 0, 419, 999999268);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (257, 'Intravenous Catheter', 'Extensions used to connect enteral feeding tubes to feeding pumps or syringes.', 0, 0, 408, 999999018);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (258, 'Portable Blood Pressure Monitors', 'Blades used with laryngoscopes for visualizing the larynx and inserting endotracheal tubes.', 0, 1, 423, 999999102);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (259, 'Urinary Catheters', 'Splints used to stabilize and immobilize fractured femurs or lower limbs.', 0, 1, 412, 999999229);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (260, 'Disinfectant Wipes', 'Handheld ultrasound devices used for point-of-care diagnostics.', 0, 1, 419, 999999312);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (261, 'Cervical Collar', 'Devices used to warm intravenous fluids before administration to patients.', 0, 1, 414, 545678901);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (262, 'Splint', 'Masks used to deliver rescue breaths during CPR or respiratory emergencies.', 0, 0, 412, 999999266);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (263, 'Orthopedic Boots', 'Devices inserted into the throat to maintain an open airway during anesthesia or resuscitation.', 0, 0, 418, 999999254);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (264, 'Medical Tourniquets', 'Devices used to deliver fluids medications or nutrients into the bloodstream at a controlled rate.', 0, 1, 408, 999999076);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (265, 'Splint', 'Bandages with a sticky backing used to cover small wounds or hold dressings in place.', 0, 1, 414, 999999068);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (266, 'Orthopedic Splinting Tools', 'A device that turns liquid medicine into a fine mist that can be inhaled into the lungs.', 0, 0, 410, 999999262);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (267, 'Stretcher', 'Kits containing tools and reagents for diagnosing specific medical conditions or infections.', 0, 0, 421, 546789012);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (268, 'Urinary Catheters', 'Masks used to deliver oxygen to patients with respiratory conditions or emergencies.', 0, 1, 406, 999999118);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (269, 'Chest Decompression Needles', 'Pouches used to hold and sterilize medical instruments and supplies.', 0, 1, 412, 999999092);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (270, 'Medical Waste Bins', 'Tourniquets used to control severe bleeding from extremity wounds.', 0, 1, 421, 999999018);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (271, 'Orthopedic Braces', 'A device used to measure the concentration of glucose in the blood.', 0, 1, 409, 999999269);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (272, 'Intravenous Cannulas', 'Devices used to deliver fluids medications or nutrients into the bloodstream at a controlled rate.', 0, 1, 421, 999999288);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (273, 'Nebulizer', 'A device used to support a patient''s neck and head in cases of suspected cervical spine injuries.', 0, 1, 412, 999999139);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (274, 'Cardiac Defibrillator Training Units', 'Wipes saturated with disinfectant solution used to clean surfaces and equipment.', 0, 1, 417, 999999030);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (275, 'Cardiac Defibrillator Training Units', 'Masks used to deliver rescue breaths during CPR or respiratory emergencies.', 0, 1, 412, 999999215);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (276, 'Nebulizer Mask', 'A device used to remove mucus blood or other fluids from the body.', 0, 1, 403, 999999213);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (277, 'Medical Gloves', 'Masks used to deliver rescue breaths during CPR or respiratory emergencies.', 0, 1, 411, 999999192);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (278, 'Medical Suction Canisters', 'Materials used to create casts for immobilizing and supporting fractures or injuries.', 0, 0, 405, 999999274);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (279, 'Medical Sterilization Pouches', 'A device used to remove mucus blood or other fluids from the body.', 0, 1, 404, 544098765);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (280, 'Cardiac Defibrillator Training Units', 'A device used to assist or replace spontaneous breathing in patients.', 0, 0, 403, 999999121);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (281, 'Oxygen Mask', 'Devices specifically designed for managing pediatric airways during resuscitation.', 0, 1, 408, 999999354);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (282, 'Medical Suction Canisters', 'A device used to assist or replace spontaneous breathing in patients.', 0, 0, 410, 999999273);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (283, 'Medical Ventilator Circuits', 'Stretchers designed for use in ambulances for transporting patients.', 0, 1, 418, 999999323);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (284, 'Oxygen Tank', 'Handheld ultrasound devices used for point-of-care diagnostics.', 0, 0, 420, 999999350);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (285, 'Suture Kit', 'Catheters used to remove secretions and fluids from the airway.', 0, 0, 421, 999999369);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (286, 'Orthopedic Splinting Tools', 'A device inserted through the nose to maintain an open airway.', 0, 0, 417, 999999313);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (287, 'Medical Feeding Pumps', 'A training device used to simulate the operation of an automated external defibrillator.', 0, 1, 408, 999999177);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (288, 'Intravenous Infusion Pumps', 'Circuits used to connect patients to mechanical ventilators for assisted breathing.', 0, 0, 415, 999999381);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (289, 'Medical Feeding Pumps', 'A device inserted through the nose to maintain an open airway.', 0, 1, 416, 999999088);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (290, 'Hypodermic Needles', 'Bandages with a sticky backing used to cover small wounds or hold dressings in place.', 0, 1, 419, 999999126);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (291, 'Portable Oxygen Concentrators', 'A sterile solution of salt in water used for various medical purposes.', 0, 1, 405, 999999229);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (292, 'Tourniquet', 'Bandages with a sticky backing used to cover small wounds or hold dressings in place.', 0, 0, 418, 999999245);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (293, 'Pediatric Airway Management Devices', 'Kits containing tools and reagents for diagnosing specific medical conditions or infections.', 0, 1, 414, 999999067);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (294, 'First Aid Kit', 'Defibrillators designed for easy transport and use in various settings.', 0, 1, 423, 999999360);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (295, 'Medical Suction Canisters', 'Devices inserted into the throat to maintain an open airway during anesthesia or resuscitation.', 0, 0, 407, 999999364);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (296, 'Hypodermic Needles', 'Extensions used to connect enteral feeding tubes to feeding pumps or syringes.', 0, 0, 414, 999999215);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (297, 'CPR Mask', 'Sets used to administer intravenous fluids or medication from IV bags to patients.', 0, 1, 413, 999999243);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (298, 'Medical Needles and Syringes', 'Thin tubes inserted into veins to administer fluids or medication.', 0, 0, 403, 999999293);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (299, 'Stretcher', 'Kits containing supplies for cleaning and maintaining tracheostomy tubes.', 0, 1, 408, 999999154);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (300, 'Defibrillator pads', 'Splints used to stabilize and immobilize fractured femurs or lower limbs.', 0, 1, 413, 999999014);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (301, 'Medical Suction Canisters', 'Wipes saturated with disinfectant solution used to clean surfaces and equipment.', 0, 1, 420, 999999374);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (302, 'Intravenous Cannulas', 'Devices inserted into the throat to maintain an open airway during anesthesia or resuscitation.', 0, 1, 404, 999999378);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (303, 'Electrocardiogram (ECG) Machines', 'Needles used for emergency decompression of tension pneumothorax.', 0, 1, 415, 999999290);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (304, 'Disposable Bedpans', 'Braces used to support and stabilize joints or limbs.', 0, 1, 422, 548901234);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (305, 'Cardiac Monitor', 'Gloves designed for single use to prevent contamination and infection.', 0, 0, 418, 999999202);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (306, 'Defibrillator pads', 'Circuits used to connect patients to mechanical ventilators for assisted breathing.', 0, 0, 420, 999999208);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (307, 'Nebulizer', 'A device used to support a patient''s neck and head in cases of suspected cervical spine injuries.', 0, 0, 404, 999999035);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (308, 'Pulse Oximeter', 'Sets used to administer intravenous fluids or medication from IV bags to patients.', 0, 1, 411, 999999198);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (309, 'Adhesive Bandages', 'A flat board used for immobilizing a patient with suspected spinal injuries.', 0, 0, 421, 999999154);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (310, 'Orthopedic Casting Materials', 'Flexible tubes inserted into the bladder to drain urine.', 0, 0, 414, 999999095);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (311, 'Disinfectant Wipes', 'Tubes used for collecting and storing blood samples for laboratory testing.', 0, 0, 416, 999999144);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (312, 'Enteral Feeding Tubes', 'Sets used to administer intravenous fluids or medication from IV bags to patients.', 0, 0, 415, 999999132);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (313, 'Pulse Oximeter', 'Devices that extract oxygen from the air and deliver it to patients via a nasal cannula or mask.', 0, 0, 423, 999999112);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (314, 'Medical Cast Saw Blades', 'A flat board used for immobilizing a patient with suspected spinal injuries.', 0, 0, 408, 999999106);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (315, 'Splinting Materials', 'Syringes designed for single use to administer medication or draw blood.', 0, 0, 412, 999999165);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (316, 'Nebulizer Mask', 'Kits containing tools and reagents for diagnosing specific medical conditions or infections.', 0, 1, 420, 999999148);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (317, 'Burn Dressing', 'Pouches used to hold and sterilize medical instruments and supplies.', 0, 1, 408, 999999377);
commit;
prompt 100 records committed...
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (318, 'Neck Brace', 'Manual resuscitators used to provide positive pressure ventilation to patients.', 0, 1, 407, 999999260);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (319, 'Laryngeal Mask Airways', 'Devices specifically designed for managing pediatric airways during resuscitation.', 0, 0, 415, 999999383);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (320, 'Tourniquet', 'Manual resuscitators used to provide positive pressure ventilation to patients.', 0, 1, 423, 999999256);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (321, 'Hemostatic Dressing', 'Sets of needles and syringes used for injections or aspirations.', 0, 0, 416, 999999288);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (322, 'Feeding Tube Extensions', 'A device used to support and assist walking for patients with lower limb injuries or disabilities.', 0, 0, 417, 999999230);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (323, 'Portable Ventilator', 'Kits containing supplies for cleaning and maintaining tracheostomy tubes.', 0, 1, 408, 999999198);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (324, 'Electrocardiogram (ECG) Machines', 'Braces used to support and stabilize joints or limbs.', 0, 0, 406, 999999101);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (325, 'First Aid Kit', 'Systems used to apply and control pressure to extremities to control bleeding during surgery.', 0, 1, 403, 999999253);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (326, 'Laryngoscope Blades', 'A device that measures and displays the electrical activity of the heart.', 0, 1, 403, 999999208);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (327, 'Intravenous Cannulas', 'A device used to administer rescue breaths during cardiopulmonary resuscitation (CPR).', 0, 1, 419, 999999323);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (328, 'Intravenous Catheter', 'Devices that extract oxygen from the air and deliver it to patients via a nasal cannula or mask.', 0, 1, 422, 999999087);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (329, 'Disposable Gloves', 'Implants used to stabilize or repair fractured or damaged bones.', 0, 0, 412, 999999220);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (330, 'Orthopedic Walker', 'Manual resuscitators used to provide positive pressure ventilation to patients.', 0, 0, 411, 999999039);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (331, 'Blood Pressure Cuff', 'Sets used to administer intravenous fluids or medication from IV bags to patients.', 0, 1, 418, 999999193);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (332, 'Intravenous Cannulas', 'Stretchers designed for use in ambulances for transporting patients.', 0, 0, 420, 999999385);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (333, 'Blood Collection Tubes', 'Stretchers designed for use in ambulances for transporting patients.', 0, 0, 422, 999999325);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (452, 'Medical Feeding Pumps', 'Gloves designed for single use to prevent contamination and infection.', 0, 0, 410, 999999306);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (453, 'IV Start Kit', 'Devices used to stabilize and support fractured bones externally.', 0, 1, 419, 999999134);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (454, 'Orthopedic Implants', 'A mask used to deliver aerosolized medication to the lungs.', 0, 0, 419, 999999353);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (455, 'Nebulizer Mask', 'Circuits used to connect patients to mechanical ventilators for assisted breathing.', 0, 1, 410, 999999186);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (456, 'IV Start Kit', 'A device used to remove mucus blood or other fluids from the body.', 0, 1, 409, 999999155);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (457, 'Chest Decompression Needles', 'Blades used for cutting through orthopedic casts during cast removal.', 0, 1, 403, 999999343);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (458, 'Disinfectant Wipes', 'Canisters used to collect and dispose of suctioned fluids during medical procedures.', 0, 1, 419, 999999270);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (459, 'Tracheostomy Tubes', 'Swabs saturated with alcohol used to clean and disinfect the skin before injections or procedures.', 0, 0, 416, 999999315);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (460, 'Nasopharyngeal Airway', 'A medical instrument used to view the inside of the throat and larynx.', 0, 0, 419, 999999070);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (461, 'AED Training Unit', 'A kit containing supplies and equipment for administering basic first aid.', 0, 0, 403, 999999298);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (462, 'Disposable Bedpans', 'A device used to remove mucus blood or other fluids from the body.', 0, 0, 417, 999999037);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (463, 'Laryngoscope Blades', 'Needles used for injections or drawing blood samples.', 0, 1, 404, 999999377);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (464, 'Epinephrine Auto-Injector', 'Devices specifically designed for managing pediatric airways during resuscitation.', 0, 0, 407, 999999003);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (465, 'Orthopedic Implants', 'A medical device used to support a patient''s neck and head in cases of suspected spinal injuries.', 0, 0, 403, 999999072);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (466, 'Orthopedic Splinting Materials', 'Devices that extract oxygen from the air and deliver it to patients via a nasal cannula or mask.', 0, 0, 420, 999999014);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (467, 'Enteral Feeding Tubes', 'A type of adhesive tape used to secure dressings or bandages in place.', 0, 1, 415, 999999238);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (468, 'Electrocardiogram (ECG) Machines', 'A device used to support a patient''s neck and head in cases of suspected cervical spine injuries.', 0, 0, 403, 999999335);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (469, 'Backboard', 'Tubes inserted through the nose into the stomach for feeding or drainage.', 0, 0, 416, 999999196);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (470, 'Feeding Tube Extensions', 'A flat board used for immobilizing a patient with suspected spinal injuries.', 0, 1, 406, 999999082);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (471, 'Nasogastric Tubes', 'A device used to administer rescue breaths during cardiopulmonary resuscitation (CPR).', 0, 1, 414, 999999313);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (472, 'Electrocardiogram (ECG) Machines', 'Pouches used to hold and sterilize medical instruments and supplies.', 0, 0, 403, 999999244);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (473, 'Medical Needles and Syringes', 'Thin tubes inserted into veins to administer fluids or medication.', 0, 1, 420, 999999231);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (474, 'Neck Brace', 'Pumps used to deliver nutrition or medications directly into the digestive tract.', 0, 0, 423, 999999116);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (475, 'Orthopedic Splinting Tools', 'Devices used to stabilize fractured bones internally with screws plates or rods.', 0, 1, 403, 999999304);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (476, 'Oxygen Tank', 'A device used to immobilize and support fractures or injuries to the arms or legs.', 0, 1, 413, 999999081);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (477, 'Medical Oxygen Masks', 'Canisters used to collect and dispose of suctioned fluids during medical procedures.', 0, 0, 407, 999999339);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (478, 'Stretcher', 'A device used to immobilize and support fractures or injuries to the arms or legs.', 0, 1, 415, 999999381);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (479, 'Orthopedic Traction Devices', 'A device used to apply pressure to a limb or extremity in order to control bleeding.', 0, 1, 407, 999999118);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (480, 'Disinfectant Wipes', 'Bags used to apply controlled pressure to intravenous fluids during rapid infusion.', 0, 1, 412, 546098765);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (481, 'Tracheostomy Tubes', 'Devices used to stabilize and support fractured bones externally.', 0, 0, 407, 999999112);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (482, 'Medical Scales', 'A device used to measure the oxygen saturation of the blood.', 0, 1, 408, 999999218);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (483, 'Laryngeal Mask Airways', 'Tourniquets used to control severe bleeding from extremity wounds.', 0, 1, 405, 999999090);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (484, 'Suture Kit', 'A medical instrument used to view the inside of the throat and larynx.', 0, 1, 423, 999999097);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (485, 'Portable Defibrillators', 'A mask placed over the nose and mouth to deliver oxygen to the patient.', 0, 1, 408, 543456789);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (486, 'Portable Ultrasound Machines', 'A device used to administer a measured dose of epinephrine in cases of severe allergic reactions.', 0, 0, 420, 999999334);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (487, 'IV Start Kit', 'Materials used to immobilize and support fractures or injuries.', 0, 0, 423, 999999109);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (488, 'Intravenous Cannulas', 'Sets used to administer intravenous fluids or medication from IV bags to patients.', 0, 1, 418, 999999182);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (489, 'Nebulizer', 'A device used to immobilize and support fractures or injuries to the arms or legs.', 0, 0, 410, 999999333);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (490, 'Defibrillator pads', 'Kits containing supplies for cleaning and maintaining tracheostomy tubes.', 0, 1, 422, 999999101);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (491, 'Tracheostomy Tube Holders', 'Thin tubes inserted into veins to administer fluids or medication.', 0, 0, 421, 999999096);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (492, 'Backboard', 'Defibrillators designed for easy transport and use in various settings.', 0, 0, 408, 999999138);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (493, 'Enteral Feeding Tubes', 'A dressing used to cover and protect burns.', 0, 0, 409, 999999252);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (494, 'Blood Pressure Cuff', 'Devices used to warm intravenous fluids before administration to patients.', 0, 1, 420, 999999106);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (495, 'Neck Brace', 'A device that turns liquid medicine into a fine mist that can be inhaled into the lungs.', 0, 1, 415, 999999205);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (496, 'Orthopedic Tourniquet Systems', 'Devices used to warm intravenous fluids before administration to patients.', 0, 1, 416, 999999316);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (497, 'Airway Kit', 'Gloves designed for single use to prevent contamination and infection.', 0, 0, 408, 999999199);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (498, 'Medical Tape', 'A device used to cover penetrating chest wounds and prevent air from entering the chest cavity.', 0, 0, 411, 999999116);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (499, 'Pediatric Airway Management Devices', 'Swabs saturated with alcohol used to clean and disinfect the skin before injections or procedures.', 0, 0, 405, 999999331);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (500, 'Electrocardiogram (ECG) Machines', 'Bins used for the safe disposal of medical waste such as used needles syringes and dressings.', 0, 1, 403, 999999176);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (501, 'Orthopedic Tourniquet Systems', 'A device used to measure the concentration of glucose in the blood.', 0, 1, 409, 999999225);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (502, 'Ambu Bags', 'Gloves designed for single use to prevent contamination and infection.', 0, 1, 414, 999999242);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (503, 'Orthopedic Cast', 'A dressing designed to promote blood clotting and control bleeding.', 0, 0, 420, 999999155);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (504, 'Diagnostic Kits', 'A device used to administer rescue breaths during cardiopulmonary resuscitation (CPR).', 0, 1, 410, 999999128);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (505, 'Intravenous Infusion Pumps', 'A tank containing compressed oxygen for medical use.', 0, 1, 423, 999999389);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (506, 'Orthopedic Casting Materials', 'Kits containing tools and reagents for diagnosing specific medical conditions or infections.', 0, 1, 421, 541234567);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (507, 'Orthopedic Splinting Materials', 'Tools used to apply and shape splinting materials for orthopedic injuries.', 0, 0, 423, 999999138);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (508, 'IV Start Kit', 'A device used for immobilizing a fractured or injured bone.', 0, 0, 419, 999999022);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (509, 'Orthopedic Splinting Tools', 'Stands used to support bags of intravenous fluids during administration to patients.', 0, 0, 423, 999999078);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (510, 'Medical Traction Splints', 'A kit containing supplies and equipment for administering basic first aid.', 0, 0, 416, 999999054);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (511, 'Orthopedic External Fixators', 'A device used to administer rescue breaths during cardiopulmonary resuscitation (CPR).', 0, 0, 423, 999999183);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (512, 'Splint', 'A device used to measure the pressure of the blood in the arteries.', 0, 1, 403, 999999021);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (513, 'Cardiac Monitor', 'A kit containing instruments and materials for suturing wounds.', 0, 1, 422, 999999319);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (514, 'Laryngoscope', 'Kits containing tools and reagents for diagnosing specific medical conditions or infections.', 0, 1, 410, 999999045);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (515, 'Blood Collection Tubes', 'A device used to support and assist walking for patients with lower limb injuries or disabilities.', 0, 1, 407, 999999064);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (516, 'IV Fluid Warmers', 'Braces used to support and stabilize joints or limbs.', 0, 0, 413, 999999165);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (517, 'Orthopedic Casting Materials', 'A large sterile dressing used to cover extensive wounds or burns.', 0, 0, 404, 999999068);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (518, 'Orthopedic Tourniquet Systems', 'A device used to immobilize and support fractures or injuries to the arms or legs.', 0, 0, 415, 999999102);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (519, 'Oxygen Tank', 'Handheld devices used to measure blood pressure in clinical or home settings.', 0, 0, 405, 543098765);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (520, 'Medical Cast Saw Blades', 'Thin tubes inserted into veins to administer fluids or medication.', 0, 1, 420, 999999271);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (521, 'Medical Suction Device', 'Materials used to create custom splints for immobilizing and supporting fractures or injuries.', 0, 1, 407, 999999014);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (522, 'Burn Dressing', 'Braces used to support and stabilize joints or limbs.', 0, 1, 408, 999999065);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (523, 'Blood Collection Tubes', 'A flat board used for immobilizing a patient with suspected spinal injuries.', 0, 0, 411, 999999039);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (524, 'Ambu Bags', 'A dressing used to cover and protect burns.', 0, 0, 411, 999999163);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (525, 'Tourniquet', 'A device used to apply pressure to a limb or extremity in order to control bleeding.', 0, 1, 415, 999999352);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (526, 'IV Start Kit', 'A portable bed or litter for transporting patients.', 0, 0, 405, 999999176);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (527, 'Nasal Oxygen Cannulas', 'Implants used to stabilize or repair fractured or damaged bones.', 0, 0, 408, 999999194);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (528, 'Medical Tourniquets', 'A device used to support and assist walking for patients with lower limb injuries or disabilities.', 0, 1, 417, 999999235);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (529, 'Blood Pressure Cuff', 'Stretchers designed for use in ambulances for transporting patients.', 0, 0, 423, 999999335);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (530, 'Portable Ultrasound Machines', 'Materials used to create custom splints for immobilizing and supporting fractures or injuries.', 0, 0, 410, 999999068);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (531, 'Medical Tape', 'Splints used to stabilize and immobilize fractured femurs or lower limbs.', 0, 0, 411, 999999016);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (532, 'Tracheostomy Tubes', 'Medication used to relieve pain.', 0, 0, 404, 999999303);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (533, 'Intravenous Administration Sets', 'A sterile solution of salt in water used for various medical purposes.', 0, 1, 411, 545678901);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (534, 'Orthopedic Splinting Materials', 'A dressing used to cover and protect burns.', 0, 1, 408, 999999137);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (535, 'Tracheostomy Tubes', 'Gloves worn by healthcare professionals to prevent contamination and protect against infection.', 0, 0, 419, 999999143);
commit;
prompt 200 records committed...
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (536, 'First Aid Kit', 'A thin tube inserted into a vein to administer fluids medication or blood products.', 0, 0, 406, 999999013);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (537, 'Ambu Bags', 'A device used to measure the pressure of the blood in the arteries.', 0, 0, 416, 999999342);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (538, 'Orthopedic Boots', 'Bandages with a sticky backing used to cover small wounds or hold dressings in place.', 0, 1, 416, 999999373);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (539, 'Hypodermic Needles', 'Forceps designed for removing splinters or foreign objects from the skin.', 0, 0, 415, 999999205);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (540, 'Nasal Oxygen Cannulas', 'A mask used to deliver aerosolized medication to the lungs.', 0, 1, 422, 547098765);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (541, 'Feeding Tube Extensions', 'Canisters used to collect and dispose of suctioned fluids during medical procedures.', 0, 1, 405, 999999051);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (542, 'Medical Gloves', 'Strips used with a glucose meter to test the level of glucose in the blood.', 0, 0, 404, 999999354);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (543, 'Medical Suction Device', 'A device that measures and displays the electrical activity of the heart.', 0, 0, 422, 999999154);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (544, 'Portable Blood Pressure Monitors', 'Bags used to apply controlled pressure to intravenous fluids during rapid infusion.', 0, 0, 403, 999999067);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (545, 'Tracheostomy Tubes', 'A kit containing supplies and equipment for administering basic first aid.', 0, 0, 409, 543456789);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (546, 'Cardiac Defibrillator Training Units', 'Bins used for the safe disposal of medical waste such as used needles syringes and dressings.', 0, 1, 403, 999999382);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (547, 'Stretcher', 'Canisters used to collect and dispose of suctioned fluids during medical procedures.', 0, 1, 406, 999999072);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (548, 'Medical Oxygen Masks', 'A tank containing compressed oxygen for medical use.', 0, 0, 405, 999999246);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (549, 'Medical Cast Saw Blades', 'A training device used to simulate the operation of an automated external defibrillator.', 0, 0, 420, 999999140);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (550, 'Medical Tape', 'Sets of needles and syringes used for injections or aspirations.', 0, 0, 412, 999999091);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (551, 'Medical Oxygen Masks', 'A device used to cover penetrating chest wounds and prevent air from entering the chest cavity.', 0, 1, 417, 999999123);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (552, 'Orthopedic External Fixators', 'Systems used to apply and control pressure to extremities to control bleeding during surgery.', 0, 1, 410, 999999016);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (553, 'Orthopedic Casting Materials', 'Medication used to relieve pain.', 0, 1, 403, 999999339);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (554, 'Epinephrine Auto-Injector', 'Handheld devices used to measure blood pressure in clinical or home settings.', 0, 1, 405, 999999250);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (555, 'Laryngeal Mask Airways', 'Splints used to stabilize and immobilize fractured femurs or lower limbs.', 0, 0, 412, 999999208);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (556, 'Hypodermic Needles', 'A device used to remove mucus blood or other fluids from the body.', 0, 1, 415, 999999008);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (557, 'Diagnostic Kits', 'Devices specifically designed for managing pediatric airways during resuscitation.', 0, 0, 406, 999999285);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (558, 'Orthopedic Tourniquet Systems', 'Wipes saturated with disinfectant solution used to clean surfaces and equipment.', 0, 1, 403, 544567890);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (559, 'Intravenous Cannulas', 'A type of adhesive tape used to secure dressings or bandages in place.', 0, 1, 415, 999999165);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (560, 'Laryngoscope Blades', 'Circuits used to connect patients to mechanical ventilators for assisted breathing.', 0, 0, 407, 999999300);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (561, 'Disposable Syringes', 'Tubes inserted into the digestive tract for delivering nutrition or medications.', 0, 1, 404, 999999127);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (562, 'Medical Waste Bins', 'Devices used to deliver fluids medications or nutrients into the bloodstream at a controlled rate.', 0, 0, 406, 999999088);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (563, 'Medical Tape', 'A device that measures and displays the electrical activity of the heart.', 0, 0, 408, 999999101);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (564, 'Laryngoscope', 'Defibrillators designed for easy transport and use in various settings.', 0, 1, 413, 999999296);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (565, 'Oxygen Mask', 'Tubes used for collecting and storing blood samples for laboratory testing.', 0, 1, 416, 999999335);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (566, 'Orthopedic Splint', 'A sterile solution of salt in water used for various medical purposes.', 0, 0, 421, 999999046);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (567, 'Orthopedic Splinting Tools', 'Devices inserted into the throat to maintain an open airway during anesthesia or resuscitation.', 0, 1, 414, 999999020);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (568, 'Medical Needles and Syringes', 'Gloves designed for single use to prevent contamination and infection.', 0, 1, 412, 999999157);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (570, 'Oxygen Tank', 'Circuits used to connect patients to mechanical ventilators for assisted breathing.', 0, 1, 419, 545098765);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (571, 'Medical Waste Bins', 'Masks used to deliver anesthesia gases or oxygen to patients during surgery or procedures.', 0, 0, 407, 999999006);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (572, 'Tracheostomy Care Kits', 'A kit containing supplies and equipment for administering basic first aid.', 0, 0, 409, 999999114);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (573, 'Disposable Bedpans', 'Masks used to deliver anesthesia gases or oxygen to patients during surgery or procedures.', 0, 0, 403, 999999199);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (574, 'Alcohol Swabs', 'Blades used for cutting through orthopedic casts during cast removal.', 0, 1, 411, 999999050);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (575, 'Hemostatic Dressing', 'A kit containing devices used to establish or maintain a patient''s airway.', 0, 1, 416, 999999107);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (576, 'Ambu Bags', 'Pouches used to hold and sterilize medical instruments and supplies.', 0, 1, 414, 999999108);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (577, 'Defibrillator pads', 'A flat board used for immobilizing a patient with suspected spinal injuries.', 0, 0, 413, 999999251);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (578, 'Disposable Bedpans', 'Catheters used to remove secretions and fluids from the airway.', 0, 1, 421, 999999061);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (579, 'Nebulizer Mask', 'Tubes inserted into the digestive tract for delivering nutrition or medications.', 0, 0, 422, 999999359);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (580, 'Anesthesia Masks', 'A device used to cover penetrating chest wounds and prevent air from entering the chest cavity.', 0, 1, 413, 999999175);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (581, 'Nebulizer Mask', 'A type of adhesive tape used to secure dressings or bandages in place.', 0, 1, 415, 999999070);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (582, 'Medical Traction Splints', 'Flexible tubes inserted into the bladder to drain urine.', 0, 1, 403, 999999015);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (583, 'Chest Decompression Needles', 'Devices used to stabilize and support fractured bones externally.', 0, 1, 423, 999999112);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (584, 'Laryngeal Mask Airways', 'A device used to measure the pressure of the blood in the arteries.', 0, 0, 411, 999999343);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (585, 'Medical Suction Device', 'Pads used with a defibrillator to deliver an electric shock to the heart.', 0, 0, 415, 999999316);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (586, 'Cardiac Monitor', 'Tubes used for collecting and storing blood samples for laboratory testing.', 0, 1, 408, 999999025);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (587, 'Pulse Oximeter', 'Pumps used to deliver nutrition or medications directly into the digestive tract.', 0, 0, 413, 999999361);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (588, 'Epinephrine Auto-Injector', 'Devices used to record the electrical activity of the heart for diagnostic purposes.', 0, 0, 410, 999999049);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (589, 'Orthopedic Splinting Tools', 'Pumps used to deliver nutrition or medications directly into the digestive tract.', 0, 1, 413, 999999250);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (590, 'Pulse Oximeter', 'Medication used to relieve pain.', 0, 1, 408, 999999207);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (591, 'Orthopedic Implants', 'Stretchers designed for use in ambulances for transporting patients.', 0, 1, 410, 999999043);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (592, 'Disposable Bedpans', 'Tubes inserted through the nose into the stomach for feeding or drainage.', 0, 1, 408, 999999337);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (593, 'Portable Oxygen Concentrators', 'Kits containing supplies for cleaning and maintaining tracheostomy tubes.', 0, 0, 423, 999999146);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (594, 'Ambu Bags', 'Devices used to stabilize and support fractured bones externally.', 0, 0, 414, 999999081);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (595, 'Portable Ultrasound Machines', 'A flat board used for immobilizing a patient with suspected spinal injuries.', 0, 1, 418, 999999265);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (596, 'Medical Gloves', 'Devices that extract oxygen from the air and deliver it to patients via a nasal cannula or mask.', 0, 0, 422, 999999249);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (597, 'Defibrillator pads', 'A device that measures and displays the electrical activity of the heart.', 0, 1, 405, 999999150);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (598, 'Ambulance Stretchers', 'A kit containing devices used to establish or maintain a patient''s airway.', 0, 0, 406, 999999350);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (599, 'Blood Glucose Test Strips', 'Blades used for cutting through orthopedic casts during cast removal.', 0, 0, 412, 999999044);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (394, 'Cardiac Monitor', 'Extensions used to connect enteral feeding tubes to feeding pumps or syringes.', 0, 0, 410, 999999357);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (395, 'Intravenous Drip Stands', 'Devices used to warm intravenous fluids before administration to patients.', 0, 0, 410, 999999265);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (396, 'Tracheostomy Tubes', 'A device used to measure the concentration of glucose in the blood.', 0, 1, 419, 999999052);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (397, 'Medical Traction Splints', 'Devices used to warm intravenous fluids before administration to patients.', 0, 1, 419, 999999137);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (398, 'Orthopedic Internal Fixation Devices', 'Devices specifically designed for managing pediatric airways during resuscitation.', 0, 1, 407, 999999223);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (399, 'Ambulance Stretchers', 'A device used to immobilize and support fractures or injuries to the arms or legs.', 0, 0, 419, 999999385);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (400, 'Orthopedic External Fixators', 'A device used to assist or replace spontaneous breathing in patients.', 0, 1, 420, 999999227);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (401, 'Stretcher', 'Needles used for emergency decompression of tension pneumothorax.', 0, 0, 423, 999999125);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (402, 'Cardiac Monitor', 'Cannulas inserted into the nostrils to deliver oxygen to patients.', 0, 0, 421, 999999248);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (403, 'Tracheostomy Care Kits', 'A kit containing supplies and equipment for administering basic first aid.', 0, 1, 421, 999999211);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (404, 'Laryngoscope', 'A device used to measure the concentration of glucose in the blood.', 0, 1, 415, 999999008);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (405, 'Defibrillator pads', 'Materials used to create custom splints for immobilizing and supporting fractures or injuries.', 0, 0, 410, 999999197);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (406, 'Medical Sterilization Pouches', 'A training device used to simulate the operation of an automated external defibrillator.', 0, 0, 416, 999999004);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (407, 'Medical Sterilization Pouches', 'Pouches used to hold and sterilize medical instruments and supplies.', 0, 0, 404, 999999141);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (408, 'Pulse Oximeter', 'Masks used to deliver anesthesia gases or oxygen to patients during surgery or procedures.', 0, 1, 415, 999999358);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (409, 'Laryngoscope', 'Materials used to create custom splints for immobilizing and supporting fractures or injuries.', 0, 0, 420, 999999300);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (410, 'Orthopedic Braces', 'A training device used to simulate the operation of an automated external defibrillator.', 0, 1, 414, 999999271);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (411, 'Glucose Meter', 'Blades used for cutting through orthopedic casts during cast removal.', 0, 0, 418, 999999153);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (412, 'Portable Ventilator', 'A device that turns liquid medicine into a fine mist that can be inhaled into the lungs.', 0, 0, 419, 999999325);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (413, 'Medical Waste Bins', 'A device that turns liquid medicine into a fine mist that can be inhaled into the lungs.', 0, 0, 414, 999999251);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (414, 'Disposable Bedpans', 'Stands used to support bags of intravenous fluids during administration to patients.', 0, 1, 412, 999999163);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (415, 'Glucose Meter', 'Gloves worn by healthcare professionals to prevent contamination and protect against infection.', 0, 0, 419, 999999317);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (416, 'Orthopedic Braces', 'Braces used to support and stabilize joints or limbs.', 0, 0, 405, 999999175);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (417, 'Medical Ventilator Circuits', 'Devices specifically designed for managing pediatric airways during resuscitation.', 0, 1, 410, 999999206);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (418, 'Medical Waste Bins', 'A thin tube inserted into a vein to administer fluids medication or blood products.', 0, 0, 413, 999999310);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (419, 'Cervical Collar', 'Canisters used to collect and dispose of suctioned fluids during medical procedures.', 0, 0, 406, 999999193);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (420, 'First Aid Kit', 'A device inserted through the nose to maintain an open airway.', 0, 1, 416, 999999340);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (569, 'First Aid Kit', 'A large sterile dressing used to cover extensive wounds or burns.', 0, 1, 410, 999999073);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (449, 'Feeding Tube Extensions', 'A device that turns liquid medicine into a fine mist that can be inhaled into the lungs.', 0, 1, 408, 999999384);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (450, 'Intravenous Cannulas', 'Devices used to stabilize fractured bones internally with screws plates or rods.', 0, 1, 410, 999999122);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (451, 'Portable Oxygen Concentrators', 'Pumps used to deliver nutrition or medications directly into the digestive tract.', 0, 1, 408, 999999010);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (421, 'Orthopedic Internal Fixation Devices', 'A device used to administer a measured dose of epinephrine in cases of severe allergic reactions.', 0, 1, 406, 999999029);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (422, 'Cervical Collar', 'Pads used with a defibrillator to deliver an electric shock to the heart.', 0, 0, 408, 999999240);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (423, 'Portable Oxygen Concentrators', 'Masks used to deliver oxygen to patients with respiratory conditions or emergencies.', 0, 1, 414, 999999010);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (424, 'Ambulance Stretchers', 'A dressing used to cover and protect burns.', 0, 1, 423, 999999290);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (425, 'Nasal Oxygen Cannulas', 'Masks used to deliver oxygen to patients with respiratory conditions or emergencies.', 0, 0, 403, 999999010);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (426, 'Laryngoscope Blades', 'Handheld ultrasound devices used for point-of-care diagnostics.', 0, 1, 415, 999999180);
commit;
prompt 300 records committed...
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (427, 'Splinter Forceps', 'A kit containing supplies and equipment for administering basic first aid.', 0, 0, 418, 999999325);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (428, 'Orthopedic Braces', 'A device used to remove mucus blood or other fluids from the body.', 0, 0, 421, 999999201);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (429, 'Electrocardiogram (ECG) Machines', 'A device used to immobilize and support fractures or injuries to the arms or legs.', 0, 1, 419, 999999087);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (430, 'Medical Suction Catheters', 'Bandages with a sticky backing used to cover small wounds or hold dressings in place.', 0, 1, 413, 999999331);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (431, 'Portable Ultrasound Machines', 'Masks used to deliver rescue breaths during CPR or respiratory emergencies.', 0, 0, 412, 999999172);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (432, 'Disinfectant Wipes', 'A kit containing devices used to establish or maintain a patient''s airway.', 0, 0, 417, 999999085);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (433, 'Medical Waste Bins', 'Catheters used to remove secretions and fluids from the airway.', 0, 0, 412, 549098765);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (434, 'Urinary Catheters', 'A device used to measure the pressure of the blood in the arteries.', 0, 1, 409, 999999062);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (435, 'Cervical Collar', 'Defibrillators designed for easy transport and use in various settings.', 0, 1, 408, 999999262);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (436, 'Cardiac Monitor', 'Gloves worn by healthcare professionals to prevent contamination and protect against infection.', 0, 0, 420, 999999071);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (437, 'Nasogastric Tubes', 'A device used to remove mucus blood or other fluids from the body.', 0, 1, 418, 544567890);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (438, 'Intravenous Cannulas', 'Flexible tubes inserted into the bladder to drain urine.', 0, 0, 421, 999999301);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (439, 'Backboard', 'Splints used to stabilize and immobilize fractured femurs or lower limbs.', 0, 0, 406, 999999154);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (440, 'Tracheostomy Tube Holders', 'A device that turns liquid medicine into a fine mist that can be inhaled into the lungs.', 0, 0, 415, 999999202);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (441, 'Disinfectant Wipes', 'Blades used with laryngoscopes for visualizing the larynx and inserting endotracheal tubes.', 0, 1, 419, 545098765);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (442, 'Blood Pressure Cuff', 'Materials used to create custom splints for immobilizing and supporting fractures or injuries.', 0, 1, 414, 999999121);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (443, 'Defibrillator pads', 'Devices used to warm intravenous fluids before administration to patients.', 0, 0, 414, 999999074);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (444, 'Disposable Syringes', 'A dressing used to cover and protect burns.', 0, 0, 420, 999999153);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (445, 'Medical Cast Saw Blades', 'Scales used to measure the weight of patients.', 0, 1, 417, 999999172);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (446, 'Oxygen Tank', 'Manual resuscitators used to provide positive pressure ventilation to patients.', 0, 1, 415, 999999211);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (447, 'Intravenous Infusion Pumps', 'Defibrillators designed for easy transport and use in various settings.', 0, 0, 406, 541234567);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (448, 'Disposable Gloves', 'Circuits used to connect patients to mechanical ventilators for assisted breathing.', 0, 0, 417, 999999104);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (334, 'Disinfectant Wipes', 'A device used to immobilize and support fractures or injuries to the arms or legs.', 0, 0, 421, 999999346);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (335, 'Orthopedic Walker', 'Devices used to stabilize and support fractured bones externally.', 0, 0, 407, 999999008);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (336, 'Airway Kit', 'A mask placed over the nose and mouth to deliver oxygen to the patient.', 0, 0, 417, 999999263);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (337, 'Stretcher', 'Manual resuscitators used to provide positive pressure ventilation to patients.', 0, 1, 413, 999999029);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (338, 'Nebulizer Mask', 'Medication used to relieve pain.', 0, 1, 413, 999999280);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (339, 'Pressure Infusion Bags', 'Bins used for the safe disposal of medical waste such as used needles syringes and dressings.', 0, 1, 423, 999999033);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (340, 'Nebulizer Mask', 'Pads used with a defibrillator to deliver an electric shock to the heart.', 0, 0, 416, 999999217);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (341, 'Multi-Trauma Dressing', 'Stands used to support bags of intravenous fluids during administration to patients.', 0, 0, 405, 999999248);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (342, 'Cardiac Defibrillator Training Units', 'Swabs saturated with alcohol used to clean and disinfect the skin before injections or procedures.', 0, 1, 411, 999999128);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (343, 'Portable Ventilator', 'Bins used for the safe disposal of medical waste such as used needles syringes and dressings.', 0, 1, 419, 999999033);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (344, 'Disposable Bedpans', 'Pads used with a defibrillator to deliver an electric shock to the heart.', 0, 1, 411, 999999326);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (345, 'AED Training Unit', 'A kit containing devices used to establish or maintain a patient''s airway.', 0, 0, 421, 999999291);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (346, 'Orthopedic Walker', 'Masks used to deliver oxygen to patients with respiratory conditions or emergencies.', 0, 0, 421, 999999146);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (347, 'First Aid Kit', 'Kits containing tools and reagents for diagnosing specific medical conditions or infections.', 0, 1, 422, 999999058);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (348, 'Pulse Oximeter', 'Cannulas inserted into the nostrils to deliver oxygen to patients.', 0, 0, 405, 999999185);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (349, 'Medical Suction Canisters', 'A thin tube inserted into a vein to administer fluids medication or blood products.', 0, 0, 404, 999999245);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (350, 'Laryngoscope', 'A kit containing instruments and materials for suturing wounds.', 0, 0, 418, 999999133);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (351, 'Blood Glucose Test Strips', 'Blades used for cutting through orthopedic casts during cast removal.', 0, 0, 412, 999999133);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (352, 'Nebulizer', 'Devices used to secure tracheostomy tubes in place to prevent accidental removal.', 0, 0, 406, 999999383);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (353, 'Blood Pressure Cuff', 'Handheld ultrasound devices used for point-of-care diagnostics.', 0, 0, 415, 999999216);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (354, 'Medical Feeding Pumps', 'A device used to immobilize and support fractures or injuries to the arms or legs.', 0, 1, 416, 999999170);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (355, 'Multi-Trauma Dressing', 'A device used to measure the concentration of glucose in the blood.', 0, 0, 423, 999999070);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (356, 'Disinfectant Wipes', 'Medication used to relieve pain.', 0, 1, 422, 999999228);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (357, 'AED Training Unit', 'A device used to administer a measured dose of epinephrine in cases of severe allergic reactions.', 0, 0, 405, 999999107);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (358, 'Hemostatic Dressing', 'A device used to support a patient''s neck and head in cases of suspected cervical spine injuries.', 0, 1, 411, 999999036);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (359, 'Cervical Collar', 'Materials used to create custom splints for immobilizing and supporting fractures or injuries.', 0, 1, 420, 999999233);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (360, 'Splint', 'A device used to measure the oxygen saturation of the blood.', 0, 0, 418, 999999310);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (361, 'Saline Solution', 'Scales used to measure the weight of patients.', 0, 0, 409, 999999340);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (362, 'Glucose Meter', 'Cannulas inserted into the nostrils to deliver oxygen to patients.', 0, 0, 412, 999999202);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (363, 'Medical Tape', 'Wipes saturated with disinfectant solution used to clean surfaces and equipment.', 0, 1, 405, 999999380);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (364, 'Medical Tourniquets', 'Training devices used to simulate the operation of cardiac defibrillators.', 0, 1, 421, 999999067);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (365, 'Ambu Bags', 'Materials used to create custom splints for immobilizing and supporting fractures or injuries.', 0, 0, 415, 999999248);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (366, 'Intravenous Catheter', 'Needles used for injections or drawing blood samples.', 0, 0, 406, 999999278);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (367, 'Medical Tape', 'Kits containing supplies for cleaning and maintaining tracheostomy tubes.', 0, 1, 406, 999999270);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (368, 'Medical Waste Bins', 'A device used to apply pressure to a limb or extremity in order to control bleeding.', 0, 1, 412, 999999193);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (369, 'Urinary Catheters', 'A kit containing instruments and materials for suturing wounds.', 0, 0, 409, 999999291);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (370, 'Splint', 'Scales used to measure the weight of patients.', 0, 1, 419, 999999256);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (371, 'Cardiac Monitor', 'A rigid dressing used to immobilize and protect a broken bone or injured limb.', 0, 0, 410, 547098765);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (372, 'Intravenous Infusion Pumps', 'Wipes saturated with disinfectant solution used to clean surfaces and equipment.', 0, 0, 416, 999999054);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (373, 'Pediatric Airway Management Devices', 'Devices used to warm intravenous fluids before administration to patients.', 0, 0, 412, 999999291);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (374, 'Blood Collection Tubes', 'Devices used to apply traction to fractured or dislocated bones for alignment and stabilization.', 0, 0, 416, 999999039);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (375, 'Orthopedic Walker', 'Implants used to stabilize or repair fractured or damaged bones.', 0, 1, 423, 999999015);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (376, 'Nebulizer', 'Circuits used to connect patients to mechanical ventilators for assisted breathing.', 0, 0, 420, 999999349);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (377, 'Suture Kit', 'Thin tubes inserted into veins to administer fluids or medication.', 0, 1, 403, 999999258);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (378, 'Nasopharyngeal Airway', 'Sets used to administer intravenous fluids or medication from IV bags to patients.', 0, 1, 406, 999999121);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (379, 'Cervical Collar', 'Disposable containers used for collecting urine and feces from bedridden patients.', 0, 1, 423, 999999118);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (380, 'Blood Glucose Test Strips', 'A device used to measure the concentration of glucose in the blood.', 0, 0, 418, 999999375);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (381, 'IV Fluid Warmers', 'Stands used to support bags of intravenous fluids during administration to patients.', 0, 1, 405, 999999119);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (382, 'Medical Suction Catheters', 'Stands used to support bags of intravenous fluids during administration to patients.', 0, 1, 410, 999999136);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (383, 'Intravenous Cannulas', 'Pads used with a defibrillator to deliver an electric shock to the heart.', 0, 0, 404, 999999119);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (384, 'AED Training Unit', 'A device used to administer a measured dose of epinephrine in cases of severe allergic reactions.', 0, 1, 416, 999999124);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (385, 'Oxygen Mask', 'Stretchers designed for use in ambulances for transporting patients.', 0, 0, 407, 541098765);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (386, 'Pediatric Airway Management Devices', 'Handheld devices used to measure blood pressure in clinical or home settings.', 0, 1, 419, 999999210);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (387, 'Splinting Materials', 'Canisters used to collect and dispose of suctioned fluids during medical procedures.', 0, 0, 418, 999999294);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (388, 'Oxygen Tank', 'Boots designed to immobilize and protect the foot and ankle.', 0, 1, 423, 999999260);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (389, 'Medical Tape', 'Devices inserted into the throat to maintain an open airway during anesthesia or resuscitation.', 0, 0, 408, 999999112);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (390, 'Pressure Infusion Bags', 'Sets of needles and syringes used for injections or aspirations.', 0, 1, 410, 999999176);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (391, 'Portable Defibrillators', 'Tourniquets used to control severe bleeding from extremity wounds.', 0, 0, 405, 999999299);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (392, 'Stretcher', 'A device used to measure the pressure of the blood in the arteries.', 0, 0, 413, 999999377);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (393, 'First Aid Kit', 'Bandages with a sticky backing used to cover small wounds or hold dressings in place.', 0, 1, 410, 999999225);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (42, 'Intravenous Catheter', 'A thin tube inserted into a vein to administer fluids medication or blood products.', 0, 0, 417, 999999028);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (43, 'Splinting Materials', 'Materials used to immobilize and support fractures or injuries.', 0, 1, 418, 999999360);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (44, 'Blood Glucose Test Strips', 'Strips used with a glucose meter to test the level of glucose in the blood.', 0, 0, 419, 999999380);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (45, 'Medical Suction Device', 'A device used to remove mucus blood or other fluids from the body.', 0, 1, 420, 999999099);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (46, 'Chest Seal', 'A device used to cover penetrating chest wounds and prevent air from entering the chest cavity.', 0, 0, 421, 999999000);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (47, 'Orthopedic Cast', 'A rigid dressing used to immobilize and protect a broken bone or injured limb.', 0, 1, 422, 999999009);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (48, 'Alcohol Swabs', 'Swabs saturated with alcohol used to clean and disinfect the skin before injections or procedures.', 0, 0, 423, 999999031);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (52, 'Splinter Forceps', 'Forceps designed for removing splinters or foreign objects from the skin.', 0, 0, 403, 999999167);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (53, 'IV Start Kit', 'A kit containing supplies for starting intravenous lines.', 0, 1, 404, 999999123);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (54, 'Portable Ventilator', 'A device used to assist or replace spontaneous breathing in patients.', 0, 0, 405, 999999178);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (55, 'Analgesic Medication', 'Medication used to relieve pain.', 0, 1, 406, 999999198);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (56, 'Hemostatic Dressing', 'A dressing designed to promote blood clotting and control bleeding.', 0, 0, 407, 999999116);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (57, 'Laryngoscope', 'A medical instrument used to view the inside of the throat and larynx.', 0, 1, 408, 999999023);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (58, 'Orthopedic Boots', 'Boots designed to immobilize and protect the foot and ankle.', 0, 0, 409, 999999378);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (59, 'Orthopedic Braces', 'Braces used to support and stabilize joints or limbs.', 0, 1, 410, 999999078);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (60, 'Disposable Gloves', 'Gloves designed for single use to prevent contamination and infection.', 0, 0, 411, 999999191);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (61, 'Orthopedic Walker', 'A device used to support and assist walking for patients with lower limb injuries or disabilities.', 0, 1, 412, 999999212);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (62, 'IV Fluid Warmers', 'Devices used to warm intravenous fluids before administration to patients.', 0, 0, 413, 999999100);
commit;
prompt 400 records committed...
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (63, 'Rescue Breathing Masks', 'Masks used to deliver rescue breaths during CPR or respiratory emergencies.', 0, 1, 414, 999999200);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (64, 'Disinfectant Wipes', 'Wipes saturated with disinfectant solution used to clean surfaces and equipment.', 0, 0, 415, 999999300);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (65, 'Diagnostic Kits', 'Kits containing tools and reagents for diagnosing specific medical conditions or infections.', 0, 1, 416, 999999301);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (66, 'Portable Ultrasound Machines', 'Handheld ultrasound devices used for point-of-care diagnostics.', 0, 0, 417, 999999201);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (67, 'Cardiac Defibrillator Training Units', 'Training devices used to simulate the operation of cardiac defibrillators.', 0, 1, 418, 999999202);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (68, 'Nasogastric Tubes', 'Tubes inserted through the nose into the stomach for feeding or drainage.', 0, 0, 419, 999999101);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (69, 'Orthopedic Splinting Materials', 'Materials used to create custom splints for immobilizing and supporting fractures or injuries.', 0, 1, 420, 999999103);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (70, 'Laryngeal Mask Airways', 'Devices inserted into the throat to maintain an open airway during anesthesia or resuscitation.', 0, 0, 421, 999999345);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (71, 'Ambu Bags', 'Manual resuscitators used to provide positive pressure ventilation to patients.', 0, 1, 422, 999999001);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (72, 'Hypodermic Needles', 'Needles used for injections or drawing blood samples.', 0, 0, 423, 999999111);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (76, 'Medical Tourniquets', 'Tourniquets used to control severe bleeding from extremity wounds.', 0, 0, 403, 999999002);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (77, 'Intravenous Cannulas', 'Thin tubes inserted into veins to administer fluids or medication.', 0, 1, 404, 999999003);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (4, 'Oxygen Mask', 'A mask placed over the nose and mouth to deliver oxygen to the patient.', 0, 0, 403, 999999000);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (6, 'Cardiac Monitor', 'A device that measures and displays the electrical activity of the heart.', 0, 0, 405, 999999200);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (8, 'Backboard', 'A flat board used for immobilizing a patient with suspected spinal injuries.', 0, 0, 407, 999999360);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (9, 'Splint', 'A device used for immobilizing a fractured or injured bone.', 0, 1, 408, 999999210);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (10, 'Tourniquet', 'A device used to apply pressure to a limb or extremity in order to control bleeding.', 0, 0, 409, 999999070);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (11, 'Neck Brace', 'A medical device used to support a patient''s neck and head in cases of suspected spinal injuries.', 0, 1, 410, 999999023);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (12, 'Nebulizer', 'A device that turns liquid medicine into a fine mist that can be inhaled into the lungs.', 0, 0, 411, 999999009);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (14, 'Blood Pressure Cuff', 'A device used to measure the pressure of the blood in the arteries.', 0, 0, 413, 999999100);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (15, 'Suture Kit', 'A kit containing instruments and materials for suturing wounds.', 0, 1, 414, 999999029);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (16, 'Orthopedic Splint', 'A device used to immobilize and support fractures or injuries to the arms or legs.', 0, 0, 415, 999999300);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (17, 'Glucose Meter', 'A device used to measure the concentration of glucose in the blood.', 0, 1, 416, 999999000);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (18, 'Epinephrine Auto-Injector', 'A device used to administer a measured dose of epinephrine in cases of severe allergic reactions.', 0, 0, 417, 999999002);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (19, 'Burn Dressing', 'A dressing used to cover and protect burns.', 0, 1, 418, 999999233);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (20, 'Defibrillator pads', 'Pads used with a defibrillator to deliver an electric shock to the heart.', 0, 0, 419, 999999008);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (21, 'Oxygen Tank', 'A tank containing compressed oxygen for medical use.', 0, 1, 420, 999999110);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (22, 'Airway Kit', 'A kit containing devices used to establish or maintain a patient''s airway.', 0, 0, 421, 999999112);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (24, 'Pulse Oximeter', 'A device used to measure the oxygen saturation of the blood.', 0, 0, 423, 999999231);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (28, 'Nasopharyngeal Airway', 'A device inserted through the nose to maintain an open airway.', 0, 0, 403, 999999099);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (29, 'Medical Gloves', 'Gloves worn by healthcare professionals to prevent contamination and protect against infection.', 0, 1, 404, 999999100);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (30, 'Adhesive Bandages', 'Bandages with a sticky backing used to cover small wounds or hold dressings in place.', 0, 0, 405, 999999080);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (31, 'Saline Solution', 'A sterile solution of salt in water used for various medical purposes.', 0, 1, 406, 999999015);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (32, 'Cervical Collar', 'A device used to support a patient''s neck and head in cases of suspected cervical spine injuries.', 0, 0, 407, 999999001);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (33, 'Multi-Trauma Dressing', 'A large sterile dressing used to cover extensive wounds or burns.', 0, 1, 408, 999999009);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (34, 'Nebulizer Mask', 'A mask used to deliver aerosolized medication to the lungs.', 0, 0, 409, 999999020);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (35, 'Stretcher', 'A portable bed or litter for transporting patients.', 0, 1, 410, 999999031);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (36, 'CPR Mask', 'A device used to administer rescue breaths during cardiopulmonary resuscitation (CPR).', 0, 0, 411, 999999333);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (37, 'First Aid Kit', 'A kit containing supplies and equipment for administering basic first aid.', 0, 1, 412, 999999321);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (38, 'Blood Collection Tubes', 'Tubes used for collecting and storing blood samples for laboratory testing.', 0, 0, 413, 999999210);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (39, 'Disposable Syringes', 'Syringes designed for single use to administer medication or draw blood.', 0, 1, 414, 999999111);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (40, 'Medical Tape', 'A type of adhesive tape used to secure dressings or bandages in place.', 0, 0, 415, 999999222);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (41, 'AED Training Unit', 'A training device used to simulate the operation of an automated external defibrillator.', 0, 1, 416, 999999129);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (78, 'Tracheostomy Tubes', 'Tubes inserted into a surgically created opening in the trachea to assist breathing.', 0, 0, 405, 999999006);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (79, 'Portable Oxygen Concentrators', 'Devices that extract oxygen from the air and deliver it to patients via a nasal cannula or mask.', 0, 1, 406, 999999007);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (80, 'Electrocardiogram (ECG) Machines', 'Devices used to record the electrical activity of the heart for diagnostic purposes.', 0, 0, 407, 999999011);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (81, 'Medical Scales', 'Scales used to measure the weight of patients.', 0, 1, 408, 999999013);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (82, 'Pediatric Airway Management Devices', 'Devices specifically designed for managing pediatric airways during resuscitation.', 0, 0, 409, 999999019);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (83, 'Medical Suction Catheters', 'Catheters used to remove secretions and fluids from the airway.', 0, 1, 410, 999999021);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (84, 'Orthopedic Casting Materials', 'Materials used to create casts for immobilizing and supporting fractures or injuries.', 0, 0, 411, 999999322);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (85, 'Nasal Oxygen Cannulas', 'Cannulas inserted into the nostrils to deliver oxygen to patients.', 0, 1, 412, 999999232);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (87, 'Ambulance Stretchers', 'Stretchers designed for use in ambulances for transporting patients.', 0, 1, 414, 999999033);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (88, 'Intravenous Drip Stands', 'Stands used to support bags of intravenous fluids during administration to patients.', 0, 0, 415, 999999003);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (89, 'Medical Ventilator Circuits', 'Circuits used to connect patients to mechanical ventilators for assisted breathing.', 0, 1, 416, 999999001);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (90, 'Orthopedic Splinting Tools', 'Tools used to apply and shape splinting materials for orthopedic injuries.', 0, 0, 417, 999999002);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (91, 'Medical Needles and Syringes', 'Sets of needles and syringes used for injections or aspirations.', 0, 1, 418, 999999000);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (92, 'Portable Blood Pressure Monitors', 'Handheld devices used to measure blood pressure in clinical or home settings.', 0, 0, 419, 999999000);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (93, 'Enteral Feeding Tubes', 'Tubes inserted into the digestive tract for delivering nutrition or medications.', 0, 1, 420, 999999012);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (94, 'Medical Oxygen Masks', 'Masks used to deliver oxygen to patients with respiratory conditions or emergencies.', 0, 0, 421, 999999370);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (95, 'Chest Decompression Needles', 'Needles used for emergency decompression of tension pneumothorax.', 0, 1, 422, 999999160);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (96, 'Intravenous Infusion Pumps', 'Devices used to deliver fluids medications or nutrients into the bloodstream at a controlled rate.', 0, 0, 423, 999999122);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (101, 'Portable Defibrillators', 'Defibrillators designed for easy transport and use in various settings.', 0, 1, 404, 999999111);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (102, 'Disposable Bedpans', 'Disposable containers used for collecting urine and feces from bedridden patients.', 0, 0, 405, 999999089);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (103, 'Orthopedic External Fixators', 'Devices used to stabilize and support fractured bones externally.', 0, 1, 406, 999999060);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (104, 'Medical Cast Saw Blades', 'Blades used for cutting through orthopedic casts during cast removal.', 0, 0, 407, 999999033);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (105, 'Medical Feeding Pumps', 'Pumps used to deliver nutrition or medications directly into the digestive tract.', 0, 1, 408, 999999011);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (106, 'Pressure Infusion Bags', 'Bags used to apply controlled pressure to intravenous fluids during rapid infusion.', 0, 0, 409, 999999090);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (107, 'Laryngoscope Blades', 'Blades used with laryngoscopes for visualizing the larynx and inserting endotracheal tubes.', 0, 1, 410, 999999098);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (108, 'Orthopedic Traction Devices', 'Devices used to apply traction to fractured or dislocated bones for alignment and stabilization.', 0, 0, 411, 999999099);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (110, 'Urinary Catheters', 'Flexible tubes inserted into the bladder to drain urine.', 0, 0, 413, 999999101);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (111, 'Medical Sterilization Pouches', 'Pouches used to hold and sterilize medical instruments and supplies.', 0, 1, 414, 999999000);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (112, 'Anesthesia Masks', 'Masks used to deliver anesthesia gases or oxygen to patients during surgery or procedures.', 0, 0, 415, 999999117);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (113, 'Orthopedic Implants', 'Implants used to stabilize or repair fractured or damaged bones.', 0, 1, 416, 999999088);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (114, 'Medical Traction Splints', 'Splints used to stabilize and immobilize fractured femurs or lower limbs.', 0, 0, 417, 999999121);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (115, 'Feeding Tube Extensions', 'Extensions used to connect enteral feeding tubes to feeding pumps or syringes.', 0, 1, 418, 999999120);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (116, 'Tracheostomy Care Kits', 'Kits containing supplies for cleaning and maintaining tracheostomy tubes.', 0, 0, 419, 999999032);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (117, 'Medical Suction Canisters', 'Canisters used to collect and dispose of suctioned fluids during medical procedures.', 0, 1, 420, 999999019);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (118, 'Orthopedic Tourniquet Systems', 'Systems used to apply and control pressure to extremities to control bleeding during surgery.', 0, 0, 421, 999999022);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (124, 'Medical Waste Bins', 'Bins used for the safe disposal of medical waste such as used needles syringes and dressings.', 0, 0, 403, 999999027);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (125, 'Tracheostomy Tube Holders', 'Devices used to secure tracheostomy tubes in place to prevent accidental removal.', 0, 1, 404, 999999028);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (127, 'Orthopedic Internal Fixation Devices', 'Devices used to stabilize fractured bones internally with screws plates or rods.', 0, 1, 406, 999999030);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (128, 'Intravenous Administration Sets', 'Sets used to administer intravenous fluids or medication from IV bags to patients.', 0, 0, 407, 999999031);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (200, 'Oxygen Tank', 'A kit containing supplies and equipment for administering basic first aid.', 0, 0, 421, 999999317);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (201, 'Tracheostomy Tubes', 'A thin tube inserted into a vein to administer fluids medication or blood products.', 0, 0, 422, 999999330);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (202, 'Intravenous Cannulas', 'Needles used for injections or drawing blood samples.', 0, 0, 418, 999999331);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (203, 'Medical Needles and Syringes', 'Devices specifically designed for managing pediatric airways during resuscitation.', 0, 1, 423, 999999379);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (204, 'Epinephrine Auto-Injector', 'Devices used to apply traction to fractured or dislocated bones for alignment and stabilization.', 0, 1, 406, 999999351);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (205, 'Orthopedic External Fixators', 'A device used to apply pressure to a limb or extremity in order to control bleeding.', 0, 1, 411, 999999305);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (206, 'Tracheostomy Care Kits', 'A device used to immobilize and support fractures or injuries to the arms or legs.', 0, 1, 412, 999999083);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (207, 'Feeding Tube Extensions', 'Materials used to immobilize and support fractures or injuries.', 0, 0, 423, 999999140);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (208, 'Tracheostomy Tubes', 'A device used for immobilizing a fractured or injured bone.', 0, 0, 412, 999999068);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (209, 'Pressure Infusion Bags', 'A medical instrument used to view the inside of the throat and larynx.', 0, 0, 415, 545098765);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (210, 'Blood Collection Tubes', 'Devices used to record the electrical activity of the heart for diagnostic purposes.', 0, 0, 410, 999999238);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (211, 'Intravenous Administration Sets', 'Devices used to stabilize fractured bones internally with screws plates or rods.', 0, 1, 403, 999999036);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (212, 'Medical Suction Catheters', 'Defibrillators designed for easy transport and use in various settings.', 0, 0, 414, 999999072);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (213, 'Feeding Tube Extensions', 'Medication used to relieve pain.', 0, 1, 419, 999999281);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (214, 'Cervical Collar', 'Devices used to record the electrical activity of the heart for diagnostic purposes.', 0, 0, 414, 999999258);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (215, 'Orthopedic Splint', 'Masks used to deliver anesthesia gases or oxygen to patients during surgery or procedures.', 0, 0, 409, 999999000);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (216, 'AED Training Unit', 'Handheld ultrasound devices used for point-of-care diagnostics.', 0, 1, 404, 999999122);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (217, 'Nasopharyngeal Airway', 'A type of adhesive tape used to secure dressings or bandages in place.', 0, 0, 407, 999999230);
commit;
prompt 500 records loaded
prompt Loading DONATION...
insert into DONATION (donationid, donationdate, itemid, donorid)
values (80, to_date('16-06-2024 05:19:44', 'dd-mm-yyyy hh24:mi:ss'), 19, 199);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (81, to_date('16-06-2024 05:19:44', 'dd-mm-yyyy hh24:mi:ss'), 19, 199);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (82, to_date('16-06-2024 05:19:44', 'dd-mm-yyyy hh24:mi:ss'), 19, 199);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (83, to_date('16-06-2024 05:19:44', 'dd-mm-yyyy hh24:mi:ss'), 19, 199);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (84, to_date('16-06-2024 05:19:44', 'dd-mm-yyyy hh24:mi:ss'), 19, 199);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (85, to_date('16-06-2024 05:19:44', 'dd-mm-yyyy hh24:mi:ss'), 19, 199);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (86, to_date('16-06-2024 05:19:44', 'dd-mm-yyyy hh24:mi:ss'), 19, 199);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (87, to_date('16-06-2024 05:19:44', 'dd-mm-yyyy hh24:mi:ss'), 19, 199);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (88, to_date('16-06-2024 05:19:44', 'dd-mm-yyyy hh24:mi:ss'), 19, 199);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (89, to_date('16-06-2024 05:19:44', 'dd-mm-yyyy hh24:mi:ss'), 19, 199);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (90, to_date('16-06-2024 05:19:44', 'dd-mm-yyyy hh24:mi:ss'), 19, 199);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (91, to_date('16-06-2024 05:19:44', 'dd-mm-yyyy hh24:mi:ss'), 19, 199);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (92, to_date('16-06-2024 05:19:44', 'dd-mm-yyyy hh24:mi:ss'), 19, 199);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (101, to_date('16-06-2024 05:20:06', 'dd-mm-yyyy hh24:mi:ss'), 19, 199);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1312, to_date('14-05-2021', 'dd-mm-yyyy'), 128, 107);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1318, to_date('12-08-2019', 'dd-mm-yyyy'), 44, 355);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1340, to_date('31-10-1993', 'dd-mm-yyyy'), 61, 197);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1349, to_date('04-03-2023', 'dd-mm-yyyy'), 127, 57);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1355, to_date('18-06-2021', 'dd-mm-yyyy'), 95, 99);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1357, to_date('04-04-1989', 'dd-mm-yyyy'), 45, 57);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1373, to_date('09-07-2022', 'dd-mm-yyyy'), 22, 179);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1382, to_date('25-04-1971', 'dd-mm-yyyy'), 116, 219);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1384, to_date('28-01-2020', 'dd-mm-yyyy'), 72, 338);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1385, to_date('23-05-2020', 'dd-mm-yyyy'), 53, 228);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1390, to_date('22-06-1970', 'dd-mm-yyyy'), 33, 179);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1391, to_date('17-04-1999', 'dd-mm-yyyy'), 117, 95);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1397, to_date('20-02-2021', 'dd-mm-yyyy'), 90, 96);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1398, to_date('25-11-2023', 'dd-mm-yyyy'), 30, 219);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1006, to_date('03-09-2021', 'dd-mm-yyyy'), 104, 95);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1008, to_date('13-08-2021', 'dd-mm-yyyy'), 45, 60);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1014, to_date('28-01-2023', 'dd-mm-yyyy'), 85, 139);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1028, to_date('28-07-2012', 'dd-mm-yyyy'), 17, 346);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1034, to_date('05-09-1996', 'dd-mm-yyyy'), 4, 349);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1044, to_date('13-06-2021', 'dd-mm-yyyy'), 68, 227);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1052, to_date('14-02-1987', 'dd-mm-yyyy'), 128, 219);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1053, to_date('04-01-2022', 'dd-mm-yyyy'), 115, 161);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1055, to_date('01-12-2021', 'dd-mm-yyyy'), 29, 349);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1074, to_date('16-06-2016', 'dd-mm-yyyy'), 96, 107);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1075, to_date('15-10-2020', 'dd-mm-yyyy'), 127, 110);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1079, to_date('10-06-2023', 'dd-mm-yyyy'), 42, 351);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1080, to_date('15-07-2009', 'dd-mm-yyyy'), 52, 197);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1082, to_date('19-05-1978', 'dd-mm-yyyy'), 64, 99);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1094, to_date('18-04-1997', 'dd-mm-yyyy'), 111, 169);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1111, to_date('30-09-2022', 'dd-mm-yyyy'), 42, 334);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1123, to_date('30-01-1974', 'dd-mm-yyyy'), 92, 253);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1127, to_date('08-02-1984', 'dd-mm-yyyy'), 45, 355);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1132, to_date('27-12-2023', 'dd-mm-yyyy'), 108, 377);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1136, to_date('10-08-2002', 'dd-mm-yyyy'), 21, 227);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1142, to_date('29-08-1979', 'dd-mm-yyyy'), 19, 195);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1146, to_date('28-12-2019', 'dd-mm-yyyy'), 116, 199);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1148, to_date('15-03-2004', 'dd-mm-yyyy'), 95, 262);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1150, to_date('29-12-2019', 'dd-mm-yyyy'), 22, 187);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1151, to_date('12-03-2023', 'dd-mm-yyyy'), 113, 117);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1152, to_date('17-09-1967', 'dd-mm-yyyy'), 67, 95);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1172, to_date('18-05-2022', 'dd-mm-yyyy'), 32, 169);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1190, to_date('26-02-2023', 'dd-mm-yyyy'), 82, 346);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1203, to_date('12-07-2020', 'dd-mm-yyyy'), 35, 54);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1207, to_date('30-04-1966', 'dd-mm-yyyy'), 46, 57);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1217, to_date('30-11-2019', 'dd-mm-yyyy'), 45, 262);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1223, to_date('19-07-2019', 'dd-mm-yyyy'), 62, 375);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1234, to_date('29-08-1975', 'dd-mm-yyyy'), 82, 377);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1237, to_date('15-06-2008', 'dd-mm-yyyy'), 16, 227);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1262, to_date('16-08-2023', 'dd-mm-yyyy'), 12, 181);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1265, to_date('30-10-1981', 'dd-mm-yyyy'), 65, 363);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1268, to_date('30-01-2023', 'dd-mm-yyyy'), 43, 197);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1273, to_date('25-08-2023', 'dd-mm-yyyy'), 68, 195);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1274, to_date('31-08-1994', 'dd-mm-yyyy'), 67, 262);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1280, to_date('23-06-2021', 'dd-mm-yyyy'), 85, 363);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1282, to_date('08-03-2012', 'dd-mm-yyyy'), 42, 181);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1285, to_date('20-10-2006', 'dd-mm-yyyy'), 82, 169);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1287, to_date('19-12-1963', 'dd-mm-yyyy'), 116, 179);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1293, to_date('06-08-2022', 'dd-mm-yyyy'), 32, 253);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1294, to_date('05-05-1996', 'dd-mm-yyyy'), 70, 95);
commit;
prompt 73 records loaded
prompt Loading DONOR_COURSES...
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (1, 355, 62);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (2, 54, 109);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (3, 195, 123);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (4, 377, 196);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (5, 161, 255);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (6, 169, 45);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (7, 161, 363);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (8, 161, 17);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (9, 95, 27);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (10, 1001, 178);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (11, 195, 298);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (12, 96, 61);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (13, 351, 336);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (14, 1002, 76);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (15, 338, 394);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (16, 377, 106);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (17, 1000, 379);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (18, 1003, 175);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (19, 197, 90);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (20, 169, 153);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (21, 338, 179);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (22, 54, 368);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (23, 179, 132);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (24, 99, 281);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (25, 95, 92);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (26, 355, 122);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (27, 179, 253);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (28, 228, 19);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (29, 96, 38);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (30, 334, 119);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (31, 195, 168);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (32, 363, 52);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (33, 1002, 65);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (34, 54, 217);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (35, 95, 289);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (36, 139, 248);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (37, 169, 229);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (38, 346, 142);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (39, 57, 179);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (40, 1001, 8);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (41, 57, 202);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (42, 1002, 104);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (43, 375, 317);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (44, 253, 146);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (45, 181, 208);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (46, 139, 135);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (47, 219, 398);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (48, 253, 291);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (49, 227, 81);
insert into DONOR_COURSES (donation_id, donorid, courseid)
values (50, 334, 153);
commit;
prompt 50 records loaded
prompt Loading EQUIPMENT...
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('19-10-2026', 'dd-mm-yyyy'), 1, 97, 266);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('05-05-2025', 'dd-mm-yyyy'), 2, 96, 494);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('18-09-2025', 'dd-mm-yyyy'), 3, 82, 537);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('25-08-2026', 'dd-mm-yyyy'), 4, 72, 229);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('31-07-2025', 'dd-mm-yyyy'), 5, 64, 340);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('26-04-2027', 'dd-mm-yyyy'), 6, 87, 223);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('29-08-2026', 'dd-mm-yyyy'), 7, 57, 267);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('16-11-2026', 'dd-mm-yyyy'), 8, 68, 518);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('10-10-2026', 'dd-mm-yyyy'), 9, 74, 365);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('09-06-2027', 'dd-mm-yyyy'), 10, 55, 565);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('06-06-2025', 'dd-mm-yyyy'), 11, 100, 33);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('11-05-2026', 'dd-mm-yyyy'), 12, 99, 356);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('06-02-2026', 'dd-mm-yyyy'), 13, 89, 365);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('20-12-2027', 'dd-mm-yyyy'), 14, 79, 448);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('17-07-2025', 'dd-mm-yyyy'), 15, 85, 381);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('02-11-2027', 'dd-mm-yyyy'), 16, 82, 243);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('07-07-2027', 'dd-mm-yyyy'), 17, 85, 474);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('07-01-2027', 'dd-mm-yyyy'), 18, 71, 382);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('26-08-2026', 'dd-mm-yyyy'), 19, 94, 54);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('15-12-2027', 'dd-mm-yyyy'), 20, 82, 203);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('20-11-2026', 'dd-mm-yyyy'), 21, 76, 368);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('12-01-2025', 'dd-mm-yyyy'), 22, 81, 299);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('12-06-2027', 'dd-mm-yyyy'), 23, 91, 359);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('18-08-2025', 'dd-mm-yyyy'), 24, 84, 442);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('03-12-2025', 'dd-mm-yyyy'), 25, 90, 389);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('02-12-2027', 'dd-mm-yyyy'), 26, 98, 390);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('21-06-2025', 'dd-mm-yyyy'), 27, 99, 222);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('01-12-2027', 'dd-mm-yyyy'), 28, 63, 33);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('15-06-2025', 'dd-mm-yyyy'), 29, 76, 59);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('26-06-2025', 'dd-mm-yyyy'), 30, 66, 578);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('23-11-2026', 'dd-mm-yyyy'), 31, 55, 425);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('08-06-2026', 'dd-mm-yyyy'), 32, 96, 434);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('12-12-2027', 'dd-mm-yyyy'), 33, 79, 501);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('10-08-2026', 'dd-mm-yyyy'), 34, 64, 372);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('20-12-2025', 'dd-mm-yyyy'), 35, 92, 9);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('23-02-2026', 'dd-mm-yyyy'), 36, 86, 305);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('31-10-2025', 'dd-mm-yyyy'), 37, 84, 501);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('22-04-2026', 'dd-mm-yyyy'), 38, 67, 500);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('20-08-2025', 'dd-mm-yyyy'), 39, 88, 250);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('06-01-2026', 'dd-mm-yyyy'), 40, 85, 92);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('31-12-2027', 'dd-mm-yyyy'), 41, 86, 384);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('29-08-2026', 'dd-mm-yyyy'), 42, 87, 320);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('04-07-2027', 'dd-mm-yyyy'), 43, 83, 35);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('21-11-2025', 'dd-mm-yyyy'), 44, 88, 412);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('09-08-2027', 'dd-mm-yyyy'), 45, 78, 478);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('12-03-2027', 'dd-mm-yyyy'), 46, 81, 55);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('09-04-2025', 'dd-mm-yyyy'), 47, 63, 213);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('03-08-2026', 'dd-mm-yyyy'), 48, 73, 585);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('11-01-2025', 'dd-mm-yyyy'), 49, 76, 405);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('17-03-2027', 'dd-mm-yyyy'), 50, 98, 219);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('03-03-2027', 'dd-mm-yyyy'), 51, 75, 511);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('27-01-2027', 'dd-mm-yyyy'), 52, 94, 365);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('03-08-2025', 'dd-mm-yyyy'), 53, 94, 10);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('12-03-2026', 'dd-mm-yyyy'), 54, 60, 301);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('29-01-2026', 'dd-mm-yyyy'), 55, 75, 446);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('24-02-2026', 'dd-mm-yyyy'), 56, 96, 557);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('10-05-2025', 'dd-mm-yyyy'), 57, 80, 373);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('11-04-2027', 'dd-mm-yyyy'), 58, 62, 236);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('10-06-2025', 'dd-mm-yyyy'), 59, 80, 432);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('07-02-2025', 'dd-mm-yyyy'), 60, 68, 291);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('27-03-2026', 'dd-mm-yyyy'), 61, 87, 107);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('23-04-2025', 'dd-mm-yyyy'), 62, 76, 273);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('27-12-2025', 'dd-mm-yyyy'), 63, 100, 76);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('23-03-2025', 'dd-mm-yyyy'), 64, 64, 590);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('11-02-2026', 'dd-mm-yyyy'), 65, 67, 216);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('11-02-2025', 'dd-mm-yyyy'), 66, 74, 316);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('13-01-2026', 'dd-mm-yyyy'), 67, 55, 337);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('31-01-2027', 'dd-mm-yyyy'), 68, 68, 37);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('15-09-2026', 'dd-mm-yyyy'), 69, 94, 28);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('28-12-2027', 'dd-mm-yyyy'), 70, 61, 513);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('15-10-2025', 'dd-mm-yyyy'), 71, 77, 248);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('24-01-2027', 'dd-mm-yyyy'), 72, 84, 12);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('16-06-2027', 'dd-mm-yyyy'), 73, 63, 107);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('01-06-2027', 'dd-mm-yyyy'), 74, 68, 103);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('07-12-2026', 'dd-mm-yyyy'), 75, 61, 584);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('24-06-2025', 'dd-mm-yyyy'), 76, 93, 374);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('17-08-2025', 'dd-mm-yyyy'), 77, 74, 238);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('18-08-2025', 'dd-mm-yyyy'), 78, 85, 218);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('25-06-2025', 'dd-mm-yyyy'), 79, 63, 96);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('12-04-2025', 'dd-mm-yyyy'), 80, 71, 404);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('21-05-2025', 'dd-mm-yyyy'), 81, 98, 596);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('05-07-2026', 'dd-mm-yyyy'), 82, 73, 235);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('04-08-2026', 'dd-mm-yyyy'), 83, 76, 340);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('19-03-2025', 'dd-mm-yyyy'), 84, 100, 522);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('21-07-2026', 'dd-mm-yyyy'), 85, 54, 209);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('03-12-2026', 'dd-mm-yyyy'), 86, 98, 315);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('11-11-2026', 'dd-mm-yyyy'), 87, 91, 77);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('26-11-2026', 'dd-mm-yyyy'), 88, 78, 285);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('26-04-2027', 'dd-mm-yyyy'), 89, 57, 8);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('17-06-2026', 'dd-mm-yyyy'), 90, 89, 384);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('07-05-2027', 'dd-mm-yyyy'), 91, 77, 263);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('19-03-2025', 'dd-mm-yyyy'), 92, 56, 18);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('03-02-2025', 'dd-mm-yyyy'), 93, 100, 420);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('25-03-2025', 'dd-mm-yyyy'), 94, 63, 351);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('31-03-2027', 'dd-mm-yyyy'), 95, 95, 593);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('25-11-2026', 'dd-mm-yyyy'), 96, 64, 323);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('20-04-2027', 'dd-mm-yyyy'), 97, 67, 491);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('19-02-2025', 'dd-mm-yyyy'), 98, 87, 251);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('07-01-2027', 'dd-mm-yyyy'), 99, 96, 475);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('17-05-2026', 'dd-mm-yyyy'), 100, 66, 464);
commit;
prompt 100 records committed...
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('30-09-2027', 'dd-mm-yyyy'), 101, 87, 439);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('30-10-2026', 'dd-mm-yyyy'), 102, 64, 290);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('03-06-2025', 'dd-mm-yyyy'), 103, 65, 299);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('08-02-2027', 'dd-mm-yyyy'), 104, 79, 295);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('09-12-2027', 'dd-mm-yyyy'), 105, 68, 522);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('12-03-2027', 'dd-mm-yyyy'), 106, 96, 300);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('04-09-2025', 'dd-mm-yyyy'), 107, 78, 301);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('23-12-2026', 'dd-mm-yyyy'), 108, 75, 569);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('02-06-2027', 'dd-mm-yyyy'), 109, 62, 478);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('19-02-2026', 'dd-mm-yyyy'), 110, 84, 218);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('07-10-2027', 'dd-mm-yyyy'), 111, 99, 538);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('13-08-2027', 'dd-mm-yyyy'), 112, 93, 268);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('05-01-2025', 'dd-mm-yyyy'), 113, 85, 289);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('01-01-2025', 'dd-mm-yyyy'), 114, 61, 375);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('11-08-2026', 'dd-mm-yyyy'), 115, 67, 301);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('15-07-2026', 'dd-mm-yyyy'), 116, 52, 31);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('09-08-2025', 'dd-mm-yyyy'), 117, 92, 407);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('08-11-2026', 'dd-mm-yyyy'), 118, 67, 453);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('23-07-2027', 'dd-mm-yyyy'), 119, 81, 296);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('05-08-2026', 'dd-mm-yyyy'), 120, 79, 346);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('01-10-2026', 'dd-mm-yyyy'), 121, 83, 20);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('06-07-2025', 'dd-mm-yyyy'), 122, 85, 44);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('28-06-2025', 'dd-mm-yyyy'), 123, 98, 582);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('02-02-2026', 'dd-mm-yyyy'), 124, 54, 212);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('19-04-2026', 'dd-mm-yyyy'), 125, 51, 282);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('13-01-2025', 'dd-mm-yyyy'), 126, 68, 560);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('20-06-2026', 'dd-mm-yyyy'), 127, 75, 367);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('15-07-2025', 'dd-mm-yyyy'), 128, 56, 565);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('30-10-2026', 'dd-mm-yyyy'), 129, 70, 476);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('20-01-2027', 'dd-mm-yyyy'), 130, 90, 389);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('12-09-2026', 'dd-mm-yyyy'), 131, 60, 384);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('01-12-2027', 'dd-mm-yyyy'), 132, 62, 117);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('23-07-2025', 'dd-mm-yyyy'), 133, 62, 415);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('18-02-2026', 'dd-mm-yyyy'), 134, 59, 279);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('04-04-2026', 'dd-mm-yyyy'), 135, 77, 204);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('17-12-2027', 'dd-mm-yyyy'), 136, 77, 448);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('14-01-2027', 'dd-mm-yyyy'), 137, 81, 470);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('02-02-2027', 'dd-mm-yyyy'), 138, 68, 370);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('12-11-2026', 'dd-mm-yyyy'), 139, 77, 455);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('19-09-2025', 'dd-mm-yyyy'), 140, 52, 102);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('10-10-2026', 'dd-mm-yyyy'), 141, 56, 477);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('08-12-2026', 'dd-mm-yyyy'), 142, 86, 348);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('22-08-2026', 'dd-mm-yyyy'), 143, 94, 560);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('15-07-2025', 'dd-mm-yyyy'), 144, 70, 223);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('19-08-2025', 'dd-mm-yyyy'), 145, 60, 293);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('15-11-2027', 'dd-mm-yyyy'), 146, 50, 371);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('04-08-2025', 'dd-mm-yyyy'), 147, 95, 205);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('07-03-2027', 'dd-mm-yyyy'), 148, 87, 210);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('13-08-2027', 'dd-mm-yyyy'), 149, 92, 31);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('25-06-2025', 'dd-mm-yyyy'), 150, 85, 241);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('07-05-2026', 'dd-mm-yyyy'), 151, 77, 405);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('28-08-2025', 'dd-mm-yyyy'), 152, 93, 107);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('23-05-2025', 'dd-mm-yyyy'), 153, 82, 267);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('30-01-2025', 'dd-mm-yyyy'), 154, 62, 317);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('02-05-2027', 'dd-mm-yyyy'), 155, 95, 47);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('20-01-2025', 'dd-mm-yyyy'), 156, 96, 575);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('03-09-2026', 'dd-mm-yyyy'), 157, 59, 58);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('17-11-2025', 'dd-mm-yyyy'), 158, 91, 312);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('19-05-2027', 'dd-mm-yyyy'), 159, 80, 40);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('10-06-2027', 'dd-mm-yyyy'), 160, 75, 223);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('30-04-2025', 'dd-mm-yyyy'), 161, 59, 391);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('11-05-2027', 'dd-mm-yyyy'), 162, 99, 233);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('09-07-2025', 'dd-mm-yyyy'), 163, 66, 565);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('08-08-2027', 'dd-mm-yyyy'), 164, 69, 292);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('13-10-2025', 'dd-mm-yyyy'), 165, 71, 113);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('30-01-2026', 'dd-mm-yyyy'), 166, 67, 337);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('08-06-2027', 'dd-mm-yyyy'), 167, 72, 517);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('07-03-2027', 'dd-mm-yyyy'), 168, 82, 500);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('18-02-2026', 'dd-mm-yyyy'), 169, 100, 421);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('22-10-2025', 'dd-mm-yyyy'), 170, 83, 33);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('22-10-2025', 'dd-mm-yyyy'), 171, 97, 21);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('07-07-2025', 'dd-mm-yyyy'), 172, 98, 239);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('15-01-2025', 'dd-mm-yyyy'), 173, 100, 456);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('10-08-2027', 'dd-mm-yyyy'), 174, 63, 475);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('15-07-2027', 'dd-mm-yyyy'), 175, 83, 522);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('20-03-2026', 'dd-mm-yyyy'), 176, 59, 290);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('09-04-2025', 'dd-mm-yyyy'), 177, 93, 489);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('01-06-2027', 'dd-mm-yyyy'), 178, 54, 246);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('27-07-2027', 'dd-mm-yyyy'), 179, 76, 492);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('10-04-2027', 'dd-mm-yyyy'), 180, 70, 444);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('03-07-2025', 'dd-mm-yyyy'), 181, 97, 462);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('02-03-2025', 'dd-mm-yyyy'), 182, 51, 33);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('02-11-2027', 'dd-mm-yyyy'), 183, 94, 298);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('06-04-2026', 'dd-mm-yyyy'), 184, 54, 473);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('08-10-2025', 'dd-mm-yyyy'), 185, 97, 243);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('07-06-2026', 'dd-mm-yyyy'), 186, 82, 313);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('11-07-2026', 'dd-mm-yyyy'), 187, 70, 557);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('02-12-2027', 'dd-mm-yyyy'), 188, 70, 534);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('01-08-2027', 'dd-mm-yyyy'), 189, 67, 330);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('07-04-2027', 'dd-mm-yyyy'), 190, 98, 104);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('19-08-2026', 'dd-mm-yyyy'), 191, 61, 534);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('26-02-2027', 'dd-mm-yyyy'), 192, 70, 104);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('17-09-2025', 'dd-mm-yyyy'), 193, 59, 528);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('25-08-2027', 'dd-mm-yyyy'), 194, 50, 575);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('11-08-2026', 'dd-mm-yyyy'), 195, 56, 64);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('16-04-2025', 'dd-mm-yyyy'), 196, 83, 334);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('09-02-2025', 'dd-mm-yyyy'), 197, 69, 6);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('17-09-2026', 'dd-mm-yyyy'), 198, 97, 238);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('11-07-2025', 'dd-mm-yyyy'), 199, 96, 553);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('20-01-2027', 'dd-mm-yyyy'), 200, 89, 16);
commit;
prompt 200 records committed...
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('29-05-2027', 'dd-mm-yyyy'), 201, 86, 592);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('30-08-2025', 'dd-mm-yyyy'), 202, 90, 325);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('25-12-2027', 'dd-mm-yyyy'), 203, 76, 222);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('04-09-2026', 'dd-mm-yyyy'), 204, 93, 39);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('07-02-2025', 'dd-mm-yyyy'), 205, 64, 586);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('31-01-2026', 'dd-mm-yyyy'), 206, 99, 43);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('25-10-2025', 'dd-mm-yyyy'), 207, 59, 208);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('25-01-2025', 'dd-mm-yyyy'), 208, 83, 467);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('29-03-2027', 'dd-mm-yyyy'), 209, 88, 328);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('14-01-2027', 'dd-mm-yyyy'), 210, 64, 310);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('02-04-2027', 'dd-mm-yyyy'), 211, 51, 238);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('05-12-2027', 'dd-mm-yyyy'), 212, 50, 574);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('27-03-2027', 'dd-mm-yyyy'), 213, 51, 247);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('14-02-2025', 'dd-mm-yyyy'), 214, 59, 449);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('20-01-2025', 'dd-mm-yyyy'), 215, 81, 542);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('26-04-2026', 'dd-mm-yyyy'), 216, 97, 17);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('20-03-2025', 'dd-mm-yyyy'), 217, 85, 540);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('06-06-2025', 'dd-mm-yyyy'), 218, 55, 535);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('16-11-2026', 'dd-mm-yyyy'), 219, 72, 358);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('24-12-2027', 'dd-mm-yyyy'), 220, 76, 273);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('10-12-2025', 'dd-mm-yyyy'), 221, 50, 11);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('23-01-2027', 'dd-mm-yyyy'), 222, 67, 410);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('16-10-2025', 'dd-mm-yyyy'), 223, 83, 245);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('17-06-2025', 'dd-mm-yyyy'), 224, 63, 305);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('15-03-2027', 'dd-mm-yyyy'), 225, 86, 247);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('20-08-2025', 'dd-mm-yyyy'), 226, 63, 495);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('05-10-2026', 'dd-mm-yyyy'), 227, 94, 405);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('02-11-2027', 'dd-mm-yyyy'), 228, 80, 500);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('11-04-2026', 'dd-mm-yyyy'), 229, 66, 104);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('01-12-2027', 'dd-mm-yyyy'), 230, 95, 87);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('06-07-2026', 'dd-mm-yyyy'), 231, 78, 383);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('10-08-2025', 'dd-mm-yyyy'), 232, 90, 80);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('03-11-2027', 'dd-mm-yyyy'), 233, 69, 517);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('30-07-2026', 'dd-mm-yyyy'), 234, 89, 290);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('14-01-2025', 'dd-mm-yyyy'), 235, 99, 19);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('26-12-2025', 'dd-mm-yyyy'), 236, 77, 585);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('28-05-2025', 'dd-mm-yyyy'), 237, 51, 480);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('31-08-2027', 'dd-mm-yyyy'), 238, 91, 516);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('04-10-2027', 'dd-mm-yyyy'), 239, 79, 410);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('24-09-2026', 'dd-mm-yyyy'), 240, 85, 229);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('27-02-2025', 'dd-mm-yyyy'), 241, 97, 332);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('01-04-2026', 'dd-mm-yyyy'), 242, 95, 80);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('07-01-2025', 'dd-mm-yyyy'), 243, 84, 64);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('27-03-2025', 'dd-mm-yyyy'), 244, 58, 455);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('26-10-2025', 'dd-mm-yyyy'), 245, 54, 480);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('03-06-2027', 'dd-mm-yyyy'), 246, 88, 492);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('11-06-2026', 'dd-mm-yyyy'), 247, 73, 462);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('19-06-2025', 'dd-mm-yyyy'), 248, 96, 220);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('10-11-2027', 'dd-mm-yyyy'), 249, 73, 478);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('22-07-2027', 'dd-mm-yyyy'), 250, 97, 438);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('15-05-2027', 'dd-mm-yyyy'), 251, 99, 437);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('05-01-2027', 'dd-mm-yyyy'), 252, 66, 328);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('19-03-2026', 'dd-mm-yyyy'), 253, 60, 102);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('02-07-2027', 'dd-mm-yyyy'), 254, 90, 400);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('07-05-2025', 'dd-mm-yyyy'), 255, 65, 435);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('12-05-2026', 'dd-mm-yyyy'), 256, 95, 428);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('23-04-2025', 'dd-mm-yyyy'), 257, 98, 480);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('18-02-2027', 'dd-mm-yyyy'), 258, 77, 363);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('10-06-2025', 'dd-mm-yyyy'), 259, 65, 230);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('31-01-2025', 'dd-mm-yyyy'), 260, 70, 569);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('26-01-2026', 'dd-mm-yyyy'), 261, 74, 81);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('13-06-2026', 'dd-mm-yyyy'), 262, 99, 230);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('20-10-2027', 'dd-mm-yyyy'), 263, 85, 337);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('06-08-2025', 'dd-mm-yyyy'), 264, 72, 276);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('17-03-2025', 'dd-mm-yyyy'), 265, 97, 551);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('02-02-2026', 'dd-mm-yyyy'), 266, 80, 363);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('16-10-2027', 'dd-mm-yyyy'), 267, 100, 497);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('19-09-2025', 'dd-mm-yyyy'), 268, 95, 118);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('05-12-2025', 'dd-mm-yyyy'), 269, 91, 127);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('03-01-2027', 'dd-mm-yyyy'), 270, 51, 489);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('25-07-2026', 'dd-mm-yyyy'), 271, 56, 429);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('02-02-2027', 'dd-mm-yyyy'), 272, 78, 527);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('09-12-2026', 'dd-mm-yyyy'), 273, 58, 591);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('03-09-2026', 'dd-mm-yyyy'), 274, 88, 118);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('03-12-2026', 'dd-mm-yyyy'), 275, 58, 568);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('12-04-2025', 'dd-mm-yyyy'), 276, 58, 543);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('25-04-2026', 'dd-mm-yyyy'), 277, 58, 363);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('31-12-2027', 'dd-mm-yyyy'), 278, 52, 435);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('16-11-2025', 'dd-mm-yyyy'), 279, 92, 57);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('27-01-2025', 'dd-mm-yyyy'), 280, 72, 68);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('15-08-2026', 'dd-mm-yyyy'), 281, 52, 128);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('23-11-2026', 'dd-mm-yyyy'), 282, 68, 514);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('02-03-2025', 'dd-mm-yyyy'), 283, 93, 573);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('13-04-2026', 'dd-mm-yyyy'), 284, 54, 588);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('26-05-2025', 'dd-mm-yyyy'), 285, 80, 214);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('28-02-2026', 'dd-mm-yyyy'), 286, 73, 220);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('19-09-2027', 'dd-mm-yyyy'), 287, 92, 282);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('08-02-2025', 'dd-mm-yyyy'), 288, 74, 367);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('05-11-2026', 'dd-mm-yyyy'), 289, 92, 228);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('28-01-2025', 'dd-mm-yyyy'), 290, 57, 339);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('13-10-2027', 'dd-mm-yyyy'), 291, 81, 70);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('05-11-2025', 'dd-mm-yyyy'), 292, 95, 424);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('29-04-2027', 'dd-mm-yyyy'), 293, 61, 470);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('04-12-2027', 'dd-mm-yyyy'), 294, 81, 437);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('26-03-2027', 'dd-mm-yyyy'), 295, 65, 501);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('06-07-2025', 'dd-mm-yyyy'), 296, 64, 286);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('29-01-2027', 'dd-mm-yyyy'), 297, 79, 371);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('05-05-2025', 'dd-mm-yyyy'), 298, 65, 433);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('29-03-2027', 'dd-mm-yyyy'), 299, 59, 471);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('14-08-2027', 'dd-mm-yyyy'), 300, 100, 398);
commit;
prompt 300 records committed...
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('15-03-2025', 'dd-mm-yyyy'), 301, 92, 245);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('17-02-2026', 'dd-mm-yyyy'), 302, 53, 574);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('12-05-2026', 'dd-mm-yyyy'), 303, 66, 572);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('02-04-2025', 'dd-mm-yyyy'), 304, 94, 288);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('15-10-2027', 'dd-mm-yyyy'), 305, 55, 269);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('18-01-2026', 'dd-mm-yyyy'), 306, 60, 585);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('08-09-2026', 'dd-mm-yyyy'), 307, 83, 464);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('13-02-2026', 'dd-mm-yyyy'), 308, 94, 395);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('29-10-2027', 'dd-mm-yyyy'), 309, 70, 294);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('25-08-2025', 'dd-mm-yyyy'), 310, 60, 374);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('24-08-2026', 'dd-mm-yyyy'), 311, 92, 424);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('04-04-2025', 'dd-mm-yyyy'), 312, 93, 492);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('23-03-2027', 'dd-mm-yyyy'), 313, 82, 79);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('24-02-2027', 'dd-mm-yyyy'), 314, 85, 294);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('04-08-2027', 'dd-mm-yyyy'), 315, 98, 428);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('15-07-2026', 'dd-mm-yyyy'), 316, 57, 291);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('23-01-2025', 'dd-mm-yyyy'), 317, 70, 307);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('28-12-2027', 'dd-mm-yyyy'), 318, 83, 8);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('26-03-2025', 'dd-mm-yyyy'), 319, 54, 472);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('06-03-2026', 'dd-mm-yyyy'), 320, 82, 412);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('01-12-2025', 'dd-mm-yyyy'), 321, 58, 565);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('01-07-2026', 'dd-mm-yyyy'), 322, 100, 368);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('06-08-2026', 'dd-mm-yyyy'), 323, 72, 346);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('07-12-2027', 'dd-mm-yyyy'), 324, 77, 549);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('30-11-2026', 'dd-mm-yyyy'), 325, 100, 221);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('26-10-2025', 'dd-mm-yyyy'), 326, 55, 220);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('18-01-2026', 'dd-mm-yyyy'), 327, 56, 221);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('30-07-2025', 'dd-mm-yyyy'), 328, 94, 262);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('28-10-2026', 'dd-mm-yyyy'), 329, 96, 471);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('30-01-2026', 'dd-mm-yyyy'), 330, 97, 426);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('20-07-2027', 'dd-mm-yyyy'), 331, 54, 515);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('08-12-2026', 'dd-mm-yyyy'), 332, 100, 483);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('22-04-2026', 'dd-mm-yyyy'), 333, 92, 569);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('28-05-2025', 'dd-mm-yyyy'), 334, 85, 461);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('10-03-2027', 'dd-mm-yyyy'), 335, 93, 69);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('25-07-2026', 'dd-mm-yyyy'), 336, 85, 418);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('19-03-2025', 'dd-mm-yyyy'), 337, 61, 596);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('18-03-2027', 'dd-mm-yyyy'), 338, 55, 298);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('15-09-2026', 'dd-mm-yyyy'), 339, 90, 445);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('22-10-2026', 'dd-mm-yyyy'), 340, 92, 90);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('04-07-2026', 'dd-mm-yyyy'), 341, 50, 365);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('09-01-2025', 'dd-mm-yyyy'), 342, 55, 320);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('18-06-2026', 'dd-mm-yyyy'), 343, 64, 405);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('08-11-2027', 'dd-mm-yyyy'), 344, 64, 538);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('09-03-2027', 'dd-mm-yyyy'), 345, 84, 64);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('16-08-2026', 'dd-mm-yyyy'), 346, 62, 349);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('23-02-2025', 'dd-mm-yyyy'), 347, 51, 548);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('02-01-2025', 'dd-mm-yyyy'), 348, 51, 528);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('18-04-2025', 'dd-mm-yyyy'), 349, 70, 509);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('19-04-2027', 'dd-mm-yyyy'), 350, 52, 442);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('24-02-2027', 'dd-mm-yyyy'), 351, 55, 201);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('15-04-2025', 'dd-mm-yyyy'), 352, 66, 331);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('04-12-2027', 'dd-mm-yyyy'), 353, 81, 42);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('18-07-2025', 'dd-mm-yyyy'), 354, 70, 113);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('15-05-2026', 'dd-mm-yyyy'), 355, 94, 599);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('19-02-2027', 'dd-mm-yyyy'), 356, 73, 527);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('08-10-2027', 'dd-mm-yyyy'), 357, 61, 231);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('17-06-2025', 'dd-mm-yyyy'), 358, 71, 421);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('06-12-2025', 'dd-mm-yyyy'), 359, 78, 4);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('04-10-2027', 'dd-mm-yyyy'), 360, 78, 495);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('11-08-2027', 'dd-mm-yyyy'), 361, 92, 85);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('04-09-2027', 'dd-mm-yyyy'), 362, 78, 306);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('20-01-2025', 'dd-mm-yyyy'), 363, 62, 490);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('23-05-2027', 'dd-mm-yyyy'), 364, 62, 592);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('12-11-2027', 'dd-mm-yyyy'), 365, 57, 568);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('25-07-2026', 'dd-mm-yyyy'), 366, 97, 503);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('08-01-2025', 'dd-mm-yyyy'), 367, 83, 502);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('11-08-2027', 'dd-mm-yyyy'), 368, 72, 297);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('06-01-2025', 'dd-mm-yyyy'), 369, 92, 377);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('11-02-2026', 'dd-mm-yyyy'), 370, 92, 593);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('18-01-2026', 'dd-mm-yyyy'), 371, 82, 250);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('17-05-2027', 'dd-mm-yyyy'), 372, 62, 44);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('23-07-2027', 'dd-mm-yyyy'), 373, 63, 365);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('20-08-2027', 'dd-mm-yyyy'), 374, 69, 128);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('19-06-2026', 'dd-mm-yyyy'), 375, 86, 443);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('12-06-2027', 'dd-mm-yyyy'), 376, 95, 322);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('26-10-2027', 'dd-mm-yyyy'), 377, 100, 262);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('27-03-2027', 'dd-mm-yyyy'), 378, 65, 290);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('05-07-2027', 'dd-mm-yyyy'), 379, 93, 360);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('28-05-2027', 'dd-mm-yyyy'), 380, 69, 241);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('02-10-2027', 'dd-mm-yyyy'), 381, 99, 311);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('29-09-2025', 'dd-mm-yyyy'), 382, 77, 300);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('25-08-2026', 'dd-mm-yyyy'), 383, 58, 88);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('19-05-2027', 'dd-mm-yyyy'), 384, 97, 368);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('30-07-2025', 'dd-mm-yyyy'), 385, 81, 54);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('23-06-2027', 'dd-mm-yyyy'), 386, 64, 328);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('01-04-2025', 'dd-mm-yyyy'), 387, 73, 345);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('25-03-2026', 'dd-mm-yyyy'), 388, 70, 546);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('10-11-2026', 'dd-mm-yyyy'), 389, 79, 512);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('15-01-2026', 'dd-mm-yyyy'), 390, 68, 298);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('22-12-2025', 'dd-mm-yyyy'), 391, 87, 497);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('29-09-2026', 'dd-mm-yyyy'), 392, 82, 505);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('26-05-2027', 'dd-mm-yyyy'), 393, 78, 598);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('03-02-2027', 'dd-mm-yyyy'), 394, 62, 579);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('06-04-2026', 'dd-mm-yyyy'), 395, 56, 54);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('12-03-2026', 'dd-mm-yyyy'), 396, 62, 218);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('19-01-2027', 'dd-mm-yyyy'), 397, 85, 581);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('16-09-2026', 'dd-mm-yyyy'), 398, 52, 217);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('29-09-2026', 'dd-mm-yyyy'), 399, 91, 444);
insert into EQUIPMENT (e_date, e_id, amount, item_id)
values (to_date('17-03-2025', 'dd-mm-yyyy'), 400, 97, 283);
commit;
prompt 400 records loaded
prompt Loading MAINTENANCE...
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (302, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 45);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (303, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 81);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (304, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 32);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (305, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 90);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (306, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 71);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (307, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 17);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (308, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 28);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (309, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 84);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (310, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 117);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (311, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 79);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (312, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 117);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (313, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 110);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (314, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 32);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (315, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 58);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (316, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 91);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (317, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 63);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (318, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 44);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (319, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 62);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (320, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 113);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (321, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 115);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (322, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 47);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (323, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 77);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (324, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 43);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (325, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 66);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (326, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 71);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (327, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 4);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (328, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 106);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (329, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 81);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (330, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 114);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (331, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 12);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (332, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 52);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (333, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 62);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (334, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 20);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (335, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 118);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (336, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 96);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (337, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 41);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (338, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 19);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (339, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 15);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (340, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 54);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (341, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 108);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (342, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 43);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (343, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 16);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (344, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 33);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (345, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 41);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (346, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 43);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (347, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 108);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (348, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 89);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (349, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 106);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (350, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 96);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (351, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 127);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (352, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 127);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (353, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 113);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (354, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 84);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (355, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 60);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (356, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 102);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (357, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 69);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (358, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 6);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (359, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 80);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (360, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 69);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (361, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 57);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (362, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 127);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (363, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 81);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (364, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 33);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (365, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 72);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (366, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 116);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (367, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 115);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (368, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 8);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (369, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 89);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (370, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 77);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (371, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 58);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (372, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 16);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (373, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 113);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (374, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 82);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (375, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 106);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (376, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 76);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (377, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 106);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (378, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 47);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (379, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 69);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (380, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 11);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (381, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 125);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (382, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 15);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (383, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 72);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (384, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 79);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (385, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 35);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (386, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 77);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (387, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 77);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (388, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 113);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (389, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 37);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (390, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 104);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (391, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 55);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (392, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 35);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (393, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 18);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (394, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 32);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (395, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 19);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (396, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 93);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (397, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 14);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (398, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 117);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (399, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 45);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (400, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 67);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (250, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 69);
commit;
prompt 100 records committed...
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (251, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 127);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (252, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 35);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (253, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 128);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (254, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 83);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (255, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 44);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (256, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 102);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (257, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 24);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (258, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 94);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (259, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 21);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (260, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 113);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (261, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 91);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (262, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 81);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (263, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 54);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (264, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 94);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (265, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 107);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (266, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 35);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (267, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 53);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (268, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 20);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (269, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 57);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (270, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 68);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (271, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 93);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (272, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 125);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (273, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 10);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (274, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 70);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (275, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 11);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (276, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 58);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (277, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 128);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (278, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 18);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (279, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 93);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (280, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 39);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (281, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 64);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (282, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 65);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (283, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 108);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (284, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 88);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (285, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 53);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (286, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 47);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (287, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 105);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (288, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 24);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (289, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 9);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (290, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 48);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (291, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 56);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (292, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 4);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (293, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 47);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (294, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 69);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (295, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 70);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (296, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 67);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (297, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 16);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (298, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 40);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (299, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 63);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (300, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 12);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (301, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 66);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (401, to_date('01-07-2023', 'dd-mm-yyyy'), 'clean', 341);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (402, to_date('01-02-2023', 'dd-mm-yyyy'), 'healthy check', 338);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (403, to_date('01-08-2023', 'dd-mm-yyyy'), 'check validation', 362);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (404, to_date('01-12-2022', 'dd-mm-yyyy'), 'insert values for check', 351);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (405, to_date('01-06-2023', 'dd-mm-yyyy'), 'Replaced tires', 365);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (406, to_date('01-10-2023', 'dd-mm-yyyy'), 'Replaced battery', 334);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (407, to_date('01-08-2023', 'dd-mm-yyyy'), 'clean', 341);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (408, to_date('02-12-2023', 'dd-mm-yyyy'), 'healthy check', 338);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (409, to_date('09-08-2023', 'dd-mm-yyyy'), 'check validation', 362);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (410, to_date('20-03-2023', 'dd-mm-yyyy'), 'insert values for check', 351);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (411, to_date('01-01-2024', 'dd-mm-yyyy'), 'Replaced tires', 365);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (1, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 15);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (2, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 38);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (3, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 6);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (4, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 9);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (5, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 82);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (6, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 76);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (7, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 114);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (8, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 124);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (9, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 125);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (10, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 96);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (11, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 78);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (12, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 32);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (13, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 40);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (14, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 44);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (15, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 20);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (16, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 14);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (17, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 91);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (18, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 41);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (19, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 44);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (20, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 14);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (21, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 36);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (22, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 28);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (23, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 69);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (24, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 35);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (25, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 9);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (26, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 34);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (27, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 70);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (28, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 54);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (29, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 128);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (30, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 111);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (31, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 22);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (32, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 108);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (33, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 66);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (34, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 54);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (35, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 68);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (36, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 113);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (37, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 80);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (38, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 79);
commit;
prompt 200 records committed...
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (39, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 116);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (40, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 107);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (41, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 54);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (42, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 56);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (43, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 44);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (44, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 17);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (45, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 128);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (46, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 21);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (47, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 20);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (48, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 34);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (49, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 116);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (50, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 101);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (51, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 33);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (52, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 44);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (53, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 69);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (54, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 55);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (55, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 92);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (56, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 17);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (57, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 85);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (58, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 45);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (59, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 70);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (60, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 31);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (61, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 15);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (62, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 110);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (63, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 22);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (64, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 30);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (65, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 18);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (66, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 95);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (67, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 69);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (68, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 89);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (69, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 84);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (70, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 88);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (71, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 60);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (72, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 8);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (73, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 60);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (74, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 32);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (75, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 91);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (76, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 112);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (77, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 4);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (78, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 31);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (79, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 90);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (80, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 67);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (81, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 128);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (82, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 105);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (83, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 48);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (416, to_date('07-07-2024 11:42:00', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 117);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (417, to_date('07-07-2024 11:42:00', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 104);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (418, to_date('07-07-2024 11:42:00', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 67);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (419, to_date('07-07-2024 11:42:00', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 70);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (420, to_date('07-07-2024 11:42:03', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 117);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (421, to_date('07-07-2024 11:42:03', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 104);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (422, to_date('07-07-2024 11:42:03', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 67);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (423, to_date('07-07-2024 11:42:03', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 70);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (424, to_date('07-07-2024 11:47:26', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 117);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (425, to_date('07-07-2024 11:47:26', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 104);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (426, to_date('07-07-2024 11:47:26', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 67);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (427, to_date('07-07-2024 11:47:26', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 70);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (428, to_date('02-05-2021', 'dd-mm-yyyy'), 'donor asked', 117);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (429, to_date('02-05-2021', 'dd-mm-yyyy'), 'donor asked', 104);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (430, to_date('02-05-2021', 'dd-mm-yyyy'), 'donor asked', 67);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (431, to_date('02-05-2021', 'dd-mm-yyyy'), 'donor asked', 70);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (432, to_date('18-07-2024 02:03:52', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 117);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (433, to_date('18-07-2024 02:03:52', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 104);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (434, to_date('18-07-2024 02:03:52', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 67);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (435, to_date('18-07-2024 02:03:52', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 70);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (440, to_date('23-07-2024 04:22:44', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 117);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (441, to_date('23-07-2024 04:22:44', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 104);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (442, to_date('23-07-2024 04:22:44', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 67);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (443, to_date('23-07-2024 04:22:44', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 70);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (444, to_date('23-07-2024 04:23:39', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 117);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (445, to_date('23-07-2024 04:23:39', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 104);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (446, to_date('23-07-2024 04:23:39', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 67);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (447, to_date('23-07-2024 04:23:39', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 70);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (448, to_date('23-07-2024 04:23:54', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 117);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (449, to_date('23-07-2024 04:23:54', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 104);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (450, to_date('23-07-2024 04:23:54', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 67);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (451, to_date('23-07-2024 04:23:54', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 70);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (452, to_date('23-07-2024 04:26:12', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 117);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (453, to_date('23-07-2024 04:26:12', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 104);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (454, to_date('23-07-2024 04:26:12', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 67);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (455, to_date('23-07-2024 04:26:12', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 70);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (456, to_date('23-07-2024 04:26:45', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 117);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (457, to_date('23-07-2024 04:26:45', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 104);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (458, to_date('23-07-2024 04:26:45', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 67);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (459, to_date('23-07-2024 04:26:45', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 70);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (460, to_date('23-07-2024 04:26:58', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 117);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (461, to_date('23-07-2024 04:26:58', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 104);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (462, to_date('23-07-2024 04:26:58', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 67);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (463, to_date('23-07-2024 04:26:58', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 70);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (464, to_date('23-07-2024 04:27:09', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 117);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (465, to_date('23-07-2024 04:27:09', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 104);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (466, to_date('23-07-2024 04:27:09', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 67);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (467, to_date('23-07-2024 04:27:09', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 70);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (468, to_date('23-07-2024 04:29:04', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 117);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (469, to_date('23-07-2024 04:29:04', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 104);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (470, to_date('23-07-2024 04:29:04', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 67);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (471, to_date('23-07-2024 04:29:04', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 70);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (472, to_date('23-07-2024 04:29:31', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 117);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (473, to_date('23-07-2024 04:29:31', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 104);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (474, to_date('23-07-2024 04:29:31', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 67);
commit;
prompt 300 records committed...
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (475, to_date('23-07-2024 04:29:31', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 70);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (476, to_date('23-07-2024 11:20:21', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 117);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (477, to_date('23-07-2024 11:20:21', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 104);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (478, to_date('23-07-2024 11:20:21', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 67);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (479, to_date('23-07-2024 11:20:21', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 70);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (436, to_date('21-07-2024 12:18:52', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 117);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (437, to_date('21-07-2024 12:18:52', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 104);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (438, to_date('21-07-2024 12:18:52', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 67);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (439, to_date('21-07-2024 12:18:52', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 70);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (140, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 14);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (141, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 39);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (142, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 56);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (143, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 35);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (144, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 83);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (145, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 11);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (146, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 8);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (147, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 64);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (148, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 59);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (149, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 69);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (150, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 29);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (151, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 56);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (152, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 31);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (153, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 82);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (154, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 8);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (155, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 28);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (156, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 93);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (157, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 87);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (158, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 22);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (159, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 77);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (160, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 46);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (161, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 9);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (162, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 83);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (163, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 57);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (164, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 22);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (165, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 17);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (166, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 11);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (167, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 116);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (168, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 103);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (169, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 37);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (170, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 69);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (171, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 58);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (172, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 66);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (173, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 91);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (174, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 103);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (175, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 16);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (176, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 91);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (177, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 37);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (178, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 107);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (179, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 77);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (180, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 56);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (181, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 62);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (182, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 96);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (183, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 19);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (184, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 101);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (185, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 8);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (186, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 91);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (187, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 58);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (188, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 78);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (189, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 104);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (190, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 115);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (191, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 124);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (192, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 88);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (193, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 33);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (194, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 108);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (195, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 46);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (196, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 20);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (197, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 104);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (198, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 17);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (199, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 96);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (200, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 44);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (201, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 18);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (202, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 128);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (203, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 16);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (204, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 124);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (205, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 57);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (206, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 59);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (207, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 37);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (208, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 55);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (209, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 90);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (210, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 78);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (211, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 28);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (212, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 34);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (213, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 17);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (214, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 103);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (215, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 63);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (216, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 95);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (217, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 46);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (218, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 72);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (219, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 128);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (220, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 4);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (221, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 85);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (222, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 24);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (223, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 111);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (224, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 19);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (225, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 59);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (226, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 125);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (227, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 104);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (228, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 72);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (229, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 87);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (230, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 24);
commit;
prompt 400 records committed...
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (231, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 90);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (232, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 60);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (233, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 88);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (234, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 106);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (235, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 69);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (236, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 61);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (237, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 108);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (238, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 105);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (239, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 82);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (240, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 125);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (241, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 68);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (242, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 18);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (243, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 45);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (244, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 95);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (245, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 118);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (246, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 17);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (247, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 112);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (248, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 68);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (249, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 110);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (412, to_date('07-07-2024', 'dd-mm-yyyy'), 'donor asked', 117);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (413, to_date('07-07-2024', 'dd-mm-yyyy'), 'donor asked', 104);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (414, to_date('07-07-2024', 'dd-mm-yyyy'), 'donor asked', 67);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (415, to_date('07-07-2024', 'dd-mm-yyyy'), 'donor asked', 70);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (480, to_date('23-07-2024 11:21:07', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 117);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (481, to_date('23-07-2024 11:21:07', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 104);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (482, to_date('23-07-2024 11:21:07', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 67);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (483, to_date('23-07-2024 11:21:07', 'dd-mm-yyyy hh24:mi:ss'), 'donor asked', 70);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (484, to_date('01-01-2024', 'dd-mm-yyyy'), 'donor asked', 117);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (485, to_date('01-01-2024', 'dd-mm-yyyy'), 'donor asked', 104);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (486, to_date('01-01-2024', 'dd-mm-yyyy'), 'donor asked', 67);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (487, to_date('01-01-2024', 'dd-mm-yyyy'), 'donor asked', 70);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (84, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 4);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (85, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 127);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (86, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 33);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (87, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 113);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (88, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 46);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (89, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 59);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (90, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 72);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (91, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 70);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (92, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 45);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (93, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 81);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (94, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 71);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (95, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 89);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (96, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 77);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (97, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 115);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (98, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 113);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (99, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 36);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (100, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 69);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (101, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 53);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (102, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 81);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (103, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 34);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (104, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 39);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (105, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 4);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (106, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 77);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (107, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 4);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (108, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 68);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (109, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 70);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (110, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 118);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (111, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 48);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (112, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 28);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (113, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 31);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (114, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 88);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (115, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 72);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (116, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 116);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (117, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 37);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (118, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 106);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (119, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 15);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (120, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 45);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (121, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 91);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (122, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 48);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (123, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 48);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (124, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 17);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (125, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 71);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (126, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 32);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (127, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 59);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (128, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 31);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (129, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 78);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (130, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 4);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (131, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 78);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (132, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 92);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (133, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 128);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (134, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 37);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (135, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 72);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (136, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'difficult', 20);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (137, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'Need continue', 9);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (138, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 33);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (139, to_date('02-06-2024 11:28:20', 'dd-mm-yyyy hh24:mi:ss'), 'easy', 52);
commit;
prompt 487 records loaded
prompt Loading OPERATOR...
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (401, 'CrystalManning', to_date('02-08-2029', 'dd-mm-yyyy'), '36 Josh Ave');
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (402, 'SaffronMurray', to_date('21-12-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (403, 'NastassjaO''Neal', to_date('19-05-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (404, 'DickKahn', to_date('23-10-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (405, 'RhysDafoe', to_date('27-05-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (406, 'HalleReid', to_date('15-11-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (407, 'GatesElizondo', to_date('20-08-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (408, 'WesKingsley', to_date('29-10-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (409, 'FredaCheadle', to_date('25-11-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (410, 'JoelyMcPherson', to_date('27-03-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (411, 'KaronLavigne', to_date('13-09-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (412, 'MichaelHeron', to_date('05-02-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (413, 'PowersRock', to_date('22-05-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (414, 'BradleyHeche', to_date('17-02-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (415, 'BuffyUtada', to_date('20-08-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (416, 'KingGoldwyn', to_date('20-04-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (417, 'IsabellaO''Connor', to_date('16-08-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (418, 'ElizabethVan Shelton', to_date('23-05-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (419, 'DiamondDiehl', to_date('22-11-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (420, 'FionaGlover', to_date('11-03-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (421, 'WillLunch', to_date('21-10-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (422, 'AdrienHumphrey', to_date('13-02-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (423, 'DerrickLaw', to_date('01-03-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (424, 'AlannahLeto', to_date('01-10-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (425, 'HarryEstevez', to_date('10-01-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (426, 'LaraWitt', to_date('04-10-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (427, 'JodyParish', to_date('02-01-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (428, 'BelindaRush', to_date('09-12-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (429, 'MikeHirsch', to_date('18-03-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (430, 'StephenAlston', to_date('25-07-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (431, 'AndyDeVito', to_date('03-08-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (432, 'IkeDiBiasio', to_date('07-11-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (433, 'JavonThornton', to_date('30-04-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (434, 'MarinaJovovich', to_date('02-02-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (435, 'CoreyMorales', to_date('04-11-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (436, 'AlbertGray', to_date('03-09-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (437, 'LarenzFlanagan', to_date('18-06-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (438, 'JessicaPigott-Smith', to_date('03-01-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (439, 'AdinaRockwell', to_date('28-10-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (440, 'HumbertoSevenfold', to_date('04-10-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (441, 'RhysKaryo', to_date('28-12-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (442, 'CledusHall', to_date('24-06-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (443, 'LynetteBeals', to_date('15-01-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (444, 'NedMcNeice', to_date('24-09-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (445, 'DarrenDillon', to_date('17-12-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (446, 'TerenceLachey', to_date('10-10-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (447, 'DebraDrive', to_date('17-02-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (448, 'JeremyMars', to_date('07-06-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (449, 'TobeyDiCaprio', to_date('10-06-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (450, 'NightPeet', to_date('06-12-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (451, 'MikaMcKennitt', to_date('30-01-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (452, 'GoldieProwse', to_date('11-02-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (453, 'RoscoeDe Almeida', to_date('12-05-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (454, 'VingHutch', to_date('22-08-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (455, 'SethRed', to_date('14-11-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (456, 'KimberlyThewlis', to_date('06-03-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (457, 'HarrySledge', to_date('25-03-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (458, 'GoranIsaacs', to_date('15-08-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (459, 'TimothyHanley', to_date('10-04-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (460, 'SimonKilmer', to_date('21-05-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (461, 'JohnnieTheron', to_date('02-09-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (462, 'VondieSchreiber', to_date('15-03-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (463, 'MintSwayze', to_date('04-03-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (464, 'RuebenJones', to_date('08-05-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (465, 'BernieBerry', to_date('22-08-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (466, 'AshleyJessee', to_date('07-11-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (467, 'HarrisonBell', to_date('17-08-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (468, 'LeonardoBacon', to_date('17-09-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (469, 'AndrewBonham', to_date('08-11-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (470, 'KimberlyThomas', to_date('28-11-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (471, 'MatthewWard', to_date('20-07-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (472, 'ChristopherFrampton', to_date('10-04-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (473, 'GeraldineMacLachlan', to_date('18-09-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (474, 'AidanMewes', to_date('09-09-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (475, 'DiamondFishburne', to_date('15-09-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (476, 'PeteAtkins', to_date('12-02-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (477, 'NightBlack', to_date('23-10-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (478, 'FreddyDriver', to_date('20-10-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (479, 'LouiseClayton', to_date('15-06-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (480, 'DaveyDiggs', to_date('28-04-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (481, 'GarlandDonovan', to_date('26-09-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (482, 'IsaiahPleasure', to_date('15-04-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (483, 'AlanLiu', to_date('18-05-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (484, 'DanielLoring', to_date('05-12-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (485, 'WaymanRooker', to_date('01-11-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (486, 'FrankieMilsap', to_date('09-12-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (487, 'AimeeGambon', to_date('05-10-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (488, 'LucindaAniston', to_date('17-03-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (489, 'BradleyPressly', to_date('18-02-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (490, 'LionelSpears', to_date('28-11-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (491, 'IreneTippe', to_date('18-07-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (492, 'GeraldineDanger', to_date('20-05-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (493, 'DianeNewman', to_date('30-06-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (494, 'DelroyElwes', to_date('27-06-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (495, 'PattiSerbedzija', to_date('19-03-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (496, 'PamelaSantana', to_date('06-06-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (497, 'DianeDavid', to_date('03-11-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (498, 'FayeHolbrook', to_date('13-08-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (499, 'JonnyRippy', to_date('10-10-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (343, 'SalmaShearer', to_date('16-02-2026', 'dd-mm-yyyy'), null);
commit;
prompt 100 records committed...
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (344, 'SteveColtrane', to_date('05-04-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (345, 'JohnRush', to_date('23-01-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (346, 'TarynMantegna', to_date('02-03-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (347, 'RobertaHaslam', to_date('08-01-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (348, 'MorrisMcCann', to_date('09-05-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (349, 'MurrayShatner', to_date('28-04-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (350, 'FionaDriver', to_date('19-01-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (351, 'PenelopeAndrews', to_date('11-07-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (352, 'MarieMcGriff', to_date('09-06-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (353, 'SaulNelson', to_date('19-02-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (354, 'ReneLewis', to_date('29-06-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (355, 'TreatHagar', to_date('31-03-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (356, 'BoTomei', to_date('09-02-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (357, 'NedHeslov', to_date('22-03-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (358, 'BrianWinter', to_date('24-11-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (359, 'EmmylouChristie', to_date('08-05-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (360, 'CliffBrolin', to_date('25-11-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (361, 'StevieHoliday', to_date('07-03-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (362, 'DenisArkenstone', to_date('23-09-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (363, 'Mary BethPopper', to_date('14-10-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (364, 'SteveCumming', to_date('17-02-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (365, 'MadelineBarnett', to_date('25-02-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (366, 'JaimeWakeling', to_date('13-09-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (367, 'StevieJones', to_date('22-12-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (368, 'CliffParm', to_date('16-05-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (369, 'AngelaPride', to_date('01-02-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (370, 'FairuzaPerrineau', to_date('14-03-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (371, 'KevinShaye', to_date('19-01-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (372, 'DarrenZeta-Jones', to_date('30-12-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (373, 'ChakaWilder', to_date('18-01-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (374, 'KatrinWithers', to_date('29-04-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (375, 'BenicioCleary', to_date('24-08-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (376, 'CrispinLynskey', to_date('26-01-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (377, 'BalthazarRifkin', to_date('07-12-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (378, 'JesseBirch', to_date('13-09-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (379, 'BarryNeill', to_date('07-11-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (380, 'MykeltiMoffat', to_date('21-07-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (381, 'SuziRankin', to_date('06-08-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (382, 'AlessandroOrbit', to_date('24-10-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (383, 'GuyCampbell', to_date('16-10-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (384, 'EmmMaxwell', to_date('16-07-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (385, 'ReneeAmos', to_date('21-03-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (386, 'LisaMraz', to_date('05-08-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (387, 'OdedMoreno', to_date('12-12-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (388, 'BobLangella', to_date('28-01-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (389, 'LindaMifune', to_date('06-06-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (390, 'HugoHolm', to_date('18-07-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (391, 'EmmaPlatt', to_date('03-04-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (392, 'EttaVannelli', to_date('05-09-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (393, 'GwynethRundgren', to_date('07-07-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (394, 'GloriaLarter', to_date('16-07-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (395, 'ChuckBenson', to_date('24-06-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (396, 'RufusLithgow', to_date('02-09-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (397, 'ScarlettReid', to_date('30-09-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (398, 'MichelleCrouch', to_date('13-02-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (399, 'HazelWorrell', to_date('25-06-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (400, 'WesPalmer', to_date('16-12-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (100, 'MattCollie', to_date('13-11-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (101, 'JulietPfeiffer', to_date('03-04-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (102, 'ChristianMewes', to_date('22-12-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (103, 'GlenTanon', to_date('06-07-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (104, 'OwenLaPaglia', to_date('18-03-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (105, 'IvanHatchet', to_date('31-01-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (106, 'FranzHunter', to_date('26-05-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (107, 'RobGaines', to_date('18-01-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (108, 'HexFoxx', to_date('17-12-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (109, 'AliciaWinstone', to_date('12-09-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (110, 'PhilipBenson', to_date('09-12-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (111, 'TziMcAnally', to_date('31-10-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (112, 'MarleyBlossoms', to_date('15-03-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (113, 'DaveBuffalo', to_date('24-02-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (114, 'KirkCromwell', to_date('03-09-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (115, 'MarlonSecada', to_date('28-10-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (116, 'MaxDiBiasio', to_date('18-02-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (117, 'CevinBachman', to_date('03-03-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (118, 'MekhiCantrell', to_date('04-04-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (119, 'HarryBrando', to_date('04-06-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (120, 'HarrisonMcPherson', to_date('15-04-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (121, 'LupeRebhorn', to_date('05-12-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (122, 'YolandaJeffreys', to_date('05-07-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (123, 'RadeLogue', to_date('08-01-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (124, 'JuliannePride', to_date('06-01-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (125, 'NikSchwarzenegger', to_date('28-03-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (126, 'HarrisVai', to_date('03-08-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (127, 'ClaireGibson', to_date('09-02-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (128, 'PragaLevin', to_date('31-01-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (129, 'YaphetTierney', to_date('16-12-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (130, 'KathleenBranch', to_date('26-05-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (131, 'ReneeKlugh', to_date('10-03-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (132, 'ChristopherGill', to_date('29-09-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (133, 'TchekyTolkan', to_date('21-03-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (134, 'RachidNeil', to_date('02-07-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (135, 'LenaDaniels', to_date('05-06-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (136, 'EddieCulkin', to_date('16-08-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (137, 'HollandWahlberg', to_date('28-08-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (138, 'AliciaShand', to_date('24-09-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (139, 'ClayTurner', to_date('02-08-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (140, 'JeffreyScorsese', to_date('02-05-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (141, 'BethRicci', to_date('26-10-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (142, 'LucyCoburn', to_date('01-05-2029', 'dd-mm-yyyy'), null);
commit;
prompt 200 records committed...
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (143, 'JoelyPresley', to_date('07-11-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (144, 'DesmondNuman', to_date('30-07-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (145, 'ChristineGarza', to_date('10-06-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (146, 'HeathHatchet', to_date('18-03-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (147, 'MurrayWhitley', to_date('25-07-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (148, 'TimHeald', to_date('28-03-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (149, 'BrentMueller-Stahl', to_date('15-03-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (150, 'MollyGraham', to_date('22-09-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (151, 'MiaMac', to_date('13-11-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (152, 'RoyCash', to_date('27-08-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (153, 'LauraSepulveda', to_date('02-04-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (154, 'ConnieFuray', to_date('07-01-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (155, 'NicoleMacy', to_date('01-12-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (156, 'DarrenHeslov', to_date('06-02-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (157, 'HectorJackson', to_date('01-07-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (158, 'DebraStarr', to_date('17-11-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (159, 'SharonStills', to_date('17-01-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (160, 'OwenWhite', to_date('11-03-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (161, 'LydiaGriggs', to_date('17-07-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (162, 'ChadFinn', to_date('14-08-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (163, 'PatriciaMoffat', to_date('20-02-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (164, 'NicolePostlethwaite', to_date('07-09-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (165, 'HarveyHayek', to_date('25-09-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (166, 'KeithKapanka', to_date('09-06-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (167, 'AustinLewis', to_date('07-01-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (168, 'PatrickGeldof', to_date('10-12-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (169, 'RandallWillis', to_date('03-09-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (170, 'LiamBalk', to_date('15-04-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (171, 'SigourneyPenders', to_date('23-08-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (172, 'JackHeston', to_date('01-01-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (173, 'MillaHayek', to_date('23-03-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (174, 'SharonAli', to_date('21-02-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (175, 'NigelHeslov', to_date('03-06-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (176, 'CharltonCronin', to_date('13-01-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (177, 'AndieDukakis', to_date('11-10-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (178, 'GarryRhodes', to_date('23-04-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (179, 'HarryRaybon', to_date('27-11-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (180, 'Jean-ClaudeGuzman', to_date('14-08-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (181, 'MaggieGalecki', to_date('23-05-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (182, 'VictorVaughan', to_date('30-01-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (183, 'CarrieFlanagan', to_date('29-09-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (184, 'TommyCraddock', to_date('16-02-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (185, 'KurtSpector', to_date('12-01-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (244, 'BelindaDonovan', to_date('14-08-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (245, 'GoldieSteagall', to_date('12-12-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (246, 'SelmaMatarazzo', to_date('09-06-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (247, 'JoshCarrack', to_date('01-04-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (248, 'AzucarDiffie', to_date('13-09-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (249, 'PhilipBarrymore', to_date('30-12-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (250, 'AnneGiamatti', to_date('24-08-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (251, 'AniShand', to_date('27-03-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (252, 'RitaHayes', to_date('04-04-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (253, 'ElvisCurry', to_date('10-07-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (254, 'EmilyMarsden', to_date('09-12-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (255, 'RyanMaxwell', to_date('28-02-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (256, 'CornellVan Der Beek', to_date('29-12-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (257, 'MaeWeisz', to_date('16-09-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (258, 'BlairEstevez', to_date('10-10-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (259, 'TraceSpader', to_date('07-06-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (260, 'YaphetO''Neal', to_date('03-11-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (261, 'OlympiaWilson', to_date('01-08-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (262, 'PaulaHong', to_date('17-03-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (263, 'WhoopiLowe', to_date('31-12-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (264, 'FirstWhitford', to_date('25-02-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (265, 'AdinaO''Keefe', to_date('09-04-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (266, 'LynetteCollins', to_date('18-08-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (267, 'WallyMoss', to_date('13-01-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (268, 'JulietBuscemi', to_date('07-03-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (269, 'JesusPonce', to_date('31-10-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (270, 'SpikeFlemyng', to_date('16-06-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (271, 'TeenaFoxx', to_date('19-12-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (272, 'NicholasCash', to_date('04-07-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (273, 'BeverleyHamilton', to_date('09-07-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (274, 'EmmaBrooke', to_date('12-07-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (275, 'TedFranks', to_date('05-12-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (276, 'AliLarter', to_date('27-12-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (277, 'MindyGaynor', to_date('07-01-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (278, 'MichaelRundgren', to_date('06-06-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (279, 'LouNivola', to_date('20-08-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (280, 'AliChesnutt', to_date('19-05-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (281, 'DebiMorse', to_date('29-11-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (282, 'JaimeStiers', to_date('24-12-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (283, 'RobertCole', to_date('17-04-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (284, 'ElvisRuiz', to_date('22-08-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (285, 'AllanViterelli', to_date('18-06-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (286, 'MykeltiMcCracken', to_date('20-08-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (287, 'CarlosMartin', to_date('02-01-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (288, 'WalterHyde', to_date('13-09-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (289, 'ArturoCurry', to_date('04-07-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (290, 'BuddyGarr', to_date('03-07-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (291, 'JosephPurefoy', to_date('05-11-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (292, 'SamuelNuman', to_date('05-02-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (293, 'BurtonHouston', to_date('21-12-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (294, 'TyroneWood', to_date('06-04-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (295, 'AdamLeguizamo', to_date('25-06-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (296, 'ThinVincent', to_date('11-10-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (297, 'AhmadWheel', to_date('14-05-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (298, 'TeenaEsposito', to_date('21-02-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (299, 'WillHoly', to_date('26-01-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (300, 'TerriCash', to_date('13-01-2024', 'dd-mm-yyyy'), null);
commit;
prompt 300 records committed...
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (301, 'LeonardoWarburton', to_date('28-03-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (302, 'PowersRibisi', to_date('16-10-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (303, 'HalSandler', to_date('25-10-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (304, 'DennyArden', to_date('09-04-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (305, 'IkeHauer', to_date('03-06-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (306, 'NataschaUnion', to_date('01-09-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (307, 'DomingoHagar', to_date('12-05-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (308, 'RosannaDorn', to_date('26-02-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (309, 'MurrayClinton', to_date('24-08-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (310, 'AprilNeeson', to_date('15-04-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (311, 'HexHatosy', to_date('17-12-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (312, 'JulianneHedaya', to_date('29-04-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (313, 'CurtisAtlas', to_date('28-09-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (314, 'RupertTah', to_date('18-06-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (315, 'MartyMitra', to_date('01-02-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (316, 'GranRispoli', to_date('06-09-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (317, 'NedEnglish', to_date('17-07-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (318, 'AlbertinaHenstridge', to_date('19-05-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (319, 'MichaelWillard', to_date('17-11-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (320, 'JulietteColeman', to_date('13-12-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (321, 'ChubbyPleasure', to_date('08-04-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (322, 'RandySimpson', to_date('11-02-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (323, 'MiaMarie', to_date('22-08-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (324, 'YaphetWeaving', to_date('20-01-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (325, 'JulianneWhitmore', to_date('01-12-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (326, 'AdinaKeitel', to_date('12-12-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (327, 'MinnieGoodall', to_date('13-04-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (328, 'AzucarSpeaks', to_date('05-07-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (329, 'PeaboMarsden', to_date('24-12-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (330, 'RobMcGinley', to_date('24-08-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (331, 'ReneSaucedo', to_date('19-05-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (332, 'RhettKirkwood', to_date('15-10-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (333, 'WangAndrews', to_date('15-07-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (334, 'RandallBroderick', to_date('13-06-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (335, 'HoraceCherry', to_date('21-04-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (336, 'MirandaMarie', to_date('17-06-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (337, 'HarryTanon', to_date('26-06-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (338, 'DorryStrong', to_date('02-07-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (339, 'DebraCusack', to_date('13-07-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (340, 'CubaEnglish', to_date('16-07-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (341, 'WallySlater', to_date('07-07-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (342, 'AmandaCalle', to_date('28-12-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (186, 'AndreaCraig', to_date('12-11-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (187, 'GeenaGilley', to_date('19-07-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (188, 'GailardBrooke', to_date('27-02-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (189, 'LesleyBullock', to_date('05-01-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (190, 'JerryEvans', to_date('10-09-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (191, 'TildaWaits', to_date('24-02-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (192, 'PattyParsons', to_date('04-10-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (193, 'SineadNicholas', to_date('26-05-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (194, 'LeslieCurry', to_date('10-08-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (195, 'GailardCook', to_date('11-05-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (196, 'DomingoImbruglia', to_date('21-12-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (197, 'MiaMargulies', to_date('07-12-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (198, 'SalGriffiths', to_date('09-06-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (199, 'JoaquinHagerty', to_date('14-03-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (200, 'NinaSepulveda', to_date('11-11-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (201, 'StephenSanchez', to_date('12-10-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (202, 'SolomonVanian', to_date('05-12-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (203, 'DanielShaw', to_date('01-04-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (204, 'VerticalKapanka', to_date('17-01-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (205, 'BuffyCampbell', to_date('01-03-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (206, 'RitaTennison', to_date('28-02-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (207, 'HarrietPayne', to_date('16-07-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (208, 'CarleneO''Hara', to_date('30-06-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (209, 'AliMcCormack', to_date('12-08-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (210, 'ChristineKaryo', to_date('25-11-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (211, 'ThinStarr', to_date('27-02-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (212, 'LiamGyllenhaal', to_date('08-01-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (213, 'ColeFonda', to_date('23-06-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (214, 'MiaRodriguez', to_date('13-02-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (215, 'DebbieBancroft', to_date('07-07-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (216, 'RheaHawn', to_date('28-09-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (217, 'ElizaBosco', to_date('27-11-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (218, 'GabrielClinton', to_date('07-12-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (219, 'HollyFrakes', to_date('18-11-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (220, 'CesarKramer', to_date('21-06-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (221, 'LisaBlossoms', to_date('28-05-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (222, 'DiamondGyllenhaal', to_date('19-09-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (223, 'CarlWilliams', to_date('19-09-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (224, 'GlenMatheson', to_date('19-10-2026', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (225, 'MintMills', to_date('23-09-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (226, 'MirandaKingsley', to_date('27-01-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (227, 'JoanHaggard', to_date('03-11-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (228, 'CaroleEmmerich', to_date('26-04-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (229, 'KathleenTillis', to_date('06-09-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (230, 'CeiliHimmelman', to_date('12-12-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (231, 'JosephBeckinsale', to_date('25-06-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (232, 'GeggyKadison', to_date('03-04-2025', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (233, 'GilBadalucco', to_date('09-02-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (234, 'BridgetteGold', to_date('21-01-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (235, 'SonaIsaak', to_date('17-10-2028', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (236, 'LeaKlugh', to_date('19-06-2030', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (237, 'DorryRipley', to_date('15-02-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (238, 'BradleyHaslam', to_date('22-06-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (239, 'ReneSingh', to_date('25-04-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (240, 'YolandaHawthorne', to_date('25-07-2024', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (241, 'CarlosSinatra', to_date('21-05-2027', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (242, 'JacksonConnick', to_date('18-12-2029', 'dd-mm-yyyy'), null);
insert into OPERATOR (operatorid, name, expirationdate, adress)
values (243, 'JeanneLemmon', to_date('28-06-2025', 'dd-mm-yyyy'), null);
commit;
prompt 400 records loaded
prompt Loading OPERATION...
insert into OPERATION (itemid, operatorid)
values (4, 100);
insert into OPERATION (itemid, operatorid)
values (4, 154);
insert into OPERATION (itemid, operatorid)
values (4, 313);
insert into OPERATION (itemid, operatorid)
values (4, 441);
insert into OPERATION (itemid, operatorid)
values (6, 419);
insert into OPERATION (itemid, operatorid)
values (8, 165);
insert into OPERATION (itemid, operatorid)
values (8, 327);
insert into OPERATION (itemid, operatorid)
values (9, 120);
insert into OPERATION (itemid, operatorid)
values (9, 214);
insert into OPERATION (itemid, operatorid)
values (9, 389);
insert into OPERATION (itemid, operatorid)
values (10, 220);
insert into OPERATION (itemid, operatorid)
values (10, 479);
insert into OPERATION (itemid, operatorid)
values (10, 492);
insert into OPERATION (itemid, operatorid)
values (11, 106);
insert into OPERATION (itemid, operatorid)
values (11, 115);
insert into OPERATION (itemid, operatorid)
values (11, 189);
insert into OPERATION (itemid, operatorid)
values (11, 296);
insert into OPERATION (itemid, operatorid)
values (11, 330);
insert into OPERATION (itemid, operatorid)
values (11, 429);
insert into OPERATION (itemid, operatorid)
values (12, 258);
insert into OPERATION (itemid, operatorid)
values (12, 280);
insert into OPERATION (itemid, operatorid)
values (12, 351);
insert into OPERATION (itemid, operatorid)
values (12, 445);
insert into OPERATION (itemid, operatorid)
values (14, 100);
insert into OPERATION (itemid, operatorid)
values (14, 246);
insert into OPERATION (itemid, operatorid)
values (14, 283);
insert into OPERATION (itemid, operatorid)
values (15, 121);
insert into OPERATION (itemid, operatorid)
values (15, 141);
insert into OPERATION (itemid, operatorid)
values (15, 189);
insert into OPERATION (itemid, operatorid)
values (15, 471);
insert into OPERATION (itemid, operatorid)
values (16, 159);
insert into OPERATION (itemid, operatorid)
values (16, 264);
insert into OPERATION (itemid, operatorid)
values (16, 464);
insert into OPERATION (itemid, operatorid)
values (17, 121);
insert into OPERATION (itemid, operatorid)
values (17, 180);
insert into OPERATION (itemid, operatorid)
values (17, 238);
insert into OPERATION (itemid, operatorid)
values (17, 293);
insert into OPERATION (itemid, operatorid)
values (18, 145);
insert into OPERATION (itemid, operatorid)
values (18, 379);
insert into OPERATION (itemid, operatorid)
values (18, 455);
insert into OPERATION (itemid, operatorid)
values (18, 466);
insert into OPERATION (itemid, operatorid)
values (18, 469);
insert into OPERATION (itemid, operatorid)
values (19, 201);
insert into OPERATION (itemid, operatorid)
values (19, 275);
insert into OPERATION (itemid, operatorid)
values (19, 429);
insert into OPERATION (itemid, operatorid)
values (20, 119);
insert into OPERATION (itemid, operatorid)
values (20, 282);
insert into OPERATION (itemid, operatorid)
values (20, 365);
insert into OPERATION (itemid, operatorid)
values (20, 431);
insert into OPERATION (itemid, operatorid)
values (20, 447);
insert into OPERATION (itemid, operatorid)
values (20, 490);
insert into OPERATION (itemid, operatorid)
values (21, 110);
insert into OPERATION (itemid, operatorid)
values (21, 157);
insert into OPERATION (itemid, operatorid)
values (21, 183);
insert into OPERATION (itemid, operatorid)
values (21, 258);
insert into OPERATION (itemid, operatorid)
values (22, 115);
insert into OPERATION (itemid, operatorid)
values (22, 386);
insert into OPERATION (itemid, operatorid)
values (22, 394);
insert into OPERATION (itemid, operatorid)
values (22, 439);
insert into OPERATION (itemid, operatorid)
values (22, 457);
insert into OPERATION (itemid, operatorid)
values (24, 144);
insert into OPERATION (itemid, operatorid)
values (24, 206);
insert into OPERATION (itemid, operatorid)
values (24, 277);
insert into OPERATION (itemid, operatorid)
values (24, 284);
insert into OPERATION (itemid, operatorid)
values (24, 396);
insert into OPERATION (itemid, operatorid)
values (24, 465);
insert into OPERATION (itemid, operatorid)
values (24, 476);
insert into OPERATION (itemid, operatorid)
values (28, 197);
insert into OPERATION (itemid, operatorid)
values (28, 220);
insert into OPERATION (itemid, operatorid)
values (28, 228);
insert into OPERATION (itemid, operatorid)
values (28, 315);
insert into OPERATION (itemid, operatorid)
values (28, 328);
insert into OPERATION (itemid, operatorid)
values (28, 483);
insert into OPERATION (itemid, operatorid)
values (29, 181);
insert into OPERATION (itemid, operatorid)
values (29, 217);
insert into OPERATION (itemid, operatorid)
values (29, 317);
insert into OPERATION (itemid, operatorid)
values (29, 337);
insert into OPERATION (itemid, operatorid)
values (30, 304);
insert into OPERATION (itemid, operatorid)
values (30, 375);
insert into OPERATION (itemid, operatorid)
values (30, 411);
insert into OPERATION (itemid, operatorid)
values (30, 472);
insert into OPERATION (itemid, operatorid)
values (31, 165);
insert into OPERATION (itemid, operatorid)
values (31, 274);
insert into OPERATION (itemid, operatorid)
values (31, 322);
insert into OPERATION (itemid, operatorid)
values (31, 394);
insert into OPERATION (itemid, operatorid)
values (31, 421);
insert into OPERATION (itemid, operatorid)
values (31, 446);
insert into OPERATION (itemid, operatorid)
values (31, 495);
insert into OPERATION (itemid, operatorid)
values (32, 104);
insert into OPERATION (itemid, operatorid)
values (32, 202);
insert into OPERATION (itemid, operatorid)
values (32, 356);
insert into OPERATION (itemid, operatorid)
values (32, 449);
insert into OPERATION (itemid, operatorid)
values (33, 185);
insert into OPERATION (itemid, operatorid)
values (33, 187);
insert into OPERATION (itemid, operatorid)
values (33, 325);
insert into OPERATION (itemid, operatorid)
values (33, 361);
insert into OPERATION (itemid, operatorid)
values (33, 424);
insert into OPERATION (itemid, operatorid)
values (34, 169);
insert into OPERATION (itemid, operatorid)
values (35, 102);
insert into OPERATION (itemid, operatorid)
values (35, 369);
commit;
prompt 100 records committed...
insert into OPERATION (itemid, operatorid)
values (36, 103);
insert into OPERATION (itemid, operatorid)
values (36, 197);
insert into OPERATION (itemid, operatorid)
values (36, 350);
insert into OPERATION (itemid, operatorid)
values (36, 369);
insert into OPERATION (itemid, operatorid)
values (36, 459);
insert into OPERATION (itemid, operatorid)
values (37, 127);
insert into OPERATION (itemid, operatorid)
values (37, 211);
insert into OPERATION (itemid, operatorid)
values (37, 240);
insert into OPERATION (itemid, operatorid)
values (38, 263);
insert into OPERATION (itemid, operatorid)
values (38, 358);
insert into OPERATION (itemid, operatorid)
values (38, 386);
insert into OPERATION (itemid, operatorid)
values (38, 456);
insert into OPERATION (itemid, operatorid)
values (39, 256);
insert into OPERATION (itemid, operatorid)
values (39, 353);
insert into OPERATION (itemid, operatorid)
values (40, 128);
insert into OPERATION (itemid, operatorid)
values (40, 154);
insert into OPERATION (itemid, operatorid)
values (40, 257);
insert into OPERATION (itemid, operatorid)
values (40, 261);
insert into OPERATION (itemid, operatorid)
values (40, 328);
insert into OPERATION (itemid, operatorid)
values (41, 171);
insert into OPERATION (itemid, operatorid)
values (41, 178);
insert into OPERATION (itemid, operatorid)
values (41, 218);
insert into OPERATION (itemid, operatorid)
values (41, 327);
insert into OPERATION (itemid, operatorid)
values (41, 423);
insert into OPERATION (itemid, operatorid)
values (42, 175);
insert into OPERATION (itemid, operatorid)
values (42, 318);
insert into OPERATION (itemid, operatorid)
values (42, 329);
insert into OPERATION (itemid, operatorid)
values (42, 499);
insert into OPERATION (itemid, operatorid)
values (43, 309);
insert into OPERATION (itemid, operatorid)
values (43, 312);
insert into OPERATION (itemid, operatorid)
values (43, 364);
insert into OPERATION (itemid, operatorid)
values (43, 417);
insert into OPERATION (itemid, operatorid)
values (44, 173);
insert into OPERATION (itemid, operatorid)
values (44, 297);
insert into OPERATION (itemid, operatorid)
values (45, 155);
insert into OPERATION (itemid, operatorid)
values (45, 260);
insert into OPERATION (itemid, operatorid)
values (45, 284);
insert into OPERATION (itemid, operatorid)
values (45, 450);
insert into OPERATION (itemid, operatorid)
values (46, 147);
insert into OPERATION (itemid, operatorid)
values (46, 187);
insert into OPERATION (itemid, operatorid)
values (46, 201);
insert into OPERATION (itemid, operatorid)
values (46, 202);
insert into OPERATION (itemid, operatorid)
values (46, 289);
insert into OPERATION (itemid, operatorid)
values (46, 307);
insert into OPERATION (itemid, operatorid)
values (46, 370);
insert into OPERATION (itemid, operatorid)
values (46, 447);
insert into OPERATION (itemid, operatorid)
values (47, 141);
insert into OPERATION (itemid, operatorid)
values (47, 321);
insert into OPERATION (itemid, operatorid)
values (47, 365);
insert into OPERATION (itemid, operatorid)
values (47, 443);
insert into OPERATION (itemid, operatorid)
values (47, 476);
insert into OPERATION (itemid, operatorid)
values (48, 159);
insert into OPERATION (itemid, operatorid)
values (48, 213);
insert into OPERATION (itemid, operatorid)
values (48, 392);
insert into OPERATION (itemid, operatorid)
values (48, 454);
insert into OPERATION (itemid, operatorid)
values (52, 113);
insert into OPERATION (itemid, operatorid)
values (52, 466);
insert into OPERATION (itemid, operatorid)
values (53, 117);
insert into OPERATION (itemid, operatorid)
values (53, 167);
insert into OPERATION (itemid, operatorid)
values (53, 279);
insert into OPERATION (itemid, operatorid)
values (54, 112);
insert into OPERATION (itemid, operatorid)
values (54, 197);
insert into OPERATION (itemid, operatorid)
values (55, 155);
insert into OPERATION (itemid, operatorid)
values (55, 178);
insert into OPERATION (itemid, operatorid)
values (55, 291);
insert into OPERATION (itemid, operatorid)
values (55, 295);
insert into OPERATION (itemid, operatorid)
values (55, 345);
insert into OPERATION (itemid, operatorid)
values (55, 390);
insert into OPERATION (itemid, operatorid)
values (56, 113);
insert into OPERATION (itemid, operatorid)
values (56, 164);
insert into OPERATION (itemid, operatorid)
values (56, 211);
insert into OPERATION (itemid, operatorid)
values (57, 107);
insert into OPERATION (itemid, operatorid)
values (57, 133);
insert into OPERATION (itemid, operatorid)
values (57, 210);
insert into OPERATION (itemid, operatorid)
values (57, 442);
insert into OPERATION (itemid, operatorid)
values (58, 195);
insert into OPERATION (itemid, operatorid)
values (58, 240);
insert into OPERATION (itemid, operatorid)
values (58, 305);
insert into OPERATION (itemid, operatorid)
values (58, 353);
insert into OPERATION (itemid, operatorid)
values (58, 419);
insert into OPERATION (itemid, operatorid)
values (59, 147);
insert into OPERATION (itemid, operatorid)
values (60, 121);
insert into OPERATION (itemid, operatorid)
values (60, 203);
insert into OPERATION (itemid, operatorid)
values (60, 207);
insert into OPERATION (itemid, operatorid)
values (60, 259);
insert into OPERATION (itemid, operatorid)
values (60, 332);
insert into OPERATION (itemid, operatorid)
values (60, 353);
insert into OPERATION (itemid, operatorid)
values (60, 381);
insert into OPERATION (itemid, operatorid)
values (60, 485);
insert into OPERATION (itemid, operatorid)
values (61, 126);
insert into OPERATION (itemid, operatorid)
values (62, 244);
insert into OPERATION (itemid, operatorid)
values (62, 280);
insert into OPERATION (itemid, operatorid)
values (62, 285);
insert into OPERATION (itemid, operatorid)
values (62, 396);
insert into OPERATION (itemid, operatorid)
values (62, 445);
insert into OPERATION (itemid, operatorid)
values (63, 154);
insert into OPERATION (itemid, operatorid)
values (63, 275);
insert into OPERATION (itemid, operatorid)
values (63, 319);
insert into OPERATION (itemid, operatorid)
values (63, 389);
insert into OPERATION (itemid, operatorid)
values (63, 457);
commit;
prompt 200 records committed...
insert into OPERATION (itemid, operatorid)
values (64, 124);
insert into OPERATION (itemid, operatorid)
values (64, 178);
insert into OPERATION (itemid, operatorid)
values (64, 223);
insert into OPERATION (itemid, operatorid)
values (64, 370);
insert into OPERATION (itemid, operatorid)
values (64, 384);
insert into OPERATION (itemid, operatorid)
values (64, 444);
insert into OPERATION (itemid, operatorid)
values (65, 229);
insert into OPERATION (itemid, operatorid)
values (65, 456);
insert into OPERATION (itemid, operatorid)
values (66, 143);
insert into OPERATION (itemid, operatorid)
values (66, 167);
insert into OPERATION (itemid, operatorid)
values (66, 184);
insert into OPERATION (itemid, operatorid)
values (66, 249);
insert into OPERATION (itemid, operatorid)
values (66, 319);
insert into OPERATION (itemid, operatorid)
values (66, 400);
insert into OPERATION (itemid, operatorid)
values (67, 118);
insert into OPERATION (itemid, operatorid)
values (67, 217);
insert into OPERATION (itemid, operatorid)
values (67, 335);
insert into OPERATION (itemid, operatorid)
values (67, 433);
insert into OPERATION (itemid, operatorid)
values (68, 164);
insert into OPERATION (itemid, operatorid)
values (68, 227);
insert into OPERATION (itemid, operatorid)
values (68, 245);
insert into OPERATION (itemid, operatorid)
values (68, 391);
insert into OPERATION (itemid, operatorid)
values (69, 184);
insert into OPERATION (itemid, operatorid)
values (69, 279);
insert into OPERATION (itemid, operatorid)
values (69, 305);
insert into OPERATION (itemid, operatorid)
values (69, 325);
insert into OPERATION (itemid, operatorid)
values (70, 261);
insert into OPERATION (itemid, operatorid)
values (70, 262);
insert into OPERATION (itemid, operatorid)
values (70, 302);
insert into OPERATION (itemid, operatorid)
values (70, 421);
insert into OPERATION (itemid, operatorid)
values (70, 485);
insert into OPERATION (itemid, operatorid)
values (71, 249);
insert into OPERATION (itemid, operatorid)
values (71, 311);
insert into OPERATION (itemid, operatorid)
values (71, 371);
insert into OPERATION (itemid, operatorid)
values (71, 403);
insert into OPERATION (itemid, operatorid)
values (71, 451);
insert into OPERATION (itemid, operatorid)
values (72, 167);
insert into OPERATION (itemid, operatorid)
values (72, 391);
insert into OPERATION (itemid, operatorid)
values (72, 467);
insert into OPERATION (itemid, operatorid)
values (72, 480);
insert into OPERATION (itemid, operatorid)
values (72, 483);
insert into OPERATION (itemid, operatorid)
values (72, 487);
insert into OPERATION (itemid, operatorid)
values (76, 333);
insert into OPERATION (itemid, operatorid)
values (76, 484);
insert into OPERATION (itemid, operatorid)
values (78, 132);
insert into OPERATION (itemid, operatorid)
values (78, 171);
insert into OPERATION (itemid, operatorid)
values (78, 186);
insert into OPERATION (itemid, operatorid)
values (78, 288);
insert into OPERATION (itemid, operatorid)
values (78, 321);
insert into OPERATION (itemid, operatorid)
values (78, 361);
insert into OPERATION (itemid, operatorid)
values (78, 438);
insert into OPERATION (itemid, operatorid)
values (78, 453);
insert into OPERATION (itemid, operatorid)
values (78, 456);
insert into OPERATION (itemid, operatorid)
values (78, 462);
insert into OPERATION (itemid, operatorid)
values (79, 214);
insert into OPERATION (itemid, operatorid)
values (79, 298);
insert into OPERATION (itemid, operatorid)
values (79, 311);
insert into OPERATION (itemid, operatorid)
values (79, 323);
insert into OPERATION (itemid, operatorid)
values (79, 358);
insert into OPERATION (itemid, operatorid)
values (80, 303);
insert into OPERATION (itemid, operatorid)
values (80, 306);
insert into OPERATION (itemid, operatorid)
values (80, 359);
insert into OPERATION (itemid, operatorid)
values (80, 370);
insert into OPERATION (itemid, operatorid)
values (81, 153);
insert into OPERATION (itemid, operatorid)
values (81, 312);
insert into OPERATION (itemid, operatorid)
values (81, 333);
insert into OPERATION (itemid, operatorid)
values (82, 130);
insert into OPERATION (itemid, operatorid)
values (82, 313);
insert into OPERATION (itemid, operatorid)
values (83, 206);
insert into OPERATION (itemid, operatorid)
values (83, 288);
insert into OPERATION (itemid, operatorid)
values (84, 135);
insert into OPERATION (itemid, operatorid)
values (84, 269);
insert into OPERATION (itemid, operatorid)
values (84, 281);
insert into OPERATION (itemid, operatorid)
values (84, 348);
insert into OPERATION (itemid, operatorid)
values (84, 351);
insert into OPERATION (itemid, operatorid)
values (84, 438);
insert into OPERATION (itemid, operatorid)
values (84, 472);
insert into OPERATION (itemid, operatorid)
values (84, 475);
insert into OPERATION (itemid, operatorid)
values (84, 497);
insert into OPERATION (itemid, operatorid)
values (85, 273);
insert into OPERATION (itemid, operatorid)
values (85, 324);
insert into OPERATION (itemid, operatorid)
values (85, 423);
insert into OPERATION (itemid, operatorid)
values (87, 116);
insert into OPERATION (itemid, operatorid)
values (87, 163);
insert into OPERATION (itemid, operatorid)
values (88, 269);
insert into OPERATION (itemid, operatorid)
values (89, 102);
insert into OPERATION (itemid, operatorid)
values (89, 123);
insert into OPERATION (itemid, operatorid)
values (89, 271);
insert into OPERATION (itemid, operatorid)
values (89, 385);
insert into OPERATION (itemid, operatorid)
values (89, 398);
insert into OPERATION (itemid, operatorid)
values (90, 126);
insert into OPERATION (itemid, operatorid)
values (90, 133);
insert into OPERATION (itemid, operatorid)
values (90, 262);
insert into OPERATION (itemid, operatorid)
values (90, 305);
insert into OPERATION (itemid, operatorid)
values (90, 381);
insert into OPERATION (itemid, operatorid)
values (91, 254);
insert into OPERATION (itemid, operatorid)
values (91, 325);
insert into OPERATION (itemid, operatorid)
values (91, 463);
insert into OPERATION (itemid, operatorid)
values (92, 230);
insert into OPERATION (itemid, operatorid)
values (92, 277);
commit;
prompt 300 records committed...
insert into OPERATION (itemid, operatorid)
values (92, 480);
insert into OPERATION (itemid, operatorid)
values (93, 115);
insert into OPERATION (itemid, operatorid)
values (93, 306);
insert into OPERATION (itemid, operatorid)
values (93, 313);
insert into OPERATION (itemid, operatorid)
values (94, 147);
insert into OPERATION (itemid, operatorid)
values (94, 358);
insert into OPERATION (itemid, operatorid)
values (94, 368);
insert into OPERATION (itemid, operatorid)
values (94, 372);
insert into OPERATION (itemid, operatorid)
values (94, 400);
insert into OPERATION (itemid, operatorid)
values (94, 442);
insert into OPERATION (itemid, operatorid)
values (95, 375);
insert into OPERATION (itemid, operatorid)
values (95, 405);
insert into OPERATION (itemid, operatorid)
values (96, 201);
insert into OPERATION (itemid, operatorid)
values (96, 222);
insert into OPERATION (itemid, operatorid)
values (96, 300);
insert into OPERATION (itemid, operatorid)
values (96, 429);
insert into OPERATION (itemid, operatorid)
values (101, 190);
insert into OPERATION (itemid, operatorid)
values (101, 312);
insert into OPERATION (itemid, operatorid)
values (101, 320);
insert into OPERATION (itemid, operatorid)
values (101, 322);
insert into OPERATION (itemid, operatorid)
values (101, 468);
insert into OPERATION (itemid, operatorid)
values (102, 327);
insert into OPERATION (itemid, operatorid)
values (102, 328);
insert into OPERATION (itemid, operatorid)
values (102, 329);
insert into OPERATION (itemid, operatorid)
values (102, 447);
insert into OPERATION (itemid, operatorid)
values (103, 191);
insert into OPERATION (itemid, operatorid)
values (103, 479);
insert into OPERATION (itemid, operatorid)
values (105, 161);
insert into OPERATION (itemid, operatorid)
values (105, 198);
insert into OPERATION (itemid, operatorid)
values (105, 296);
insert into OPERATION (itemid, operatorid)
values (105, 387);
insert into OPERATION (itemid, operatorid)
values (106, 189);
insert into OPERATION (itemid, operatorid)
values (106, 224);
insert into OPERATION (itemid, operatorid)
values (106, 239);
insert into OPERATION (itemid, operatorid)
values (106, 293);
insert into OPERATION (itemid, operatorid)
values (106, 394);
insert into OPERATION (itemid, operatorid)
values (107, 161);
insert into OPERATION (itemid, operatorid)
values (107, 272);
insert into OPERATION (itemid, operatorid)
values (107, 279);
insert into OPERATION (itemid, operatorid)
values (107, 406);
insert into OPERATION (itemid, operatorid)
values (107, 482);
insert into OPERATION (itemid, operatorid)
values (107, 491);
insert into OPERATION (itemid, operatorid)
values (108, 137);
insert into OPERATION (itemid, operatorid)
values (108, 312);
insert into OPERATION (itemid, operatorid)
values (110, 128);
insert into OPERATION (itemid, operatorid)
values (110, 140);
insert into OPERATION (itemid, operatorid)
values (110, 152);
insert into OPERATION (itemid, operatorid)
values (110, 239);
insert into OPERATION (itemid, operatorid)
values (110, 275);
insert into OPERATION (itemid, operatorid)
values (110, 316);
insert into OPERATION (itemid, operatorid)
values (110, 337);
insert into OPERATION (itemid, operatorid)
values (110, 356);
insert into OPERATION (itemid, operatorid)
values (111, 234);
insert into OPERATION (itemid, operatorid)
values (111, 321);
insert into OPERATION (itemid, operatorid)
values (111, 327);
insert into OPERATION (itemid, operatorid)
values (112, 162);
insert into OPERATION (itemid, operatorid)
values (112, 352);
insert into OPERATION (itemid, operatorid)
values (112, 367);
insert into OPERATION (itemid, operatorid)
values (113, 290);
insert into OPERATION (itemid, operatorid)
values (113, 296);
insert into OPERATION (itemid, operatorid)
values (113, 379);
insert into OPERATION (itemid, operatorid)
values (113, 400);
insert into OPERATION (itemid, operatorid)
values (114, 123);
insert into OPERATION (itemid, operatorid)
values (114, 127);
insert into OPERATION (itemid, operatorid)
values (114, 146);
insert into OPERATION (itemid, operatorid)
values (114, 438);
insert into OPERATION (itemid, operatorid)
values (115, 176);
insert into OPERATION (itemid, operatorid)
values (115, 186);
insert into OPERATION (itemid, operatorid)
values (115, 270);
insert into OPERATION (itemid, operatorid)
values (115, 276);
insert into OPERATION (itemid, operatorid)
values (115, 309);
insert into OPERATION (itemid, operatorid)
values (116, 196);
insert into OPERATION (itemid, operatorid)
values (116, 262);
insert into OPERATION (itemid, operatorid)
values (116, 273);
insert into OPERATION (itemid, operatorid)
values (116, 298);
insert into OPERATION (itemid, operatorid)
values (117, 171);
insert into OPERATION (itemid, operatorid)
values (117, 194);
insert into OPERATION (itemid, operatorid)
values (117, 215);
insert into OPERATION (itemid, operatorid)
values (117, 314);
insert into OPERATION (itemid, operatorid)
values (117, 315);
insert into OPERATION (itemid, operatorid)
values (117, 473);
insert into OPERATION (itemid, operatorid)
values (118, 147);
insert into OPERATION (itemid, operatorid)
values (118, 174);
insert into OPERATION (itemid, operatorid)
values (118, 178);
insert into OPERATION (itemid, operatorid)
values (118, 202);
insert into OPERATION (itemid, operatorid)
values (118, 255);
insert into OPERATION (itemid, operatorid)
values (118, 279);
insert into OPERATION (itemid, operatorid)
values (118, 356);
insert into OPERATION (itemid, operatorid)
values (118, 384);
insert into OPERATION (itemid, operatorid)
values (124, 387);
insert into OPERATION (itemid, operatorid)
values (124, 399);
insert into OPERATION (itemid, operatorid)
values (124, 419);
insert into OPERATION (itemid, operatorid)
values (124, 430);
insert into OPERATION (itemid, operatorid)
values (125, 245);
insert into OPERATION (itemid, operatorid)
values (125, 276);
insert into OPERATION (itemid, operatorid)
values (125, 299);
insert into OPERATION (itemid, operatorid)
values (125, 429);
insert into OPERATION (itemid, operatorid)
values (127, 117);
insert into OPERATION (itemid, operatorid)
values (128, 100);
insert into OPERATION (itemid, operatorid)
values (128, 221);
commit;
prompt 400 records committed...
insert into OPERATION (itemid, operatorid)
values (128, 224);
insert into OPERATION (itemid, operatorid)
values (218, 401);
commit;
prompt 402 records loaded
prompt Loading OPERATORCOURSE...
insert into OPERATORCOURSE (operatorid, g_id)
values (100, 195);
insert into OPERATORCOURSE (operatorid, g_id)
values (101, 158);
insert into OPERATORCOURSE (operatorid, g_id)
values (104, 206);
insert into OPERATORCOURSE (operatorid, g_id)
values (105, 199);
insert into OPERATORCOURSE (operatorid, g_id)
values (106, 258);
insert into OPERATORCOURSE (operatorid, g_id)
values (107, 384);
insert into OPERATORCOURSE (operatorid, g_id)
values (109, 113);
insert into OPERATORCOURSE (operatorid, g_id)
values (110, 142);
insert into OPERATORCOURSE (operatorid, g_id)
values (111, 355);
insert into OPERATORCOURSE (operatorid, g_id)
values (112, 83);
insert into OPERATORCOURSE (operatorid, g_id)
values (115, 94);
insert into OPERATORCOURSE (operatorid, g_id)
values (115, 106);
insert into OPERATORCOURSE (operatorid, g_id)
values (115, 130);
insert into OPERATORCOURSE (operatorid, g_id)
values (115, 274);
insert into OPERATORCOURSE (operatorid, g_id)
values (117, 269);
insert into OPERATORCOURSE (operatorid, g_id)
values (119, 114);
insert into OPERATORCOURSE (operatorid, g_id)
values (123, 152);
insert into OPERATORCOURSE (operatorid, g_id)
values (125, 129);
insert into OPERATORCOURSE (operatorid, g_id)
values (126, 60);
insert into OPERATORCOURSE (operatorid, g_id)
values (127, 56);
insert into OPERATORCOURSE (operatorid, g_id)
values (130, 172);
insert into OPERATORCOURSE (operatorid, g_id)
values (131, 158);
insert into OPERATORCOURSE (operatorid, g_id)
values (131, 314);
insert into OPERATORCOURSE (operatorid, g_id)
values (135, 207);
insert into OPERATORCOURSE (operatorid, g_id)
values (136, 231);
insert into OPERATORCOURSE (operatorid, g_id)
values (139, 266);
insert into OPERATORCOURSE (operatorid, g_id)
values (140, 39);
insert into OPERATORCOURSE (operatorid, g_id)
values (141, 9);
insert into OPERATORCOURSE (operatorid, g_id)
values (144, 138);
insert into OPERATORCOURSE (operatorid, g_id)
values (144, 345);
insert into OPERATORCOURSE (operatorid, g_id)
values (146, 240);
insert into OPERATORCOURSE (operatorid, g_id)
values (152, 38);
insert into OPERATORCOURSE (operatorid, g_id)
values (152, 370);
insert into OPERATORCOURSE (operatorid, g_id)
values (153, 86);
insert into OPERATORCOURSE (operatorid, g_id)
values (154, 113);
insert into OPERATORCOURSE (operatorid, g_id)
values (154, 114);
insert into OPERATORCOURSE (operatorid, g_id)
values (155, 51);
insert into OPERATORCOURSE (operatorid, g_id)
values (156, 146);
insert into OPERATORCOURSE (operatorid, g_id)
values (157, 298);
insert into OPERATORCOURSE (operatorid, g_id)
values (159, 124);
insert into OPERATORCOURSE (operatorid, g_id)
values (160, 327);
insert into OPERATORCOURSE (operatorid, g_id)
values (161, 257);
insert into OPERATORCOURSE (operatorid, g_id)
values (163, 162);
insert into OPERATORCOURSE (operatorid, g_id)
values (165, 176);
insert into OPERATORCOURSE (operatorid, g_id)
values (169, 288);
insert into OPERATORCOURSE (operatorid, g_id)
values (171, 346);
insert into OPERATORCOURSE (operatorid, g_id)
values (173, 21);
insert into OPERATORCOURSE (operatorid, g_id)
values (173, 268);
insert into OPERATORCOURSE (operatorid, g_id)
values (174, 168);
insert into OPERATORCOURSE (operatorid, g_id)
values (176, 52);
insert into OPERATORCOURSE (operatorid, g_id)
values (177, 134);
insert into OPERATORCOURSE (operatorid, g_id)
values (177, 320);
insert into OPERATORCOURSE (operatorid, g_id)
values (177, 361);
insert into OPERATORCOURSE (operatorid, g_id)
values (178, 305);
insert into OPERATORCOURSE (operatorid, g_id)
values (178, 383);
insert into OPERATORCOURSE (operatorid, g_id)
values (179, 271);
insert into OPERATORCOURSE (operatorid, g_id)
values (180, 133);
insert into OPERATORCOURSE (operatorid, g_id)
values (180, 380);
insert into OPERATORCOURSE (operatorid, g_id)
values (183, 175);
insert into OPERATORCOURSE (operatorid, g_id)
values (185, 300);
insert into OPERATORCOURSE (operatorid, g_id)
values (188, 255);
insert into OPERATORCOURSE (operatorid, g_id)
values (190, 259);
insert into OPERATORCOURSE (operatorid, g_id)
values (190, 317);
insert into OPERATORCOURSE (operatorid, g_id)
values (191, 244);
insert into OPERATORCOURSE (operatorid, g_id)
values (192, 376);
insert into OPERATORCOURSE (operatorid, g_id)
values (193, 347);
insert into OPERATORCOURSE (operatorid, g_id)
values (195, 121);
insert into OPERATORCOURSE (operatorid, g_id)
values (195, 378);
insert into OPERATORCOURSE (operatorid, g_id)
values (196, 123);
insert into OPERATORCOURSE (operatorid, g_id)
values (196, 264);
insert into OPERATORCOURSE (operatorid, g_id)
values (197, 312);
insert into OPERATORCOURSE (operatorid, g_id)
values (198, 92);
insert into OPERATORCOURSE (operatorid, g_id)
values (198, 152);
insert into OPERATORCOURSE (operatorid, g_id)
values (199, 26);
insert into OPERATORCOURSE (operatorid, g_id)
values (200, 396);
insert into OPERATORCOURSE (operatorid, g_id)
values (200, 400);
insert into OPERATORCOURSE (operatorid, g_id)
values (201, 31);
insert into OPERATORCOURSE (operatorid, g_id)
values (201, 294);
insert into OPERATORCOURSE (operatorid, g_id)
values (202, 252);
insert into OPERATORCOURSE (operatorid, g_id)
values (203, 369);
insert into OPERATORCOURSE (operatorid, g_id)
values (204, 308);
insert into OPERATORCOURSE (operatorid, g_id)
values (205, 350);
insert into OPERATORCOURSE (operatorid, g_id)
values (208, 239);
insert into OPERATORCOURSE (operatorid, g_id)
values (212, 26);
insert into OPERATORCOURSE (operatorid, g_id)
values (213, 224);
insert into OPERATORCOURSE (operatorid, g_id)
values (215, 399);
insert into OPERATORCOURSE (operatorid, g_id)
values (216, 127);
insert into OPERATORCOURSE (operatorid, g_id)
values (216, 136);
insert into OPERATORCOURSE (operatorid, g_id)
values (216, 194);
insert into OPERATORCOURSE (operatorid, g_id)
values (217, 178);
insert into OPERATORCOURSE (operatorid, g_id)
values (218, 212);
insert into OPERATORCOURSE (operatorid, g_id)
values (218, 276);
insert into OPERATORCOURSE (operatorid, g_id)
values (222, 63);
insert into OPERATORCOURSE (operatorid, g_id)
values (222, 267);
insert into OPERATORCOURSE (operatorid, g_id)
values (224, 342);
insert into OPERATORCOURSE (operatorid, g_id)
values (233, 16);
insert into OPERATORCOURSE (operatorid, g_id)
values (234, 279);
insert into OPERATORCOURSE (operatorid, g_id)
values (235, 339);
insert into OPERATORCOURSE (operatorid, g_id)
values (237, 312);
insert into OPERATORCOURSE (operatorid, g_id)
values (238, 382);
commit;
prompt 100 records committed...
insert into OPERATORCOURSE (operatorid, g_id)
values (240, 237);
insert into OPERATORCOURSE (operatorid, g_id)
values (241, 259);
insert into OPERATORCOURSE (operatorid, g_id)
values (241, 310);
insert into OPERATORCOURSE (operatorid, g_id)
values (244, 271);
insert into OPERATORCOURSE (operatorid, g_id)
values (247, 78);
insert into OPERATORCOURSE (operatorid, g_id)
values (252, 66);
insert into OPERATORCOURSE (operatorid, g_id)
values (252, 130);
insert into OPERATORCOURSE (operatorid, g_id)
values (254, 263);
insert into OPERATORCOURSE (operatorid, g_id)
values (255, 58);
insert into OPERATORCOURSE (operatorid, g_id)
values (256, 24);
insert into OPERATORCOURSE (operatorid, g_id)
values (257, 175);
insert into OPERATORCOURSE (operatorid, g_id)
values (258, 81);
insert into OPERATORCOURSE (operatorid, g_id)
values (259, 393);
insert into OPERATORCOURSE (operatorid, g_id)
values (260, 118);
insert into OPERATORCOURSE (operatorid, g_id)
values (262, 161);
insert into OPERATORCOURSE (operatorid, g_id)
values (263, 201);
insert into OPERATORCOURSE (operatorid, g_id)
values (263, 307);
insert into OPERATORCOURSE (operatorid, g_id)
values (266, 337);
insert into OPERATORCOURSE (operatorid, g_id)
values (267, 114);
insert into OPERATORCOURSE (operatorid, g_id)
values (267, 290);
insert into OPERATORCOURSE (operatorid, g_id)
values (267, 388);
insert into OPERATORCOURSE (operatorid, g_id)
values (270, 363);
insert into OPERATORCOURSE (operatorid, g_id)
values (273, 91);
insert into OPERATORCOURSE (operatorid, g_id)
values (273, 366);
insert into OPERATORCOURSE (operatorid, g_id)
values (274, 137);
insert into OPERATORCOURSE (operatorid, g_id)
values (275, 31);
insert into OPERATORCOURSE (operatorid, g_id)
values (275, 216);
insert into OPERATORCOURSE (operatorid, g_id)
values (276, 142);
insert into OPERATORCOURSE (operatorid, g_id)
values (277, 336);
insert into OPERATORCOURSE (operatorid, g_id)
values (280, 234);
insert into OPERATORCOURSE (operatorid, g_id)
values (284, 101);
insert into OPERATORCOURSE (operatorid, g_id)
values (284, 346);
insert into OPERATORCOURSE (operatorid, g_id)
values (285, 296);
insert into OPERATORCOURSE (operatorid, g_id)
values (285, 358);
insert into OPERATORCOURSE (operatorid, g_id)
values (286, 199);
insert into OPERATORCOURSE (operatorid, g_id)
values (287, 71);
insert into OPERATORCOURSE (operatorid, g_id)
values (288, 168);
insert into OPERATORCOURSE (operatorid, g_id)
values (290, 255);
insert into OPERATORCOURSE (operatorid, g_id)
values (291, 184);
insert into OPERATORCOURSE (operatorid, g_id)
values (291, 192);
insert into OPERATORCOURSE (operatorid, g_id)
values (292, 50);
insert into OPERATORCOURSE (operatorid, g_id)
values (295, 143);
insert into OPERATORCOURSE (operatorid, g_id)
values (296, 289);
insert into OPERATORCOURSE (operatorid, g_id)
values (299, 3);
insert into OPERATORCOURSE (operatorid, g_id)
values (303, 252);
insert into OPERATORCOURSE (operatorid, g_id)
values (304, 188);
insert into OPERATORCOURSE (operatorid, g_id)
values (308, 19);
insert into OPERATORCOURSE (operatorid, g_id)
values (308, 159);
insert into OPERATORCOURSE (operatorid, g_id)
values (309, 245);
insert into OPERATORCOURSE (operatorid, g_id)
values (310, 320);
insert into OPERATORCOURSE (operatorid, g_id)
values (311, 17);
insert into OPERATORCOURSE (operatorid, g_id)
values (311, 57);
insert into OPERATORCOURSE (operatorid, g_id)
values (311, 169);
insert into OPERATORCOURSE (operatorid, g_id)
values (311, 251);
insert into OPERATORCOURSE (operatorid, g_id)
values (312, 45);
insert into OPERATORCOURSE (operatorid, g_id)
values (313, 53);
insert into OPERATORCOURSE (operatorid, g_id)
values (313, 346);
insert into OPERATORCOURSE (operatorid, g_id)
values (314, 4);
insert into OPERATORCOURSE (operatorid, g_id)
values (315, 171);
insert into OPERATORCOURSE (operatorid, g_id)
values (316, 338);
insert into OPERATORCOURSE (operatorid, g_id)
values (318, 83);
insert into OPERATORCOURSE (operatorid, g_id)
values (318, 286);
insert into OPERATORCOURSE (operatorid, g_id)
values (319, 83);
insert into OPERATORCOURSE (operatorid, g_id)
values (323, 34);
insert into OPERATORCOURSE (operatorid, g_id)
values (325, 290);
insert into OPERATORCOURSE (operatorid, g_id)
values (326, 10);
insert into OPERATORCOURSE (operatorid, g_id)
values (326, 295);
insert into OPERATORCOURSE (operatorid, g_id)
values (327, 88);
insert into OPERATORCOURSE (operatorid, g_id)
values (330, 70);
insert into OPERATORCOURSE (operatorid, g_id)
values (330, 342);
insert into OPERATORCOURSE (operatorid, g_id)
values (332, 215);
insert into OPERATORCOURSE (operatorid, g_id)
values (332, 287);
insert into OPERATORCOURSE (operatorid, g_id)
values (335, 298);
insert into OPERATORCOURSE (operatorid, g_id)
values (336, 290);
insert into OPERATORCOURSE (operatorid, g_id)
values (337, 86);
insert into OPERATORCOURSE (operatorid, g_id)
values (340, 292);
insert into OPERATORCOURSE (operatorid, g_id)
values (341, 86);
insert into OPERATORCOURSE (operatorid, g_id)
values (341, 301);
insert into OPERATORCOURSE (operatorid, g_id)
values (342, 207);
insert into OPERATORCOURSE (operatorid, g_id)
values (346, 20);
insert into OPERATORCOURSE (operatorid, g_id)
values (347, 143);
insert into OPERATORCOURSE (operatorid, g_id)
values (348, 17);
insert into OPERATORCOURSE (operatorid, g_id)
values (348, 111);
insert into OPERATORCOURSE (operatorid, g_id)
values (348, 382);
insert into OPERATORCOURSE (operatorid, g_id)
values (349, 248);
insert into OPERATORCOURSE (operatorid, g_id)
values (351, 132);
insert into OPERATORCOURSE (operatorid, g_id)
values (352, 156);
insert into OPERATORCOURSE (operatorid, g_id)
values (353, 101);
insert into OPERATORCOURSE (operatorid, g_id)
values (353, 200);
insert into OPERATORCOURSE (operatorid, g_id)
values (358, 142);
insert into OPERATORCOURSE (operatorid, g_id)
values (361, 269);
insert into OPERATORCOURSE (operatorid, g_id)
values (361, 287);
insert into OPERATORCOURSE (operatorid, g_id)
values (363, 315);
insert into OPERATORCOURSE (operatorid, g_id)
values (365, 9);
insert into OPERATORCOURSE (operatorid, g_id)
values (366, 295);
insert into OPERATORCOURSE (operatorid, g_id)
values (367, 146);
insert into OPERATORCOURSE (operatorid, g_id)
values (369, 71);
insert into OPERATORCOURSE (operatorid, g_id)
values (370, 65);
insert into OPERATORCOURSE (operatorid, g_id)
values (370, 66);
insert into OPERATORCOURSE (operatorid, g_id)
values (370, 200);
commit;
prompt 200 records committed...
insert into OPERATORCOURSE (operatorid, g_id)
values (370, 353);
insert into OPERATORCOURSE (operatorid, g_id)
values (371, 66);
insert into OPERATORCOURSE (operatorid, g_id)
values (371, 372);
insert into OPERATORCOURSE (operatorid, g_id)
values (372, 173);
insert into OPERATORCOURSE (operatorid, g_id)
values (374, 286);
insert into OPERATORCOURSE (operatorid, g_id)
values (376, 86);
insert into OPERATORCOURSE (operatorid, g_id)
values (379, 220);
insert into OPERATORCOURSE (operatorid, g_id)
values (380, 56);
insert into OPERATORCOURSE (operatorid, g_id)
values (381, 260);
insert into OPERATORCOURSE (operatorid, g_id)
values (383, 113);
insert into OPERATORCOURSE (operatorid, g_id)
values (384, 271);
insert into OPERATORCOURSE (operatorid, g_id)
values (385, 84);
insert into OPERATORCOURSE (operatorid, g_id)
values (386, 277);
insert into OPERATORCOURSE (operatorid, g_id)
values (388, 138);
insert into OPERATORCOURSE (operatorid, g_id)
values (391, 112);
insert into OPERATORCOURSE (operatorid, g_id)
values (393, 94);
insert into OPERATORCOURSE (operatorid, g_id)
values (393, 144);
insert into OPERATORCOURSE (operatorid, g_id)
values (394, 9);
insert into OPERATORCOURSE (operatorid, g_id)
values (394, 195);
insert into OPERATORCOURSE (operatorid, g_id)
values (395, 282);
insert into OPERATORCOURSE (operatorid, g_id)
values (398, 59);
insert into OPERATORCOURSE (operatorid, g_id)
values (401, 94);
insert into OPERATORCOURSE (operatorid, g_id)
values (402, 3);
insert into OPERATORCOURSE (operatorid, g_id)
values (404, 79);
insert into OPERATORCOURSE (operatorid, g_id)
values (404, 322);
insert into OPERATORCOURSE (operatorid, g_id)
values (408, 215);
insert into OPERATORCOURSE (operatorid, g_id)
values (408, 231);
insert into OPERATORCOURSE (operatorid, g_id)
values (408, 398);
insert into OPERATORCOURSE (operatorid, g_id)
values (416, 127);
insert into OPERATORCOURSE (operatorid, g_id)
values (417, 81);
insert into OPERATORCOURSE (operatorid, g_id)
values (417, 204);
insert into OPERATORCOURSE (operatorid, g_id)
values (418, 39);
insert into OPERATORCOURSE (operatorid, g_id)
values (419, 155);
insert into OPERATORCOURSE (operatorid, g_id)
values (421, 74);
insert into OPERATORCOURSE (operatorid, g_id)
values (422, 398);
insert into OPERATORCOURSE (operatorid, g_id)
values (426, 219);
insert into OPERATORCOURSE (operatorid, g_id)
values (427, 41);
insert into OPERATORCOURSE (operatorid, g_id)
values (427, 112);
insert into OPERATORCOURSE (operatorid, g_id)
values (427, 290);
insert into OPERATORCOURSE (operatorid, g_id)
values (429, 163);
insert into OPERATORCOURSE (operatorid, g_id)
values (433, 47);
insert into OPERATORCOURSE (operatorid, g_id)
values (436, 26);
insert into OPERATORCOURSE (operatorid, g_id)
values (439, 198);
insert into OPERATORCOURSE (operatorid, g_id)
values (443, 354);
insert into OPERATORCOURSE (operatorid, g_id)
values (446, 175);
insert into OPERATORCOURSE (operatorid, g_id)
values (446, 236);
insert into OPERATORCOURSE (operatorid, g_id)
values (447, 166);
insert into OPERATORCOURSE (operatorid, g_id)
values (449, 233);
insert into OPERATORCOURSE (operatorid, g_id)
values (451, 129);
insert into OPERATORCOURSE (operatorid, g_id)
values (451, 170);
insert into OPERATORCOURSE (operatorid, g_id)
values (451, 236);
insert into OPERATORCOURSE (operatorid, g_id)
values (452, 317);
insert into OPERATORCOURSE (operatorid, g_id)
values (453, 398);
insert into OPERATORCOURSE (operatorid, g_id)
values (454, 288);
insert into OPERATORCOURSE (operatorid, g_id)
values (455, 26);
insert into OPERATORCOURSE (operatorid, g_id)
values (457, 71);
insert into OPERATORCOURSE (operatorid, g_id)
values (457, 297);
insert into OPERATORCOURSE (operatorid, g_id)
values (458, 173);
insert into OPERATORCOURSE (operatorid, g_id)
values (462, 21);
insert into OPERATORCOURSE (operatorid, g_id)
values (462, 87);
insert into OPERATORCOURSE (operatorid, g_id)
values (462, 153);
insert into OPERATORCOURSE (operatorid, g_id)
values (462, 282);
insert into OPERATORCOURSE (operatorid, g_id)
values (462, 287);
insert into OPERATORCOURSE (operatorid, g_id)
values (462, 316);
insert into OPERATORCOURSE (operatorid, g_id)
values (463, 24);
insert into OPERATORCOURSE (operatorid, g_id)
values (463, 272);
insert into OPERATORCOURSE (operatorid, g_id)
values (465, 334);
insert into OPERATORCOURSE (operatorid, g_id)
values (466, 165);
insert into OPERATORCOURSE (operatorid, g_id)
values (467, 38);
insert into OPERATORCOURSE (operatorid, g_id)
values (467, 143);
insert into OPERATORCOURSE (operatorid, g_id)
values (467, 236);
insert into OPERATORCOURSE (operatorid, g_id)
values (469, 145);
insert into OPERATORCOURSE (operatorid, g_id)
values (469, 297);
insert into OPERATORCOURSE (operatorid, g_id)
values (471, 85);
insert into OPERATORCOURSE (operatorid, g_id)
values (472, 129);
insert into OPERATORCOURSE (operatorid, g_id)
values (474, 323);
insert into OPERATORCOURSE (operatorid, g_id)
values (475, 31);
insert into OPERATORCOURSE (operatorid, g_id)
values (475, 49);
insert into OPERATORCOURSE (operatorid, g_id)
values (476, 186);
insert into OPERATORCOURSE (operatorid, g_id)
values (477, 172);
insert into OPERATORCOURSE (operatorid, g_id)
values (478, 86);
insert into OPERATORCOURSE (operatorid, g_id)
values (478, 234);
insert into OPERATORCOURSE (operatorid, g_id)
values (479, 96);
insert into OPERATORCOURSE (operatorid, g_id)
values (480, 54);
insert into OPERATORCOURSE (operatorid, g_id)
values (480, 324);
insert into OPERATORCOURSE (operatorid, g_id)
values (481, 134);
insert into OPERATORCOURSE (operatorid, g_id)
values (482, 336);
insert into OPERATORCOURSE (operatorid, g_id)
values (483, 39);
insert into OPERATORCOURSE (operatorid, g_id)
values (483, 291);
insert into OPERATORCOURSE (operatorid, g_id)
values (483, 332);
insert into OPERATORCOURSE (operatorid, g_id)
values (485, 239);
insert into OPERATORCOURSE (operatorid, g_id)
values (485, 257);
insert into OPERATORCOURSE (operatorid, g_id)
values (489, 62);
insert into OPERATORCOURSE (operatorid, g_id)
values (490, 140);
insert into OPERATORCOURSE (operatorid, g_id)
values (490, 211);
insert into OPERATORCOURSE (operatorid, g_id)
values (491, 254);
insert into OPERATORCOURSE (operatorid, g_id)
values (492, 84);
insert into OPERATORCOURSE (operatorid, g_id)
values (492, 328);
insert into OPERATORCOURSE (operatorid, g_id)
values (493, 7);
insert into OPERATORCOURSE (operatorid, g_id)
values (498, 264);
commit;
prompt 300 records loaded
prompt Loading TEACHES_THE...
insert into TEACHES_THE (l_id, c_id)
values (100, 23);
insert into TEACHES_THE (l_id, c_id)
values (100, 221);
insert into TEACHES_THE (l_id, c_id)
values (101, 141);
insert into TEACHES_THE (l_id, c_id)
values (102, 91);
insert into TEACHES_THE (l_id, c_id)
values (106, 61);
insert into TEACHES_THE (l_id, c_id)
values (107, 39);
insert into TEACHES_THE (l_id, c_id)
values (107, 245);
insert into TEACHES_THE (l_id, c_id)
values (108, 43);
insert into TEACHES_THE (l_id, c_id)
values (108, 325);
insert into TEACHES_THE (l_id, c_id)
values (109, 290);
insert into TEACHES_THE (l_id, c_id)
values (112, 37);
insert into TEACHES_THE (l_id, c_id)
values (115, 397);
insert into TEACHES_THE (l_id, c_id)
values (116, 62);
insert into TEACHES_THE (l_id, c_id)
values (116, 385);
insert into TEACHES_THE (l_id, c_id)
values (118, 49);
insert into TEACHES_THE (l_id, c_id)
values (118, 298);
insert into TEACHES_THE (l_id, c_id)
values (119, 31);
insert into TEACHES_THE (l_id, c_id)
values (119, 116);
insert into TEACHES_THE (l_id, c_id)
values (120, 150);
insert into TEACHES_THE (l_id, c_id)
values (121, 55);
insert into TEACHES_THE (l_id, c_id)
values (124, 173);
insert into TEACHES_THE (l_id, c_id)
values (125, 196);
insert into TEACHES_THE (l_id, c_id)
values (126, 28);
insert into TEACHES_THE (l_id, c_id)
values (126, 196);
insert into TEACHES_THE (l_id, c_id)
values (128, 340);
insert into TEACHES_THE (l_id, c_id)
values (129, 307);
insert into TEACHES_THE (l_id, c_id)
values (131, 111);
insert into TEACHES_THE (l_id, c_id)
values (132, 365);
insert into TEACHES_THE (l_id, c_id)
values (133, 298);
insert into TEACHES_THE (l_id, c_id)
values (134, 277);
insert into TEACHES_THE (l_id, c_id)
values (135, 172);
insert into TEACHES_THE (l_id, c_id)
values (135, 214);
insert into TEACHES_THE (l_id, c_id)
values (136, 293);
insert into TEACHES_THE (l_id, c_id)
values (137, 118);
insert into TEACHES_THE (l_id, c_id)
values (138, 301);
insert into TEACHES_THE (l_id, c_id)
values (139, 243);
insert into TEACHES_THE (l_id, c_id)
values (139, 357);
insert into TEACHES_THE (l_id, c_id)
values (140, 158);
insert into TEACHES_THE (l_id, c_id)
values (143, 303);
insert into TEACHES_THE (l_id, c_id)
values (145, 21);
insert into TEACHES_THE (l_id, c_id)
values (146, 387);
insert into TEACHES_THE (l_id, c_id)
values (148, 15);
insert into TEACHES_THE (l_id, c_id)
values (148, 156);
insert into TEACHES_THE (l_id, c_id)
values (148, 265);
insert into TEACHES_THE (l_id, c_id)
values (150, 25);
insert into TEACHES_THE (l_id, c_id)
values (150, 73);
insert into TEACHES_THE (l_id, c_id)
values (150, 146);
insert into TEACHES_THE (l_id, c_id)
values (151, 114);
insert into TEACHES_THE (l_id, c_id)
values (154, 255);
insert into TEACHES_THE (l_id, c_id)
values (157, 151);
insert into TEACHES_THE (l_id, c_id)
values (158, 398);
insert into TEACHES_THE (l_id, c_id)
values (159, 329);
insert into TEACHES_THE (l_id, c_id)
values (160, 123);
insert into TEACHES_THE (l_id, c_id)
values (160, 382);
insert into TEACHES_THE (l_id, c_id)
values (161, 131);
insert into TEACHES_THE (l_id, c_id)
values (162, 168);
insert into TEACHES_THE (l_id, c_id)
values (164, 248);
insert into TEACHES_THE (l_id, c_id)
values (165, 168);
insert into TEACHES_THE (l_id, c_id)
values (165, 295);
insert into TEACHES_THE (l_id, c_id)
values (167, 304);
insert into TEACHES_THE (l_id, c_id)
values (168, 187);
insert into TEACHES_THE (l_id, c_id)
values (169, 271);
insert into TEACHES_THE (l_id, c_id)
values (171, 1);
insert into TEACHES_THE (l_id, c_id)
values (171, 266);
insert into TEACHES_THE (l_id, c_id)
values (173, 135);
insert into TEACHES_THE (l_id, c_id)
values (175, 338);
insert into TEACHES_THE (l_id, c_id)
values (177, 37);
insert into TEACHES_THE (l_id, c_id)
values (177, 38);
insert into TEACHES_THE (l_id, c_id)
values (177, 153);
insert into TEACHES_THE (l_id, c_id)
values (178, 161);
insert into TEACHES_THE (l_id, c_id)
values (178, 338);
insert into TEACHES_THE (l_id, c_id)
values (179, 84);
insert into TEACHES_THE (l_id, c_id)
values (184, 52);
insert into TEACHES_THE (l_id, c_id)
values (184, 191);
insert into TEACHES_THE (l_id, c_id)
values (185, 66);
insert into TEACHES_THE (l_id, c_id)
values (185, 192);
insert into TEACHES_THE (l_id, c_id)
values (186, 241);
insert into TEACHES_THE (l_id, c_id)
values (187, 328);
insert into TEACHES_THE (l_id, c_id)
values (189, 267);
insert into TEACHES_THE (l_id, c_id)
values (193, 172);
insert into TEACHES_THE (l_id, c_id)
values (195, 315);
insert into TEACHES_THE (l_id, c_id)
values (196, 100);
insert into TEACHES_THE (l_id, c_id)
values (196, 238);
insert into TEACHES_THE (l_id, c_id)
values (198, 78);
insert into TEACHES_THE (l_id, c_id)
values (198, 239);
insert into TEACHES_THE (l_id, c_id)
values (199, 104);
insert into TEACHES_THE (l_id, c_id)
values (199, 249);
insert into TEACHES_THE (l_id, c_id)
values (202, 279);
insert into TEACHES_THE (l_id, c_id)
values (203, 209);
insert into TEACHES_THE (l_id, c_id)
values (205, 43);
insert into TEACHES_THE (l_id, c_id)
values (206, 374);
insert into TEACHES_THE (l_id, c_id)
values (207, 209);
insert into TEACHES_THE (l_id, c_id)
values (207, 267);
insert into TEACHES_THE (l_id, c_id)
values (209, 283);
insert into TEACHES_THE (l_id, c_id)
values (209, 321);
insert into TEACHES_THE (l_id, c_id)
values (210, 129);
insert into TEACHES_THE (l_id, c_id)
values (210, 284);
insert into TEACHES_THE (l_id, c_id)
values (210, 341);
insert into TEACHES_THE (l_id, c_id)
values (212, 64);
insert into TEACHES_THE (l_id, c_id)
values (212, 85);
commit;
prompt 100 records committed...
insert into TEACHES_THE (l_id, c_id)
values (212, 254);
insert into TEACHES_THE (l_id, c_id)
values (213, 1);
insert into TEACHES_THE (l_id, c_id)
values (213, 286);
insert into TEACHES_THE (l_id, c_id)
values (214, 316);
insert into TEACHES_THE (l_id, c_id)
values (215, 31);
insert into TEACHES_THE (l_id, c_id)
values (215, 135);
insert into TEACHES_THE (l_id, c_id)
values (215, 191);
insert into TEACHES_THE (l_id, c_id)
values (215, 374);
insert into TEACHES_THE (l_id, c_id)
values (216, 218);
insert into TEACHES_THE (l_id, c_id)
values (219, 239);
insert into TEACHES_THE (l_id, c_id)
values (219, 362);
insert into TEACHES_THE (l_id, c_id)
values (220, 356);
insert into TEACHES_THE (l_id, c_id)
values (221, 149);
insert into TEACHES_THE (l_id, c_id)
values (221, 164);
insert into TEACHES_THE (l_id, c_id)
values (222, 352);
insert into TEACHES_THE (l_id, c_id)
values (223, 80);
insert into TEACHES_THE (l_id, c_id)
values (223, 250);
insert into TEACHES_THE (l_id, c_id)
values (224, 146);
insert into TEACHES_THE (l_id, c_id)
values (224, 218);
insert into TEACHES_THE (l_id, c_id)
values (224, 400);
insert into TEACHES_THE (l_id, c_id)
values (225, 311);
insert into TEACHES_THE (l_id, c_id)
values (226, 141);
insert into TEACHES_THE (l_id, c_id)
values (226, 230);
insert into TEACHES_THE (l_id, c_id)
values (226, 340);
insert into TEACHES_THE (l_id, c_id)
values (227, 84);
insert into TEACHES_THE (l_id, c_id)
values (227, 164);
insert into TEACHES_THE (l_id, c_id)
values (227, 392);
insert into TEACHES_THE (l_id, c_id)
values (231, 72);
insert into TEACHES_THE (l_id, c_id)
values (232, 258);
insert into TEACHES_THE (l_id, c_id)
values (236, 73);
insert into TEACHES_THE (l_id, c_id)
values (237, 400);
insert into TEACHES_THE (l_id, c_id)
values (238, 201);
insert into TEACHES_THE (l_id, c_id)
values (239, 65);
insert into TEACHES_THE (l_id, c_id)
values (240, 52);
insert into TEACHES_THE (l_id, c_id)
values (240, 86);
insert into TEACHES_THE (l_id, c_id)
values (240, 236);
insert into TEACHES_THE (l_id, c_id)
values (241, 312);
insert into TEACHES_THE (l_id, c_id)
values (241, 396);
insert into TEACHES_THE (l_id, c_id)
values (245, 48);
insert into TEACHES_THE (l_id, c_id)
values (245, 65);
insert into TEACHES_THE (l_id, c_id)
values (245, 202);
insert into TEACHES_THE (l_id, c_id)
values (245, 248);
insert into TEACHES_THE (l_id, c_id)
values (246, 197);
insert into TEACHES_THE (l_id, c_id)
values (246, 371);
insert into TEACHES_THE (l_id, c_id)
values (247, 112);
insert into TEACHES_THE (l_id, c_id)
values (248, 70);
insert into TEACHES_THE (l_id, c_id)
values (248, 350);
insert into TEACHES_THE (l_id, c_id)
values (249, 371);
insert into TEACHES_THE (l_id, c_id)
values (250, 120);
insert into TEACHES_THE (l_id, c_id)
values (252, 162);
insert into TEACHES_THE (l_id, c_id)
values (252, 173);
insert into TEACHES_THE (l_id, c_id)
values (254, 208);
insert into TEACHES_THE (l_id, c_id)
values (256, 283);
insert into TEACHES_THE (l_id, c_id)
values (257, 230);
insert into TEACHES_THE (l_id, c_id)
values (258, 125);
insert into TEACHES_THE (l_id, c_id)
values (259, 293);
insert into TEACHES_THE (l_id, c_id)
values (259, 374);
insert into TEACHES_THE (l_id, c_id)
values (261, 154);
insert into TEACHES_THE (l_id, c_id)
values (261, 324);
insert into TEACHES_THE (l_id, c_id)
values (262, 168);
insert into TEACHES_THE (l_id, c_id)
values (262, 340);
insert into TEACHES_THE (l_id, c_id)
values (263, 13);
insert into TEACHES_THE (l_id, c_id)
values (263, 314);
insert into TEACHES_THE (l_id, c_id)
values (265, 45);
insert into TEACHES_THE (l_id, c_id)
values (265, 46);
insert into TEACHES_THE (l_id, c_id)
values (267, 279);
insert into TEACHES_THE (l_id, c_id)
values (268, 183);
insert into TEACHES_THE (l_id, c_id)
values (270, 158);
insert into TEACHES_THE (l_id, c_id)
values (272, 7);
insert into TEACHES_THE (l_id, c_id)
values (273, 98);
insert into TEACHES_THE (l_id, c_id)
values (274, 195);
insert into TEACHES_THE (l_id, c_id)
values (275, 251);
insert into TEACHES_THE (l_id, c_id)
values (275, 279);
insert into TEACHES_THE (l_id, c_id)
values (276, 47);
insert into TEACHES_THE (l_id, c_id)
values (276, 191);
insert into TEACHES_THE (l_id, c_id)
values (277, 163);
insert into TEACHES_THE (l_id, c_id)
values (277, 321);
insert into TEACHES_THE (l_id, c_id)
values (279, 188);
insert into TEACHES_THE (l_id, c_id)
values (280, 118);
insert into TEACHES_THE (l_id, c_id)
values (281, 213);
insert into TEACHES_THE (l_id, c_id)
values (281, 398);
insert into TEACHES_THE (l_id, c_id)
values (283, 71);
insert into TEACHES_THE (l_id, c_id)
values (289, 312);
insert into TEACHES_THE (l_id, c_id)
values (291, 77);
insert into TEACHES_THE (l_id, c_id)
values (293, 179);
insert into TEACHES_THE (l_id, c_id)
values (293, 182);
insert into TEACHES_THE (l_id, c_id)
values (294, 1);
insert into TEACHES_THE (l_id, c_id)
values (295, 208);
insert into TEACHES_THE (l_id, c_id)
values (295, 224);
insert into TEACHES_THE (l_id, c_id)
values (295, 276);
insert into TEACHES_THE (l_id, c_id)
values (297, 270);
insert into TEACHES_THE (l_id, c_id)
values (299, 71);
insert into TEACHES_THE (l_id, c_id)
values (300, 196);
insert into TEACHES_THE (l_id, c_id)
values (301, 368);
insert into TEACHES_THE (l_id, c_id)
values (302, 22);
insert into TEACHES_THE (l_id, c_id)
values (302, 38);
insert into TEACHES_THE (l_id, c_id)
values (303, 335);
insert into TEACHES_THE (l_id, c_id)
values (304, 129);
insert into TEACHES_THE (l_id, c_id)
values (304, 305);
insert into TEACHES_THE (l_id, c_id)
values (305, 330);
commit;
prompt 200 records committed...
insert into TEACHES_THE (l_id, c_id)
values (307, 180);
insert into TEACHES_THE (l_id, c_id)
values (307, 186);
insert into TEACHES_THE (l_id, c_id)
values (307, 254);
insert into TEACHES_THE (l_id, c_id)
values (309, 132);
insert into TEACHES_THE (l_id, c_id)
values (310, 2);
insert into TEACHES_THE (l_id, c_id)
values (310, 121);
insert into TEACHES_THE (l_id, c_id)
values (310, 124);
insert into TEACHES_THE (l_id, c_id)
values (310, 265);
insert into TEACHES_THE (l_id, c_id)
values (313, 184);
insert into TEACHES_THE (l_id, c_id)
values (313, 336);
insert into TEACHES_THE (l_id, c_id)
values (315, 48);
insert into TEACHES_THE (l_id, c_id)
values (316, 299);
insert into TEACHES_THE (l_id, c_id)
values (317, 164);
insert into TEACHES_THE (l_id, c_id)
values (318, 90);
insert into TEACHES_THE (l_id, c_id)
values (318, 109);
insert into TEACHES_THE (l_id, c_id)
values (319, 160);
insert into TEACHES_THE (l_id, c_id)
values (321, 165);
insert into TEACHES_THE (l_id, c_id)
values (323, 54);
insert into TEACHES_THE (l_id, c_id)
values (323, 305);
insert into TEACHES_THE (l_id, c_id)
values (324, 21);
insert into TEACHES_THE (l_id, c_id)
values (325, 89);
insert into TEACHES_THE (l_id, c_id)
values (325, 181);
insert into TEACHES_THE (l_id, c_id)
values (325, 328);
insert into TEACHES_THE (l_id, c_id)
values (326, 332);
insert into TEACHES_THE (l_id, c_id)
values (327, 185);
insert into TEACHES_THE (l_id, c_id)
values (329, 286);
insert into TEACHES_THE (l_id, c_id)
values (331, 225);
insert into TEACHES_THE (l_id, c_id)
values (332, 107);
insert into TEACHES_THE (l_id, c_id)
values (334, 379);
insert into TEACHES_THE (l_id, c_id)
values (335, 140);
insert into TEACHES_THE (l_id, c_id)
values (335, 191);
insert into TEACHES_THE (l_id, c_id)
values (335, 263);
insert into TEACHES_THE (l_id, c_id)
values (335, 265);
insert into TEACHES_THE (l_id, c_id)
values (337, 126);
insert into TEACHES_THE (l_id, c_id)
values (338, 28);
insert into TEACHES_THE (l_id, c_id)
values (338, 75);
insert into TEACHES_THE (l_id, c_id)
values (338, 247);
insert into TEACHES_THE (l_id, c_id)
values (341, 43);
insert into TEACHES_THE (l_id, c_id)
values (341, 121);
insert into TEACHES_THE (l_id, c_id)
values (341, 396);
insert into TEACHES_THE (l_id, c_id)
values (344, 55);
insert into TEACHES_THE (l_id, c_id)
values (346, 6);
insert into TEACHES_THE (l_id, c_id)
values (347, 341);
insert into TEACHES_THE (l_id, c_id)
values (349, 326);
insert into TEACHES_THE (l_id, c_id)
values (352, 222);
insert into TEACHES_THE (l_id, c_id)
values (353, 241);
insert into TEACHES_THE (l_id, c_id)
values (355, 157);
insert into TEACHES_THE (l_id, c_id)
values (357, 81);
insert into TEACHES_THE (l_id, c_id)
values (358, 146);
insert into TEACHES_THE (l_id, c_id)
values (358, 181);
insert into TEACHES_THE (l_id, c_id)
values (359, 23);
insert into TEACHES_THE (l_id, c_id)
values (359, 24);
insert into TEACHES_THE (l_id, c_id)
values (359, 245);
insert into TEACHES_THE (l_id, c_id)
values (360, 336);
insert into TEACHES_THE (l_id, c_id)
values (361, 115);
insert into TEACHES_THE (l_id, c_id)
values (361, 284);
insert into TEACHES_THE (l_id, c_id)
values (362, 22);
insert into TEACHES_THE (l_id, c_id)
values (362, 83);
insert into TEACHES_THE (l_id, c_id)
values (365, 293);
insert into TEACHES_THE (l_id, c_id)
values (367, 154);
insert into TEACHES_THE (l_id, c_id)
values (369, 137);
insert into TEACHES_THE (l_id, c_id)
values (369, 171);
insert into TEACHES_THE (l_id, c_id)
values (369, 248);
insert into TEACHES_THE (l_id, c_id)
values (369, 399);
insert into TEACHES_THE (l_id, c_id)
values (370, 319);
insert into TEACHES_THE (l_id, c_id)
values (371, 266);
insert into TEACHES_THE (l_id, c_id)
values (372, 380);
insert into TEACHES_THE (l_id, c_id)
values (372, 388);
insert into TEACHES_THE (l_id, c_id)
values (373, 112);
insert into TEACHES_THE (l_id, c_id)
values (373, 274);
insert into TEACHES_THE (l_id, c_id)
values (375, 255);
insert into TEACHES_THE (l_id, c_id)
values (377, 179);
insert into TEACHES_THE (l_id, c_id)
values (377, 388);
insert into TEACHES_THE (l_id, c_id)
values (378, 205);
insert into TEACHES_THE (l_id, c_id)
values (380, 192);
insert into TEACHES_THE (l_id, c_id)
values (380, 247);
insert into TEACHES_THE (l_id, c_id)
values (381, 345);
insert into TEACHES_THE (l_id, c_id)
values (381, 363);
insert into TEACHES_THE (l_id, c_id)
values (382, 361);
insert into TEACHES_THE (l_id, c_id)
values (384, 262);
insert into TEACHES_THE (l_id, c_id)
values (384, 328);
insert into TEACHES_THE (l_id, c_id)
values (385, 208);
insert into TEACHES_THE (l_id, c_id)
values (388, 73);
insert into TEACHES_THE (l_id, c_id)
values (391, 27);
insert into TEACHES_THE (l_id, c_id)
values (391, 139);
insert into TEACHES_THE (l_id, c_id)
values (391, 234);
insert into TEACHES_THE (l_id, c_id)
values (391, 340);
insert into TEACHES_THE (l_id, c_id)
values (393, 169);
insert into TEACHES_THE (l_id, c_id)
values (393, 279);
insert into TEACHES_THE (l_id, c_id)
values (397, 163);
insert into TEACHES_THE (l_id, c_id)
values (397, 235);
insert into TEACHES_THE (l_id, c_id)
values (397, 374);
insert into TEACHES_THE (l_id, c_id)
values (398, 3);
insert into TEACHES_THE (l_id, c_id)
values (398, 151);
insert into TEACHES_THE (l_id, c_id)
values (400, 50);
insert into TEACHES_THE (l_id, c_id)
values (400, 367);
insert into TEACHES_THE (l_id, c_id)
values (402, 228);
insert into TEACHES_THE (l_id, c_id)
values (406, 96);
insert into TEACHES_THE (l_id, c_id)
values (407, 27);
insert into TEACHES_THE (l_id, c_id)
values (407, 120);
commit;
prompt 300 records committed...
insert into TEACHES_THE (l_id, c_id)
values (408, 89);
insert into TEACHES_THE (l_id, c_id)
values (409, 15);
insert into TEACHES_THE (l_id, c_id)
values (409, 361);
insert into TEACHES_THE (l_id, c_id)
values (409, 364);
insert into TEACHES_THE (l_id, c_id)
values (410, 5);
insert into TEACHES_THE (l_id, c_id)
values (410, 136);
insert into TEACHES_THE (l_id, c_id)
values (410, 279);
insert into TEACHES_THE (l_id, c_id)
values (411, 300);
insert into TEACHES_THE (l_id, c_id)
values (411, 379);
insert into TEACHES_THE (l_id, c_id)
values (413, 358);
insert into TEACHES_THE (l_id, c_id)
values (416, 79);
insert into TEACHES_THE (l_id, c_id)
values (416, 269);
insert into TEACHES_THE (l_id, c_id)
values (417, 309);
insert into TEACHES_THE (l_id, c_id)
values (418, 295);
insert into TEACHES_THE (l_id, c_id)
values (423, 290);
insert into TEACHES_THE (l_id, c_id)
values (425, 205);
insert into TEACHES_THE (l_id, c_id)
values (426, 119);
insert into TEACHES_THE (l_id, c_id)
values (426, 128);
insert into TEACHES_THE (l_id, c_id)
values (426, 164);
insert into TEACHES_THE (l_id, c_id)
values (427, 291);
insert into TEACHES_THE (l_id, c_id)
values (428, 62);
insert into TEACHES_THE (l_id, c_id)
values (428, 119);
insert into TEACHES_THE (l_id, c_id)
values (429, 91);
insert into TEACHES_THE (l_id, c_id)
values (429, 229);
insert into TEACHES_THE (l_id, c_id)
values (432, 389);
insert into TEACHES_THE (l_id, c_id)
values (433, 22);
insert into TEACHES_THE (l_id, c_id)
values (435, 253);
insert into TEACHES_THE (l_id, c_id)
values (436, 147);
insert into TEACHES_THE (l_id, c_id)
values (436, 328);
insert into TEACHES_THE (l_id, c_id)
values (437, 61);
insert into TEACHES_THE (l_id, c_id)
values (442, 301);
insert into TEACHES_THE (l_id, c_id)
values (443, 11);
insert into TEACHES_THE (l_id, c_id)
values (443, 351);
insert into TEACHES_THE (l_id, c_id)
values (444, 183);
insert into TEACHES_THE (l_id, c_id)
values (444, 292);
insert into TEACHES_THE (l_id, c_id)
values (445, 287);
insert into TEACHES_THE (l_id, c_id)
values (445, 314);
insert into TEACHES_THE (l_id, c_id)
values (446, 116);
insert into TEACHES_THE (l_id, c_id)
values (448, 122);
insert into TEACHES_THE (l_id, c_id)
values (448, 135);
insert into TEACHES_THE (l_id, c_id)
values (449, 25);
insert into TEACHES_THE (l_id, c_id)
values (450, 43);
insert into TEACHES_THE (l_id, c_id)
values (450, 168);
insert into TEACHES_THE (l_id, c_id)
values (450, 254);
insert into TEACHES_THE (l_id, c_id)
values (451, 165);
insert into TEACHES_THE (l_id, c_id)
values (451, 388);
insert into TEACHES_THE (l_id, c_id)
values (452, 162);
insert into TEACHES_THE (l_id, c_id)
values (452, 179);
insert into TEACHES_THE (l_id, c_id)
values (452, 357);
insert into TEACHES_THE (l_id, c_id)
values (454, 367);
insert into TEACHES_THE (l_id, c_id)
values (455, 34);
insert into TEACHES_THE (l_id, c_id)
values (455, 278);
insert into TEACHES_THE (l_id, c_id)
values (455, 382);
insert into TEACHES_THE (l_id, c_id)
values (456, 31);
insert into TEACHES_THE (l_id, c_id)
values (456, 348);
insert into TEACHES_THE (l_id, c_id)
values (457, 10);
insert into TEACHES_THE (l_id, c_id)
values (457, 257);
insert into TEACHES_THE (l_id, c_id)
values (458, 173);
insert into TEACHES_THE (l_id, c_id)
values (459, 3);
insert into TEACHES_THE (l_id, c_id)
values (460, 156);
insert into TEACHES_THE (l_id, c_id)
values (460, 211);
insert into TEACHES_THE (l_id, c_id)
values (460, 362);
insert into TEACHES_THE (l_id, c_id)
values (461, 67);
insert into TEACHES_THE (l_id, c_id)
values (464, 153);
insert into TEACHES_THE (l_id, c_id)
values (465, 51);
insert into TEACHES_THE (l_id, c_id)
values (465, 228);
insert into TEACHES_THE (l_id, c_id)
values (467, 306);
insert into TEACHES_THE (l_id, c_id)
values (468, 45);
insert into TEACHES_THE (l_id, c_id)
values (468, 302);
insert into TEACHES_THE (l_id, c_id)
values (468, 371);
insert into TEACHES_THE (l_id, c_id)
values (469, 240);
insert into TEACHES_THE (l_id, c_id)
values (470, 101);
insert into TEACHES_THE (l_id, c_id)
values (470, 235);
insert into TEACHES_THE (l_id, c_id)
values (471, 18);
insert into TEACHES_THE (l_id, c_id)
values (473, 14);
insert into TEACHES_THE (l_id, c_id)
values (474, 355);
insert into TEACHES_THE (l_id, c_id)
values (475, 197);
insert into TEACHES_THE (l_id, c_id)
values (477, 205);
insert into TEACHES_THE (l_id, c_id)
values (478, 317);
insert into TEACHES_THE (l_id, c_id)
values (479, 145);
insert into TEACHES_THE (l_id, c_id)
values (480, 60);
insert into TEACHES_THE (l_id, c_id)
values (481, 40);
insert into TEACHES_THE (l_id, c_id)
values (481, 81);
insert into TEACHES_THE (l_id, c_id)
values (481, 143);
insert into TEACHES_THE (l_id, c_id)
values (482, 189);
insert into TEACHES_THE (l_id, c_id)
values (482, 321);
insert into TEACHES_THE (l_id, c_id)
values (485, 278);
insert into TEACHES_THE (l_id, c_id)
values (487, 278);
insert into TEACHES_THE (l_id, c_id)
values (488, 226);
insert into TEACHES_THE (l_id, c_id)
values (489, 285);
insert into TEACHES_THE (l_id, c_id)
values (489, 328);
insert into TEACHES_THE (l_id, c_id)
values (490, 373);
insert into TEACHES_THE (l_id, c_id)
values (491, 135);
insert into TEACHES_THE (l_id, c_id)
values (492, 56);
insert into TEACHES_THE (l_id, c_id)
values (492, 68);
insert into TEACHES_THE (l_id, c_id)
values (496, 23);
insert into TEACHES_THE (l_id, c_id)
values (497, 94);
insert into TEACHES_THE (l_id, c_id)
values (497, 219);
insert into TEACHES_THE (l_id, c_id)
values (498, 247);
insert into TEACHES_THE (l_id, c_id)
values (499, 359);
commit;
prompt 400 records loaded
prompt Loading USES...
insert into USES (c_id, e_id, i_id)
values (1, 315, null);
insert into USES (c_id, e_id, i_id)
values (1, 350, null);
insert into USES (c_id, e_id, i_id)
values (2, 197, null);
insert into USES (c_id, e_id, i_id)
values (3, 128, null);
insert into USES (c_id, e_id, i_id)
values (6, 361, null);
insert into USES (c_id, e_id, i_id)
values (8, 148, null);
insert into USES (c_id, e_id, i_id)
values (9, 366, null);
insert into USES (c_id, e_id, i_id)
values (10, 273, null);
insert into USES (c_id, e_id, i_id)
values (10, 348, null);
insert into USES (c_id, e_id, i_id)
values (11, 151, null);
insert into USES (c_id, e_id, i_id)
values (11, 396, null);
insert into USES (c_id, e_id, i_id)
values (12, 157, null);
insert into USES (c_id, e_id, i_id)
values (13, 334, null);
insert into USES (c_id, e_id, i_id)
values (14, 150, null);
insert into USES (c_id, e_id, i_id)
values (14, 311, null);
insert into USES (c_id, e_id, i_id)
values (14, 382, null);
insert into USES (c_id, e_id, i_id)
values (15, 348, null);
insert into USES (c_id, e_id, i_id)
values (17, 51, null);
insert into USES (c_id, e_id, i_id)
values (18, 112, null);
insert into USES (c_id, e_id, i_id)
values (19, 125, null);
insert into USES (c_id, e_id, i_id)
values (21, 161, null);
insert into USES (c_id, e_id, i_id)
values (21, 207, null);
insert into USES (c_id, e_id, i_id)
values (25, 183, null);
insert into USES (c_id, e_id, i_id)
values (26, 29, null);
insert into USES (c_id, e_id, i_id)
values (26, 399, null);
insert into USES (c_id, e_id, i_id)
values (27, 36, null);
insert into USES (c_id, e_id, i_id)
values (27, 200, null);
insert into USES (c_id, e_id, i_id)
values (28, 64, null);
insert into USES (c_id, e_id, i_id)
values (29, 15, null);
insert into USES (c_id, e_id, i_id)
values (30, 205, null);
insert into USES (c_id, e_id, i_id)
values (31, 262, null);
insert into USES (c_id, e_id, i_id)
values (32, 215, null);
insert into USES (c_id, e_id, i_id)
values (32, 325, null);
insert into USES (c_id, e_id, i_id)
values (33, 176, null);
insert into USES (c_id, e_id, i_id)
values (33, 205, null);
insert into USES (c_id, e_id, i_id)
values (34, 160, null);
insert into USES (c_id, e_id, i_id)
values (34, 241, null);
insert into USES (c_id, e_id, i_id)
values (34, 268, null);
insert into USES (c_id, e_id, i_id)
values (35, 235, null);
insert into USES (c_id, e_id, i_id)
values (38, 112, null);
insert into USES (c_id, e_id, i_id)
values (38, 134, null);
insert into USES (c_id, e_id, i_id)
values (39, 241, null);
insert into USES (c_id, e_id, i_id)
values (40, 349, null);
insert into USES (c_id, e_id, i_id)
values (41, 276, null);
insert into USES (c_id, e_id, i_id)
values (42, 87, null);
insert into USES (c_id, e_id, i_id)
values (42, 395, null);
insert into USES (c_id, e_id, i_id)
values (43, 62, null);
insert into USES (c_id, e_id, i_id)
values (45, 375, null);
insert into USES (c_id, e_id, i_id)
values (46, 42, null);
insert into USES (c_id, e_id, i_id)
values (46, 112, null);
insert into USES (c_id, e_id, i_id)
values (48, 389, null);
insert into USES (c_id, e_id, i_id)
values (49, 263, null);
insert into USES (c_id, e_id, i_id)
values (50, 202, null);
insert into USES (c_id, e_id, i_id)
values (51, 69, null);
insert into USES (c_id, e_id, i_id)
values (53, 52, null);
insert into USES (c_id, e_id, i_id)
values (53, 161, null);
insert into USES (c_id, e_id, i_id)
values (54, 199, null);
insert into USES (c_id, e_id, i_id)
values (55, 247, null);
insert into USES (c_id, e_id, i_id)
values (56, 26, null);
insert into USES (c_id, e_id, i_id)
values (57, 58, null);
insert into USES (c_id, e_id, i_id)
values (57, 105, null);
insert into USES (c_id, e_id, i_id)
values (61, 46, null);
insert into USES (c_id, e_id, i_id)
values (61, 126, null);
insert into USES (c_id, e_id, i_id)
values (62, 203, null);
insert into USES (c_id, e_id, i_id)
values (64, 266, null);
insert into USES (c_id, e_id, i_id)
values (66, 129, null);
insert into USES (c_id, e_id, i_id)
values (66, 181, null);
insert into USES (c_id, e_id, i_id)
values (66, 377, null);
insert into USES (c_id, e_id, i_id)
values (68, 213, null);
insert into USES (c_id, e_id, i_id)
values (69, 322, null);
insert into USES (c_id, e_id, i_id)
values (69, 351, null);
insert into USES (c_id, e_id, i_id)
values (69, 361, null);
insert into USES (c_id, e_id, i_id)
values (70, 12, null);
insert into USES (c_id, e_id, i_id)
values (70, 159, null);
insert into USES (c_id, e_id, i_id)
values (70, 227, null);
insert into USES (c_id, e_id, i_id)
values (72, 257, null);
insert into USES (c_id, e_id, i_id)
values (74, 190, null);
insert into USES (c_id, e_id, i_id)
values (75, 108, null);
insert into USES (c_id, e_id, i_id)
values (77, 77, null);
insert into USES (c_id, e_id, i_id)
values (77, 257, null);
insert into USES (c_id, e_id, i_id)
values (81, 281, null);
insert into USES (c_id, e_id, i_id)
values (82, 91, null);
insert into USES (c_id, e_id, i_id)
values (84, 372, null);
insert into USES (c_id, e_id, i_id)
values (85, 37, null);
insert into USES (c_id, e_id, i_id)
values (85, 104, null);
insert into USES (c_id, e_id, i_id)
values (85, 333, null);
insert into USES (c_id, e_id, i_id)
values (86, 286, null);
insert into USES (c_id, e_id, i_id)
values (89, 12, null);
insert into USES (c_id, e_id, i_id)
values (89, 217, null);
insert into USES (c_id, e_id, i_id)
values (90, 316, null);
insert into USES (c_id, e_id, i_id)
values (91, 383, null);
insert into USES (c_id, e_id, i_id)
values (92, 7, null);
insert into USES (c_id, e_id, i_id)
values (94, 372, null);
insert into USES (c_id, e_id, i_id)
values (96, 32, null);
insert into USES (c_id, e_id, i_id)
values (97, 212, null);
insert into USES (c_id, e_id, i_id)
values (98, 390, null);
insert into USES (c_id, e_id, i_id)
values (101, 52, null);
insert into USES (c_id, e_id, i_id)
values (103, 264, null);
insert into USES (c_id, e_id, i_id)
values (104, 298, null);
insert into USES (c_id, e_id, i_id)
values (104, 334, null);
commit;
prompt 100 records committed...
insert into USES (c_id, e_id, i_id)
values (105, 314, null);
insert into USES (c_id, e_id, i_id)
values (106, 324, null);
insert into USES (c_id, e_id, i_id)
values (107, 70, null);
insert into USES (c_id, e_id, i_id)
values (107, 76, null);
insert into USES (c_id, e_id, i_id)
values (108, 6, null);
insert into USES (c_id, e_id, i_id)
values (108, 170, null);
insert into USES (c_id, e_id, i_id)
values (108, 392, null);
insert into USES (c_id, e_id, i_id)
values (109, 135, null);
insert into USES (c_id, e_id, i_id)
values (109, 151, null);
insert into USES (c_id, e_id, i_id)
values (109, 216, null);
insert into USES (c_id, e_id, i_id)
values (109, 400, null);
insert into USES (c_id, e_id, i_id)
values (111, 194, null);
insert into USES (c_id, e_id, i_id)
values (111, 276, null);
insert into USES (c_id, e_id, i_id)
values (112, 327, null);
insert into USES (c_id, e_id, i_id)
values (113, 216, null);
insert into USES (c_id, e_id, i_id)
values (113, 303, null);
insert into USES (c_id, e_id, i_id)
values (113, 394, null);
insert into USES (c_id, e_id, i_id)
values (115, 224, null);
insert into USES (c_id, e_id, i_id)
values (115, 363, null);
insert into USES (c_id, e_id, i_id)
values (118, 239, null);
insert into USES (c_id, e_id, i_id)
values (119, 300, null);
insert into USES (c_id, e_id, i_id)
values (120, 69, null);
insert into USES (c_id, e_id, i_id)
values (122, 229, null);
insert into USES (c_id, e_id, i_id)
values (127, 128, null);
insert into USES (c_id, e_id, i_id)
values (130, 9, null);
insert into USES (c_id, e_id, i_id)
values (132, 252, null);
insert into USES (c_id, e_id, i_id)
values (132, 300, null);
insert into USES (c_id, e_id, i_id)
values (132, 348, null);
insert into USES (c_id, e_id, i_id)
values (133, 158, null);
insert into USES (c_id, e_id, i_id)
values (134, 31, null);
insert into USES (c_id, e_id, i_id)
values (134, 107, null);
insert into USES (c_id, e_id, i_id)
values (134, 153, null);
insert into USES (c_id, e_id, i_id)
values (136, 55, null);
insert into USES (c_id, e_id, i_id)
values (137, 101, null);
insert into USES (c_id, e_id, i_id)
values (138, 10, null);
insert into USES (c_id, e_id, i_id)
values (139, 399, null);
insert into USES (c_id, e_id, i_id)
values (144, 334, null);
insert into USES (c_id, e_id, i_id)
values (145, 78, null);
insert into USES (c_id, e_id, i_id)
values (146, 280, null);
insert into USES (c_id, e_id, i_id)
values (148, 36, null);
insert into USES (c_id, e_id, i_id)
values (151, 192, null);
insert into USES (c_id, e_id, i_id)
values (153, 218, null);
insert into USES (c_id, e_id, i_id)
values (153, 239, null);
insert into USES (c_id, e_id, i_id)
values (154, 264, null);
insert into USES (c_id, e_id, i_id)
values (155, 111, null);
insert into USES (c_id, e_id, i_id)
values (156, 59, null);
insert into USES (c_id, e_id, i_id)
values (156, 310, null);
insert into USES (c_id, e_id, i_id)
values (159, 47, null);
insert into USES (c_id, e_id, i_id)
values (159, 337, null);
insert into USES (c_id, e_id, i_id)
values (160, 51, null);
insert into USES (c_id, e_id, i_id)
values (162, 241, null);
insert into USES (c_id, e_id, i_id)
values (163, 270, null);
insert into USES (c_id, e_id, i_id)
values (165, 92, null);
insert into USES (c_id, e_id, i_id)
values (165, 99, null);
insert into USES (c_id, e_id, i_id)
values (165, 377, null);
insert into USES (c_id, e_id, i_id)
values (168, 25, null);
insert into USES (c_id, e_id, i_id)
values (168, 165, null);
insert into USES (c_id, e_id, i_id)
values (168, 223, null);
insert into USES (c_id, e_id, i_id)
values (168, 262, null);
insert into USES (c_id, e_id, i_id)
values (168, 307, null);
insert into USES (c_id, e_id, i_id)
values (170, 113, null);
insert into USES (c_id, e_id, i_id)
values (170, 250, null);
insert into USES (c_id, e_id, i_id)
values (171, 14, null);
insert into USES (c_id, e_id, i_id)
values (173, 369, null);
insert into USES (c_id, e_id, i_id)
values (175, 393, null);
insert into USES (c_id, e_id, i_id)
values (176, 24, null);
insert into USES (c_id, e_id, i_id)
values (176, 181, null);
insert into USES (c_id, e_id, i_id)
values (177, 39, null);
insert into USES (c_id, e_id, i_id)
values (178, 21, null);
insert into USES (c_id, e_id, i_id)
values (178, 26, null);
insert into USES (c_id, e_id, i_id)
values (178, 206, null);
insert into USES (c_id, e_id, i_id)
values (183, 324, null);
insert into USES (c_id, e_id, i_id)
values (184, 274, null);
insert into USES (c_id, e_id, i_id)
values (185, 369, null);
insert into USES (c_id, e_id, i_id)
values (186, 18, null);
insert into USES (c_id, e_id, i_id)
values (188, 330, null);
insert into USES (c_id, e_id, i_id)
values (191, 78, null);
insert into USES (c_id, e_id, i_id)
values (191, 309, null);
insert into USES (c_id, e_id, i_id)
values (191, 375, null);
insert into USES (c_id, e_id, i_id)
values (191, 385, null);
insert into USES (c_id, e_id, i_id)
values (192, 57, null);
insert into USES (c_id, e_id, i_id)
values (193, 68, null);
insert into USES (c_id, e_id, i_id)
values (194, 48, null);
insert into USES (c_id, e_id, i_id)
values (194, 327, null);
insert into USES (c_id, e_id, i_id)
values (195, 131, null);
insert into USES (c_id, e_id, i_id)
values (196, 92, null);
insert into USES (c_id, e_id, i_id)
values (196, 344, null);
insert into USES (c_id, e_id, i_id)
values (197, 26, null);
insert into USES (c_id, e_id, i_id)
values (198, 319, null);
insert into USES (c_id, e_id, i_id)
values (198, 326, null);
insert into USES (c_id, e_id, i_id)
values (202, 274, null);
insert into USES (c_id, e_id, i_id)
values (203, 51, null);
insert into USES (c_id, e_id, i_id)
values (203, 140, null);
insert into USES (c_id, e_id, i_id)
values (203, 239, null);
insert into USES (c_id, e_id, i_id)
values (205, 190, null);
insert into USES (c_id, e_id, i_id)
values (205, 273, null);
insert into USES (c_id, e_id, i_id)
values (206, 265, null);
insert into USES (c_id, e_id, i_id)
values (207, 70, null);
insert into USES (c_id, e_id, i_id)
values (208, 246, null);
insert into USES (c_id, e_id, i_id)
values (209, 67, null);
commit;
prompt 200 records committed...
insert into USES (c_id, e_id, i_id)
values (209, 323, null);
insert into USES (c_id, e_id, i_id)
values (210, 234, null);
insert into USES (c_id, e_id, i_id)
values (212, 292, null);
insert into USES (c_id, e_id, i_id)
values (214, 360, null);
insert into USES (c_id, e_id, i_id)
values (215, 115, null);
insert into USES (c_id, e_id, i_id)
values (215, 265, null);
insert into USES (c_id, e_id, i_id)
values (218, 179, null);
insert into USES (c_id, e_id, i_id)
values (219, 145, null);
insert into USES (c_id, e_id, i_id)
values (220, 18, null);
insert into USES (c_id, e_id, i_id)
values (220, 280, null);
insert into USES (c_id, e_id, i_id)
values (223, 76, null);
insert into USES (c_id, e_id, i_id)
values (224, 89, null);
insert into USES (c_id, e_id, i_id)
values (225, 220, null);
insert into USES (c_id, e_id, i_id)
values (226, 65, null);
insert into USES (c_id, e_id, i_id)
values (227, 267, null);
insert into USES (c_id, e_id, i_id)
values (227, 364, null);
insert into USES (c_id, e_id, i_id)
values (229, 6, null);
insert into USES (c_id, e_id, i_id)
values (230, 188, null);
insert into USES (c_id, e_id, i_id)
values (230, 226, null);
insert into USES (c_id, e_id, i_id)
values (231, 270, null);
insert into USES (c_id, e_id, i_id)
values (231, 299, null);
insert into USES (c_id, e_id, i_id)
values (232, 92, null);
insert into USES (c_id, e_id, i_id)
values (232, 231, null);
insert into USES (c_id, e_id, i_id)
values (234, 69, null);
insert into USES (c_id, e_id, i_id)
values (235, 54, null);
insert into USES (c_id, e_id, i_id)
values (235, 57, null);
insert into USES (c_id, e_id, i_id)
values (235, 244, null);
insert into USES (c_id, e_id, i_id)
values (237, 89, null);
insert into USES (c_id, e_id, i_id)
values (237, 331, null);
insert into USES (c_id, e_id, i_id)
values (238, 27, null);
insert into USES (c_id, e_id, i_id)
values (238, 256, null);
insert into USES (c_id, e_id, i_id)
values (240, 127, null);
insert into USES (c_id, e_id, i_id)
values (241, 352, null);
insert into USES (c_id, e_id, i_id)
values (243, 353, null);
insert into USES (c_id, e_id, i_id)
values (244, 16, null);
insert into USES (c_id, e_id, i_id)
values (244, 290, null);
insert into USES (c_id, e_id, i_id)
values (244, 389, null);
insert into USES (c_id, e_id, i_id)
values (245, 222, null);
insert into USES (c_id, e_id, i_id)
values (249, 91, null);
insert into USES (c_id, e_id, i_id)
values (253, 47, null);
insert into USES (c_id, e_id, i_id)
values (254, 74, null);
insert into USES (c_id, e_id, i_id)
values (254, 110, null);
insert into USES (c_id, e_id, i_id)
values (256, 227, null);
insert into USES (c_id, e_id, i_id)
values (256, 291, null);
insert into USES (c_id, e_id, i_id)
values (257, 169, null);
insert into USES (c_id, e_id, i_id)
values (258, 146, null);
insert into USES (c_id, e_id, i_id)
values (259, 71, null);
insert into USES (c_id, e_id, i_id)
values (260, 186, null);
insert into USES (c_id, e_id, i_id)
values (261, 74, null);
insert into USES (c_id, e_id, i_id)
values (261, 343, null);
insert into USES (c_id, e_id, i_id)
values (262, 131, null);
insert into USES (c_id, e_id, i_id)
values (263, 158, null);
insert into USES (c_id, e_id, i_id)
values (263, 373, null);
insert into USES (c_id, e_id, i_id)
values (264, 234, null);
insert into USES (c_id, e_id, i_id)
values (264, 326, null);
insert into USES (c_id, e_id, i_id)
values (266, 364, null);
insert into USES (c_id, e_id, i_id)
values (268, 35, null);
insert into USES (c_id, e_id, i_id)
values (268, 168, null);
insert into USES (c_id, e_id, i_id)
values (268, 243, null);
insert into USES (c_id, e_id, i_id)
values (272, 251, null);
insert into USES (c_id, e_id, i_id)
values (272, 320, null);
insert into USES (c_id, e_id, i_id)
values (273, 83, null);
insert into USES (c_id, e_id, i_id)
values (275, 255, null);
insert into USES (c_id, e_id, i_id)
values (276, 57, null);
insert into USES (c_id, e_id, i_id)
values (276, 96, null);
insert into USES (c_id, e_id, i_id)
values (279, 125, null);
insert into USES (c_id, e_id, i_id)
values (280, 31, null);
insert into USES (c_id, e_id, i_id)
values (281, 375, null);
insert into USES (c_id, e_id, i_id)
values (282, 62, null);
insert into USES (c_id, e_id, i_id)
values (283, 72, null);
insert into USES (c_id, e_id, i_id)
values (287, 211, null);
insert into USES (c_id, e_id, i_id)
values (288, 120, null);
insert into USES (c_id, e_id, i_id)
values (289, 271, null);
insert into USES (c_id, e_id, i_id)
values (290, 148, null);
insert into USES (c_id, e_id, i_id)
values (290, 378, null);
insert into USES (c_id, e_id, i_id)
values (291, 111, null);
insert into USES (c_id, e_id, i_id)
values (291, 254, null);
insert into USES (c_id, e_id, i_id)
values (291, 346, null);
insert into USES (c_id, e_id, i_id)
values (292, 188, null);
insert into USES (c_id, e_id, i_id)
values (295, 33, null);
insert into USES (c_id, e_id, i_id)
values (295, 123, null);
insert into USES (c_id, e_id, i_id)
values (295, 310, null);
insert into USES (c_id, e_id, i_id)
values (297, 87, null);
insert into USES (c_id, e_id, i_id)
values (298, 305, null);
insert into USES (c_id, e_id, i_id)
values (301, 282, null);
insert into USES (c_id, e_id, i_id)
values (301, 382, null);
insert into USES (c_id, e_id, i_id)
values (303, 28, null);
insert into USES (c_id, e_id, i_id)
values (305, 392, null);
insert into USES (c_id, e_id, i_id)
values (308, 26, null);
insert into USES (c_id, e_id, i_id)
values (310, 124, null);
insert into USES (c_id, e_id, i_id)
values (312, 262, null);
insert into USES (c_id, e_id, i_id)
values (313, 329, null);
insert into USES (c_id, e_id, i_id)
values (314, 201, null);
insert into USES (c_id, e_id, i_id)
values (316, 89, null);
insert into USES (c_id, e_id, i_id)
values (317, 211, null);
insert into USES (c_id, e_id, i_id)
values (318, 1, null);
insert into USES (c_id, e_id, i_id)
values (318, 131, null);
insert into USES (c_id, e_id, i_id)
values (318, 253, null);
insert into USES (c_id, e_id, i_id)
values (318, 373, null);
insert into USES (c_id, e_id, i_id)
values (319, 202, null);
commit;
prompt 300 records committed...
insert into USES (c_id, e_id, i_id)
values (320, 396, null);
insert into USES (c_id, e_id, i_id)
values (321, 86, null);
insert into USES (c_id, e_id, i_id)
values (321, 155, null);
insert into USES (c_id, e_id, i_id)
values (322, 360, null);
insert into USES (c_id, e_id, i_id)
values (325, 289, null);
insert into USES (c_id, e_id, i_id)
values (327, 161, null);
insert into USES (c_id, e_id, i_id)
values (330, 83, null);
insert into USES (c_id, e_id, i_id)
values (330, 308, null);
insert into USES (c_id, e_id, i_id)
values (332, 112, null);
insert into USES (c_id, e_id, i_id)
values (332, 172, null);
insert into USES (c_id, e_id, i_id)
values (332, 215, null);
insert into USES (c_id, e_id, i_id)
values (333, 36, null);
insert into USES (c_id, e_id, i_id)
values (335, 201, null);
insert into USES (c_id, e_id, i_id)
values (335, 378, null);
insert into USES (c_id, e_id, i_id)
values (337, 131, null);
insert into USES (c_id, e_id, i_id)
values (339, 242, null);
insert into USES (c_id, e_id, i_id)
values (339, 272, null);
insert into USES (c_id, e_id, i_id)
values (340, 347, null);
insert into USES (c_id, e_id, i_id)
values (341, 298, null);
insert into USES (c_id, e_id, i_id)
values (342, 372, null);
insert into USES (c_id, e_id, i_id)
values (343, 218, null);
insert into USES (c_id, e_id, i_id)
values (345, 212, null);
insert into USES (c_id, e_id, i_id)
values (347, 87, null);
insert into USES (c_id, e_id, i_id)
values (349, 32, null);
insert into USES (c_id, e_id, i_id)
values (350, 85, null);
insert into USES (c_id, e_id, i_id)
values (350, 129, null);
insert into USES (c_id, e_id, i_id)
values (350, 213, null);
insert into USES (c_id, e_id, i_id)
values (350, 249, null);
insert into USES (c_id, e_id, i_id)
values (350, 375, null);
insert into USES (c_id, e_id, i_id)
values (350, 379, null);
insert into USES (c_id, e_id, i_id)
values (351, 331, null);
insert into USES (c_id, e_id, i_id)
values (352, 98, null);
insert into USES (c_id, e_id, i_id)
values (352, 287, null);
insert into USES (c_id, e_id, i_id)
values (353, 362, null);
insert into USES (c_id, e_id, i_id)
values (354, 335, null);
insert into USES (c_id, e_id, i_id)
values (355, 3, null);
insert into USES (c_id, e_id, i_id)
values (355, 7, null);
insert into USES (c_id, e_id, i_id)
values (355, 103, null);
insert into USES (c_id, e_id, i_id)
values (356, 287, null);
insert into USES (c_id, e_id, i_id)
values (356, 343, null);
insert into USES (c_id, e_id, i_id)
values (357, 21, null);
insert into USES (c_id, e_id, i_id)
values (358, 47, null);
insert into USES (c_id, e_id, i_id)
values (358, 312, null);
insert into USES (c_id, e_id, i_id)
values (359, 126, null);
insert into USES (c_id, e_id, i_id)
values (360, 125, null);
insert into USES (c_id, e_id, i_id)
values (360, 182, null);
insert into USES (c_id, e_id, i_id)
values (360, 287, null);
insert into USES (c_id, e_id, i_id)
values (361, 237, null);
insert into USES (c_id, e_id, i_id)
values (363, 400, null);
insert into USES (c_id, e_id, i_id)
values (365, 86, null);
insert into USES (c_id, e_id, i_id)
values (367, 205, null);
insert into USES (c_id, e_id, i_id)
values (368, 154, null);
insert into USES (c_id, e_id, i_id)
values (369, 220, null);
insert into USES (c_id, e_id, i_id)
values (370, 217, null);
insert into USES (c_id, e_id, i_id)
values (371, 82, null);
insert into USES (c_id, e_id, i_id)
values (373, 103, null);
insert into USES (c_id, e_id, i_id)
values (375, 55, null);
insert into USES (c_id, e_id, i_id)
values (376, 14, null);
insert into USES (c_id, e_id, i_id)
values (376, 59, null);
insert into USES (c_id, e_id, i_id)
values (376, 86, null);
insert into USES (c_id, e_id, i_id)
values (376, 268, null);
insert into USES (c_id, e_id, i_id)
values (377, 196, null);
insert into USES (c_id, e_id, i_id)
values (378, 270, null);
insert into USES (c_id, e_id, i_id)
values (378, 361, null);
insert into USES (c_id, e_id, i_id)
values (379, 124, null);
insert into USES (c_id, e_id, i_id)
values (379, 135, null);
insert into USES (c_id, e_id, i_id)
values (381, 245, null);
insert into USES (c_id, e_id, i_id)
values (382, 294, null);
insert into USES (c_id, e_id, i_id)
values (382, 391, null);
insert into USES (c_id, e_id, i_id)
values (383, 122, null);
insert into USES (c_id, e_id, i_id)
values (383, 365, null);
insert into USES (c_id, e_id, i_id)
values (384, 20, null);
insert into USES (c_id, e_id, i_id)
values (384, 64, null);
insert into USES (c_id, e_id, i_id)
values (384, 143, null);
insert into USES (c_id, e_id, i_id)
values (384, 251, null);
insert into USES (c_id, e_id, i_id)
values (386, 189, null);
insert into USES (c_id, e_id, i_id)
values (388, 84, null);
insert into USES (c_id, e_id, i_id)
values (388, 321, null);
insert into USES (c_id, e_id, i_id)
values (389, 41, null);
insert into USES (c_id, e_id, i_id)
values (390, 145, null);
insert into USES (c_id, e_id, i_id)
values (391, 152, null);
insert into USES (c_id, e_id, i_id)
values (393, 43, null);
insert into USES (c_id, e_id, i_id)
values (393, 143, null);
insert into USES (c_id, e_id, i_id)
values (393, 173, null);
insert into USES (c_id, e_id, i_id)
values (394, 43, null);
insert into USES (c_id, e_id, i_id)
values (396, 119, null);
insert into USES (c_id, e_id, i_id)
values (396, 205, null);
insert into USES (c_id, e_id, i_id)
values (397, 315, null);
insert into USES (c_id, e_id, i_id)
values (397, 347, null);
insert into USES (c_id, e_id, i_id)
values (398, 326, null);
insert into USES (c_id, e_id, i_id)
values (399, 40, null);
insert into USES (c_id, e_id, i_id)
values (399, 126, null);
insert into USES (c_id, e_id, i_id)
values (399, 149, null);
insert into USES (c_id, e_id, i_id)
values (399, 267, null);
commit;
prompt 394 records loaded
prompt Enabling foreign key constraints for ROOM...
alter table ROOM enable constraint FK_ROOM_LOCATION;
prompt Enabling foreign key constraints for STUDENTSGROUP...
alter table STUDENTSGROUP enable constraint SYS_C00725889;
alter table STUDENTSGROUP enable constraint SYS_C00725890;
alter table STUDENTSGROUP enable constraint SYS_C00725891;
prompt Enabling foreign key constraints for BELONGS...
alter table BELONGS enable constraint SYS_C00725895;
alter table BELONGS enable constraint SYS_C00725896;
prompt Enabling foreign key constraints for ITEM...
alter table ITEM enable constraint SYS_C00717208;
prompt Enabling foreign key constraints for DONATION...
alter table DONATION enable constraint SYS_C00717214;
alter table DONATION enable constraint SYS_C00717215;
prompt Enabling foreign key constraints for DONOR_COURSES...
alter table DONOR_COURSES enable constraint FK_COURSE;
alter table DONOR_COURSES enable constraint FK_DONOR;
prompt Enabling foreign key constraints for EQUIPMENT...
alter table EQUIPMENT enable constraint FK_EQUIPMENT_ITEM;
prompt Enabling foreign key constraints for MAINTENANCE...
alter table MAINTENANCE enable constraint SYS_C00717221;
prompt Enabling foreign key constraints for OPERATION...
alter table OPERATION enable constraint SYS_C00717229;
alter table OPERATION enable constraint SYS_C00717230;
prompt Enabling foreign key constraints for OPERATORCOURSE...
alter table OPERATORCOURSE enable constraint SYS_C00725956;
alter table OPERATORCOURSE enable constraint SYS_C00725957;
prompt Enabling foreign key constraints for TEACHES_THE...
alter table TEACHES_THE enable constraint SYS_C00725906;
alter table TEACHES_THE enable constraint SYS_C00725907;
prompt Enabling foreign key constraints for USES...
alter table USES enable constraint SYS_C00725911;
alter table USES enable constraint SYS_C00725962;
prompt Enabling triggers for PARTICIPANTS...
alter table PARTICIPANTS enable all triggers;
prompt Enabling triggers for COURSES...
alter table COURSES enable all triggers;
prompt Enabling triggers for LECTURERS...
alter table LECTURERS enable all triggers;
prompt Enabling triggers for LOCATION...
alter table LOCATION enable all triggers;
prompt Enabling triggers for ROOM...
alter table ROOM enable all triggers;
prompt Enabling triggers for STUDENTSGROUP...
alter table STUDENTSGROUP enable all triggers;
prompt Enabling triggers for BELONGS...
alter table BELONGS enable all triggers;
prompt Enabling triggers for CATEGORY...
alter table CATEGORY enable all triggers;
prompt Enabling triggers for DONOR...
alter table DONOR enable all triggers;
prompt Enabling triggers for ITEM...
alter table ITEM enable all triggers;
prompt Enabling triggers for DONATION...
alter table DONATION enable all triggers;
prompt Enabling triggers for DONOR_COURSES...
alter table DONOR_COURSES enable all triggers;
prompt Enabling triggers for EQUIPMENT...
alter table EQUIPMENT enable all triggers;
prompt Enabling triggers for MAINTENANCE...
alter table MAINTENANCE enable all triggers;
prompt Enabling triggers for OPERATOR...
alter table OPERATOR enable all triggers;
prompt Enabling triggers for OPERATION...
alter table OPERATION enable all triggers;
prompt Enabling triggers for OPERATORCOURSE...
alter table OPERATORCOURSE enable all triggers;
prompt Enabling triggers for TEACHES_THE...
alter table TEACHES_THE enable all triggers;
prompt Enabling triggers for USES...
alter table USES enable all triggers;

set feedback on
set define on
prompt Done
