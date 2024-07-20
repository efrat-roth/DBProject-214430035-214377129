prompt PL/SQL Developer Export Tables for user EFROTH@LABDBWIN
prompt Created by efroth on יום חמישי 18 יולי 2024
set feedback off
set define off

prompt Creating CATEGORY...
create table CATEGORY
(
  categoryid     NUMBER(10) not null,
  name           VARCHAR2(100) not null,
  emergencylevel NUMBER not null
)

alter table CATEGORY
  add primary key (CATEGORYID)
  ;

prompt Creating DONOR...
create table DONOR
(
  donorid     NUMBER(10) not null,
  name        VARCHAR2(100) not null,
  isactive    CHAR(1) not null,
  designation VARCHAR2(100) not null
)

alter table DONOR
  add primary key (DONORID);

prompt Creating LOCATION...
create table LOCATION
(
  phonenumber  NUMBER(10) not null,
  address      VARCHAR2(100) not null,
  instructions VARCHAR2(100) not null,
  capacity     INTEGER
)

alter table LOCATION
  add primary key (PHONENUMBER) ;

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

alter table ITEM
  add primary key (ITEMID);
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
alter table DONATION
  add primary key (DONATIONID)
  ;
alter table DONATION
  add foreign key (ITEMID)
  references ITEM (ITEMID);
alter table DONATION
  add foreign key (DONORID)
  references DONOR (DONORID);

prompt Creating MAINTENANCE...
create table MAINTENANCE
(
  maintenanceid   NUMBER not null,
  maintenancedate DATE not null,
  description     VARCHAR2(100) not null,
  itemid          NUMBER not null
)
alter table MAINTENANCE
  add primary key (MAINTENANCEID)
  ;
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
alter table OPERATOR
  add primary key (OPERATORID);

prompt Creating OPERATION...
create table OPERATION
(
  itemid     NUMBER not null,
  operatorid NUMBER not null
)
alter table OPERATION
  add primary key (ITEMID, OPERATORID);
alter table OPERATION
  add foreign key (ITEMID)
  references ITEM (ITEMID);
alter table OPERATION
  add foreign key (OPERATORID)
  references OPERATOR (OPERATORID);

prompt Disabling triggers for CATEGORY...
alter table CATEGORY disable all triggers;
prompt Disabling triggers for DONOR...
alter table DONOR disable all triggers;
prompt Disabling triggers for LOCATION...
alter table LOCATION disable all triggers;
prompt Disabling triggers for ITEM...
alter table ITEM disable all triggers;
prompt Disabling triggers for DONATION...
alter table DONATION disable all triggers;
prompt Disabling triggers for MAINTENANCE...
alter table MAINTENANCE disable all triggers;
prompt Disabling triggers for OPERATOR...
alter table OPERATOR disable all triggers;
prompt Disabling triggers for OPERATION...
alter table OPERATION disable all triggers;
prompt Disabling foreign key constraints for ITEM...
alter table ITEM disable constraint SYS_C00717208;
prompt Disabling foreign key constraints for DONATION...
alter table DONATION disable constraint SYS_C00717214;
alter table DONATION disable constraint SYS_C00717215;
prompt Disabling foreign key constraints for MAINTENANCE...
alter table MAINTENANCE disable constraint SYS_C00717221;
prompt Disabling foreign key constraints for OPERATION...
alter table OPERATION disable constraint SYS_C00717229;
alter table OPERATION disable constraint SYS_C00717230;
prompt Deleting OPERATION...
delete from OPERATION;
commit;
prompt Deleting OPERATOR...
delete from OPERATOR;
commit;
prompt Deleting MAINTENANCE...
delete from MAINTENANCE;
commit;
prompt Deleting DONATION...
delete from DONATION;
commit;
prompt Deleting ITEM...
delete from ITEM;
commit;
prompt Deleting LOCATION...
delete from LOCATION;
commit;
prompt Deleting DONOR...
delete from DONOR;
commit;
prompt Deleting CATEGORY...
delete from CATEGORY;
commit;
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
prompt Loading LOCATION...
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999092, 'Shosanim 100, NY', 'permission from organization head', 812);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999095, '36 Josh Ave', 'permission from chief security officer', 78);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999096, '965 Matarazzo Road', 'permission from organization head', 564);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999097, '80 Howard Road', 'permission from chief security officer', 166);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999098, '89 Chalee Street', 'permission from organization head', 448);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999099, '51 Heath Road', 'permission from organization head', 843);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999100, '75 Wetzlar', 'permission from manager', 322);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999101, '732 Cozier Road', 'permission from security', 3096);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999102, '93 Sao roque Street', 'permission from security', 1882);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999103, '37 Lionel Ave', 'permission from manager', 74);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999104, '60 Tambor Road', 'permission from manager', 832);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999106, '82 Van Helden Drive', 'permission from security', 982);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999107, '4 Haggard Blvd', 'permission from security', 471);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999108, '5 Porto alegre Road', 'permission from security', 102);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999109, '30 Schaumburg Blvd', 'permission from security', 1180);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999110, '851 Avalon Road', 'permission from security', 24);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999111, '16 Tinsley Street', 'permission from manager', 626);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999112, '1 Miles Street', 'permission from security', 2843);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999114, '8 Vincent Blvd', 'permission from manager', 915);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999116, '38 Padova', 'permission from manager', 1300);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999117, '89 Chandler Ave', 'permission from security', 476);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999118, '48 Astin Road', 'permission from security', 1820);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999119, '8 West Launceston Street', 'permission from security', 1736);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999120, '75 Dempsey Road', 'permission from security', 120);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999121, '87 Aniston Street', 'permission from manager', 1695);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999122, '50 Arlington', 'permission from security', 2639);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999123, '577 Traralgon Road', 'permission from security', 1112);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999124, '886 Huston Drive', 'permission from security', 178);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999125, '724 Cassidy', 'permission from security', 211);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999126, '91 Carla Road', 'permission from security', 381);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999127, '41 Angelina', 'permission from manager', 1120);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999128, '30 Head Drive', 'permission from manager', 2234);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999129, '71 Keitel Blvd', 'permission from security', 96);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999132, '22 Manaus Ave', 'permission from manager', 580);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999133, '23rd Street', 'permission from security', 1052);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999134, '61 Keeslar Street', 'permission from manager', 246);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999136, '17 Grand Rapids', 'permission from manager', 1060);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999137, '61 Bingham Farms Street', 'permission from manager', 1402);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999138, '70 Benicio Street', 'permission from manager', 939);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999139, '42 Frampton Drive', 'permission from manager', 1532);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999140, '18 Cuba Street', 'permission from security', 481);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999141, '245 Shand Road', 'permission from security', 404);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999143, '523 Bale Road', 'permission from manager', 61);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999144, '535 Indianapolis', 'permission from security', 369);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999146, '18 Richie', 'permission from manager', 596);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999148, '35 Sinatra Drive', 'permission from security', 233);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999150, '679 Lapointe Ave', 'permission from manager', 1104);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999153, '5 Linney Road', 'permission from security', 456);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999154, '82nd Street', 'permission from manager', 2170);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999155, '32nd Street', 'permission from security', 974);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999156, '30 Vendetta Blvd', 'permission from manager', 260);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999157, '38 Kenoly Street', 'permission from security', 272);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999160, '90 Llewelyn Drive', 'permission from manager', 1692);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999163, '63rd Street', 'permission from security', 2192);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999165, '626 Carlingford Drive', 'permission from security', 1314);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999167, '99 Lila Drive', 'permission from manager', 562);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999168, '22 Zagreb Ave', 'permission from manager', 1316);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999170, '70 Nathan Ave', 'permission from security', 136);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999172, '491 Miki Drive', 'permission from security', 1312);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999174, '84 Cochran Drive', 'permission from security', 920);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999175, '97 Jaime Street', 'permission from security', 1042);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999176, '676 Janeane Ave', 'permission from manager', 2932);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999177, '88 Dermot Ave', 'permission from manager', 496);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999178, '87 Eileen Street', 'permission from manager', 244);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999180, '17 Breslin', 'permission from security', 936);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999182, '49 Trejo Ave', 'permission from security', 120);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999183, '45 Kid', 'permission from security', 196);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999185, '86 Elijah', 'permission from manager', 284);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999186, '82 Gryner Blvd', 'permission from manager', 1428);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999191, '78 Chapeco', 'permission from manager', 268);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999192, '96 Naha Street', 'permission from manager', 844);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999193, '23 Haysbert Drive', 'permission from manager', 1986);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999194, '904 Brothers', 'permission from manager', 1148);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999195, '2 Olin Drive', 'permission from manager', 356);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999196, '93 North Yorkshire Street', 'permission from security', 227);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999197, '35 Sedaka Blvd', 'permission from security', 1040);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999198, '25 Nicosia Road', 'permission from security', 2336);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999199, '86 Borgnine Street', 'permission from manager', 2520);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999200, '92 Wehrheim Blvd', 'permission from organization head', 260);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999201, '23 Boothe Road', 'permission from organization head', 692);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999202, '25 Puckett Street', 'ID is required', 2844);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999205, '99 Tualatin Drive', 'ID is required', 1012);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999206, '80 Chely Road', 'permission from organization head', 932);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999207, '86 Pleasure Drive', 'ID is required', 948);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999208, '31st Street', 'permission from organization head', 1688);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999210, '45 Bend Street', 'permission from organization head', 1810);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999211, '776 Hawke', 'ID is required', 2448);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999212, '83 Duchovny Drive', 'permission from organization head', 264);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999213, '93 Gibbons Road', 'permission from organization head', 524);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999215, '72 Schneider Road', 'ID is required', 1350);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999216, '74 Owen Drive', 'ID is required', 432);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999217, '76 Browne Road', 'permission from organization head', 140);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999218, '52nd Street', 'permission from organization head', 748);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999220, '134 Zuerich Street', 'ID is required', 1360);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999222, '59 Moraz Street', 'ID is required', 180);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999223, '21 Elias Blvd', 'ID is required', 588);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999225, '99 Carson City', 'permission from organization head', 832);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999227, '89 Gatlin Ave', 'ID is required', 354);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999228, '21st Street', 'permission from organization head', 245);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999229, '62 Concordville Drive', 'permission from organization head', 1612);
commit;
prompt 100 records committed...
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999230, '9 Barry Street', 'permission from organization head', 932);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999231, '55 Dysart Street', 'permission from organization head', 427);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999232, '74 Vaughn Drive', 'permission from organization head', 360);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999233, '89 Luzern Street', 'permission from organization head', 213);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999800, 'heretz 9', 'permission from chief security officer', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999235, '59 O''fallon Drive', 'permission from organization head', 1212);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999801, 'Yosef 19', 'permission from organization head', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999900, 'Yosef 50', 'permission from security', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999238, '17 Seth Blvd', 'permission from organization head', 1260);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999901, 'Moshe 30', 'permission from security', 0);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999240, '667 Holts Summit Road', 'permission from organization head', 728);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999241, '100 Ripley Drive', 'ID is required', 242);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999242, '11 Belle Street', 'ID is required', 457);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999243, '35 Annie Road', 'ID is required', 346);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999244, '154 Madonna Road', 'permission from organization head', 1365);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999245, '73rd Street', 'ID is required', 894);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999246, '729 Drogenbos Street', 'ID is required', 500);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999248, '63 Johnson Blvd', 'permission from organization head', 4552);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999249, '52 Matt Street', 'ID is required', 83);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999250, '97 Crete Road', 'ID is required', 1727);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999251, '20 Apple', 'permission from organization head', 391);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999252, '42 Port Macquarie Road', 'ID is required', 756);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999253, '58 Frances Road', 'ID is required', 1412);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (541234567, '123 Herzl St', ' premisson from manager', 772);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (543456789, '789 Dizengoff St', ' premisson from supervisor', 1376);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (544567890, '101 Allenby St', ' premisson from building owner', 1355);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (545678901, '202 Jaffa Rd', ' premisson from tenant', 1405);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (546789012, '303 Ben Yehuda St', ' premisson from landlord', 820);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (548901234, '505 Ibn Gvirol St', ' premisson from property manager', 118);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (541098765, '808 HaNeviim St', ' premisson from site manager', 916);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (543098765, '111 Weizmann St', ' premisson from department head', 1412);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (544098765, '222 Begin Blvd', ' premisson from company', 672);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (545098765, '333 Yefet St', ' premisson from local authorities', 1277);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (546098765, '444 Derech Hashalom', ' premisson from neighborhood committee', 404);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (547098765, '555 Agron St', ' premisson from site coordinator', 833);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (549098765, '777 Jabotinsky St', ' premisson from organization head', 748);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999254, '80 Wincott Blvd', 'ID is required', 108);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999050, '872 Marina Street', 'permission from organization head', 528);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999051, '33rd Street', 'permission from chief security officer', 892);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999052, '799 Neill Street', 'permission from chief security officer', 380);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999054, '196 Rosanna Road', 'permission from chief security officer', 465);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999055, '1 Whitman Road', 'permission from organization head', 263);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999058, '95 Caan', 'permission from organization head', 137);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999060, '19 Keeslar Blvd', 'permission from chief security officer', 108);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999061, '51 Wakayama Road', 'permission from organization head', 1008);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999062, '94 Augst Drive', 'permission from organization head', 1440);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999064, '73rd Street', 'permission from chief security officer', 888);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999065, '65 Emmerich', 'permission from organization head', 528);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999067, '43 Pitney Road', 'permission from organization head', 1730);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999068, '91st Street', 'permission from organization head', 3052);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999070, '636 Dallas Road', 'permission from chief security officer', 1468);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999071, '54 Dabney Road', 'permission from organization head', 80);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999072, '1 Betty Road', 'permission from organization head', 1744);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999073, '92 Andrew Street', 'permission from organization head', 432);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999074, '22 Eugene Blvd', 'permission from chief security officer', 130);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999075, '16 Crudup Drive', 'permission from chief security officer', 1200);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999076, '56 Longueuil Road', 'permission from chief security officer', 464);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999078, '883 Oshkosh Road', 'permission from organization head', 495);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999080, '25 Worrell Blvd', 'permission from organization head', 136);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999081, '80 Hughes Road', 'permission from chief security officer', 324);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999082, '13 George Drive', 'permission from chief security officer', 1262);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999083, '50 Santana', 'permission from organization head', 992);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999085, '52 Key Biscayne Drive', 'permission from organization head', 1032);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999087, '13rd Street', 'permission from chief security officer', 1013);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999088, '11 Stephanie Street', 'permission from organization head', 526);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999089, '7 Terence Drive', 'permission from chief security officer', 436);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999090, '80 Grier Drive', 'permission from chief security officer', 820);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999091, '34 Coltrane Drive', 'permission from chief security officer', 356);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999256, '89 Varzea grande Street', 'ID is required', 684);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999258, '96 Oakenfold Drive', 'ID is required', 1718);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999260, '27 Moreno Road', 'permission from organization head', 630);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999261, '31 Ruiz Road', 'permission from organization head', 312);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999262, '340 Lakewood Road', 'ID is required', 1304);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999263, '66 Gagnon Street', 'permission from organization head', 884);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999265, '759 Rowan Street', 'permission from organization head', 1512);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999266, '8 Arquette Street', 'ID is required', 628);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999268, '49 Guy Ave', 'permission from organization head', 153);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999269, '11 Susan Ave', 'permission from organization head', 1248);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999270, '3 Tramaine Street', 'permission from organization head', 370);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999271, '48 Nikka Blvd', 'ID is required', 291);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999273, '60 Livermore Street', 'ID is required', 540);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999274, '91 Gabriel Drive', 'ID is required', 1468);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999278, '610 Hannah', 'ID is required', 1571);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999279, '96 Getty Ave', 'ID is required', 104);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999280, '11 Choice Blvd', 'ID is required', 122);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999281, '51 Seoul Drive', 'ID is required', 104);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999285, '831 David Road', 'ID is required', 651);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999288, '49 Paquin Drive', 'permission from organization head', 602);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999290, '64 Duisburg Street', 'ID is required', 1329);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999291, '289 Tilda Ave', 'ID is required', 3476);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999293, '418 Cooper Road', 'ID is required', 952);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999294, '82 Vega Road', 'ID is required', 202);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999296, '83 Pepper Street', 'permission from organization head', 236);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999298, '60 Hawn Blvd', 'permission from organization head', 656);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999299, '67 Los Angeles Blvd', 'ID is required', 312);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999300, '85 Day-Lewis Blvd', 'permission from building owner', 1124);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999301, '65 McDowall', '''permission from tenant', 924);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999303, '79 Pointe-claire', '''permission from tenant', 372);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999304, '31 Friedrichshafe Road', 'permission from building owner', 1248);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999305, '361 El Paso Road', 'permission from building owner', 1464);
commit;
prompt 200 records committed...
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999306, '96 Cheadle Drive', 'permission from building owner', 1464);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999310, '51 Clarence Road', '''permission from tenant', 376);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999312, '521 Rhames Road', 'permission from building owner', 359);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999313, '99 Wilder Drive', 'permission from building owner', 792);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999315, '89 Santiago Street', 'permission from building owner', 256);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999316, '14 Melanie', '''permission from tenant', 1883);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999317, '73rd Street', 'permission from building owner', 549);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999319, '45 Spall Street', 'permission from building owner', 245);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999321, '527 Ethan Street', 'permission from building owner', 184);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999322, '520 Li Road', 'permission from building owner', 560);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999323, '78 McGriff', 'permission from building owner', 391);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999325, '98 Hoskins Drive', '''permission from tenant', 601);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999326, '8 Ceasar Drive', '''permission from tenant', 1320);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999330, '39 Spring City Road', '''permission from tenant', 368);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999331, '91 Bassett Road', '''permission from tenant', 1749);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999333, '85 Seann Road', '''permission from tenant', 776);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999334, '63rd Street', '''permission from tenant', 279);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999335, '64 Bogguss Street', '''permission from tenant', 2072);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999337, '23rd Street', 'permission from building owner', 416);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999339, '60 Charlize Road', 'permission from building owner', 1424);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999340, '488 Yavne Street', 'permission from building owner', 1672);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999341, '95 Merillee Road', '''permission from tenant', 144);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999342, '29 Saint Paul Street', 'permission from building owner', 351);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999357, '97 Leipzig Drive', '''permission from tenant', 1268);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999358, '73rd Street', '''permission from tenant', 948);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999359, '2 Washington Blvd', 'permission from building owner', 300);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999360, '77 Corona Street', 'permission from building owner', 592);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999361, '19 Ferraz  vasconcelos Street', 'permission from building owner', 353);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999362, '75 Hong Kong Street', 'permission from building owner', 824);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999363, '1 Beck Road', 'permission from building owner', 1528);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999364, '68 Carrack', 'permission from building owner', 836);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999343, '44 Bryson Ave', '''permission from tenant', 1644);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999345, '301 Lynne Drive', 'permission from building owner', 308);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999346, '33 Hampton Drive', '''permission from tenant', 524);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999347, '48 Holts Summit', 'permission from building owner', 119);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999349, '98 Issaquah', '''permission from tenant', 279);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999350, '53 Joinville Ave', 'permission from building owner', 231);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999351, '18 Wolf Road', '''permission from tenant', 145);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999352, '82 Nicole Drive', '''permission from tenant', 1376);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999353, '36 B?nes Road', '''permission from tenant', 170);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999354, '38 Davison Road', '''permission from tenant', 2092);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999369, '43rd Street', '''permission from tenant', 688);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999370, '371 Rod Drive', 'permission from building owner', 404);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999373, '6 Cuba Street', '''permission from tenant', 183);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999374, '22 Gdansk Drive', '''permission from tenant', 343);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999375, '74 Nyn?shamn Road', 'permission from building owner', 366);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999377, '71 Jim Blvd', 'permission from building owner', 2650);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999378, '12 Patrick Road', 'permission from building owner', 540);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999379, '81 Nielsen Street', '''permission from tenant', 126);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999380, '28 Victoria Drive', '''permission from tenant', 1566);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999381, '49 Miami Drive', 'permission from building owner', 2412);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999382, '26 Amarillo Street', '''permission from tenant', 876);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999383, '40 Reykjavik Road', 'permission from building owner', 792);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999384, '783 Barbara Road', '''permission from tenant', 860);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999385, '267 Westerberg Blvd', 'permission from building owner', 1141);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999389, '99 Robby Street', '''permission from tenant', 134);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999000, '38 Tilly Drive', '"permission from facility manager"', 2209);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999001, '26 Gunton Street', '"permission from tenant"', 420);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999002, '31st Street', 'permission from organization head', 832);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999003, '758 Bryan Street', 'permission from chief security officer', 2020);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999004, '29 Tlalpan Street', 'permission from organization head', 219);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999006, '6 Pasadena', 'permission from chief security officer', 1500);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999007, '242 Lavigne Street', 'permission from organization head', 168);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999008, '32 Peter Road', 'permission from organization head', 3125);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999009, '32 Newton-le-willows Road', 'permission from organization head', 334);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999010, '73 Bellevue Road', 'permission from chief security officer', 1747);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999011, '64 Phillippe Drive', 'permission from organization head', 788);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999012, '95 Quinn Road', 'permission from chief security officer', 98);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999013, '16 Yolanda Blvd', 'permission from chief security officer', 490);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999014, '8 Hayes', 'permission from chief security officer', 1738);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999015, '35 Gambon Street', 'permission from chief security officer', 774);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999016, '994 Wesley Road', 'permission from organization head', 1724);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999018, '82 Hawke Drive', 'permission from organization head', 2148);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999019, '79 Warrington Drive', 'permission from chief security officer', 478);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999020, '79 Domingo Drive', 'permission from organization head', 502);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999021, '83rd Street', 'permission from organization head', 1316);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999022, '7 Aracruz Road', 'permission from organization head', 1759);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999023, '18 Darren Street', 'permission from chief security officer', 550);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999025, '60 Roberts Ave', 'permission from organization head', 748);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999027, '72 Rosas Street', 'permission from chief security officer', 524);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999028, '21 Peterson Road', 'permission from chief security officer', 708);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999029, '430 Carlton Drive', 'permission from organization head', 262);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999030, '14 Day Street', 'permission from chief security officer', 400);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999031, '42nd Street', 'permission from chief security officer', 822);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999032, '42 Trieste Drive', 'permission from chief security officer', 123);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999033, '74 Day Ave', 'permission from chief security officer', 766);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999035, '71st Street', 'permission from chief security officer', 1560);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999036, '80 Calcutta Blvd', 'permission from chief security officer', 1300);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999037, '4 Patrick Blvd', 'permission from chief security officer', 1476);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999039, '79 Kenoly Ave', 'permission from organization head', 1414);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999043, '89 Burns Road', 'permission from chief security officer', 1316);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999044, '10 Sizemore Road', 'permission from organization head', 584);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999045, '87 Schlieren Blvd', 'permission from chief security officer', 272);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999046, '7 Johansson Drive', 'permission from organization head', 572);
insert into LOCATION (phonenumber, address, instructions, capacity)
values (999999049, '18 Wayman Street', 'permission from chief security officer', 896);
commit;
prompt 295 records loaded
prompt Loading ITEM...
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (218, 'Medical Ventilator Circuits', 'A device used to assist or replace spontaneous breathing in patients.', 240, 0, 414, 999999369);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (219, 'Tracheostomy Tube Holders', 'Bins used for the safe disposal of medical waste such as used needles syringes and dressings.', 1000, 0, 409, 999999022);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (220, 'Tourniquet', 'A dressing used to cover and protect burns.', 1212, 0, 407, 999999278);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (221, 'Portable Defibrillators', 'A device used to administer a measured dose of epinephrine in cases of severe allergic reactions.', 312, 0, 423, 999999261);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (222, 'First Aid Kit', 'Masks used to deliver anesthesia gases or oxygen to patients during surgery or procedures.', 206, 0, 414, 999999316);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (223, 'Medical Sterilization Pouches', 'A device that measures and displays the electrical activity of the heart.', 242, 0, 423, 999999242);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (224, 'Suture Kit', 'Devices used to secure tracheostomy tubes in place to prevent accidental removal.', 119, 0, 413, 999999347);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (225, 'Defibrillator pads', 'Strips used with a glucose meter to test the level of glucose in the blood.', 492, 0, 409, 999999176);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (226, 'Laryngeal Mask Airways', 'Syringes designed for single use to administer medication or draw blood.', 198, 0, 418, 999999099);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (227, 'Hemostatic Dressing', 'A device used to remove mucus blood or other fluids from the body.', 824, 0, 409, 999999362);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (228, 'Nebulizer', 'Needles used for injections or drawing blood samples.', 263, 1, 420, 999999055);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (229, 'Feeding Tube Extensions', 'Defibrillators designed for easy transport and use in various settings.', 324, 0, 404, 999999160);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (230, 'Orthopedic External Fixators', 'A type of adhesive tape used to secure dressings or bandages in place.', 1272, 0, 417, 999999210);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (231, 'Hypodermic Needles', 'Scales used to measure the weight of patients.', 984, 0, 404, 545678901);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (232, 'Intravenous Catheter', 'Gloves worn by healthcare professionals to prevent contamination and protect against infection.', 992, 1, 403, 999999385);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (233, 'Disinfectant Wipes', 'A device used to apply pressure to a limb or extremity in order to control bleeding.', 104, 0, 420, 999999279);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (234, 'Laryngeal Mask Airways', 'Gloves designed for single use to prevent contamination and infection.', 326, 1, 418, 999999167);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (235, 'Enteral Feeding Tubes', 'Gloves worn by healthcare professionals to prevent contamination and protect against infection.', 1528, 1, 407, 999999363);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (236, 'Portable Defibrillators', 'A device that turns liquid medicine into a fine mist that can be inhaled into the lungs.', 196, 0, 406, 999999322);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (237, 'Pulse Oximeter', 'Kits containing supplies for cleaning and maintaining tracheostomy tubes.', 904, 1, 411, 999999101);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (238, 'Burn Dressing', 'A device used to measure the pressure of the blood in the arteries.', 309, 0, 413, 999999244);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (239, 'Medical Feeding Pumps', 'A device used to cover penetrating chest wounds and prevent air from entering the chest cavity.', 166, 0, 416, 999999023);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (240, 'Orthopedic Walker', 'Materials used to create casts for immobilizing and supporting fractures or injuries.', 1120, 1, 409, 999999082);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (241, 'Nasogastric Tubes', 'Materials used to create custom splints for immobilizing and supporting fractures or injuries.', 552, 0, 411, 999999087);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (242, 'IV Fluid Warmers', 'Sets used to administer intravenous fluids or medication from IV bags to patients.', 812, 0, 410, 999999248);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (243, 'Splinter Forceps', 'Braces used to support and stabilize joints or limbs.', 1200, 0, 403, 999999075);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (244, 'Chest Seal', 'Stretchers designed for use in ambulances for transporting patients.', 1316, 0, 421, 999999168);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (245, 'Neck Brace', 'Boots designed to immobilize and protect the foot and ankle.', 242, 0, 416, 999999241);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (246, 'Urinary Catheters', 'Materials used to immobilize and support fractures or injuries.', 308, 0, 408, 999999285);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (247, 'Medical Sterilization Pouches', 'Pouches used to hold and sterilize medical instruments and supplies.', 130, 1, 416, 999999128);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (248, 'Cardiac Monitor', 'Circuits used to connect patients to mechanical ventilators for assisted breathing.', 144, 1, 413, 999999341);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (249, 'IV Start Kit', 'A device used to measure the oxygen saturation of the blood.', 239, 0, 420, 999999114);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (250, 'Medical Feeding Pumps', 'Devices used to stabilize and support fractured bones externally.', 760, 0, 409, 999999202);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (251, 'Intravenous Administration Sets', 'Devices inserted into the throat to maintain an open airway during anesthesia or resuscitation.', 896, 0, 405, 999999109);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (252, 'Medical Ventilator Circuits', 'Splints used to stabilize and immobilize fractured femurs or lower limbs.', 1268, 1, 412, 999999160);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (253, 'Burn Dressing', 'A kit containing devices used to establish or maintain a patient''s airway.', 920, 0, 407, 999999174);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (254, 'Anesthesia Masks', 'A device used to administer a measured dose of epinephrine in cases of severe allergic reactions.', 356, 0, 409, 999999195);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (255, 'Tracheostomy Care Kits', 'Stands used to support bags of intravenous fluids during administration to patients.', 260, 1, 415, 999999156);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (256, 'Epinephrine Auto-Injector', 'Medication used to relieve pain.', 153, 0, 419, 999999268);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (257, 'Intravenous Catheter', 'Extensions used to connect enteral feeding tubes to feeding pumps or syringes.', 1336, 0, 408, 999999018);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (258, 'Portable Blood Pressure Monitors', 'Blades used with laryngoscopes for visualizing the larynx and inserting endotracheal tubes.', 370, 1, 423, 999999102);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (259, 'Urinary Catheters', 'Splints used to stabilize and immobilize fractured femurs or lower limbs.', 440, 1, 412, 999999229);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (260, 'Disinfectant Wipes', 'Handheld ultrasound devices used for point-of-care diagnostics.', 359, 1, 419, 999999312);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (261, 'Cervical Collar', 'Devices used to warm intravenous fluids before administration to patients.', 173, 1, 414, 545678901);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (262, 'Splint', 'Masks used to deliver rescue breaths during CPR or respiratory emergencies.', 628, 0, 412, 999999266);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (263, 'Orthopedic Boots', 'Devices inserted into the throat to maintain an open airway during anesthesia or resuscitation.', 108, 0, 418, 999999254);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (264, 'Medical Tourniquets', 'Devices used to deliver fluids medications or nutrients into the bloodstream at a controlled rate.', 464, 1, 408, 999999076);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (265, 'Splint', 'Bandages with a sticky backing used to cover small wounds or hold dressings in place.', 196, 1, 414, 999999068);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (266, 'Orthopedic Splinting Tools', 'A device that turns liquid medicine into a fine mist that can be inhaled into the lungs.', 908, 0, 410, 999999262);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (267, 'Stretcher', 'Kits containing tools and reagents for diagnosing specific medical conditions or infections.', 820, 0, 421, 546789012);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (268, 'Urinary Catheters', 'Masks used to deliver oxygen to patients with respiratory conditions or emergencies.', 134, 1, 406, 999999118);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (269, 'Chest Decompression Needles', 'Pouches used to hold and sterilize medical instruments and supplies.', 812, 1, 412, 999999092);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (270, 'Medical Waste Bins', 'Tourniquets used to control severe bleeding from extremity wounds.', 812, 1, 421, 999999018);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (271, 'Orthopedic Braces', 'A device used to measure the concentration of glucose in the blood.', 1248, 1, 409, 999999269);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (272, 'Intravenous Cannulas', 'Devices used to deliver fluids medications or nutrients into the bloodstream at a controlled rate.', 412, 1, 421, 999999288);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (273, 'Nebulizer', 'A device used to support a patient''s neck and head in cases of suspected cervical spine injuries.', 1532, 1, 412, 999999139);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (274, 'Cardiac Defibrillator Training Units', 'Wipes saturated with disinfectant solution used to clean surfaces and equipment.', 268, 1, 417, 999999030);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (275, 'Cardiac Defibrillator Training Units', 'Masks used to deliver rescue breaths during CPR or respiratory emergencies.', 1280, 1, 412, 999999215);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (276, 'Nebulizer Mask', 'A device used to remove mucus blood or other fluids from the body.', 524, 1, 403, 999999213);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (277, 'Medical Gloves', 'Masks used to deliver rescue breaths during CPR or respiratory emergencies.', 844, 1, 411, 999999192);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (278, 'Medical Suction Canisters', 'Materials used to create casts for immobilizing and supporting fractures or injuries.', 1468, 0, 405, 999999274);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (279, 'Medical Sterilization Pouches', 'A device used to remove mucus blood or other fluids from the body.', 672, 1, 404, 544098765);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (280, 'Cardiac Defibrillator Training Units', 'A device used to assist or replace spontaneous breathing in patients.', 884, 0, 403, 999999121);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (281, 'Oxygen Mask', 'Devices specifically designed for managing pediatric airways during resuscitation.', 744, 1, 408, 999999354);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (282, 'Medical Suction Canisters', 'A device used to assist or replace spontaneous breathing in patients.', 540, 0, 410, 999999273);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (283, 'Medical Ventilator Circuits', 'Stretchers designed for use in ambulances for transporting patients.', 102, 1, 418, 999999323);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (284, 'Oxygen Tank', 'Handheld ultrasound devices used for point-of-care diagnostics.', 97, 0, 420, 999999350);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (285, 'Suture Kit', 'Catheters used to remove secretions and fluids from the airway.', 448, 0, 421, 999999369);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (286, 'Orthopedic Splinting Tools', 'A device inserted through the nose to maintain an open airway.', 452, 0, 417, 999999313);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (287, 'Medical Feeding Pumps', 'A training device used to simulate the operation of an automated external defibrillator.', 496, 1, 408, 999999177);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (288, 'Intravenous Infusion Pumps', 'Circuits used to connect patients to mechanical ventilators for assisted breathing.', 1520, 0, 415, 999999381);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (289, 'Medical Feeding Pumps', 'A device inserted through the nose to maintain an open airway.', 214, 1, 416, 999999088);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (290, 'Hypodermic Needles', 'Bandages with a sticky backing used to cover small wounds or hold dressings in place.', 381, 1, 419, 999999126);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (291, 'Portable Oxygen Concentrators', 'A sterile solution of salt in water used for various medical purposes.', 1172, 1, 405, 999999229);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (292, 'Tourniquet', 'Bandages with a sticky backing used to cover small wounds or hold dressings in place.', 134, 0, 418, 999999245);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (293, 'Pediatric Airway Management Devices', 'Kits containing tools and reagents for diagnosing specific medical conditions or infections.', 118, 1, 414, 999999067);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (294, 'First Aid Kit', 'Defibrillators designed for easy transport and use in various settings.', 318, 1, 423, 999999360);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (295, 'Medical Suction Canisters', 'Devices inserted into the throat to maintain an open airway during anesthesia or resuscitation.', 836, 0, 407, 999999364);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (296, 'Hypodermic Needles', 'Extensions used to connect enteral feeding tubes to feeding pumps or syringes.', 70, 0, 414, 999999215);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (297, 'CPR Mask', 'Sets used to administer intravenous fluids or medication from IV bags to patients.', 346, 1, 413, 999999243);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (298, 'Medical Needles and Syringes', 'Thin tubes inserted into veins to administer fluids or medication.', 952, 0, 403, 999999293);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (299, 'Stretcher', 'Kits containing supplies for cleaning and maintaining tracheostomy tubes.', 1420, 1, 408, 999999154);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (300, 'Defibrillator pads', 'Splints used to stabilize and immobilize fractured femurs or lower limbs.', 138, 1, 413, 999999014);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (301, 'Medical Suction Canisters', 'Wipes saturated with disinfectant solution used to clean surfaces and equipment.', 343, 1, 420, 999999374);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (302, 'Intravenous Cannulas', 'Devices inserted into the throat to maintain an open airway during anesthesia or resuscitation.', 280, 1, 404, 999999378);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (303, 'Electrocardiogram (ECG) Machines', 'Needles used for emergency decompression of tension pneumothorax.', 1180, 1, 415, 999999290);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (304, 'Disposable Bedpans', 'Braces used to support and stabilize joints or limbs.', 118, 1, 422, 548901234);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (305, 'Cardiac Monitor', 'Gloves designed for single use to prevent contamination and infection.', 336, 0, 418, 999999202);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (306, 'Defibrillator pads', 'Circuits used to connect patients to mechanical ventilators for assisted breathing.', 376, 0, 420, 999999208);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (307, 'Nebulizer', 'A device used to support a patient''s neck and head in cases of suspected cervical spine injuries.', 1560, 0, 404, 999999035);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (308, 'Pulse Oximeter', 'Sets used to administer intravenous fluids or medication from IV bags to patients.', 952, 1, 411, 999999198);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (309, 'Adhesive Bandages', 'A flat board used for immobilizing a patient with suspected spinal injuries.', 304, 0, 421, 999999154);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (310, 'Orthopedic Casting Materials', 'Flexible tubes inserted into the bladder to drain urine.', 78, 0, 414, 999999095);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (311, 'Disinfectant Wipes', 'Tubes used for collecting and storing blood samples for laboratory testing.', 369, 0, 416, 999999144);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (312, 'Enteral Feeding Tubes', 'Sets used to administer intravenous fluids or medication from IV bags to patients.', 580, 0, 415, 999999132);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (313, 'Pulse Oximeter', 'Devices that extract oxygen from the air and deliver it to patients via a nasal cannula or mask.', 146, 0, 423, 999999112);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (314, 'Medical Cast Saw Blades', 'A flat board used for immobilizing a patient with suspected spinal injuries.', 648, 0, 408, 999999106);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (315, 'Splinting Materials', 'Syringes designed for single use to administer medication or draw blood.', 352, 0, 412, 999999165);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (316, 'Nebulizer Mask', 'Kits containing tools and reagents for diagnosing specific medical conditions or infections.', 233, 1, 420, 999999148);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (317, 'Burn Dressing', 'Pouches used to hold and sterilize medical instruments and supplies.', 1496, 1, 408, 999999377);
commit;
prompt 100 records committed...
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (318, 'Neck Brace', 'Manual resuscitators used to provide positive pressure ventilation to patients.', 504, 1, 407, 999999260);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (319, 'Laryngeal Mask Airways', 'Devices specifically designed for managing pediatric airways during resuscitation.', 544, 0, 415, 999999383);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (320, 'Tourniquet', 'Manual resuscitators used to provide positive pressure ventilation to patients.', 322, 1, 423, 999999256);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (321, 'Hemostatic Dressing', 'Sets of needles and syringes used for injections or aspirations.', 190, 0, 416, 999999288);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (322, 'Feeding Tube Extensions', 'A device used to support and assist walking for patients with lower limb injuries or disabilities.', 296, 0, 417, 999999230);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (323, 'Portable Ventilator', 'Kits containing supplies for cleaning and maintaining tracheostomy tubes.', 1264, 1, 408, 999999198);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (324, 'Electrocardiogram (ECG) Machines', 'Braces used to support and stabilize joints or limbs.', 362, 0, 406, 999999101);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (325, 'First Aid Kit', 'Systems used to apply and control pressure to extremities to control bleeding during surgery.', 1412, 1, 403, 999999253);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (326, 'Laryngoscope Blades', 'A device that measures and displays the electrical activity of the heart.', 704, 1, 403, 999999208);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (327, 'Intravenous Cannulas', 'A device used to administer rescue breaths during cardiopulmonary resuscitation (CPR).', 289, 1, 419, 999999323);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (328, 'Intravenous Catheter', 'Devices that extract oxygen from the air and deliver it to patients via a nasal cannula or mask.', 150, 1, 422, 999999087);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (329, 'Disposable Gloves', 'Implants used to stabilize or repair fractured or damaged bones.', 1360, 0, 412, 999999220);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (330, 'Orthopedic Walker', 'Manual resuscitators used to provide positive pressure ventilation to patients.', 628, 0, 411, 999999039);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (331, 'Blood Pressure Cuff', 'Sets used to administer intravenous fluids or medication from IV bags to patients.', 166, 1, 418, 999999193);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (332, 'Intravenous Cannulas', 'Stretchers designed for use in ambulances for transporting patients.', 77, 0, 420, 999999385);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (333, 'Blood Collection Tubes', 'Stretchers designed for use in ambulances for transporting patients.', 107, 0, 422, 999999325);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (452, 'Medical Feeding Pumps', 'Gloves designed for single use to prevent contamination and infection.', 1464, 0, 410, 999999306);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (453, 'IV Start Kit', 'Devices used to stabilize and support fractured bones externally.', 246, 1, 419, 999999134);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (454, 'Orthopedic Implants', 'A mask used to deliver aerosolized medication to the lungs.', 170, 0, 419, 999999353);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (455, 'Nebulizer Mask', 'Circuits used to connect patients to mechanical ventilators for assisted breathing.', 1428, 1, 410, 999999186);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (456, 'IV Start Kit', 'A device used to remove mucus blood or other fluids from the body.', 588, 1, 409, 999999155);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (457, 'Chest Decompression Needles', 'Blades used for cutting through orthopedic casts during cast removal.', 1220, 1, 403, 999999343);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (458, 'Disinfectant Wipes', 'Canisters used to collect and dispose of suctioned fluids during medical procedures.', 77, 1, 419, 999999270);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (459, 'Tracheostomy Tubes', 'Swabs saturated with alcohol used to clean and disinfect the skin before injections or procedures.', 256, 0, 416, 999999315);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (460, 'Nasopharyngeal Airway', 'A medical instrument used to view the inside of the throat and larynx.', 124, 0, 419, 999999070);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (461, 'AED Training Unit', 'A kit containing supplies and equipment for administering basic first aid.', 656, 0, 403, 999999298);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (462, 'Disposable Bedpans', 'A device used to remove mucus blood or other fluids from the body.', 1476, 0, 417, 999999037);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (463, 'Laryngoscope Blades', 'Needles used for injections or drawing blood samples.', 880, 1, 404, 999999377);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (464, 'Epinephrine Auto-Injector', 'Devices specifically designed for managing pediatric airways during resuscitation.', 1312, 0, 407, 999999003);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (465, 'Orthopedic Implants', 'A medical device used to support a patient''s neck and head in cases of suspected spinal injuries.', 1540, 0, 403, 999999072);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (466, 'Orthopedic Splinting Materials', 'Devices that extract oxygen from the air and deliver it to patients via a nasal cannula or mask.', 332, 0, 420, 999999014);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (467, 'Enteral Feeding Tubes', 'A type of adhesive tape used to secure dressings or bandages in place.', 372, 1, 415, 999999238);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (468, 'Electrocardiogram (ECG) Machines', 'A device used to support a patient''s neck and head in cases of suspected cervical spine injuries.', 1504, 0, 403, 999999335);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (469, 'Backboard', 'Tubes inserted through the nose into the stomach for feeding or drainage.', 227, 0, 416, 999999196);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (470, 'Feeding Tube Extensions', 'A flat board used for immobilizing a patient with suspected spinal injuries.', 142, 1, 406, 999999082);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (471, 'Nasogastric Tubes', 'A device used to administer rescue breaths during cardiopulmonary resuscitation (CPR).', 340, 1, 414, 999999313);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (472, 'Electrocardiogram (ECG) Machines', 'Pouches used to hold and sterilize medical instruments and supplies.', 1056, 0, 403, 999999244);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (473, 'Medical Needles and Syringes', 'Thin tubes inserted into veins to administer fluids or medication.', 375, 1, 420, 999999231);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (474, 'Neck Brace', 'Pumps used to deliver nutrition or medications directly into the digestive tract.', 100, 0, 423, 999999116);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (475, 'Orthopedic Splinting Tools', 'Devices used to stabilize fractured bones internally with screws plates or rods.', 1248, 1, 403, 999999304);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (476, 'Oxygen Tank', 'A device used to immobilize and support fractures or injuries to the arms or legs.', 195, 1, 413, 999999081);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (477, 'Medical Oxygen Masks', 'Canisters used to collect and dispose of suctioned fluids during medical procedures.', 928, 0, 407, 999999339);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (478, 'Stretcher', 'A device used to immobilize and support fractures or injuries to the arms or legs.', 892, 1, 415, 999999381);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (479, 'Orthopedic Traction Devices', 'A device used to apply pressure to a limb or extremity in order to control bleeding.', 1400, 1, 407, 999999118);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (480, 'Disinfectant Wipes', 'Bags used to apply controlled pressure to intravenous fluids during rapid infusion.', 404, 1, 412, 546098765);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (481, 'Tracheostomy Tubes', 'Devices used to stabilize and support fractured bones externally.', 1412, 0, 407, 999999112);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (482, 'Medical Scales', 'A device used to measure the oxygen saturation of the blood.', 748, 1, 408, 999999218);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (483, 'Laryngeal Mask Airways', 'Tourniquets used to control severe bleeding from extremity wounds.', 368, 1, 405, 999999090);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (484, 'Suture Kit', 'A medical instrument used to view the inside of the throat and larynx.', 166, 1, 423, 999999097);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (485, 'Portable Defibrillators', 'A mask placed over the nose and mouth to deliver oxygen to the patient.', 440, 1, 408, 543456789);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (486, 'Portable Ultrasound Machines', 'A device used to administer a measured dose of epinephrine in cases of severe allergic reactions.', 279, 0, 420, 999999334);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (487, 'IV Start Kit', 'Materials used to immobilize and support fractures or injuries.', 284, 0, 423, 999999109);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (488, 'Intravenous Cannulas', 'Sets used to administer intravenous fluids or medication from IV bags to patients.', 120, 1, 418, 999999182);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (489, 'Nebulizer', 'A device used to immobilize and support fractures or injuries to the arms or legs.', 668, 0, 410, 999999333);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (490, 'Defibrillator pads', 'Kits containing supplies for cleaning and maintaining tracheostomy tubes.', 386, 1, 422, 999999101);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (491, 'Tracheostomy Tube Holders', 'Thin tubes inserted into veins to administer fluids or medication.', 564, 0, 421, 999999096);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (492, 'Backboard', 'Defibrillators designed for easy transport and use in various settings.', 688, 0, 408, 999999138);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (493, 'Enteral Feeding Tubes', 'A dressing used to cover and protect burns.', 756, 0, 409, 999999252);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (494, 'Blood Pressure Cuff', 'Devices used to warm intravenous fluids before administration to patients.', 334, 1, 420, 999999106);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (495, 'Neck Brace', 'A device that turns liquid medicine into a fine mist that can be inhaled into the lungs.', 752, 1, 415, 999999205);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (496, 'Orthopedic Tourniquet Systems', 'Devices used to warm intravenous fluids before administration to patients.', 213, 1, 416, 999999316);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (497, 'Airway Kit', 'Gloves designed for single use to prevent contamination and infection.', 1448, 0, 408, 999999199);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (498, 'Medical Tape', 'A device used to cover penetrating chest wounds and prevent air from entering the chest cavity.', 948, 0, 411, 999999116);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (499, 'Pediatric Airway Management Devices', 'Swabs saturated with alcohol used to clean and disinfect the skin before injections or procedures.', 1292, 0, 405, 999999331);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (500, 'Electrocardiogram (ECG) Machines', 'Bins used for the safe disposal of medical waste such as used needles syringes and dressings.', 656, 1, 403, 999999176);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (501, 'Orthopedic Tourniquet Systems', 'A device used to measure the concentration of glucose in the blood.', 556, 1, 409, 999999225);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (502, 'Ambu Bags', 'Gloves designed for single use to prevent contamination and infection.', 215, 1, 414, 999999242);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (503, 'Orthopedic Cast', 'A dressing designed to promote blood clotting and control bleeding.', 386, 0, 420, 999999155);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (504, 'Diagnostic Kits', 'A device used to administer rescue breaths during cardiopulmonary resuscitation (CPR).', 992, 1, 410, 999999128);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (505, 'Intravenous Infusion Pumps', 'A tank containing compressed oxygen for medical use.', 134, 1, 423, 999999389);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (506, 'Orthopedic Casting Materials', 'Kits containing tools and reagents for diagnosing specific medical conditions or infections.', 508, 1, 421, 541234567);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (507, 'Orthopedic Splinting Materials', 'Tools used to apply and shape splinting materials for orthopedic injuries.', 251, 0, 423, 999999138);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (508, 'IV Start Kit', 'A device used for immobilizing a fractured or injured bone.', 259, 0, 419, 999999022);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (509, 'Orthopedic Splinting Tools', 'Stands used to support bags of intravenous fluids during administration to patients.', 239, 0, 423, 999999078);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (510, 'Medical Traction Splints', 'A kit containing supplies and equipment for administering basic first aid.', 317, 0, 416, 999999054);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (511, 'Orthopedic External Fixators', 'A device used to administer rescue breaths during cardiopulmonary resuscitation (CPR).', 196, 0, 423, 999999183);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (512, 'Splint', 'A device used to measure the pressure of the blood in the arteries.', 964, 1, 403, 999999021);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (513, 'Cardiac Monitor', 'A kit containing instruments and materials for suturing wounds.', 245, 1, 422, 999999319);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (514, 'Laryngoscope', 'Kits containing tools and reagents for diagnosing specific medical conditions or infections.', 272, 1, 410, 999999045);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (515, 'Blood Collection Tubes', 'A device used to support and assist walking for patients with lower limb injuries or disabilities.', 888, 1, 407, 999999064);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (516, 'IV Fluid Warmers', 'Braces used to support and stabilize joints or limbs.', 186, 0, 413, 999999165);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (517, 'Orthopedic Casting Materials', 'A large sterile dressing used to cover extensive wounds or burns.', 1260, 0, 404, 999999068);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (518, 'Orthopedic Tourniquet Systems', 'A device used to immobilize and support fractures or injuries to the arms or legs.', 1512, 0, 415, 999999102);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (519, 'Oxygen Tank', 'Handheld devices used to measure blood pressure in clinical or home settings.', 1412, 0, 405, 543098765);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (520, 'Medical Cast Saw Blades', 'Thin tubes inserted into veins to administer fluids or medication.', 94, 1, 420, 999999271);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (521, 'Medical Suction Device', 'Materials used to create custom splints for immobilizing and supporting fractures or injuries.', 1268, 1, 407, 999999014);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (522, 'Burn Dressing', 'Braces used to support and stabilize joints or limbs.', 528, 1, 408, 999999065);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (523, 'Blood Collection Tubes', 'A flat board used for immobilizing a patient with suspected spinal injuries.', 652, 0, 411, 999999039);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (524, 'Ambu Bags', 'A dressing used to cover and protect burns.', 1512, 0, 411, 999999163);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (525, 'Tourniquet', 'A device used to apply pressure to a limb or extremity in order to control bleeding.', 1376, 1, 415, 999999352);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (526, 'IV Start Kit', 'A portable bed or litter for transporting patients.', 996, 0, 405, 999999176);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (527, 'Nasal Oxygen Cannulas', 'Implants used to stabilize or repair fractured or damaged bones.', 1148, 0, 408, 999999194);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (528, 'Medical Tourniquets', 'A device used to support and assist walking for patients with lower limb injuries or disabilities.', 1212, 1, 417, 999999235);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (529, 'Blood Pressure Cuff', 'Stretchers designed for use in ambulances for transporting patients.', 178, 0, 423, 999999335);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (530, 'Portable Ultrasound Machines', 'Materials used to create custom splints for immobilizing and supporting fractures or injuries.', 896, 0, 410, 999999068);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (531, 'Medical Tape', 'Splints used to stabilize and immobilize fractured femurs or lower limbs.', 900, 0, 411, 999999016);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (532, 'Tracheostomy Tubes', 'Medication used to relieve pain.', 372, 0, 404, 999999303);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (533, 'Intravenous Administration Sets', 'A sterile solution of salt in water used for various medical purposes.', 248, 1, 411, 545678901);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (534, 'Orthopedic Splinting Materials', 'A dressing used to cover and protect burns.', 1312, 1, 408, 999999137);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (535, 'Tracheostomy Tubes', 'Gloves worn by healthcare professionals to prevent contamination and protect against infection.', 61, 0, 419, 999999143);
commit;
prompt 200 records committed...
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (536, 'First Aid Kit', 'A thin tube inserted into a vein to administer fluids medication or blood products.', 146, 0, 406, 999999013);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (537, 'Ambu Bags', 'A device used to measure the pressure of the blood in the arteries.', 351, 0, 416, 999999342);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (538, 'Orthopedic Boots', 'Bandages with a sticky backing used to cover small wounds or hold dressings in place.', 183, 1, 416, 999999373);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (539, 'Hypodermic Needles', 'Forceps designed for removing splinters or foreign objects from the skin.', 260, 0, 415, 999999205);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (540, 'Nasal Oxygen Cannulas', 'A mask used to deliver aerosolized medication to the lungs.', 165, 1, 422, 547098765);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (541, 'Feeding Tube Extensions', 'Canisters used to collect and dispose of suctioned fluids during medical procedures.', 892, 1, 405, 999999051);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (542, 'Medical Gloves', 'Strips used with a glucose meter to test the level of glucose in the blood.', 1348, 0, 404, 999999354);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (543, 'Medical Suction Device', 'A device that measures and displays the electrical activity of the heart.', 137, 0, 422, 999999154);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (544, 'Portable Blood Pressure Monitors', 'Bags used to apply controlled pressure to intravenous fluids during rapid infusion.', 276, 0, 403, 999999067);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (545, 'Tracheostomy Tubes', 'A kit containing supplies and equipment for administering basic first aid.', 936, 0, 409, 543456789);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (546, 'Cardiac Defibrillator Training Units', 'Bins used for the safe disposal of medical waste such as used needles syringes and dressings.', 876, 1, 403, 999999382);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (547, 'Stretcher', 'Canisters used to collect and dispose of suctioned fluids during medical procedures.', 107, 1, 406, 999999072);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (548, 'Medical Oxygen Masks', 'A tank containing compressed oxygen for medical use.', 500, 0, 405, 999999246);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (549, 'Medical Cast Saw Blades', 'A training device used to simulate the operation of an automated external defibrillator.', 220, 0, 420, 999999140);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (550, 'Medical Tape', 'Sets of needles and syringes used for injections or aspirations.', 356, 0, 412, 999999091);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (551, 'Medical Oxygen Masks', 'A device used to cover penetrating chest wounds and prevent air from entering the chest cavity.', 880, 1, 417, 999999123);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (552, 'Orthopedic External Fixators', 'Systems used to apply and control pressure to extremities to control bleeding during surgery.', 824, 1, 410, 999999016);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (553, 'Orthopedic Casting Materials', 'Medication used to relieve pain.', 496, 1, 403, 999999339);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (554, 'Epinephrine Auto-Injector', 'Handheld devices used to measure blood pressure in clinical or home settings.', 1416, 1, 405, 999999250);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (555, 'Laryngeal Mask Airways', 'Splints used to stabilize and immobilize fractured femurs or lower limbs.', 608, 0, 412, 999999208);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (556, 'Hypodermic Needles', 'A device used to remove mucus blood or other fluids from the body.', 1180, 1, 415, 999999008);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (557, 'Diagnostic Kits', 'Devices specifically designed for managing pediatric airways during resuscitation.', 343, 0, 406, 999999285);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (558, 'Orthopedic Tourniquet Systems', 'Wipes saturated with disinfectant solution used to clean surfaces and equipment.', 1012, 1, 403, 544567890);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (559, 'Intravenous Cannulas', 'A type of adhesive tape used to secure dressings or bandages in place.', 776, 1, 415, 999999165);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (560, 'Laryngoscope Blades', 'Circuits used to connect patients to mechanical ventilators for assisted breathing.', 324, 0, 407, 999999300);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (561, 'Disposable Syringes', 'Tubes inserted into the digestive tract for delivering nutrition or medications.', 1120, 1, 404, 999999127);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (562, 'Medical Waste Bins', 'Devices used to deliver fluids medications or nutrients into the bloodstream at a controlled rate.', 194, 0, 406, 999999088);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (563, 'Medical Tape', 'A device that measures and displays the electrical activity of the heart.', 1252, 0, 408, 999999101);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (564, 'Laryngoscope', 'Defibrillators designed for easy transport and use in various settings.', 236, 1, 413, 999999296);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (565, 'Oxygen Mask', 'Tubes used for collecting and storing blood samples for laboratory testing.', 390, 1, 416, 999999335);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (566, 'Orthopedic Splint', 'A sterile solution of salt in water used for various medical purposes.', 572, 0, 421, 999999046);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (567, 'Orthopedic Splinting Tools', 'Devices inserted into the throat to maintain an open airway during anesthesia or resuscitation.', 386, 1, 414, 999999020);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (568, 'Medical Needles and Syringes', 'Gloves designed for single use to prevent contamination and infection.', 272, 1, 412, 999999157);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (570, 'Oxygen Tank', 'Circuits used to connect patients to mechanical ventilators for assisted breathing.', 355, 1, 419, 545098765);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (571, 'Medical Waste Bins', 'Masks used to deliver anesthesia gases or oxygen to patients during surgery or procedures.', 1160, 0, 407, 999999006);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (572, 'Tracheostomy Care Kits', 'A kit containing supplies and equipment for administering basic first aid.', 676, 0, 409, 999999114);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (573, 'Disposable Bedpans', 'Masks used to deliver anesthesia gases or oxygen to patients during surgery or procedures.', 1072, 0, 403, 999999199);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (574, 'Alcohol Swabs', 'Blades used for cutting through orthopedic casts during cast removal.', 528, 1, 411, 999999050);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (575, 'Hemostatic Dressing', 'A kit containing devices used to establish or maintain a patient''s airway.', 183, 1, 416, 999999107);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (576, 'Ambu Bags', 'Pouches used to hold and sterilize medical instruments and supplies.', 102, 1, 414, 999999108);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (577, 'Defibrillator pads', 'A flat board used for immobilizing a patient with suspected spinal injuries.', 166, 0, 413, 999999251);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (578, 'Disposable Bedpans', 'Catheters used to remove secretions and fluids from the airway.', 1008, 1, 421, 999999061);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (579, 'Nebulizer Mask', 'Tubes inserted into the digestive tract for delivering nutrition or medications.', 300, 0, 422, 999999359);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (580, 'Anesthesia Masks', 'A device used to cover penetrating chest wounds and prevent air from entering the chest cavity.', 190, 1, 413, 999999175);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (581, 'Nebulizer Mask', 'A type of adhesive tape used to secure dressings or bandages in place.', 1048, 1, 415, 999999070);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (582, 'Medical Traction Splints', 'Flexible tubes inserted into the bladder to drain urine.', 436, 1, 403, 999999015);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (583, 'Chest Decompression Needles', 'Devices used to stabilize and support fractured bones externally.', 285, 1, 423, 999999112);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (584, 'Laryngeal Mask Airways', 'A device used to measure the pressure of the blood in the arteries.', 424, 0, 411, 999999343);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (585, 'Medical Suction Device', 'Pads used with a defibrillator to deliver an electric shock to the heart.', 1464, 0, 415, 999999316);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (586, 'Cardiac Monitor', 'Tubes used for collecting and storing blood samples for laboratory testing.', 748, 1, 408, 999999025);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (587, 'Pulse Oximeter', 'Pumps used to deliver nutrition or medications directly into the digestive tract.', 353, 0, 413, 999999361);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (588, 'Epinephrine Auto-Injector', 'Devices used to record the electrical activity of the heart for diagnostic purposes.', 896, 0, 410, 999999049);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (589, 'Orthopedic Splinting Tools', 'Pumps used to deliver nutrition or medications directly into the digestive tract.', 311, 1, 413, 999999250);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (590, 'Pulse Oximeter', 'Medication used to relieve pain.', 948, 1, 408, 999999207);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (591, 'Orthopedic Implants', 'Stretchers designed for use in ambulances for transporting patients.', 1316, 1, 410, 999999043);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (592, 'Disposable Bedpans', 'Tubes inserted through the nose into the stomach for feeding or drainage.', 416, 1, 408, 999999337);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (593, 'Portable Oxygen Concentrators', 'Kits containing supplies for cleaning and maintaining tracheostomy tubes.', 160, 0, 423, 999999146);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (594, 'Ambu Bags', 'Devices used to stabilize and support fractured bones externally.', 129, 0, 414, 999999081);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (595, 'Portable Ultrasound Machines', 'A flat board used for immobilizing a patient with suspected spinal injuries.', 192, 1, 418, 999999265);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (596, 'Medical Gloves', 'Devices that extract oxygen from the air and deliver it to patients via a nasal cannula or mask.', 83, 0, 422, 999999249);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (597, 'Defibrillator pads', 'A device that measures and displays the electrical activity of the heart.', 1104, 1, 405, 999999150);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (598, 'Ambulance Stretchers', 'A kit containing devices used to establish or maintain a patient''s airway.', 134, 0, 406, 999999350);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (599, 'Blood Glucose Test Strips', 'Blades used for cutting through orthopedic casts during cast removal.', 584, 0, 412, 999999044);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (394, 'Cardiac Monitor', 'Extensions used to connect enteral feeding tubes to feeding pumps or syringes.', 1268, 0, 410, 999999357);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (395, 'Intravenous Drip Stands', 'Devices used to warm intravenous fluids before administration to patients.', 1320, 0, 410, 999999265);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (396, 'Tracheostomy Tubes', 'A device used to measure the concentration of glucose in the blood.', 380, 1, 419, 999999052);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (397, 'Medical Traction Splints', 'Devices used to warm intravenous fluids before administration to patients.', 90, 1, 419, 999999137);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (398, 'Orthopedic Internal Fixation Devices', 'Devices specifically designed for managing pediatric airways during resuscitation.', 588, 1, 407, 999999223);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (399, 'Ambulance Stretchers', 'A device used to immobilize and support fractures or injuries to the arms or legs.', 72, 0, 419, 999999385);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (400, 'Orthopedic External Fixators', 'A device used to assist or replace spontaneous breathing in patients.', 354, 1, 420, 999999227);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (401, 'Stretcher', 'Needles used for emergency decompression of tension pneumothorax.', 211, 0, 423, 999999125);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (402, 'Cardiac Monitor', 'Cannulas inserted into the nostrils to deliver oxygen to patients.', 1016, 0, 421, 999999248);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (403, 'Tracheostomy Care Kits', 'A kit containing supplies and equipment for administering basic first aid.', 1288, 1, 421, 999999211);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (404, 'Laryngoscope', 'A device used to measure the concentration of glucose in the blood.', 1448, 1, 415, 999999008);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (405, 'Defibrillator pads', 'Materials used to create custom splints for immobilizing and supporting fractures or injuries.', 1040, 0, 410, 999999197);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (406, 'Medical Sterilization Pouches', 'A training device used to simulate the operation of an automated external defibrillator.', 219, 0, 416, 999999004);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (407, 'Medical Sterilization Pouches', 'Pouches used to hold and sterilize medical instruments and supplies.', 404, 0, 404, 999999141);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (408, 'Pulse Oximeter', 'Masks used to deliver anesthesia gases or oxygen to patients during surgery or procedures.', 948, 1, 415, 999999358);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (409, 'Laryngoscope', 'Materials used to create custom splints for immobilizing and supporting fractures or injuries.', 364, 0, 420, 999999300);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (410, 'Orthopedic Braces', 'A training device used to simulate the operation of an automated external defibrillator.', 197, 1, 414, 999999271);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (411, 'Glucose Meter', 'Blades used for cutting through orthopedic casts during cast removal.', 327, 0, 418, 999999153);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (412, 'Portable Ventilator', 'A device that turns liquid medicine into a fine mist that can be inhaled into the lungs.', 300, 0, 419, 999999325);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (413, 'Medical Waste Bins', 'A device that turns liquid medicine into a fine mist that can be inhaled into the lungs.', 225, 0, 414, 999999251);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (414, 'Disposable Bedpans', 'Stands used to support bags of intravenous fluids during administration to patients.', 680, 1, 412, 999999163);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (415, 'Glucose Meter', 'Gloves worn by healthcare professionals to prevent contamination and protect against infection.', 289, 0, 419, 999999317);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (416, 'Orthopedic Braces', 'Braces used to support and stabilize joints or limbs.', 852, 0, 405, 999999175);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (417, 'Medical Ventilator Circuits', 'Devices specifically designed for managing pediatric airways during resuscitation.', 932, 1, 410, 999999206);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (418, 'Medical Waste Bins', 'A thin tube inserted into a vein to administer fluids medication or blood products.', 226, 0, 413, 999999310);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (419, 'Cervical Collar', 'Canisters used to collect and dispose of suctioned fluids during medical procedures.', 264, 0, 406, 999999193);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (420, 'First Aid Kit', 'A device inserted through the nose to maintain an open airway.', 176, 1, 416, 999999340);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (569, 'First Aid Kit', 'A large sterile dressing used to cover extensive wounds or burns.', 432, 1, 410, 999999073);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (449, 'Feeding Tube Extensions', 'A device that turns liquid medicine into a fine mist that can be inhaled into the lungs.', 860, 1, 408, 999999384);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (450, 'Intravenous Cannulas', 'Devices used to stabilize fractured bones internally with screws plates or rods.', 1544, 1, 410, 999999122);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (451, 'Portable Oxygen Concentrators', 'Pumps used to deliver nutrition or medications directly into the digestive tract.', 940, 1, 408, 999999010);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (421, 'Orthopedic Internal Fixation Devices', 'A device used to administer a measured dose of epinephrine in cases of severe allergic reactions.', 120, 1, 406, 999999029);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (422, 'Cervical Collar', 'Pads used with a defibrillator to deliver an electric shock to the heart.', 728, 0, 408, 999999240);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (423, 'Portable Oxygen Concentrators', 'Masks used to deliver oxygen to patients with respiratory conditions or emergencies.', 339, 1, 414, 999999010);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (424, 'Ambulance Stretchers', 'A dressing used to cover and protect burns.', 149, 1, 423, 999999290);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (425, 'Nasal Oxygen Cannulas', 'Masks used to deliver oxygen to patients with respiratory conditions or emergencies.', 468, 0, 403, 999999010);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (426, 'Laryngoscope Blades', 'Handheld ultrasound devices used for point-of-care diagnostics.', 936, 1, 415, 999999180);
commit;
prompt 300 records committed...
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (427, 'Splinter Forceps', 'A kit containing supplies and equipment for administering basic first aid.', 194, 0, 418, 999999325);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (428, 'Orthopedic Braces', 'A device used to remove mucus blood or other fluids from the body.', 400, 0, 421, 999999201);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (429, 'Electrocardiogram (ECG) Machines', 'A device used to immobilize and support fractures or injuries to the arms or legs.', 311, 1, 419, 999999087);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (430, 'Medical Suction Catheters', 'Bandages with a sticky backing used to cover small wounds or hold dressings in place.', 297, 1, 413, 999999331);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (431, 'Portable Ultrasound Machines', 'Masks used to deliver rescue breaths during CPR or respiratory emergencies.', 512, 0, 412, 999999172);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (432, 'Disinfectant Wipes', 'A kit containing devices used to establish or maintain a patient''s airway.', 1032, 0, 417, 999999085);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (433, 'Medical Waste Bins', 'Catheters used to remove secretions and fluids from the airway.', 748, 0, 412, 549098765);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (434, 'Urinary Catheters', 'A device used to measure the pressure of the blood in the arteries.', 1440, 1, 409, 999999062);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (435, 'Cervical Collar', 'Defibrillators designed for easy transport and use in various settings.', 396, 1, 408, 999999262);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (436, 'Cardiac Monitor', 'Gloves worn by healthcare professionals to prevent contamination and protect against infection.', 80, 0, 420, 999999071);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (437, 'Nasogastric Tubes', 'A device used to remove mucus blood or other fluids from the body.', 343, 1, 418, 544567890);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (438, 'Intravenous Cannulas', 'Flexible tubes inserted into the bladder to drain urine.', 784, 0, 421, 999999301);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (439, 'Backboard', 'Splints used to stabilize and immobilize fractured femurs or lower limbs.', 309, 0, 406, 999999154);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (440, 'Tracheostomy Tube Holders', 'A device that turns liquid medicine into a fine mist that can be inhaled into the lungs.', 820, 0, 415, 999999202);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (441, 'Disinfectant Wipes', 'Blades used with laryngoscopes for visualizing the larynx and inserting endotracheal tubes.', 90, 1, 419, 545098765);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (442, 'Blood Pressure Cuff', 'Materials used to create custom splints for immobilizing and supporting fractures or injuries.', 97, 1, 414, 999999121);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (443, 'Defibrillator pads', 'Devices used to warm intravenous fluids before administration to patients.', 130, 0, 414, 999999074);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (444, 'Disposable Syringes', 'A dressing used to cover and protect burns.', 129, 0, 420, 999999153);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (445, 'Medical Cast Saw Blades', 'Scales used to measure the weight of patients.', 800, 1, 417, 999999172);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (446, 'Oxygen Tank', 'Manual resuscitators used to provide positive pressure ventilation to patients.', 1160, 1, 415, 999999211);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (447, 'Intravenous Infusion Pumps', 'Defibrillators designed for easy transport and use in various settings.', 264, 0, 406, 541234567);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (448, 'Disposable Gloves', 'Circuits used to connect patients to mechanical ventilators for assisted breathing.', 832, 0, 417, 999999104);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (334, 'Disinfectant Wipes', 'A device used to immobilize and support fractures or injuries to the arms or legs.', 524, 0, 421, 999999346);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (335, 'Orthopedic Walker', 'Devices used to stabilize and support fractured bones externally.', 484, 0, 407, 999999008);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (336, 'Airway Kit', 'A mask placed over the nose and mouth to deliver oxygen to the patient.', 884, 0, 417, 999999263);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (337, 'Stretcher', 'Manual resuscitators used to provide positive pressure ventilation to patients.', 131, 1, 413, 999999029);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (338, 'Nebulizer Mask', 'Medication used to relieve pain.', 122, 1, 413, 999999280);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (339, 'Pressure Infusion Bags', 'Bins used for the safe disposal of medical waste such as used needles syringes and dressings.', 113, 1, 423, 999999033);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (340, 'Nebulizer Mask', 'Pads used with a defibrillator to deliver an electric shock to the heart.', 140, 0, 416, 999999217);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (341, 'Multi-Trauma Dressing', 'Stands used to support bags of intravenous fluids during administration to patients.', 1256, 0, 405, 999999248);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (342, 'Cardiac Defibrillator Training Units', 'Swabs saturated with alcohol used to clean and disinfect the skin before injections or procedures.', 1112, 1, 411, 999999128);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (343, 'Portable Ventilator', 'Bins used for the safe disposal of medical waste such as used needles syringes and dressings.', 117, 1, 419, 999999033);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (344, 'Disposable Bedpans', 'Pads used with a defibrillator to deliver an electric shock to the heart.', 1320, 1, 411, 999999326);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (345, 'AED Training Unit', 'A kit containing devices used to establish or maintain a patient''s airway.', 1552, 0, 421, 999999291);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (346, 'Orthopedic Walker', 'Masks used to deliver oxygen to patients with respiratory conditions or emergencies.', 436, 0, 421, 999999146);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (347, 'First Aid Kit', 'Kits containing tools and reagents for diagnosing specific medical conditions or infections.', 137, 1, 422, 999999058);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (348, 'Pulse Oximeter', 'Cannulas inserted into the nostrils to deliver oxygen to patients.', 284, 0, 405, 999999185);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (349, 'Medical Suction Canisters', 'A thin tube inserted into a vein to administer fluids medication or blood products.', 760, 0, 404, 999999245);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (350, 'Laryngoscope', 'A kit containing instruments and materials for suturing wounds.', 124, 0, 418, 999999133);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (351, 'Blood Glucose Test Strips', 'Blades used for cutting through orthopedic casts during cast removal.', 928, 0, 412, 999999133);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (352, 'Nebulizer', 'Devices used to secure tracheostomy tubes in place to prevent accidental removal.', 248, 0, 406, 999999383);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (353, 'Blood Pressure Cuff', 'Handheld ultrasound devices used for point-of-care diagnostics.', 432, 0, 415, 999999216);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (354, 'Medical Feeding Pumps', 'A device used to immobilize and support fractures or injuries to the arms or legs.', 136, 1, 416, 999999170);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (355, 'Multi-Trauma Dressing', 'A device used to measure the concentration of glucose in the blood.', 156, 0, 423, 999999070);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (356, 'Disinfectant Wipes', 'Medication used to relieve pain.', 245, 1, 422, 999999228);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (357, 'AED Training Unit', 'A device used to administer a measured dose of epinephrine in cases of severe allergic reactions.', 288, 0, 405, 999999107);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (358, 'Hemostatic Dressing', 'A device used to support a patient''s neck and head in cases of suspected cervical spine injuries.', 716, 1, 411, 999999036);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (359, 'Cervical Collar', 'Materials used to create custom splints for immobilizing and supporting fractures or injuries.', 167, 1, 420, 999999233);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (360, 'Splint', 'A device used to measure the oxygen saturation of the blood.', 150, 0, 418, 999999310);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (361, 'Saline Solution', 'Scales used to measure the weight of patients.', 1496, 0, 409, 999999340);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (362, 'Glucose Meter', 'Cannulas inserted into the nostrils to deliver oxygen to patients.', 784, 0, 412, 999999202);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (363, 'Medical Tape', 'Wipes saturated with disinfectant solution used to clean surfaces and equipment.', 1516, 1, 405, 999999380);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (364, 'Medical Tourniquets', 'Training devices used to simulate the operation of cardiac defibrillators.', 1336, 1, 421, 999999067);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (365, 'Ambu Bags', 'Materials used to create custom splints for immobilizing and supporting fractures or injuries.', 1468, 0, 415, 999999248);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (366, 'Intravenous Catheter', 'Needles used for injections or drawing blood samples.', 359, 0, 406, 999999278);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (367, 'Medical Tape', 'Kits containing supplies for cleaning and maintaining tracheostomy tubes.', 293, 1, 406, 999999270);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (368, 'Medical Waste Bins', 'A device used to apply pressure to a limb or extremity in order to control bleeding.', 1556, 1, 412, 999999193);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (369, 'Urinary Catheters', 'A kit containing instruments and materials for suturing wounds.', 1280, 0, 409, 999999291);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (370, 'Splint', 'Scales used to measure the weight of patients.', 362, 1, 419, 999999256);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (371, 'Cardiac Monitor', 'A rigid dressing used to immobilize and protect a broken bone or injured limb.', 668, 0, 410, 547098765);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (372, 'Intravenous Infusion Pumps', 'Wipes saturated with disinfectant solution used to clean surfaces and equipment.', 148, 0, 416, 999999054);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (373, 'Pediatric Airway Management Devices', 'Devices used to warm intravenous fluids before administration to patients.', 644, 0, 412, 999999291);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (374, 'Blood Collection Tubes', 'Devices used to apply traction to fractured or dislocated bones for alignment and stabilization.', 134, 0, 416, 999999039);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (375, 'Orthopedic Walker', 'Implants used to stabilize or repair fractured or damaged bones.', 266, 1, 423, 999999015);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (376, 'Nebulizer', 'Circuits used to connect patients to mechanical ventilators for assisted breathing.', 279, 0, 420, 999999349);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (377, 'Suture Kit', 'Thin tubes inserted into veins to administer fluids or medication.', 1512, 1, 403, 999999258);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (378, 'Nasopharyngeal Airway', 'Sets used to administer intravenous fluids or medication from IV bags to patients.', 230, 1, 406, 999999121);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (379, 'Cervical Collar', 'Disposable containers used for collecting urine and feces from bedridden patients.', 286, 1, 423, 999999118);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (380, 'Blood Glucose Test Strips', 'A device used to measure the concentration of glucose in the blood.', 366, 0, 418, 999999375);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (381, 'IV Fluid Warmers', 'Stands used to support bags of intravenous fluids during administration to patients.', 556, 1, 405, 999999119);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (382, 'Medical Suction Catheters', 'Stands used to support bags of intravenous fluids during administration to patients.', 1060, 1, 410, 999999136);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (383, 'Intravenous Cannulas', 'Pads used with a defibrillator to deliver an electric shock to the heart.', 1180, 0, 404, 999999119);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (384, 'AED Training Unit', 'A device used to administer a measured dose of epinephrine in cases of severe allergic reactions.', 178, 1, 416, 999999124);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (385, 'Oxygen Mask', 'Stretchers designed for use in ambulances for transporting patients.', 916, 0, 407, 541098765);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (386, 'Pediatric Airway Management Devices', 'Handheld devices used to measure blood pressure in clinical or home settings.', 344, 1, 419, 999999210);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (387, 'Splinting Materials', 'Canisters used to collect and dispose of suctioned fluids during medical procedures.', 202, 0, 418, 999999294);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (388, 'Oxygen Tank', 'Boots designed to immobilize and protect the foot and ankle.', 126, 1, 423, 999999260);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (389, 'Medical Tape', 'Devices inserted into the throat to maintain an open airway during anesthesia or resuscitation.', 832, 0, 408, 999999112);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (390, 'Pressure Infusion Bags', 'Sets of needles and syringes used for injections or aspirations.', 788, 1, 410, 999999176);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (391, 'Portable Defibrillators', 'Tourniquets used to control severe bleeding from extremity wounds.', 312, 0, 405, 999999299);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (392, 'Stretcher', 'A device used to measure the pressure of the blood in the arteries.', 274, 0, 413, 999999377);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (393, 'First Aid Kit', 'Bandages with a sticky backing used to cover small wounds or hold dressings in place.', 276, 1, 410, 999999225);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (42, 'Intravenous Catheter', 'A thin tube inserted into a vein to administer fluids medication or blood products.', 188, 0, 417, 999999028);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (43, 'Splinting Materials', 'Materials used to immobilize and support fractures or injuries.', 98, 1, 418, 999999360);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (44, 'Blood Glucose Test Strips', 'Strips used with a glucose meter to test the level of glucose in the blood.', 50, 0, 419, 999999380);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (45, 'Medical Suction Device', 'A device used to remove mucus blood or other fluids from the body.', 53, 1, 420, 999999099);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (46, 'Chest Seal', 'A device used to cover penetrating chest wounds and prevent air from entering the chest cavity.', 204, 0, 421, 999999000);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (47, 'Orthopedic Cast', 'A rigid dressing used to immobilize and protect a broken bone or injured limb.', 54, 1, 422, 999999009);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (48, 'Alcohol Swabs', 'Swabs saturated with alcohol used to clean and disinfect the skin before injections or procedures.', 110, 0, 423, 999999031);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (52, 'Splinter Forceps', 'Forceps designed for removing splinters or foreign objects from the skin.', 236, 0, 403, 999999167);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (53, 'IV Start Kit', 'A kit containing supplies for starting intravenous lines.', 232, 1, 404, 999999123);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (54, 'Portable Ventilator', 'A device used to assist or replace spontaneous breathing in patients.', 244, 0, 405, 999999178);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (55, 'Analgesic Medication', 'Medication used to relieve pain.', 120, 1, 406, 999999198);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (56, 'Hemostatic Dressing', 'A dressing designed to promote blood clotting and control bleeding.', 252, 0, 407, 999999116);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (57, 'Laryngoscope', 'A medical instrument used to view the inside of the throat and larynx.', 248, 1, 408, 999999023);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (58, 'Orthopedic Boots', 'Boots designed to immobilize and protect the foot and ankle.', 260, 0, 409, 999999378);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (59, 'Orthopedic Braces', 'Braces used to support and stabilize joints or limbs.', 256, 1, 410, 999999078);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (60, 'Disposable Gloves', 'Gloves designed for single use to prevent contamination and infection.', 268, 0, 411, 999999191);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (61, 'Orthopedic Walker', 'A device used to support and assist walking for patients with lower limb injuries or disabilities.', 264, 1, 412, 999999212);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (62, 'IV Fluid Warmers', 'Devices used to warm intravenous fluids before administration to patients.', 138, 0, 413, 999999100);
commit;
prompt 400 records committed...
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (63, 'Rescue Breathing Masks', 'Masks used to deliver rescue breaths during CPR or respiratory emergencies.', 68, 1, 414, 999999200);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (64, 'Disinfectant Wipes', 'Wipes saturated with disinfectant solution used to clean surfaces and equipment.', 284, 0, 415, 999999300);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (65, 'Diagnostic Kits', 'Kits containing tools and reagents for diagnosing specific medical conditions or infections.', 140, 1, 416, 999999301);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (66, 'Portable Ultrasound Machines', 'Handheld ultrasound devices used for point-of-care diagnostics.', 292, 0, 417, 999999201);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (67, 'Cardiac Defibrillator Training Units', 'Training devices used to simulate the operation of cardiac defibrillators.', 144, 1, 418, 999999202);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (68, 'Nasogastric Tubes', 'Tubes inserted through the nose into the stomach for feeding or drainage.', 75, 0, 419, 999999101);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (69, 'Orthopedic Splinting Materials', 'Materials used to create custom splints for immobilizing and supporting fractures or injuries.', 74, 1, 420, 999999103);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (70, 'Laryngeal Mask Airways', 'Devices inserted into the throat to maintain an open airway during anesthesia or resuscitation.', 308, 0, 421, 999999345);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (71, 'Ambu Bags', 'Manual resuscitators used to provide positive pressure ventilation to patients.', 76, 1, 422, 999999001);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (72, 'Hypodermic Needles', 'Needles used for injections or drawing blood samples.', 158, 0, 423, 999999111);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (76, 'Medical Tourniquets', 'Tourniquets used to control severe bleeding from extremity wounds.', 332, 0, 403, 999999002);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (77, 'Intravenous Cannulas', 'Thin tubes inserted into veins to administer fluids or medication.', 328, 1, 404, 999999003);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (4, 'Oxygen Mask', 'A mask placed over the nose and mouth to deliver oxygen to the patient.', 120, 0, 403, 999999000);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (6, 'Cardiac Monitor', 'A device that measures and displays the electrical activity of the heart.', 192, 0, 405, 999999200);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (8, 'Backboard', 'A flat board used for immobilizing a patient with suspected spinal injuries.', 176, 0, 407, 999999360);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (9, 'Splint', 'A device used for immobilizing a fractured or injured bone.', 112, 1, 408, 999999210);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (10, 'Tourniquet', 'A device used to apply pressure to a limb or extremity in order to control bleeding.', 140, 0, 409, 999999070);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (11, 'Neck Brace', 'A medical device used to support a patient''s neck and head in cases of suspected spinal injuries.', 136, 1, 410, 999999023);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (12, 'Nebulizer', 'A device that turns liquid medicine into a fine mist that can be inhaled into the lungs.', 112, 0, 411, 999999009);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (14, 'Blood Pressure Cuff', 'A device used to measure the pressure of the blood in the arteries.', 32, 0, 413, 999999100);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (15, 'Suture Kit', 'A kit containing instruments and materials for suturing wounds.', 11, 1, 414, 999999029);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (16, 'Orthopedic Splint', 'A device used to immobilize and support fractures or injuries to the arms or legs.', 152, 0, 415, 999999300);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (17, 'Glucose Meter', 'A device used to measure the concentration of glucose in the blood.', 18, 1, 416, 999999000);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (18, 'Epinephrine Auto-Injector', 'A device used to administer a measured dose of epinephrine in cases of severe allergic reactions.', 112, 0, 417, 999999002);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (19, 'Burn Dressing', 'A dressing used to cover and protect burns.', 46, 1, 418, 999999233);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (20, 'Defibrillator pads', 'Pads used with a defibrillator to deliver an electric shock to the heart.', 13, 0, 419, 999999008);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (21, 'Oxygen Tank', 'A tank containing compressed oxygen for medical use.', 24, 1, 420, 999999110);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (22, 'Airway Kit', 'A kit containing devices used to establish or maintain a patient''s airway.', 168, 0, 421, 999999112);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (24, 'Pulse Oximeter', 'A device used to measure the oxygen saturation of the blood.', 52, 0, 423, 999999231);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (28, 'Nasopharyngeal Airway', 'A device inserted through the nose to maintain an open airway.', 132, 0, 403, 999999099);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (29, 'Medical Gloves', 'Gloves worn by healthcare professionals to prevent contamination and protect against infection.', 152, 1, 404, 999999100);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (30, 'Adhesive Bandages', 'Bandages with a sticky backing used to cover small wounds or hold dressings in place.', 136, 0, 405, 999999080);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (31, 'Saline Solution', 'A sterile solution of salt in water used for various medical purposes.', 72, 1, 406, 999999015);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (32, 'Cervical Collar', 'A device used to support a patient''s neck and head in cases of suspected cervical spine injuries.', 156, 0, 407, 999999001);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (33, 'Multi-Trauma Dressing', 'A large sterile dressing used to cover extensive wounds or burns.', 168, 1, 408, 999999009);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (34, 'Nebulizer Mask', 'A mask used to deliver aerosolized medication to the lungs.', 116, 0, 409, 999999020);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (35, 'Stretcher', 'A portable bed or litter for transporting patients.', 172, 1, 410, 999999031);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (36, 'CPR Mask', 'A device used to administer rescue breaths during cardiopulmonary resuscitation (CPR).', 108, 0, 411, 999999333);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (37, 'First Aid Kit', 'A kit containing supplies and equipment for administering basic first aid.', 184, 1, 412, 999999321);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (38, 'Blood Collection Tubes', 'Tubes used for collecting and storing blood samples for laboratory testing.', 82, 0, 413, 999999210);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (39, 'Disposable Syringes', 'Syringes designed for single use to administer medication or draw blood.', 44, 1, 414, 999999111);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (40, 'Medical Tape', 'A type of adhesive tape used to secure dressings or bandages in place.', 180, 0, 415, 999999222);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (41, 'AED Training Unit', 'A training device used to simulate the operation of an automated external defibrillator.', 96, 1, 416, 999999129);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (78, 'Tracheostomy Tubes', 'Tubes inserted into a surgically created opening in the trachea to assist breathing.', 340, 0, 405, 999999006);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (79, 'Portable Oxygen Concentrators', 'Devices that extract oxygen from the air and deliver it to patients via a nasal cannula or mask.', 168, 1, 406, 999999007);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (80, 'Electrocardiogram (ECG) Machines', 'Devices used to record the electrical activity of the heart for diagnostic purposes.', 348, 0, 407, 999999011);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (81, 'Medical Scales', 'Scales used to measure the weight of patients.', 344, 1, 408, 999999013);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (82, 'Pediatric Airway Management Devices', 'Devices specifically designed for managing pediatric airways during resuscitation.', 356, 0, 409, 999999019);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (83, 'Medical Suction Catheters', 'Catheters used to remove secretions and fluids from the airway.', 352, 1, 410, 999999021);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (84, 'Orthopedic Casting Materials', 'Materials used to create casts for immobilizing and supporting fractures or injuries.', 364, 0, 411, 999999322);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (85, 'Nasal Oxygen Cannulas', 'Cannulas inserted into the nostrils to deliver oxygen to patients.', 360, 1, 412, 999999232);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (87, 'Ambulance Stretchers', 'Stretchers designed for use in ambulances for transporting patients.', 92, 1, 414, 999999033);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (88, 'Intravenous Drip Stands', 'Stands used to support bags of intravenous fluids during administration to patients.', 380, 0, 415, 999999003);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (89, 'Medical Ventilator Circuits', 'Circuits used to connect patients to mechanical ventilators for assisted breathing.', 188, 1, 416, 999999001);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (90, 'Orthopedic Splinting Tools', 'Tools used to apply and shape splinting materials for orthopedic injuries.', 388, 0, 417, 999999002);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (91, 'Medical Needles and Syringes', 'Sets of needles and syringes used for injections or aspirations.', 192, 1, 418, 999999000);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (92, 'Portable Blood Pressure Monitors', 'Handheld devices used to measure blood pressure in clinical or home settings.', 99, 0, 419, 999999000);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (93, 'Enteral Feeding Tubes', 'Tubes inserted into the digestive tract for delivering nutrition or medications.', 98, 1, 420, 999999012);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (94, 'Medical Oxygen Masks', 'Masks used to deliver oxygen to patients with respiratory conditions or emergencies.', 404, 0, 421, 999999370);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (95, 'Chest Decompression Needles', 'Needles used for emergency decompression of tension pneumothorax.', 100, 1, 422, 999999160);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (96, 'Intravenous Infusion Pumps', 'Devices used to deliver fluids medications or nutrients into the bloodstream at a controlled rate.', 103, 0, 423, 999999122);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (101, 'Portable Defibrillators', 'Defibrillators designed for easy transport and use in various settings.', 424, 1, 404, 999999111);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (102, 'Disposable Bedpans', 'Disposable containers used for collecting urine and feces from bedridden patients.', 436, 0, 405, 999999089);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (103, 'Orthopedic External Fixators', 'Devices used to stabilize and support fractured bones externally.', 108, 1, 406, 999999060);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (104, 'Medical Cast Saw Blades', 'Blades used for cutting through orthopedic casts during cast removal.', 444, 0, 407, 999999033);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (105, 'Medical Feeding Pumps', 'Pumps used to deliver nutrition or medications directly into the digestive tract.', 440, 1, 408, 999999011);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (106, 'Pressure Infusion Bags', 'Bags used to apply controlled pressure to intravenous fluids during rapid infusion.', 452, 0, 409, 999999090);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (107, 'Laryngoscope Blades', 'Blades used with laryngoscopes for visualizing the larynx and inserting endotracheal tubes.', 448, 1, 410, 999999098);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (108, 'Orthopedic Traction Devices', 'Devices used to apply traction to fractured or dislocated bones for alignment and stabilization.', 460, 0, 411, 999999099);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (110, 'Urinary Catheters', 'Flexible tubes inserted into the bladder to drain urine.', 117, 0, 413, 999999101);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (111, 'Medical Sterilization Pouches', 'Pouches used to hold and sterilize medical instruments and supplies.', 116, 1, 414, 999999000);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (112, 'Anesthesia Masks', 'Masks used to deliver anesthesia gases or oxygen to patients during surgery or procedures.', 476, 0, 415, 999999117);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (113, 'Orthopedic Implants', 'Implants used to stabilize or repair fractured or damaged bones.', 118, 1, 416, 999999088);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (114, 'Medical Traction Splints', 'Splints used to stabilize and immobilize fractured femurs or lower limbs.', 484, 0, 417, 999999121);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (115, 'Feeding Tube Extensions', 'Extensions used to connect enteral feeding tubes to feeding pumps or syringes.', 120, 1, 418, 999999120);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (116, 'Tracheostomy Care Kits', 'Kits containing supplies for cleaning and maintaining tracheostomy tubes.', 123, 0, 419, 999999032);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (117, 'Medical Suction Canisters', 'Canisters used to collect and dispose of suctioned fluids during medical procedures.', 122, 1, 420, 999999019);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (118, 'Orthopedic Tourniquet Systems', 'Systems used to apply and control pressure to extremities to control bleeding during surgery.', 500, 0, 421, 999999022);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (124, 'Medical Waste Bins', 'Bins used for the safe disposal of medical waste such as used needles syringes and dressings.', 524, 0, 403, 999999027);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (125, 'Tracheostomy Tube Holders', 'Devices used to secure tracheostomy tubes in place to prevent accidental removal.', 520, 1, 404, 999999028);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (127, 'Orthopedic Internal Fixation Devices', 'Devices used to stabilize fractured bones internally with screws plates or rods.', 132, 1, 406, 999999030);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (128, 'Intravenous Administration Sets', 'Sets used to administer intravenous fluids or medication from IV bags to patients.', 540, 0, 407, 999999031);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (200, 'Oxygen Tank', 'A kit containing supplies and equipment for administering basic first aid.', 260, 0, 421, 999999317);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (201, 'Tracheostomy Tubes', 'A thin tube inserted into a vein to administer fluids medication or blood products.', 368, 0, 422, 999999330);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (202, 'Intravenous Cannulas', 'Needles used for injections or drawing blood samples.', 160, 0, 418, 999999331);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (203, 'Medical Needles and Syringes', 'Devices specifically designed for managing pediatric airways during resuscitation.', 126, 1, 423, 999999379);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (204, 'Epinephrine Auto-Injector', 'Devices used to apply traction to fractured or dislocated bones for alignment and stabilization.', 145, 1, 406, 999999351);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (205, 'Orthopedic External Fixators', 'A device used to apply pressure to a limb or extremity in order to control bleeding.', 1464, 1, 411, 999999305);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (206, 'Tracheostomy Care Kits', 'A device used to immobilize and support fractures or injuries to the arms or legs.', 992, 1, 412, 999999083);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (207, 'Feeding Tube Extensions', 'Materials used to immobilize and support fractures or injuries.', 261, 0, 423, 999999140);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (208, 'Tracheostomy Tubes', 'A device used for immobilizing a fractured or injured bone.', 700, 0, 412, 999999068);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (209, 'Pressure Infusion Bags', 'A medical instrument used to view the inside of the throat and larynx.', 832, 0, 415, 545098765);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (210, 'Blood Collection Tubes', 'Devices used to record the electrical activity of the heart for diagnostic purposes.', 888, 0, 410, 999999238);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (211, 'Intravenous Administration Sets', 'Devices used to stabilize fractured bones internally with screws plates or rods.', 584, 1, 403, 999999036);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (212, 'Medical Suction Catheters', 'Defibrillators designed for easy transport and use in various settings.', 97, 0, 414, 999999072);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (213, 'Feeding Tube Extensions', 'Medication used to relieve pain.', 104, 1, 419, 999999281);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (214, 'Cervical Collar', 'Devices used to record the electrical activity of the heart for diagnostic purposes.', 206, 0, 414, 999999258);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (215, 'Orthopedic Splint', 'Masks used to deliver anesthesia gases or oxygen to patients during surgery or procedures.', 1460, 0, 409, 999999000);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (216, 'AED Training Unit', 'Handheld ultrasound devices used for point-of-care diagnostics.', 992, 1, 404, 999999122);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (217, 'Nasopharyngeal Airway', 'A type of adhesive tape used to secure dressings or bandages in place.', 636, 0, 407, 999999230);
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
commit;
prompt 300 records committed...
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
commit;
prompt 400 records committed...
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
prompt 435 records loaded
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
commit;
prompt 401 records loaded
prompt Enabling foreign key constraints for ITEM...
alter table ITEM enable constraint SYS_C00717208;
prompt Enabling foreign key constraints for DONATION...
alter table DONATION enable constraint SYS_C00717214;
alter table DONATION enable constraint SYS_C00717215;
prompt Enabling foreign key constraints for MAINTENANCE...
alter table MAINTENANCE enable constraint SYS_C00717221;
prompt Enabling foreign key constraints for OPERATION...
alter table OPERATION enable constraint SYS_C00717229;
alter table OPERATION enable constraint SYS_C00717230;
prompt Enabling triggers for CATEGORY...
alter table CATEGORY enable all triggers;
prompt Enabling triggers for DONOR...
alter table DONOR enable all triggers;
prompt Enabling triggers for LOCATION...
alter table LOCATION enable all triggers;
prompt Enabling triggers for ITEM...
alter table ITEM enable all triggers;
prompt Enabling triggers for DONATION...
alter table DONATION enable all triggers;
prompt Enabling triggers for MAINTENANCE...
alter table MAINTENANCE enable all triggers;
prompt Enabling triggers for OPERATOR...
alter table OPERATOR enable all triggers;
prompt Enabling triggers for OPERATION...
alter table OPERATION enable all triggers;

set feedback on
set define on
prompt Done
