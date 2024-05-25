prompt Creating CATEGORY...
create table CATEGORY
(
  categoryid     NUMBER(10) not null,
  name           VARCHAR2(100) not null,
  emergencylevel NUMBER not null
)
alter table CATEGORY
  add primary key (CATEGORYID);

prompt Creating DONOR...
create table DONOR
(
  donorid     NUMBER(10) not null,
  name        VARCHAR2(100) not null,
  isactive    CHAR(1) not null,
  designation VARCHAR2(100) not null
)
;
alter table DONOR
  add primary key (DONORID);

prompt Creating LOCATION...
create table LOCATION
(
  phonenumber  NUMBER(10) not null,
  address      VARCHAR2(100) not null,
  instructions VARCHAR2(100) not null
);
alter table LOCATION
  add primary key (PHONENUMBER);

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
;
alter table ITEM
  add primary key (ITEMID);
alter table ITEM
  add foreign key (CATEGORYID)
  references CATEGORY (CATEGORYID);
alter table ITEM
  add foreign key (PHONENUMBER)
  references LOCATION (PHONENUMBER);

prompt Creating DONATION...
create table DONATION
(
  donationid   NUMBER not null,
  donationdate DATE not null,
  itemid       NUMBER not null,
  donorid      NUMBER not null
);
alter table DONATION
  add primary key (DONATIONID);
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
);
alter table MAINTENANCE
  add primary key (MAINTENANCEID);
alter table MAINTENANCE
  add foreign key (ITEMID)
  references ITEM (ITEMID);

prompt Creating OPERATOR...
create table OPERATOR
(
  operatorid     NUMBER(10) not null,
  name           VARCHAR2(100) not null,
  expirationdate DATE not null
);
alter table OPERATOR
  add primary key (OPERATORID);

prompt Creating OPERATION...
create table OPERATION
(
  itemid     NUMBER not null,
  operatorid NUMBER not null
);
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
alter table ITEM disable constraint SYS_C00707451;
alter table ITEM disable constraint SYS_C00707452;
prompt Disabling foreign key constraints for DONATION...
alter table DONATION disable constraint SYS_C00707469;
alter table DONATION disable constraint SYS_C00707470;
prompt Disabling foreign key constraints for MAINTENANCE...
alter table MAINTENANCE disable constraint SYS_C00707458;
prompt Disabling foreign key constraints for OPERATION...
alter table OPERATION disable constraint SYS_C00707462;
alter table OPERATION disable constraint SYS_C00707463;
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
values (359, 'BustaHartnett', 'y', 'For the memory of the family -Hartnett');
insert into DONOR (donorid, name, isactive, designation)
values (360, 'BernardMiller', 'y', 'For the memory of the family -Miller');
insert into DONOR (donorid, name, isactive, designation)
values (361, 'AidanKline', 'n', 'For the memory of the family -Kline');
insert into DONOR (donorid, name, isactive, designation)
values (362, 'SallyFreeman', 'n', 'For the memory of the family -Freeman');
insert into DONOR (donorid, name, isactive, designation)
values (363, 'JoannaZellweger', 'n', 'For the memory of the family -Zellweger');
insert into DONOR (donorid, name, isactive, designation)
values (364, 'MickeyLaws', 'n', 'For the memory of the family -Laws');
insert into DONOR (donorid, name, isactive, designation)
values (365, 'PaulaLlewelyn', 'y', 'For the memory of the family -Llewelyn');
insert into DONOR (donorid, name, isactive, designation)
values (366, 'GuyFarrow', 'n', 'For the memory of the family -Farrow');
insert into DONOR (donorid, name, isactive, designation)
values (367, 'KimGreenwood', 'y', 'For the memory of the family -Greenwood');
insert into DONOR (donorid, name, isactive, designation)
values (368, 'UdoDalley', 'y', 'For the memory of the family -Dalley');
insert into DONOR (donorid, name, isactive, designation)
values (369, 'ElizaPearce', 'y', 'For the memory of the family -Pearce');
insert into DONOR (donorid, name, isactive, designation)
values (370, 'MaggiePreston', 'n', 'For the memory of the family -Preston');
insert into DONOR (donorid, name, isactive, designation)
values (371, 'LarnelleThomas', 'n', 'For the memory of the family -Thomas');
insert into DONOR (donorid, name, isactive, designation)
values (372, 'MikoReiner', 'n', 'For the memory of the family -Reiner');
insert into DONOR (donorid, name, isactive, designation)
values (373, 'AliciaTempest', 'y', 'For the memory of the family -Tempest');
insert into DONOR (donorid, name, isactive, designation)
values (374, 'FatsFurtado', 'n', 'For the memory of the family -Furtado');
insert into DONOR (donorid, name, isactive, designation)
values (375, 'JefferyLiotta', 'n', 'For the memory of the family -Liotta');
insert into DONOR (donorid, name, isactive, designation)
values (376, 'BrentD''Onofrio', 'y', 'For the memory of the family -D''Onofrio');
insert into DONOR (donorid, name, isactive, designation)
values (377, 'DaveyBailey', 'y', 'For the memory of the family -Bailey');
insert into DONOR (donorid, name, isactive, designation)
values (378, 'HexStrathairn', 'n', 'For the memory of the family -Strathairn');
insert into DONOR (donorid, name, isactive, designation)
values (379, 'AlexMcNarland', 'n', 'For the memory of the family -McNarland');
insert into DONOR (donorid, name, isactive, designation)
values (380, 'HiltonSweet', 'y', 'For the memory of the family -Sweet');
insert into DONOR (donorid, name, isactive, designation)
values (381, 'AnnieTyson', 'y', 'For the memory of the family -Tyson');
insert into DONOR (donorid, name, isactive, designation)
values (382, 'DebbyCornell', 'y', 'For the memory of the family -Cornell');
insert into DONOR (donorid, name, isactive, designation)
values (383, 'CleaStatham', 'y', 'For the memory of the family -Statham');
insert into DONOR (donorid, name, isactive, designation)
values (384, 'MikeShannon', 'y', 'For the memory of the family -Shannon');
insert into DONOR (donorid, name, isactive, designation)
values (385, 'SusanCrosby', 'n', 'For the memory of the family -Crosby');
insert into DONOR (donorid, name, isactive, designation)
values (386, 'PercyAiken', 'y', 'For the memory of the family -Aiken');
insert into DONOR (donorid, name, isactive, designation)
values (387, 'AshleyGracie', 'n', 'For the memory of the family -Gracie');
insert into DONOR (donorid, name, isactive, designation)
values (388, 'DaveChao', 'y', 'For the memory of the family -Chao');
insert into DONOR (donorid, name, isactive, designation)
values (389, 'JosephFerrer', 'n', 'For the memory of the family -Ferrer');
insert into DONOR (donorid, name, isactive, designation)
values (390, 'NanciWong', 'n', 'For the memory of the family -Wong');
insert into DONOR (donorid, name, isactive, designation)
values (391, 'EdwinHarris', 'y', 'For the memory of the family -Harris');
insert into DONOR (donorid, name, isactive, designation)
values (392, 'PamSanta Rosa', 'n', 'For the memory of the family -Santa Rosa');
insert into DONOR (donorid, name, isactive, designation)
values (393, 'BelindaGuinness', 'n', 'For the memory of the family -Guinness');
insert into DONOR (donorid, name, isactive, designation)
values (394, 'NoraMerchant', 'n', 'For the memory of the family -Merchant');
insert into DONOR (donorid, name, isactive, designation)
values (395, 'AniHouston', 'n', 'For the memory of the family -Houston');
insert into DONOR (donorid, name, isactive, designation)
values (396, 'JoannaLinney', 'n', 'For the memory of the family -Linney');
insert into DONOR (donorid, name, isactive, designation)
values (397, 'MitchellDay-Lewis', 'n', 'For the memory of the family -Day-Lewis');
insert into DONOR (donorid, name, isactive, designation)
values (398, 'NaomiBurmester', 'y', 'For the memory of the family -Burmester');
insert into DONOR (donorid, name, isactive, designation)
values (399, 'JenaBrooks', 'n', 'For the memory of the family -Brooks');
insert into DONOR (donorid, name, isactive, designation)
values (400, 'HalleSaxon', 'n', 'For the memory of the family -Saxon');
insert into DONOR (donorid, name, isactive, designation)
values (401, 'DaryleDunn', 'y', 'For the memory of the family -Dunn');
insert into DONOR (donorid, name, isactive, designation)
values (402, 'RascalIngram', 'y', 'For the memory of the family -Ingram');
insert into DONOR (donorid, name, isactive, designation)
values (3, 'KurtVance', 'n', 'For the memory of the family -Vance');
insert into DONOR (donorid, name, isactive, designation)
values (4, 'AidaDooley', 'y', 'For the memory of the family -Dooley');
insert into DONOR (donorid, name, isactive, designation)
values (5, 'FranzBenet', 'y', 'For the memory of the family -Benet');
insert into DONOR (donorid, name, isactive, designation)
values (6, 'GenaKelly', 'y', 'For the memory of the family -Kelly');
insert into DONOR (donorid, name, isactive, designation)
values (7, 'LoisMazzello', 'n', 'For the memory of the family -Mazzello');
insert into DONOR (donorid, name, isactive, designation)
values (8, 'LorenEnglish', 'n', 'For the memory of the family -English');
insert into DONOR (donorid, name, isactive, designation)
values (9, 'IceMasur', 'y', 'For the memory of the family -Masur');
insert into DONOR (donorid, name, isactive, designation)
values (10, 'OrlandoPlayboys', 'y', 'For the memory of the family -Playboys');
insert into DONOR (donorid, name, isactive, designation)
values (11, 'JohnnySwank', 'n', 'For the memory of the family -Swank');
insert into DONOR (donorid, name, isactive, designation)
values (12, 'AngelinaDawson', 'y', 'For the memory of the family -Dawson');
insert into DONOR (donorid, name, isactive, designation)
values (13, 'MurrayDiCaprio', 'y', 'For the memory of the family -DiCaprio');
insert into DONOR (donorid, name, isactive, designation)
values (14, 'MarcCalle', 'n', 'For the memory of the family -Calle');
insert into DONOR (donorid, name, isactive, designation)
values (15, 'RickieHerndon', 'y', 'For the memory of the family -Herndon');
insert into DONOR (donorid, name, isactive, designation)
values (16, 'Mary-LouiseWeisz', 'n', 'For the memory of the family -Weisz');
insert into DONOR (donorid, name, isactive, designation)
values (17, 'SaraHanley', 'y', 'For the memory of the family -Hanley');
insert into DONOR (donorid, name, isactive, designation)
values (18, 'JoannaBenet', 'y', 'For the memory of the family -Benet');
insert into DONOR (donorid, name, isactive, designation)
values (19, 'JasonPollack', 'y', 'For the memory of the family -Pollack');
insert into DONOR (donorid, name, isactive, designation)
values (20, 'LesleyBeckham', 'y', 'For the memory of the family -Beckham');
insert into DONOR (donorid, name, isactive, designation)
values (21, 'NormSharp', 'n', 'For the memory of the family -Sharp');
insert into DONOR (donorid, name, isactive, designation)
values (22, 'DianeLi', 'y', 'For the memory of the family -Li');
insert into DONOR (donorid, name, isactive, designation)
values (23, 'JacksonHerrmann', 'n', 'For the memory of the family -Herrmann');
insert into DONOR (donorid, name, isactive, designation)
values (24, 'ChiOrton', 'y', 'For the memory of the family -Orton');
insert into DONOR (donorid, name, isactive, designation)
values (25, 'HilaryTaha', 'n', 'For the memory of the family -Taha');
insert into DONOR (donorid, name, isactive, designation)
values (26, 'MosBoone', 'y', 'For the memory of the family -Boone');
insert into DONOR (donorid, name, isactive, designation)
values (27, 'DanniYorn', 'n', 'For the memory of the family -Yorn');
insert into DONOR (donorid, name, isactive, designation)
values (28, 'ArtLillard', 'y', 'For the memory of the family -Lillard');
insert into DONOR (donorid, name, isactive, designation)
values (29, 'JeroenFarrow', 'n', 'For the memory of the family -Farrow');
insert into DONOR (donorid, name, isactive, designation)
values (30, 'HeathShaye', 'n', 'For the memory of the family -Shaye');
insert into DONOR (donorid, name, isactive, designation)
values (31, 'RonnySupernaw', 'y', 'For the memory of the family -Supernaw');
insert into DONOR (donorid, name, isactive, designation)
values (32, 'HenrySellers', 'y', 'For the memory of the family -Sellers');
insert into DONOR (donorid, name, isactive, designation)
values (33, 'CeCeBrock', 'n', 'For the memory of the family -Brock');
insert into DONOR (donorid, name, isactive, designation)
values (34, 'AngelinaFlatts', 'y', 'For the memory of the family -Flatts');
insert into DONOR (donorid, name, isactive, designation)
values (35, 'AngieEnglund', 'n', 'For the memory of the family -Englund');
insert into DONOR (donorid, name, isactive, designation)
values (36, 'VernColtrane', 'n', 'For the memory of the family -Coltrane');
insert into DONOR (donorid, name, isactive, designation)
values (37, 'LivNewman', 'y', 'For the memory of the family -Newman');
insert into DONOR (donorid, name, isactive, designation)
values (38, 'MauryKaryo', 'n', 'For the memory of the family -Karyo');
insert into DONOR (donorid, name, isactive, designation)
values (39, 'LynetteChristie', 'n', 'For the memory of the family -Christie');
insert into DONOR (donorid, name, isactive, designation)
values (40, 'JohnMcClinton', 'y', 'For the memory of the family -McClinton');
insert into DONOR (donorid, name, isactive, designation)
values (41, 'ThinLawrence', 'y', 'For the memory of the family -Lawrence');
insert into DONOR (donorid, name, isactive, designation)
values (42, 'ManuMagnuson', 'n', 'For the memory of the family -Magnuson');
insert into DONOR (donorid, name, isactive, designation)
values (43, 'HalChinlund', 'y', 'For the memory of the family -Chinlund');
insert into DONOR (donorid, name, isactive, designation)
values (44, 'MichaelFraser', 'n', 'For the memory of the family -Fraser');
insert into DONOR (donorid, name, isactive, designation)
values (45, 'LenaHedaya', 'n', 'For the memory of the family -Hedaya');
insert into DONOR (donorid, name, isactive, designation)
values (46, 'BarbaraCage', 'n', 'For the memory of the family -Cage');
insert into DONOR (donorid, name, isactive, designation)
values (47, 'LarnelleMadsen', 'n', 'For the memory of the family -Madsen');
insert into DONOR (donorid, name, isactive, designation)
values (48, 'KellyTolkan', 'y', 'For the memory of the family -Tolkan');
insert into DONOR (donorid, name, isactive, designation)
values (49, 'EllenChanning', 'n', 'For the memory of the family -Channing');
insert into DONOR (donorid, name, isactive, designation)
values (50, 'ToshiroTah', 'y', 'For the memory of the family -Tah');
insert into DONOR (donorid, name, isactive, designation)
values (51, 'RupertCrosby', 'y', 'For the memory of the family -Crosby');
insert into DONOR (donorid, name, isactive, designation)
values (52, 'JoyBailey', 'y', 'For the memory of the family -Bailey');
insert into DONOR (donorid, name, isactive, designation)
values (53, 'KaseyMcDiarmid', 'y', 'For the memory of the family -McDiarmid');
insert into DONOR (donorid, name, isactive, designation)
values (54, 'CrispinRedford', 'n', 'For the memory of the family -Redford');
insert into DONOR (donorid, name, isactive, designation)
values (55, 'MerylHubbard', 'n', 'For the memory of the family -Hubbard');
insert into DONOR (donorid, name, isactive, designation)
values (56, 'LynnLaw', 'y', 'For the memory of the family -Law');
insert into DONOR (donorid, name, isactive, designation)
values (57, 'JeanMacDonald', 'n', 'For the memory of the family -MacDonald');
insert into DONOR (donorid, name, isactive, designation)
values (58, 'AlecNicholson', 'n', 'For the memory of the family -Nicholson');
commit;
prompt 100 records committed...
insert into DONOR (donorid, name, isactive, designation)
values (59, 'EmmylouArkenstone', 'y', 'For the memory of the family -Arkenstone');
insert into DONOR (donorid, name, isactive, designation)
values (60, 'PamelaCoburn', 'n', 'For the memory of the family -Coburn');
insert into DONOR (donorid, name, isactive, designation)
values (61, 'DorryReinhold', 'n', 'For the memory of the family -Reinhold');
insert into DONOR (donorid, name, isactive, designation)
values (62, 'WillMartinez', 'y', 'For the memory of the family -Martinez');
insert into DONOR (donorid, name, isactive, designation)
values (63, 'BustaCash', 'n', 'For the memory of the family -Cash');
insert into DONOR (donorid, name, isactive, designation)
values (64, 'PattySnipes', 'n', 'For the memory of the family -Snipes');
insert into DONOR (donorid, name, isactive, designation)
values (65, 'GarlandRobinson', 'n', 'For the memory of the family -Robinson');
insert into DONOR (donorid, name, isactive, designation)
values (66, 'EricIglesias', 'y', 'For the memory of the family -Iglesias');
insert into DONOR (donorid, name, isactive, designation)
values (67, 'RandyDickinson', 'n', 'For the memory of the family -Dickinson');
insert into DONOR (donorid, name, isactive, designation)
values (68, 'MikoFolds', 'n', 'For the memory of the family -Folds');
insert into DONOR (donorid, name, isactive, designation)
values (69, 'GladysWeiland', 'n', 'For the memory of the family -Weiland');
insert into DONOR (donorid, name, isactive, designation)
values (70, 'ShelbyBlanchett', 'y', 'For the memory of the family -Blanchett');
insert into DONOR (donorid, name, isactive, designation)
values (71, 'GeraldineBening', 'y', 'For the memory of the family -Bening');
insert into DONOR (donorid, name, isactive, designation)
values (72, 'TeaColman', 'n', 'For the memory of the family -Colman');
insert into DONOR (donorid, name, isactive, designation)
values (73, 'LouiseHartnett', 'n', 'For the memory of the family -Hartnett');
insert into DONOR (donorid, name, isactive, designation)
values (74, 'MiaCarlton', 'n', 'For the memory of the family -Carlton');
insert into DONOR (donorid, name, isactive, designation)
values (75, 'LariLaPaglia', 'y', 'For the memory of the family -LaPaglia');
insert into DONOR (donorid, name, isactive, designation)
values (76, 'JoelySobieski', 'n', 'For the memory of the family -Sobieski');
insert into DONOR (donorid, name, isactive, designation)
values (77, 'AndieRucker', 'y', 'For the memory of the family -Rucker');
insert into DONOR (donorid, name, isactive, designation)
values (78, 'NikAllison', 'n', 'For the memory of the family -Allison');
insert into DONOR (donorid, name, isactive, designation)
values (79, 'TiaMcGoohan', 'y', 'For the memory of the family -McGoohan');
insert into DONOR (donorid, name, isactive, designation)
values (80, 'AndyKrieger', 'y', 'For the memory of the family -Krieger');
insert into DONOR (donorid, name, isactive, designation)
values (81, 'LionelKinnear', 'y', 'For the memory of the family -Kinnear');
insert into DONOR (donorid, name, isactive, designation)
values (82, 'JodieSobieski', 'y', 'For the memory of the family -Sobieski');
insert into DONOR (donorid, name, isactive, designation)
values (83, 'ArminJackman', 'n', 'For the memory of the family -Jackman');
insert into DONOR (donorid, name, isactive, designation)
values (84, 'EricTsettos', 'n', 'For the memory of the family -Tsettos');
insert into DONOR (donorid, name, isactive, designation)
values (85, 'DermotFreeman', 'n', 'For the memory of the family -Freeman');
insert into DONOR (donorid, name, isactive, designation)
values (86, 'SallyHeche', 'y', 'For the memory of the family -Heche');
insert into DONOR (donorid, name, isactive, designation)
values (87, 'MykeltiChaykin', 'n', 'For the memory of the family -Chaykin');
insert into DONOR (donorid, name, isactive, designation)
values (88, 'XanderMarley', 'y', 'For the memory of the family -Marley');
insert into DONOR (donorid, name, isactive, designation)
values (89, 'GarlandNeville', 'y', 'For the memory of the family -Neville');
insert into DONOR (donorid, name, isactive, designation)
values (90, 'KevinAdler', 'n', 'For the memory of the family -Adler');
insert into DONOR (donorid, name, isactive, designation)
values (91, 'ViggoRebhorn', 'y', 'For the memory of the family -Rebhorn');
insert into DONOR (donorid, name, isactive, designation)
values (92, 'DianneHolmes', 'n', 'For the memory of the family -Holmes');
insert into DONOR (donorid, name, isactive, designation)
values (93, 'MarkCook', 'y', 'For the memory of the family -Cook');
insert into DONOR (donorid, name, isactive, designation)
values (94, 'AnnetteLewin', 'y', 'For the memory of the family -Lewin');
insert into DONOR (donorid, name, isactive, designation)
values (95, 'MarlonCharles', 'n', 'For the memory of the family -Charles');
insert into DONOR (donorid, name, isactive, designation)
values (96, 'MarleyWahlberg', 'n', 'For the memory of the family -Wahlberg');
insert into DONOR (donorid, name, isactive, designation)
values (97, 'LoisAli', 'y', 'For the memory of the family -Ali');
insert into DONOR (donorid, name, isactive, designation)
values (98, 'BlairDreyfuss', 'n', 'For the memory of the family -Dreyfuss');
insert into DONOR (donorid, name, isactive, designation)
values (99, 'CeliaBoyle', 'y', 'For the memory of the family -Boyle');
insert into DONOR (donorid, name, isactive, designation)
values (100, 'HollandAssante', 'n', 'For the memory of the family -Assante');
insert into DONOR (donorid, name, isactive, designation)
values (101, 'KimberlyKrieger', 'y', 'For the memory of the family -Krieger');
insert into DONOR (donorid, name, isactive, designation)
values (102, 'LeonUggams', 'n', 'For the memory of the family -Uggams');
insert into DONOR (donorid, name, isactive, designation)
values (103, 'UmaBachman', 'y', 'For the memory of the family -Bachman');
insert into DONOR (donorid, name, isactive, designation)
values (104, 'NenehTwilley', 'n', 'For the memory of the family -Twilley');
insert into DONOR (donorid, name, isactive, designation)
values (105, 'RobCrow', 'y', 'For the memory of the family -Crow');
insert into DONOR (donorid, name, isactive, designation)
values (106, 'SherylLynch', 'y', 'For the memory of the family -Lynch');
insert into DONOR (donorid, name, isactive, designation)
values (107, 'MekhiCobbs', 'n', 'For the memory of the family -Cobbs');
insert into DONOR (donorid, name, isactive, designation)
values (108, 'PattyColman', 'y', 'For the memory of the family -Colman');
insert into DONOR (donorid, name, isactive, designation)
values (109, 'AimeeSutherland', 'y', 'For the memory of the family -Sutherland');
insert into DONOR (donorid, name, isactive, designation)
values (110, 'BalthazarHong', 'n', 'For the memory of the family -Hong');
insert into DONOR (donorid, name, isactive, designation)
values (111, 'BradleyDunst', 'y', 'For the memory of the family -Dunst');
insert into DONOR (donorid, name, isactive, designation)
values (112, 'VinMars', 'n', 'For the memory of the family -Mars');
insert into DONOR (donorid, name, isactive, designation)
values (113, 'ChaleeGugino', 'y', 'For the memory of the family -Gugino');
insert into DONOR (donorid, name, isactive, designation)
values (114, 'AngelinaBelle', 'n', 'For the memory of the family -Belle');
insert into DONOR (donorid, name, isactive, designation)
values (115, 'PamPenn', 'y', 'For the memory of the family -Penn');
insert into DONOR (donorid, name, isactive, designation)
values (116, 'DustinBenet', 'n', 'For the memory of the family -Benet');
insert into DONOR (donorid, name, isactive, designation)
values (117, 'RoscoLi', 'n', 'For the memory of the family -Li');
insert into DONOR (donorid, name, isactive, designation)
values (118, 'NigelBrock', 'n', 'For the memory of the family -Brock');
insert into DONOR (donorid, name, isactive, designation)
values (119, 'MillaFolds', 'y', 'For the memory of the family -Folds');
insert into DONOR (donorid, name, isactive, designation)
values (120, 'CampbellPony', 'n', 'For the memory of the family -Pony');
insert into DONOR (donorid, name, isactive, designation)
values (121, 'JodyCondition', 'n', 'For the memory of the family -Condition');
insert into DONOR (donorid, name, isactive, designation)
values (122, 'DarDuke', 'y', 'For the memory of the family -Duke');
insert into DONOR (donorid, name, isactive, designation)
values (123, 'StockardHiatt', 'y', 'For the memory of the family -Hiatt');
insert into DONOR (donorid, name, isactive, designation)
values (124, 'SelmaNorton', 'n', 'For the memory of the family -Norton');
insert into DONOR (donorid, name, isactive, designation)
values (125, 'JeffBlair', 'y', 'For the memory of the family -Blair');
insert into DONOR (donorid, name, isactive, designation)
values (126, 'BettyFarrow', 'y', 'For the memory of the family -Farrow');
insert into DONOR (donorid, name, isactive, designation)
values (127, 'JuiceOjeda', 'n', 'For the memory of the family -Ojeda');
insert into DONOR (donorid, name, isactive, designation)
values (128, 'RichieWhitwam', 'n', 'For the memory of the family -Whitwam');
insert into DONOR (donorid, name, isactive, designation)
values (129, 'FranzSaucedo', 'y', 'For the memory of the family -Saucedo');
insert into DONOR (donorid, name, isactive, designation)
values (130, 'JimSwank', 'n', 'For the memory of the family -Swank');
insert into DONOR (donorid, name, isactive, designation)
values (131, 'RhysBeck', 'y', 'For the memory of the family -Beck');
insert into DONOR (donorid, name, isactive, designation)
values (132, 'JamiePaymer', 'n', 'For the memory of the family -Paymer');
insert into DONOR (donorid, name, isactive, designation)
values (133, 'AdamPurefoy', 'y', 'For the memory of the family -Purefoy');
insert into DONOR (donorid, name, isactive, designation)
values (134, 'DemiMoody', 'n', 'For the memory of the family -Moody');
insert into DONOR (donorid, name, isactive, designation)
values (135, 'LouSevigny', 'n', 'For the memory of the family -Sevigny');
insert into DONOR (donorid, name, isactive, designation)
values (136, 'LynnPeebles', 'y', 'For the memory of the family -Peebles');
insert into DONOR (donorid, name, isactive, designation)
values (137, 'VictoriaWaite', 'y', 'For the memory of the family -Waite');
insert into DONOR (donorid, name, isactive, designation)
values (138, 'ErnestTyler', 'n', 'For the memory of the family -Tyler');
insert into DONOR (donorid, name, isactive, designation)
values (139, 'FrancesHatchet', 'y', 'For the memory of the family -Hatchet');
insert into DONOR (donorid, name, isactive, designation)
values (140, 'RachaelO''Hara', 'n', 'For the memory of the family -O''Hara');
insert into DONOR (donorid, name, isactive, designation)
values (141, 'HikaruCoyote', 'n', 'For the memory of the family -Coyote');
insert into DONOR (donorid, name, isactive, designation)
values (142, 'MickyWeller', 'n', 'For the memory of the family -Weller');
insert into DONOR (donorid, name, isactive, designation)
values (143, 'CrispinFlack', 'n', 'For the memory of the family -Flack');
insert into DONOR (donorid, name, isactive, designation)
values (144, 'BettyAllison', 'n', 'For the memory of the family -Allison');
insert into DONOR (donorid, name, isactive, designation)
values (145, 'HelenSchwimmer', 'n', 'For the memory of the family -Schwimmer');
insert into DONOR (donorid, name, isactive, designation)
values (146, 'NeveMould', 'y', 'For the memory of the family -Mould');
insert into DONOR (donorid, name, isactive, designation)
values (147, 'KidCox', 'n', 'For the memory of the family -Cox');
insert into DONOR (donorid, name, isactive, designation)
values (148, 'MilesShorter', 'n', 'For the memory of the family -Shorter');
insert into DONOR (donorid, name, isactive, designation)
values (149, 'ChristinaPalin', 'y', 'For the memory of the family -Palin');
insert into DONOR (donorid, name, isactive, designation)
values (150, 'FredaJohnson', 'y', 'For the memory of the family -Johnson');
insert into DONOR (donorid, name, isactive, designation)
values (151, 'PaulNugent', 'y', 'For the memory of the family -Nugent');
insert into DONOR (donorid, name, isactive, designation)
values (152, 'PattyShawn', 'y', 'For the memory of the family -Shawn');
insert into DONOR (donorid, name, isactive, designation)
values (153, 'DevonCarr', 'y', 'For the memory of the family -Carr');
insert into DONOR (donorid, name, isactive, designation)
values (154, 'BurtLoveless', 'y', 'For the memory of the family -Loveless');
insert into DONOR (donorid, name, isactive, designation)
values (155, 'NilsDoucette', 'n', 'For the memory of the family -Doucette');
insert into DONOR (donorid, name, isactive, designation)
values (156, 'SaulDetmer', 'n', 'For the memory of the family -Detmer');
insert into DONOR (donorid, name, isactive, designation)
values (157, 'MachineTyler', 'y', 'For the memory of the family -Tyler');
insert into DONOR (donorid, name, isactive, designation)
values (158, 'MandyLaw', 'y', 'For the memory of the family -Law');
commit;
prompt 200 records committed...
insert into DONOR (donorid, name, isactive, designation)
values (159, 'ShannonHolliday', 'n', 'For the memory of the family -Holliday');
insert into DONOR (donorid, name, isactive, designation)
values (160, 'AniSanta Rosa', 'n', 'For the memory of the family -Santa Rosa');
insert into DONOR (donorid, name, isactive, designation)
values (161, 'TaylorChandler', 'y', 'For the memory of the family -Chandler');
insert into DONOR (donorid, name, isactive, designation)
values (162, 'IvanHyde', 'y', 'For the memory of the family -Hyde');
insert into DONOR (donorid, name, isactive, designation)
values (163, 'HarryHatchet', 'n', 'For the memory of the family -Hatchet');
insert into DONOR (donorid, name, isactive, designation)
values (164, 'AlfieO''Neill', 'n', 'For the memory of the family -O''Neill');
insert into DONOR (donorid, name, isactive, designation)
values (165, 'MollyColon', 'y', 'For the memory of the family -Colon');
insert into DONOR (donorid, name, isactive, designation)
values (166, 'IceSalonga', 'y', 'For the memory of the family -Salonga');
insert into DONOR (donorid, name, isactive, designation)
values (167, 'HopeClayton', 'y', 'For the memory of the family -Clayton');
insert into DONOR (donorid, name, isactive, designation)
values (168, 'HikaruGoodman', 'y', 'For the memory of the family -Goodman');
insert into DONOR (donorid, name, isactive, designation)
values (169, 'JohnetteMetcalf', 'y', 'For the memory of the family -Metcalf');
insert into DONOR (donorid, name, isactive, designation)
values (170, 'TommyHampton', 'y', 'For the memory of the family -Hampton');
insert into DONOR (donorid, name, isactive, designation)
values (171, 'CrispinHolden', 'n', 'For the memory of the family -Holden');
insert into DONOR (donorid, name, isactive, designation)
values (172, 'RickiePaltrow', 'y', 'For the memory of the family -Paltrow');
insert into DONOR (donorid, name, isactive, designation)
values (173, 'BarbaraCrouse', 'y', 'For the memory of the family -Crouse');
insert into DONOR (donorid, name, isactive, designation)
values (174, 'AidanDooley', 'n', 'For the memory of the family -Dooley');
insert into DONOR (donorid, name, isactive, designation)
values (175, 'HeathKaryo', 'n', 'For the memory of the family -Karyo');
insert into DONOR (donorid, name, isactive, designation)
values (176, 'CharliePaymer', 'n', 'For the memory of the family -Paymer');
insert into DONOR (donorid, name, isactive, designation)
values (177, 'NatalieSandoval', 'y', 'For the memory of the family -Sandoval');
insert into DONOR (donorid, name, isactive, designation)
values (178, 'JohnniePatton', 'n', 'For the memory of the family -Patton');
insert into DONOR (donorid, name, isactive, designation)
values (179, 'AzucarColtrane', 'n', 'For the memory of the family -Coltrane');
insert into DONOR (donorid, name, isactive, designation)
values (180, 'RaymondMellencamp', 'n', 'For the memory of the family -Mellencamp');
insert into DONOR (donorid, name, isactive, designation)
values (181, 'CheechEngland', 'y', 'For the memory of the family -England');
insert into DONOR (donorid, name, isactive, designation)
values (182, 'CollectiveBratt', 'n', 'For the memory of the family -Bratt');
insert into DONOR (donorid, name, isactive, designation)
values (183, 'Azucarurban', 'n', 'For the memory of the family -urban');
insert into DONOR (donorid, name, isactive, designation)
values (184, 'MekhiRichards', 'y', 'For the memory of the family -Richards');
insert into DONOR (donorid, name, isactive, designation)
values (185, 'AzucarLarter', 'n', 'For the memory of the family -Larter');
insert into DONOR (donorid, name, isactive, designation)
values (186, 'DorryWarwick', 'y', 'For the memory of the family -Warwick');
insert into DONOR (donorid, name, isactive, designation)
values (187, 'BeverleyLindo', 'n', 'For the memory of the family -Lindo');
insert into DONOR (donorid, name, isactive, designation)
values (188, 'KaronLonsdale', 'n', 'For the memory of the family -Lonsdale');
insert into DONOR (donorid, name, isactive, designation)
values (189, 'AlexDalton', 'y', 'For the memory of the family -Dalton');
insert into DONOR (donorid, name, isactive, designation)
values (190, 'ChrissieRoot', 'y', 'For the memory of the family -Root');
insert into DONOR (donorid, name, isactive, designation)
values (191, 'SusanClayton', 'n', 'For the memory of the family -Clayton');
insert into DONOR (donorid, name, isactive, designation)
values (192, 'CarolineFarrow', 'n', 'For the memory of the family -Farrow');
insert into DONOR (donorid, name, isactive, designation)
values (193, 'RawlinsArnold', 'y', 'For the memory of the family -Arnold');
insert into DONOR (donorid, name, isactive, designation)
values (194, 'WillieAssante', 'n', 'For the memory of the family -Assante');
insert into DONOR (donorid, name, isactive, designation)
values (195, 'LariGarner', 'n', 'For the memory of the family -Garner');
insert into DONOR (donorid, name, isactive, designation)
values (196, 'JohnetteFurtado', 'y', 'For the memory of the family -Furtado');
insert into DONOR (donorid, name, isactive, designation)
values (197, 'JimmieFonda', 'y', 'For the memory of the family -Fonda');
insert into DONOR (donorid, name, isactive, designation)
values (198, 'MadeleineBates', 'n', 'For the memory of the family -Bates');
insert into DONOR (donorid, name, isactive, designation)
values (199, 'KevnSampson', 'y', 'For the memory of the family -Sampson');
insert into DONOR (donorid, name, isactive, designation)
values (200, 'RuthRonstadt', 'y', 'For the memory of the family -Ronstadt');
insert into DONOR (donorid, name, isactive, designation)
values (201, 'NikkaCornell', 'y', 'For the memory of the family -Cornell');
insert into DONOR (donorid, name, isactive, designation)
values (202, 'RoseAtkinson', 'n', 'For the memory of the family -Atkinson');
insert into DONOR (donorid, name, isactive, designation)
values (203, 'UdoKramer', 'y', 'For the memory of the family -Kramer');
insert into DONOR (donorid, name, isactive, designation)
values (204, 'CarlosMcGregor', 'y', 'For the memory of the family -McGregor');
insert into DONOR (donorid, name, isactive, designation)
values (205, 'TreatHenstridge', 'y', 'For the memory of the family -Henstridge');
insert into DONOR (donorid, name, isactive, designation)
values (206, 'MelTomei', 'n', 'For the memory of the family -Tomei');
insert into DONOR (donorid, name, isactive, designation)
values (207, 'RichieKing', 'n', 'For the memory of the family -King');
insert into DONOR (donorid, name, isactive, designation)
values (208, 'TriniKeeslar', 'n', 'For the memory of the family -Keeslar');
insert into DONOR (donorid, name, isactive, designation)
values (209, 'JoeyFranklin', 'n', 'For the memory of the family -Franklin');
insert into DONOR (donorid, name, isactive, designation)
values (210, 'GrantGiamatti', 'n', 'For the memory of the family -Giamatti');
insert into DONOR (donorid, name, isactive, designation)
values (211, 'AlbertinaTaha', 'n', 'For the memory of the family -Taha');
insert into DONOR (donorid, name, isactive, designation)
values (212, 'SineadRawls', 'n', 'For the memory of the family -Rawls');
insert into DONOR (donorid, name, isactive, designation)
values (213, 'NastassjaShaye', 'y', 'For the memory of the family -Shaye');
insert into DONOR (donorid, name, isactive, designation)
values (214, 'SammyMoore', 'n', 'For the memory of the family -Moore');
insert into DONOR (donorid, name, isactive, designation)
values (215, 'RebeccaStamp', 'n', 'For the memory of the family -Stamp');
insert into DONOR (donorid, name, isactive, designation)
values (216, 'LonnieHartnett', 'y', 'For the memory of the family -Hartnett');
insert into DONOR (donorid, name, isactive, designation)
values (217, 'GavinEngland', 'n', 'For the memory of the family -England');
insert into DONOR (donorid, name, isactive, designation)
values (218, 'MickyMollard', 'n', 'For the memory of the family -Mollard');
insert into DONOR (donorid, name, isactive, designation)
values (219, 'MelJudd', 'n', 'For the memory of the family -Judd');
insert into DONOR (donorid, name, isactive, designation)
values (220, 'BenicioTravers', 'y', 'For the memory of the family -Travers');
insert into DONOR (donorid, name, isactive, designation)
values (221, 'LloydJane', 'y', 'For the memory of the family -Jane');
insert into DONOR (donorid, name, isactive, designation)
values (222, 'DustinPreston', 'y', 'For the memory of the family -Preston');
insert into DONOR (donorid, name, isactive, designation)
values (223, 'OssieMortensen', 'y', 'For the memory of the family -Mortensen');
insert into DONOR (donorid, name, isactive, designation)
values (224, 'RoyFraser', 'n', 'For the memory of the family -Fraser');
insert into DONOR (donorid, name, isactive, designation)
values (225, 'FranceHynde', 'n', 'For the memory of the family -Hynde');
insert into DONOR (donorid, name, isactive, designation)
values (226, 'DarylRooker', 'n', 'For the memory of the family -Rooker');
insert into DONOR (donorid, name, isactive, designation)
values (227, 'ToriCarlyle', 'y', 'For the memory of the family -Carlyle');
insert into DONOR (donorid, name, isactive, designation)
values (228, 'AndraeAvalon', 'y', 'For the memory of the family -Avalon');
insert into DONOR (donorid, name, isactive, designation)
values (229, 'DebiNapolitano', 'n', 'For the memory of the family -Napolitano');
insert into DONOR (donorid, name, isactive, designation)
values (230, 'GoranAllison', 'n', 'For the memory of the family -Allison');
insert into DONOR (donorid, name, isactive, designation)
values (231, 'BuddyKeith', 'n', 'For the memory of the family -Keith');
insert into DONOR (donorid, name, isactive, designation)
values (232, 'OliverShannon', 'n', 'For the memory of the family -Shannon');
insert into DONOR (donorid, name, isactive, designation)
values (233, 'BreckinO''Neill', 'y', 'For the memory of the family -O''Neill');
insert into DONOR (donorid, name, isactive, designation)
values (234, 'WinonaYankovic', 'y', 'For the memory of the family -Yankovic');
insert into DONOR (donorid, name, isactive, designation)
values (235, 'DebraSnider', 'y', 'For the memory of the family -Snider');
insert into DONOR (donorid, name, isactive, designation)
values (236, 'AlanRoth', 'n', 'For the memory of the family -Roth');
insert into DONOR (donorid, name, isactive, designation)
values (237, 'TeriEvett', 'y', 'For the memory of the family -Evett');
insert into DONOR (donorid, name, isactive, designation)
values (238, 'BettyMacIsaac', 'y', 'For the memory of the family -MacIsaac');
insert into DONOR (donorid, name, isactive, designation)
values (239, 'LouBragg', 'n', 'For the memory of the family -Bragg');
insert into DONOR (donorid, name, isactive, designation)
values (240, 'DomingoDafoe', 'n', 'For the memory of the family -Dafoe');
insert into DONOR (donorid, name, isactive, designation)
values (241, 'BridgetGuinness', 'n', 'For the memory of the family -Guinness');
insert into DONOR (donorid, name, isactive, designation)
values (242, 'JackPonty', 'y', 'For the memory of the family -Ponty');
insert into DONOR (donorid, name, isactive, designation)
values (243, 'AlexMazar', 'y', 'For the memory of the family -Mazar');
insert into DONOR (donorid, name, isactive, designation)
values (244, 'DebraMichaels', 'n', 'For the memory of the family -Michaels');
insert into DONOR (donorid, name, isactive, designation)
values (245, 'MinnieSayer', 'n', 'For the memory of the family -Sayer');
insert into DONOR (donorid, name, isactive, designation)
values (246, 'RonnyOrton', 'n', 'For the memory of the family -Orton');
insert into DONOR (donorid, name, isactive, designation)
values (247, 'AndreaCumming', 'y', 'For the memory of the family -Cumming');
insert into DONOR (donorid, name, isactive, designation)
values (248, 'GlenMasur', 'n', 'For the memory of the family -Masur');
insert into DONOR (donorid, name, isactive, designation)
values (249, 'Jean-LucKapanka', 'y', 'For the memory of the family -Kapanka');
insert into DONOR (donorid, name, isactive, designation)
values (250, 'GiancarloO''Donnell', 'y', 'For the memory of the family -O''Donnell');
insert into DONOR (donorid, name, isactive, designation)
values (251, 'AniFinney', 'n', 'For the memory of the family -Finney');
insert into DONOR (donorid, name, isactive, designation)
values (252, 'SamRauhofer', 'y', 'For the memory of the family -Rauhofer');
insert into DONOR (donorid, name, isactive, designation)
values (253, 'ColmBurstyn', 'y', 'For the memory of the family -Burstyn');
insert into DONOR (donorid, name, isactive, designation)
values (254, 'JaneWen', 'n', 'For the memory of the family -Wen');
insert into DONOR (donorid, name, isactive, designation)
values (255, 'KevinMarsden', 'n', 'For the memory of the family -Marsden');
insert into DONOR (donorid, name, isactive, designation)
values (256, 'ThinReilly', 'n', 'For the memory of the family -Reilly');
insert into DONOR (donorid, name, isactive, designation)
values (257, 'TalGuzman', 'n', 'For the memory of the family -Guzman');
insert into DONOR (donorid, name, isactive, designation)
values (258, 'BrendaSaucedo', 'y', 'For the memory of the family -Saucedo');
commit;
prompt 300 records committed...
insert into DONOR (donorid, name, isactive, designation)
values (259, 'DaryleApplegate', 'n', 'For the memory of the family -Applegate');
insert into DONOR (donorid, name, isactive, designation)
values (260, 'WillChilton', 'n', 'For the memory of the family -Chilton');
insert into DONOR (donorid, name, isactive, designation)
values (261, 'StevieNeill', 'n', 'For the memory of the family -Neill');
insert into DONOR (donorid, name, isactive, designation)
values (262, 'CliveFender', 'y', 'For the memory of the family -Fender');
insert into DONOR (donorid, name, isactive, designation)
values (263, 'FredericTyson', 'n', 'For the memory of the family -Tyson');
insert into DONOR (donorid, name, isactive, designation)
values (264, 'RogerGriffin', 'n', 'For the memory of the family -Griffin');
insert into DONOR (donorid, name, isactive, designation)
values (265, 'AlexBanderas', 'y', 'For the memory of the family -Banderas');
insert into DONOR (donorid, name, isactive, designation)
values (266, 'JimmyHaslam', 'n', 'For the memory of the family -Haslam');
insert into DONOR (donorid, name, isactive, designation)
values (267, 'MiliRain', 'n', 'For the memory of the family -Rain');
insert into DONOR (donorid, name, isactive, designation)
values (268, 'PamelaMcGoohan', 'y', 'For the memory of the family -McGoohan');
insert into DONOR (donorid, name, isactive, designation)
values (269, 'StephanieGoldblum', 'y', 'For the memory of the family -Goldblum');
insert into DONOR (donorid, name, isactive, designation)
values (270, 'SamuelRyder', 'y', 'For the memory of the family -Ryder');
insert into DONOR (donorid, name, isactive, designation)
values (271, 'TchekyBalaban', 'n', 'For the memory of the family -Balaban');
insert into DONOR (donorid, name, isactive, designation)
values (272, 'RoscoeSalt', 'y', 'For the memory of the family -Salt');
insert into DONOR (donorid, name, isactive, designation)
values (273, 'AdrienVisnjic', 'n', 'For the memory of the family -Visnjic');
insert into DONOR (donorid, name, isactive, designation)
values (274, 'MekhiUnion', 'n', 'For the memory of the family -Union');
insert into DONOR (donorid, name, isactive, designation)
values (275, 'OmarKirshner', 'y', 'For the memory of the family -Kirshner');
insert into DONOR (donorid, name, isactive, designation)
values (276, 'BrothersMcAnally', 'y', 'For the memory of the family -McAnally');
insert into DONOR (donorid, name, isactive, designation)
values (277, 'XanderPleasence', 'y', 'For the memory of the family -Pleasence');
insert into DONOR (donorid, name, isactive, designation)
values (278, 'Mary BethSledge', 'n', 'For the memory of the family -Sledge');
insert into DONOR (donorid, name, isactive, designation)
values (279, 'WangPigott-Smith', 'y', 'For the memory of the family -Pigott-Smith');
insert into DONOR (donorid, name, isactive, designation)
values (280, 'NikkiCopeland', 'y', 'For the memory of the family -Copeland');
insert into DONOR (donorid, name, isactive, designation)
values (281, 'RayBadalucco', 'y', 'For the memory of the family -Badalucco');
insert into DONOR (donorid, name, isactive, designation)
values (282, 'GenaCoughlan', 'n', 'For the memory of the family -Coughlan');
insert into DONOR (donorid, name, isactive, designation)
values (283, 'TimothyFerrell', 'y', 'For the memory of the family -Ferrell');
insert into DONOR (donorid, name, isactive, designation)
values (284, 'BobbyHart', 'n', 'For the memory of the family -Hart');
insert into DONOR (donorid, name, isactive, designation)
values (285, 'PaulPerry', 'y', 'For the memory of the family -Perry');
insert into DONOR (donorid, name, isactive, designation)
values (286, 'CleaBurton', 'n', 'For the memory of the family -Burton');
insert into DONOR (donorid, name, isactive, designation)
values (287, 'IsaacPorter', 'y', 'For the memory of the family -Porter');
insert into DONOR (donorid, name, isactive, designation)
values (288, 'ClintJanssen', 'y', 'For the memory of the family -Janssen');
insert into DONOR (donorid, name, isactive, designation)
values (289, 'VerucaShandling', 'y', 'For the memory of the family -Shandling');
insert into DONOR (donorid, name, isactive, designation)
values (290, 'Ming-NaDavies', 'y', 'For the memory of the family -Davies');
insert into DONOR (donorid, name, isactive, designation)
values (291, 'AlannahDiehl', 'n', 'For the memory of the family -Diehl');
insert into DONOR (donorid, name, isactive, designation)
values (292, 'MarcBelushi', 'y', 'For the memory of the family -Belushi');
insert into DONOR (donorid, name, isactive, designation)
values (293, 'GladysSerbedzija', 'y', 'For the memory of the family -Serbedzija');
insert into DONOR (donorid, name, isactive, designation)
values (294, 'MaceoLevin', 'n', 'For the memory of the family -Levin');
insert into DONOR (donorid, name, isactive, designation)
values (295, 'EricThomas', 'n', 'For the memory of the family -Thomas');
insert into DONOR (donorid, name, isactive, designation)
values (296, 'StevenDunst', 'y', 'For the memory of the family -Dunst');
insert into DONOR (donorid, name, isactive, designation)
values (297, 'SophieFolds', 'y', 'For the memory of the family -Folds');
insert into DONOR (donorid, name, isactive, designation)
values (298, 'DennisGandolfini', 'n', 'For the memory of the family -Gandolfini');
insert into DONOR (donorid, name, isactive, designation)
values (299, 'TerenceHayes', 'n', 'For the memory of the family -Hayes');
insert into DONOR (donorid, name, isactive, designation)
values (300, 'LilaHidalgo', 'n', 'For the memory of the family -Hidalgo');
insert into DONOR (donorid, name, isactive, designation)
values (301, 'PenelopeBracco', 'n', 'For the memory of the family -Bracco');
insert into DONOR (donorid, name, isactive, designation)
values (302, 'JonD''Onofrio', 'n', 'For the memory of the family -D''Onofrio');
insert into DONOR (donorid, name, isactive, designation)
values (303, 'TayeBlair', 'n', 'For the memory of the family -Blair');
insert into DONOR (donorid, name, isactive, designation)
values (304, 'JimmyBlanchett', 'y', 'For the memory of the family -Blanchett');
insert into DONOR (donorid, name, isactive, designation)
values (305, 'LilaArkin', 'n', 'For the memory of the family -Arkin');
insert into DONOR (donorid, name, isactive, designation)
values (306, 'AzucarBosco', 'n', 'For the memory of the family -Bosco');
insert into DONOR (donorid, name, isactive, designation)
values (307, 'ReginaSirtis', 'n', 'For the memory of the family -Sirtis');
insert into DONOR (donorid, name, isactive, designation)
values (308, 'RhysAmmons', 'n', 'For the memory of the family -Ammons');
insert into DONOR (donorid, name, isactive, designation)
values (309, 'LeVarAvalon', 'n', 'For the memory of the family -Avalon');
insert into DONOR (donorid, name, isactive, designation)
values (310, 'RichardRispoli', 'n', 'For the memory of the family -Rispoli');
insert into DONOR (donorid, name, isactive, designation)
values (311, 'RachaelBroadbent', 'y', 'For the memory of the family -Broadbent');
insert into DONOR (donorid, name, isactive, designation)
values (312, 'JeremyBrando', 'y', 'For the memory of the family -Brando');
insert into DONOR (donorid, name, isactive, designation)
values (313, 'PhoebeYoung', 'n', 'For the memory of the family -Young');
insert into DONOR (donorid, name, isactive, designation)
values (314, 'MickyFrost', 'y', 'For the memory of the family -Frost');
insert into DONOR (donorid, name, isactive, designation)
values (315, 'VendettaParm', 'y', 'For the memory of the family -Parm');
insert into DONOR (donorid, name, isactive, designation)
values (316, 'BetteDale', 'y', 'For the memory of the family -Dale');
insert into DONOR (donorid, name, isactive, designation)
values (317, 'CeCePhifer', 'n', 'For the memory of the family -Phifer');
insert into DONOR (donorid, name, isactive, designation)
values (318, 'AnnaRuiz', 'n', 'For the memory of the family -Ruiz');
insert into DONOR (donorid, name, isactive, designation)
values (319, 'LaurieShannon', 'n', 'For the memory of the family -Shannon');
insert into DONOR (donorid, name, isactive, designation)
values (320, 'HaroldEnglish', 'n', 'For the memory of the family -English');
insert into DONOR (donorid, name, isactive, designation)
values (321, 'SonnyRucker', 'n', 'For the memory of the family -Rucker');
insert into DONOR (donorid, name, isactive, designation)
values (322, 'UmaChecker', 'y', 'For the memory of the family -Checker');
insert into DONOR (donorid, name, isactive, designation)
values (323, 'WillBarrymore', 'y', 'For the memory of the family -Barrymore');
insert into DONOR (donorid, name, isactive, designation)
values (324, 'CleaButler', 'n', 'For the memory of the family -Butler');
insert into DONOR (donorid, name, isactive, designation)
values (325, 'KaseyOates', 'n', 'For the memory of the family -Oates');
insert into DONOR (donorid, name, isactive, designation)
values (326, 'ChaleeFender', 'y', 'For the memory of the family -Fender');
insert into DONOR (donorid, name, isactive, designation)
values (327, 'ChuckCaviezel', 'n', 'For the memory of the family -Caviezel');
insert into DONOR (donorid, name, isactive, designation)
values (328, 'NoahHawkins', 'n', 'For the memory of the family -Hawkins');
insert into DONOR (donorid, name, isactive, designation)
values (329, 'BernieKadison', 'y', 'For the memory of the family -Kadison');
insert into DONOR (donorid, name, isactive, designation)
values (330, 'GoldieVaughn', 'n', 'For the memory of the family -Vaughn');
insert into DONOR (donorid, name, isactive, designation)
values (331, 'MatthewBiel', 'y', 'For the memory of the family -Biel');
insert into DONOR (donorid, name, isactive, designation)
values (332, 'ReginaMcFadden', 'y', 'For the memory of the family -McFadden');
insert into DONOR (donorid, name, isactive, designation)
values (333, 'HugoWinger', 'n', 'For the memory of the family -Winger');
insert into DONOR (donorid, name, isactive, designation)
values (334, 'JohnnyLynskey', 'n', 'For the memory of the family -Lynskey');
insert into DONOR (donorid, name, isactive, designation)
values (335, 'OwenVaughn', 'y', 'For the memory of the family -Vaughn');
insert into DONOR (donorid, name, isactive, designation)
values (336, 'TanyaVai', 'n', 'For the memory of the family -Vai');
insert into DONOR (donorid, name, isactive, designation)
values (337, 'ConnieMetcalf', 'n', 'For the memory of the family -Metcalf');
insert into DONOR (donorid, name, isactive, designation)
values (338, 'NikkiFolds', 'y', 'For the memory of the family -Folds');
insert into DONOR (donorid, name, isactive, designation)
values (339, 'RyanThomas', 'n', 'For the memory of the family -Thomas');
insert into DONOR (donorid, name, isactive, designation)
values (340, 'LeaEnglund', 'n', 'For the memory of the family -Englund');
insert into DONOR (donorid, name, isactive, designation)
values (341, 'ElizabethDunaway', 'y', 'For the memory of the family -Dunaway');
insert into DONOR (donorid, name, isactive, designation)
values (342, 'SalmaBeckinsale', 'y', 'For the memory of the family -Beckinsale');
insert into DONOR (donorid, name, isactive, designation)
values (343, 'KristinCallow', 'n', 'For the memory of the family -Callow');
insert into DONOR (donorid, name, isactive, designation)
values (344, 'FredChristie', 'n', 'For the memory of the family -Christie');
insert into DONOR (donorid, name, isactive, designation)
values (345, 'RamseyGarcia', 'n', 'For the memory of the family -Garcia');
insert into DONOR (donorid, name, isactive, designation)
values (346, 'GenaConnery', 'n', 'For the memory of the family -Connery');
insert into DONOR (donorid, name, isactive, designation)
values (347, 'RandyPigott-Smith', 'y', 'For the memory of the family -Pigott-Smith');
insert into DONOR (donorid, name, isactive, designation)
values (348, 'BobbyMcElhone', 'n', 'For the memory of the family -McElhone');
insert into DONOR (donorid, name, isactive, designation)
values (349, 'ElisabethMidler', 'y', 'For the memory of the family -Midler');
insert into DONOR (donorid, name, isactive, designation)
values (350, 'LeeleeMellencamp', 'y', 'For the memory of the family -Mellencamp');
insert into DONOR (donorid, name, isactive, designation)
values (351, 'BonnieMoraz', 'n', 'For the memory of the family -Moraz');
insert into DONOR (donorid, name, isactive, designation)
values (352, 'ElizaCage', 'n', 'For the memory of the family -Cage');
insert into DONOR (donorid, name, isactive, designation)
values (353, 'ArtDiesel', 'y', 'For the memory of the family -Diesel');
insert into DONOR (donorid, name, isactive, designation)
values (354, 'VivicaPitt', 'n', 'For the memory of the family -Pitt');
insert into DONOR (donorid, name, isactive, designation)
values (355, 'RhettO''Sullivan', 'n', 'For the memory of the family -O''Sullivan');
insert into DONOR (donorid, name, isactive, designation)
values (356, 'UdoPaul', 'y', 'For the memory of the family -Paul');
insert into DONOR (donorid, name, isactive, designation)
values (357, 'DickNortham', 'n', 'For the memory of the family -Northam');
insert into DONOR (donorid, name, isactive, designation)
values (358, 'GeggyDiggs', 'y', 'For the memory of the family -Diggs');
commit;
prompt 400 records loaded
prompt Loading LOCATION...
insert into LOCATION (phonenumber, address, instructions)
values (999999365, '78 Cottbus Street', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999366, '100 Timothy Road', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999367, '38 Nora Road', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999368, '69 Hal Street', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999369, '43rd Street', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999370, '371 Rod Drive', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999371, '8 Durban Street', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999372, '63 Mohr', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999373, '6 Cuba Street', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999374, '22 Gdansk Drive', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999375, '74 Nyn?shamn Road', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999376, '67 Gauteng Drive', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999377, '71 Jim Blvd', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999378, '12 Patrick Road', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999379, '81 Nielsen Street', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999380, '28 Victoria Drive', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999381, '49 Miami Drive', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999382, '26 Amarillo Street', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999383, '40 Reykjavik Road', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999384, '783 Barbara Road', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999385, '267 Westerberg Blvd', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999386, '69 Woodland Hills Road', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999387, '54 Whitford Blvd', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999388, '23 Canberra Road', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999389, '99 Robby Street', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999000, '38 Tilly Drive', '"permission from facility manager"');
insert into LOCATION (phonenumber, address, instructions)
values (999999001, '26 Gunton Street', '"permission from tenant"');
insert into LOCATION (phonenumber, address, instructions)
values (999999002, '31st Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999003, '758 Bryan Street', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999004, '29 Tlalpan Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999005, '62nd Street', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999006, '6 Pasadena', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999007, '242 Lavigne Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999008, '32 Peter Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999009, '32 Newton-le-willows Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999010, '73 Bellevue Road', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999011, '64 Phillippe Drive', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999012, '95 Quinn Road', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999013, '16 Yolanda Blvd', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999014, '8 Hayes', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999015, '35 Gambon Street', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999016, '994 Wesley Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999017, '26 Edison Road', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999018, '82 Hawke Drive', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999019, '79 Warrington Drive', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999020, '79 Domingo Drive', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999021, '83rd Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999022, '7 Aracruz Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999023, '18 Darren Street', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999024, '2 Johnson Ave', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999025, '60 Roberts Ave', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999026, '92 Judd Drive', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999027, '72 Rosas Street', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999028, '21 Peterson Road', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999029, '430 Carlton Drive', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999030, '14 Day Street', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999031, '42nd Street', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999032, '42 Trieste Drive', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999033, '74 Day Ave', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999034, '265 McCain Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999035, '71st Street', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999036, '80 Calcutta Blvd', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999037, '4 Patrick Blvd', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999038, '55 Theron Street', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999039, '79 Kenoly Ave', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999040, '51st Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999041, '71 Bkk Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999042, '71 Johansson Ave', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999043, '89 Burns Road', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999044, '10 Sizemore Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999045, '87 Schlieren Blvd', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999046, '7 Johansson Drive', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999047, '12 Harahan Road', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999048, '49 Derrick', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999049, '18 Wayman Street', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999050, '872 Marina Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999051, '33rd Street', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999052, '799 Neill Street', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999053, '84 Stockard Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999054, '196 Rosanna Road', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999055, '1 Whitman Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999056, '9 Osaka', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999057, '237 Nelson Drive', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999058, '95 Caan', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999059, '58 New Delhi Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999060, '19 Keeslar Blvd', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999061, '51 Wakayama Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999062, '94 Augst Drive', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999063, '103 Albert Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999064, '73rd Street', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999065, '65 Emmerich', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999066, '93rd Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999067, '43 Pitney Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999068, '91st Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999069, '77 Payton Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999070, '636 Dallas Road', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999071, '54 Dabney Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999072, '1 Betty Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999073, '92 Andrew Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999074, '22 Eugene Blvd', 'permission from chief security officer');
commit;
prompt 100 records committed...
insert into LOCATION (phonenumber, address, instructions)
values (999999075, '16 Crudup Drive', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999076, '56 Longueuil Road', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999077, '81st Street', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999078, '883 Oshkosh Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999079, '89 Dutton Road', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999080, '25 Worrell Blvd', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999081, '80 Hughes Road', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999082, '13 George Drive', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999083, '50 Santana', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999084, '77 Idol Drive', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999085, '52 Key Biscayne Drive', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999086, '6 Phifer', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999087, '13rd Street', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999088, '11 Stephanie Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999089, '7 Terence Drive', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999090, '80 Grier Drive', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999091, '34 Coltrane Drive', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999092, '62 Doucette Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999093, '935 Silverman Ave', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999094, '74 Thomas Blvd', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999095, '36 Josh Ave', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999096, '965 Matarazzo Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999097, '80 Howard Road', 'permission from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999098, '89 Chalee Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999099, '51 Heath Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999100, '75 Wetzlar', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999101, '732 Cozier Road', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999102, '93 Sao roque Street', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999103, '37 Lionel Ave', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999104, '60 Tambor Road', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999105, '70 Douglas Road', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999106, '82 Van Helden Drive', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999107, '4 Haggard Blvd', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999108, '5 Porto alegre Road', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999109, '30 Schaumburg Blvd', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999110, '851 Avalon Road', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999111, '16 Tinsley Street', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999112, '1 Miles Street', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999113, '248 Foley Street', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999114, '8 Vincent Blvd', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999115, '37 Lange Ave', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999116, '38 Padova', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999117, '89 Chandler Ave', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999118, '48 Astin Road', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999119, '8 West Launceston Street', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999120, '75 Dempsey Road', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999121, '87 Aniston Street', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999122, '50 Arlington', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999123, '577 Traralgon Road', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999124, '886 Huston Drive', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999125, '724 Cassidy', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999126, '91 Carla Road', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999127, '41 Angelina', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999128, '30 Head Drive', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999129, '71 Keitel Blvd', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999130, '90 Billerica Drive', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999131, '52 Goran Drive', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999132, '22 Manaus Ave', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999133, '23rd Street', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999134, '61 Keeslar Street', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999135, '56 Miller Blvd', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999136, '17 Grand Rapids', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999137, '61 Bingham Farms Street', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999138, '70 Benicio Street', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999139, '42 Frampton Drive', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999140, '18 Cuba Street', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999141, '245 Shand Road', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999142, '36 Bad Camberg Road', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999143, '523 Bale Road', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999144, '535 Indianapolis', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999145, '13 Hopkins Street', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999146, '18 Richie', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999147, '40 Forest Road', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999148, '35 Sinatra Drive', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999149, '95 Hatfield Street', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999150, '679 Lapointe Ave', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999151, '292 Bielefeld Street', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999152, '15 Winger', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999153, '5 Linney Road', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999154, '82nd Street', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999155, '32nd Street', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999156, '30 Vendetta Blvd', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999157, '38 Kenoly Street', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999158, '26 Leawood Street', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999159, '63rd Street', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999160, '90 Llewelyn Drive', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999161, '67 Costa', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999162, '84 Capshaw Street', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999163, '63rd Street', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999164, '37 Seattle Blvd', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999165, '626 Carlingford Drive', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999166, '792 Malcolm Road', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999167, '99 Lila Drive', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999168, '22 Zagreb Ave', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999169, '618 Senior Ave', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999170, '70 Nathan Ave', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999171, '91st Street', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999172, '491 Miki Drive', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999173, '21 Davis Blvd', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999174, '84 Cochran Drive', 'permission from security');
commit;
prompt 200 records committed...
insert into LOCATION (phonenumber, address, instructions)
values (999999175, '97 Jaime Street', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999176, '676 Janeane Ave', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999177, '88 Dermot Ave', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999178, '87 Eileen Street', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999179, '55 Ft. Leavenworth Street', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999180, '17 Breslin', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999181, '52nd Street', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999182, '49 Trejo Ave', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999183, '45 Kid', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999184, '19 Heche Street', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999185, '86 Elijah', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999186, '82 Gryner Blvd', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999187, '91st Street', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999188, '622 Birkenhead Blvd', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999189, '61 Bad Oeynhausen Street', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999190, '25 Griffin Blvd', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999191, '78 Chapeco', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999192, '96 Naha Street', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999193, '23 Haysbert Drive', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999194, '904 Brothers', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999195, '2 Olin Drive', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999196, '93 North Yorkshire Street', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999197, '35 Sedaka Blvd', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999198, '25 Nicosia Road', 'permission from security');
insert into LOCATION (phonenumber, address, instructions)
values (999999199, '86 Borgnine Street', 'permission from manager');
insert into LOCATION (phonenumber, address, instructions)
values (999999200, '92 Wehrheim Blvd', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999201, '23 Boothe Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999202, '25 Puckett Street', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999203, '68 Cartlidge Street', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999204, '68 Gryner Road', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999205, '99 Tualatin Drive', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999206, '80 Chely Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999207, '86 Pleasure Drive', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999208, '31st Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999209, '74 Chesnutt Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999210, '45 Bend Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999211, '776 Hawke', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999212, '83 Duchovny Drive', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999213, '93 Gibbons Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999214, '916 Weber Blvd', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999215, '72 Schneider Road', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999216, '74 Owen Drive', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999217, '76 Browne Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999218, '52nd Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999219, '96 Matarazzo', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999220, '134 Zuerich Street', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999221, '36 Johnette Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999222, '59 Moraz Street', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999223, '21 Elias Blvd', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999224, '63rd Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999225, '99 Carson City', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999226, '1 Gainesville Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999227, '89 Gatlin Ave', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999228, '21st Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999229, '62 Concordville Drive', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999230, '9 Barry Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999231, '55 Dysart Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999232, '74 Vaughn Drive', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999233, '89 Luzern Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999234, '71 Warden Road', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999235, '59 O''fallon Drive', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999236, '815 Marburg Drive', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999237, '10 Caracas Road', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999238, '17 Seth Blvd', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999239, '300 Rossellini Ave', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999240, '667 Holts Summit Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999241, '100 Ripley Drive', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999242, '11 Belle Street', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999243, '35 Annie Road', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999244, '154 Madonna Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999245, '73rd Street', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999246, '729 Drogenbos Street', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999247, '32 Carr Road', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999248, '63 Johnson Blvd', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999249, '52 Matt Street', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999250, '97 Crete Road', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999251, '20 Apple', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999252, '42 Port Macquarie Road', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999253, '58 Frances Road', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (541234567, '123 Herzl St', ' premisson from manager');
insert into LOCATION (phonenumber, address, instructions)
values (542345678, '456 Rothschild Blvd', ' premisson from security');
insert into LOCATION (phonenumber, address, instructions)
values (543456789, '789 Dizengoff St', ' premisson from supervisor');
insert into LOCATION (phonenumber, address, instructions)
values (544567890, '101 Allenby St', ' premisson from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (545678901, '202 Jaffa Rd', ' premisson from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (546789012, '303 Ben Yehuda St', ' premisson from landlord');
insert into LOCATION (phonenumber, address, instructions)
values (547890123, '404 King George St', ' premisson from administration');
insert into LOCATION (phonenumber, address, instructions)
values (548901234, '505 Ibn Gvirol St', ' premisson from property manager');
insert into LOCATION (phonenumber, address, instructions)
values (549012345, '606 Kaplan St', ' premisson from facility manager');
insert into LOCATION (phonenumber, address, instructions)
values (540123456, '707 Hayarkon St', ' premisson from front desk');
insert into LOCATION (phonenumber, address, instructions)
values (541098765, '808 HaNeviim St', ' premisson from site manager');
insert into LOCATION (phonenumber, address, instructions)
values (542098765, '909 Emek Refaim St', ' premisson from site owner');
insert into LOCATION (phonenumber, address, instructions)
values (543098765, '111 Weizmann St', ' premisson from department head');
insert into LOCATION (phonenumber, address, instructions)
values (544098765, '222 Begin Blvd', ' premisson from company');
insert into LOCATION (phonenumber, address, instructions)
values (545098765, '333 Yefet St', ' premisson from local authorities');
insert into LOCATION (phonenumber, address, instructions)
values (546098765, '444 Derech Hashalom', ' premisson from neighborhood committee');
insert into LOCATION (phonenumber, address, instructions)
values (547098765, '555 Agron St', ' premisson from site coordinator');
insert into LOCATION (phonenumber, address, instructions)
values (548098765, '666 Bezalel St', ' premisson from regional manager');
insert into LOCATION (phonenumber, address, instructions)
values (549098765, '777 Jabotinsky St', ' premisson from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (540198765, '888 Bialik St', ' premisson from chief security officer');
insert into LOCATION (phonenumber, address, instructions)
values (999999254, '80 Wincott Blvd', 'ID is required');
commit;
prompt 300 records committed...
insert into LOCATION (phonenumber, address, instructions)
values (999999255, '42 Kingsley', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999256, '89 Varzea grande Street', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999257, '57 Yogyakarta Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999258, '96 Oakenfold Drive', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999259, '421 Orlando Drive', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999260, '27 Moreno Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999261, '31 Ruiz Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999262, '340 Lakewood Road', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999263, '66 Gagnon Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999264, '70 Wageningen Drive', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999265, '759 Rowan Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999266, '8 Arquette Street', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999267, '58 Curfman Road', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999268, '49 Guy Ave', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999269, '11 Susan Ave', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999270, '3 Tramaine Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999271, '48 Nikka Blvd', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999272, '58 Witt Blvd', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999273, '60 Livermore Street', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999274, '91 Gabriel Drive', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999275, '100 Ferrell Ave', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999276, '8 Timothy Drive', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999277, '100 Milsons Point Blvd', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999278, '610 Hannah', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999279, '96 Getty Ave', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999280, '11 Choice Blvd', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999281, '51 Seoul Drive', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999282, '22nd Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999283, '55 Adrien Blvd', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999284, '79 Russell Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999285, '831 David Road', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999286, '269 Lakeville Drive', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999287, '135 Annette Ave', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999288, '49 Paquin Drive', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999289, '60 Clea Ave', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999290, '64 Duisburg Street', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999291, '289 Tilda Ave', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999292, '85 Oxford', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999293, '418 Cooper Road', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999294, '82 Vega Road', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999295, '476 Gilley Ave', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999296, '83 Pepper Street', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999297, '58 New Hyde Park Drive', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999298, '60 Hawn Blvd', 'permission from organization head');
insert into LOCATION (phonenumber, address, instructions)
values (999999299, '67 Los Angeles Blvd', 'ID is required');
insert into LOCATION (phonenumber, address, instructions)
values (999999300, '85 Day-Lewis Blvd', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999301, '65 McDowall', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999302, '99 Koeln Road', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999303, '79 Pointe-claire', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999304, '31 Friedrichshafe Road', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999305, '361 El Paso Road', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999306, '96 Cheadle Drive', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999307, '44 Eastwood Drive', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999308, '1000 Kimberly Drive', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999309, '79 Farrell Street', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999310, '51 Clarence Road', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999311, '86 Bergara Road', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999312, '521 Rhames Road', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999313, '99 Wilder Drive', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999314, '49 Enfield Road', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999315, '89 Santiago Street', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999316, '14 Melanie', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999317, '73rd Street', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999318, '78 Bryan Street', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999319, '45 Spall Street', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999320, '28 Nancy Road', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999321, '527 Ethan Street', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999322, '520 Li Road', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999323, '78 McGriff', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999324, '32nd Street', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999325, '98 Hoskins Drive', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999326, '8 Ceasar Drive', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999327, '39 Ticotin Road', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999328, '82 Lunch Drive', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999329, '70 Monroe Road', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999330, '39 Spring City Road', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999331, '91 Bassett Road', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999332, '24 Evans Street', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999333, '85 Seann Road', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999334, '63rd Street', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999335, '64 Bogguss Street', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999336, '48 Cartlidge', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999337, '23rd Street', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999338, '29 Burt Street', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999339, '60 Charlize Road', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999340, '488 Yavne Street', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999341, '95 Merillee Road', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999342, '29 Saint Paul Street', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999343, '44 Bryson Ave', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999344, '43rd Street', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999345, '301 Lynne Drive', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999346, '33 Hampton Drive', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999347, '48 Holts Summit', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999348, '48 Krumholtz Blvd', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999349, '98 Issaquah', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999350, '53 Joinville Ave', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999351, '18 Wolf Road', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999352, '82 Nicole Drive', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999353, '36 B?nes Road', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999354, '38 Davison Road', '''permission from tenant');
commit;
prompt 400 records committed...
insert into LOCATION (phonenumber, address, instructions)
values (999999355, '308 Grand Rapids Blvd', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999356, '923 Sledge Road', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999357, '97 Leipzig Drive', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999358, '73rd Street', '''permission from tenant');
insert into LOCATION (phonenumber, address, instructions)
values (999999359, '2 Washington Blvd', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999360, '77 Corona Street', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999361, '19 Ferraz  vasconcelos Street', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999362, '75 Hong Kong Street', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999363, '1 Beck Road', 'permission from building owner');
insert into LOCATION (phonenumber, address, instructions)
values (999999364, '68 Carrack', 'permission from building owner');
commit;
prompt 410 records loaded
prompt Loading ITEM...
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (334, 'Disinfectant Wipes', 'A device used to immobilize and support fractures or injuries to the arms or legs.', 131, 0, 421, 999999346);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (335, 'Orthopedic Walker', 'Devices used to stabilize and support fractured bones externally.', 121, 0, 407, 999999008);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (336, 'Airway Kit', 'A mask placed over the nose and mouth to deliver oxygen to the patient.', 221, 0, 417, 999999263);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (337, 'Stretcher', 'Manual resuscitators used to provide positive pressure ventilation to patients.', 131, 1, 413, 999999029);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (338, 'Nebulizer Mask', 'Medication used to relieve pain.', 122, 1, 413, 999999280);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (339, 'Pressure Infusion Bags', 'Bins used for the safe disposal of medical waste such as used needles syringes and dressings.', 113, 1, 423, 999999033);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (340, 'Nebulizer Mask', 'Pads used with a defibrillator to deliver an electric shock to the heart.', 140, 0, 416, 999999217);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (341, 'Multi-Trauma Dressing', 'Stands used to support bags of intravenous fluids during administration to patients.', 314, 0, 405, 999999248);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (342, 'Cardiac Defibrillator Training Units', 'Swabs saturated with alcohol used to clean and disinfect the skin before injections or procedures.', 278, 1, 411, 999999128);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (343, 'Portable Ventilator', 'Bins used for the safe disposal of medical waste such as used needles syringes and dressings.', 117, 1, 419, 999999033);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (344, 'Disposable Bedpans', 'Pads used with a defibrillator to deliver an electric shock to the heart.', 330, 1, 411, 999999326);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (345, 'AED Training Unit', 'A kit containing devices used to establish or maintain a patient''s airway.', 388, 0, 421, 999999291);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (346, 'Orthopedic Walker', 'Masks used to deliver oxygen to patients with respiratory conditions or emergencies.', 109, 0, 421, 999999146);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (347, 'First Aid Kit', 'Kits containing tools and reagents for diagnosing specific medical conditions or infections.', 137, 1, 422, 999999058);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (348, 'Pulse Oximeter', 'Cannulas inserted into the nostrils to deliver oxygen to patients.', 71, 0, 405, 999999185);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (349, 'Medical Suction Canisters', 'A thin tube inserted into a vein to administer fluids medication or blood products.', 190, 0, 404, 999999245);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (350, 'Laryngoscope', 'A kit containing instruments and materials for suturing wounds.', 62, 0, 418, 999999133);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (351, 'Blood Glucose Test Strips', 'Blades used for cutting through orthopedic casts during cast removal.', 232, 0, 412, 999999133);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (352, 'Nebulizer', 'Devices used to secure tracheostomy tubes in place to prevent accidental removal.', 248, 0, 406, 999999383);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (353, 'Blood Pressure Cuff', 'Handheld ultrasound devices used for point-of-care diagnostics.', 108, 0, 415, 999999216);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (354, 'Medical Feeding Pumps', 'A device used to immobilize and support fractures or injuries to the arms or legs.', 136, 1, 416, 999999170);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (355, 'Multi-Trauma Dressing', 'A device used to measure the concentration of glucose in the blood.', 156, 0, 423, 999999070);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (356, 'Disinfectant Wipes', 'Medication used to relieve pain.', 245, 1, 422, 999999228);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (357, 'AED Training Unit', 'A device used to administer a measured dose of epinephrine in cases of severe allergic reactions.', 72, 0, 405, 999999107);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (358, 'Hemostatic Dressing', 'A device used to support a patient''s neck and head in cases of suspected cervical spine injuries.', 179, 1, 411, 999999036);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (359, 'Cervical Collar', 'Materials used to create custom splints for immobilizing and supporting fractures or injuries.', 167, 1, 420, 999999233);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (360, 'Splint', 'A device used to measure the oxygen saturation of the blood.', 150, 0, 418, 999999310);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (361, 'Saline Solution', 'Scales used to measure the weight of patients.', 374, 0, 409, 999999340);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (362, 'Glucose Meter', 'Cannulas inserted into the nostrils to deliver oxygen to patients.', 196, 0, 412, 999999202);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (363, 'Medical Tape', 'Wipes saturated with disinfectant solution used to clean surfaces and equipment.', 379, 1, 405, 999999380);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (364, 'Medical Tourniquets', 'Training devices used to simulate the operation of cardiac defibrillators.', 334, 1, 421, 999999067);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (365, 'Ambu Bags', 'Materials used to create custom splints for immobilizing and supporting fractures or injuries.', 367, 0, 415, 999999248);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (366, 'Intravenous Catheter', 'Needles used for injections or drawing blood samples.', 359, 0, 406, 999999278);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (367, 'Medical Tape', 'Kits containing supplies for cleaning and maintaining tracheostomy tubes.', 293, 1, 406, 999999270);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (368, 'Medical Waste Bins', 'A device used to apply pressure to a limb or extremity in order to control bleeding.', 389, 1, 412, 999999193);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (369, 'Urinary Catheters', 'A kit containing instruments and materials for suturing wounds.', 320, 0, 409, 999999291);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (370, 'Splint', 'Scales used to measure the weight of patients.', 362, 1, 419, 999999256);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (371, 'Cardiac Monitor', 'A rigid dressing used to immobilize and protect a broken bone or injured limb.', 167, 0, 410, 547098765);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (372, 'Intravenous Infusion Pumps', 'Wipes saturated with disinfectant solution used to clean surfaces and equipment.', 74, 0, 416, 999999054);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (373, 'Pediatric Airway Management Devices', 'Devices used to warm intravenous fluids before administration to patients.', 161, 0, 412, 999999291);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (374, 'Blood Collection Tubes', 'Devices used to apply traction to fractured or dislocated bones for alignment and stabilization.', 134, 0, 416, 999999039);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (375, 'Orthopedic Walker', 'Implants used to stabilize or repair fractured or damaged bones.', 266, 1, 423, 999999015);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (376, 'Nebulizer', 'Circuits used to connect patients to mechanical ventilators for assisted breathing.', 279, 0, 420, 999999349);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (377, 'Suture Kit', 'Thin tubes inserted into veins to administer fluids or medication.', 378, 1, 403, 999999258);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (378, 'Nasopharyngeal Airway', 'Sets used to administer intravenous fluids or medication from IV bags to patients.', 230, 1, 406, 999999121);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (379, 'Cervical Collar', 'Disposable containers used for collecting urine and feces from bedridden patients.', 286, 1, 423, 999999118);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (380, 'Blood Glucose Test Strips', 'A device used to measure the concentration of glucose in the blood.', 366, 0, 418, 999999375);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (381, 'IV Fluid Warmers', 'Stands used to support bags of intravenous fluids during administration to patients.', 139, 1, 405, 999999119);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (382, 'Medical Suction Catheters', 'Stands used to support bags of intravenous fluids during administration to patients.', 265, 1, 410, 999999136);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (383, 'Intravenous Cannulas', 'Pads used with a defibrillator to deliver an electric shock to the heart.', 295, 0, 404, 999999119);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (384, 'AED Training Unit', 'A device used to administer a measured dose of epinephrine in cases of severe allergic reactions.', 178, 1, 416, 999999124);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (385, 'Oxygen Mask', 'Stretchers designed for use in ambulances for transporting patients.', 229, 0, 407, 541098765);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (386, 'Pediatric Airway Management Devices', 'Handheld devices used to measure blood pressure in clinical or home settings.', 344, 1, 419, 999999210);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (387, 'Splinting Materials', 'Canisters used to collect and dispose of suctioned fluids during medical procedures.', 202, 0, 418, 999999294);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (388, 'Oxygen Tank', 'Boots designed to immobilize and protect the foot and ankle.', 63, 1, 423, 999999260);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (389, 'Medical Tape', 'Devices inserted into the throat to maintain an open airway during anesthesia or resuscitation.', 208, 0, 408, 999999112);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (390, 'Pressure Infusion Bags', 'Sets of needles and syringes used for injections or aspirations.', 197, 1, 410, 999999176);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (391, 'Portable Defibrillators', 'Tourniquets used to control severe bleeding from extremity wounds.', 78, 0, 405, 999999299);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (392, 'Stretcher', 'A device used to measure the pressure of the blood in the arteries.', 274, 0, 413, 999999377);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (393, 'First Aid Kit', 'Bandages with a sticky backing used to cover small wounds or hold dressings in place.', 69, 1, 410, 999999225);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (4, 'Oxygen Mask', 'A mask placed over the nose and mouth to deliver oxygen to the patient.', 30, 0, 403, 999999000);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (6, 'Cardiac Monitor', 'A device that measures and displays the electrical activity of the heart.', 12, 0, 405, 999999200);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (8, 'Backboard', 'A flat board used for immobilizing a patient with suspected spinal injuries.', 22, 0, 407, 999999360);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (9, 'Splint', 'A device used for immobilizing a fractured or injured bone.', 28, 1, 408, 999999210);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (10, 'Tourniquet', 'A device used to apply pressure to a limb or extremity in order to control bleeding.', 35, 0, 409, 999999070);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (11, 'Neck Brace', 'A medical device used to support a patient''s neck and head in cases of suspected spinal injuries.', 17, 1, 410, 999999023);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (12, 'Nebulizer', 'A device that turns liquid medicine into a fine mist that can be inhaled into the lungs.', 14, 0, 411, 999999009);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (14, 'Blood Pressure Cuff', 'A device used to measure the pressure of the blood in the arteries.', 16, 0, 413, 999999100);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (15, 'Suture Kit', 'A kit containing instruments and materials for suturing wounds.', 11, 1, 414, 999999029);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (16, 'Orthopedic Splint', 'A device used to immobilize and support fractures or injuries to the arms or legs.', 19, 0, 415, 999999300);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (17, 'Glucose Meter', 'A device used to measure the concentration of glucose in the blood.', 9, 1, 416, 999999000);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (18, 'Epinephrine Auto-Injector', 'A device used to administer a measured dose of epinephrine in cases of severe allergic reactions.', 7, 0, 417, 999999002);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (19, 'Burn Dressing', 'A dressing used to cover and protect burns.', 23, 1, 418, 999999233);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (20, 'Defibrillator pads', 'Pads used with a defibrillator to deliver an electric shock to the heart.', 13, 0, 419, 999999008);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (21, 'Oxygen Tank', 'A tank containing compressed oxygen for medical use.', 24, 1, 420, 999999110);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (22, 'Airway Kit', 'A kit containing devices used to establish or maintain a patient''s airway.', 21, 0, 421, 999999112);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (24, 'Pulse Oximeter', 'A device used to measure the oxygen saturation of the blood.', 26, 0, 423, 999999231);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (28, 'Nasopharyngeal Airway', 'A device inserted through the nose to maintain an open airway.', 33, 0, 403, 999999099);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (29, 'Medical Gloves', 'Gloves worn by healthcare professionals to prevent contamination and protect against infection.', 38, 1, 404, 999999100);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (30, 'Adhesive Bandages', 'Bandages with a sticky backing used to cover small wounds or hold dressings in place.', 34, 0, 405, 999999080);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (31, 'Saline Solution', 'A sterile solution of salt in water used for various medical purposes.', 36, 1, 406, 999999015);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (32, 'Cervical Collar', 'A device used to support a patient''s neck and head in cases of suspected cervical spine injuries.', 39, 0, 407, 999999001);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (33, 'Multi-Trauma Dressing', 'A large sterile dressing used to cover extensive wounds or burns.', 42, 1, 408, 999999009);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (34, 'Nebulizer Mask', 'A mask used to deliver aerosolized medication to the lungs.', 29, 0, 409, 999999020);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (35, 'Stretcher', 'A portable bed or litter for transporting patients.', 43, 1, 410, 999999031);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (36, 'CPR Mask', 'A device used to administer rescue breaths during cardiopulmonary resuscitation (CPR).', 27, 0, 411, 999999333);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (37, 'First Aid Kit', 'A kit containing supplies and equipment for administering basic first aid.', 46, 1, 412, 999999321);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (38, 'Blood Collection Tubes', 'Tubes used for collecting and storing blood samples for laboratory testing.', 41, 0, 413, 999999210);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (39, 'Disposable Syringes', 'Syringes designed for single use to administer medication or draw blood.', 44, 1, 414, 999999111);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (40, 'Medical Tape', 'A type of adhesive tape used to secure dressings or bandages in place.', 45, 0, 415, 999999222);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (41, 'AED Training Unit', 'A training device used to simulate the operation of an automated external defibrillator.', 48, 1, 416, 999999129);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (42, 'Intravenous Catheter', 'A thin tube inserted into a vein to administer fluids medication or blood products.', 47, 0, 417, 999999028);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (43, 'Splinting Materials', 'Materials used to immobilize and support fractures or injuries.', 49, 1, 418, 999999360);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (44, 'Blood Glucose Test Strips', 'Strips used with a glucose meter to test the level of glucose in the blood.', 50, 0, 419, 999999380);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (45, 'Medical Suction Device', 'A device used to remove mucus blood or other fluids from the body.', 53, 1, 420, 999999099);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (46, 'Chest Seal', 'A device used to cover penetrating chest wounds and prevent air from entering the chest cavity.', 51, 0, 421, 999999000);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (47, 'Orthopedic Cast', 'A rigid dressing used to immobilize and protect a broken bone or injured limb.', 54, 1, 422, 999999009);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (48, 'Alcohol Swabs', 'Swabs saturated with alcohol used to clean and disinfect the skin before injections or procedures.', 55, 0, 423, 999999031);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (52, 'Splinter Forceps', 'Forceps designed for removing splinters or foreign objects from the skin.', 59, 0, 403, 999999167);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (53, 'IV Start Kit', 'A kit containing supplies for starting intravenous lines.', 58, 1, 404, 999999123);
commit;
prompt 100 records committed...
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (54, 'Portable Ventilator', 'A device used to assist or replace spontaneous breathing in patients.', 61, 0, 405, 999999178);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (55, 'Analgesic Medication', 'Medication used to relieve pain.', 60, 1, 406, 999999198);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (56, 'Hemostatic Dressing', 'A dressing designed to promote blood clotting and control bleeding.', 63, 0, 407, 999999116);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (57, 'Laryngoscope', 'A medical instrument used to view the inside of the throat and larynx.', 62, 1, 408, 999999023);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (58, 'Orthopedic Boots', 'Boots designed to immobilize and protect the foot and ankle.', 65, 0, 409, 999999378);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (59, 'Orthopedic Braces', 'Braces used to support and stabilize joints or limbs.', 64, 1, 410, 999999078);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (60, 'Disposable Gloves', 'Gloves designed for single use to prevent contamination and infection.', 67, 0, 411, 999999191);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (61, 'Orthopedic Walker', 'A device used to support and assist walking for patients with lower limb injuries or disabilities.', 66, 1, 412, 999999212);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (62, 'IV Fluid Warmers', 'Devices used to warm intravenous fluids before administration to patients.', 69, 0, 413, 999999100);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (63, 'Rescue Breathing Masks', 'Masks used to deliver rescue breaths during CPR or respiratory emergencies.', 68, 1, 414, 999999200);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (64, 'Disinfectant Wipes', 'Wipes saturated with disinfectant solution used to clean surfaces and equipment.', 71, 0, 415, 999999300);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (65, 'Diagnostic Kits', 'Kits containing tools and reagents for diagnosing specific medical conditions or infections.', 70, 1, 416, 999999301);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (66, 'Portable Ultrasound Machines', 'Handheld ultrasound devices used for point-of-care diagnostics.', 73, 0, 417, 999999201);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (67, 'Cardiac Defibrillator Training Units', 'Training devices used to simulate the operation of cardiac defibrillators.', 72, 1, 418, 999999202);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (68, 'Nasogastric Tubes', 'Tubes inserted through the nose into the stomach for feeding or drainage.', 75, 0, 419, 999999101);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (69, 'Orthopedic Splinting Materials', 'Materials used to create custom splints for immobilizing and supporting fractures or injuries.', 74, 1, 420, 999999103);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (70, 'Laryngeal Mask Airways', 'Devices inserted into the throat to maintain an open airway during anesthesia or resuscitation.', 77, 0, 421, 999999345);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (71, 'Ambu Bags', 'Manual resuscitators used to provide positive pressure ventilation to patients.', 76, 1, 422, 999999001);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (72, 'Hypodermic Needles', 'Needles used for injections or drawing blood samples.', 79, 0, 423, 999999111);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (76, 'Medical Tourniquets', 'Tourniquets used to control severe bleeding from extremity wounds.', 83, 0, 403, 999999002);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (77, 'Intravenous Cannulas', 'Thin tubes inserted into veins to administer fluids or medication.', 82, 1, 404, 999999003);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (78, 'Tracheostomy Tubes', 'Tubes inserted into a surgically created opening in the trachea to assist breathing.', 85, 0, 405, 999999006);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (79, 'Portable Oxygen Concentrators', 'Devices that extract oxygen from the air and deliver it to patients via a nasal cannula or mask.', 84, 1, 406, 999999007);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (80, 'Electrocardiogram (ECG) Machines', 'Devices used to record the electrical activity of the heart for diagnostic purposes.', 87, 0, 407, 999999011);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (81, 'Medical Scales', 'Scales used to measure the weight of patients.', 86, 1, 408, 999999013);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (82, 'Pediatric Airway Management Devices', 'Devices specifically designed for managing pediatric airways during resuscitation.', 89, 0, 409, 999999019);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (83, 'Medical Suction Catheters', 'Catheters used to remove secretions and fluids from the airway.', 88, 1, 410, 999999021);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (84, 'Orthopedic Casting Materials', 'Materials used to create casts for immobilizing and supporting fractures or injuries.', 91, 0, 411, 999999322);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (85, 'Nasal Oxygen Cannulas', 'Cannulas inserted into the nostrils to deliver oxygen to patients.', 90, 1, 412, 999999232);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (87, 'Ambulance Stretchers', 'Stretchers designed for use in ambulances for transporting patients.', 92, 1, 414, 999999033);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (88, 'Intravenous Drip Stands', 'Stands used to support bags of intravenous fluids during administration to patients.', 95, 0, 415, 999999003);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (89, 'Medical Ventilator Circuits', 'Circuits used to connect patients to mechanical ventilators for assisted breathing.', 94, 1, 416, 999999001);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (90, 'Orthopedic Splinting Tools', 'Tools used to apply and shape splinting materials for orthopedic injuries.', 97, 0, 417, 999999002);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (91, 'Medical Needles and Syringes', 'Sets of needles and syringes used for injections or aspirations.', 96, 1, 418, 999999000);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (92, 'Portable Blood Pressure Monitors', 'Handheld devices used to measure blood pressure in clinical or home settings.', 99, 0, 419, 999999000);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (93, 'Enteral Feeding Tubes', 'Tubes inserted into the digestive tract for delivering nutrition or medications.', 98, 1, 420, 999999012);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (94, 'Medical Oxygen Masks', 'Masks used to deliver oxygen to patients with respiratory conditions or emergencies.', 101, 0, 421, 999999370);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (95, 'Chest Decompression Needles', 'Needles used for emergency decompression of tension pneumothorax.', 100, 1, 422, 999999160);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (96, 'Intravenous Infusion Pumps', 'Devices used to deliver fluids medications or nutrients into the bloodstream at a controlled rate.', 103, 0, 423, 999999122);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (101, 'Portable Defibrillators', 'Defibrillators designed for easy transport and use in various settings.', 106, 1, 404, 999999111);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (102, 'Disposable Bedpans', 'Disposable containers used for collecting urine and feces from bedridden patients.', 109, 0, 405, 999999089);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (103, 'Orthopedic External Fixators', 'Devices used to stabilize and support fractured bones externally.', 108, 1, 406, 999999060);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (104, 'Medical Cast Saw Blades', 'Blades used for cutting through orthopedic casts during cast removal.', 111, 0, 407, 999999033);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (105, 'Medical Feeding Pumps', 'Pumps used to deliver nutrition or medications directly into the digestive tract.', 110, 1, 408, 999999011);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (106, 'Pressure Infusion Bags', 'Bags used to apply controlled pressure to intravenous fluids during rapid infusion.', 113, 0, 409, 999999090);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (107, 'Laryngoscope Blades', 'Blades used with laryngoscopes for visualizing the larynx and inserting endotracheal tubes.', 112, 1, 410, 999999098);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (108, 'Orthopedic Traction Devices', 'Devices used to apply traction to fractured or dislocated bones for alignment and stabilization.', 115, 0, 411, 999999099);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (110, 'Urinary Catheters', 'Flexible tubes inserted into the bladder to drain urine.', 117, 0, 413, 999999101);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (111, 'Medical Sterilization Pouches', 'Pouches used to hold and sterilize medical instruments and supplies.', 116, 1, 414, 999999000);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (112, 'Anesthesia Masks', 'Masks used to deliver anesthesia gases or oxygen to patients during surgery or procedures.', 119, 0, 415, 999999117);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (113, 'Orthopedic Implants', 'Implants used to stabilize or repair fractured or damaged bones.', 118, 1, 416, 999999088);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (114, 'Medical Traction Splints', 'Splints used to stabilize and immobilize fractured femurs or lower limbs.', 121, 0, 417, 999999121);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (115, 'Feeding Tube Extensions', 'Extensions used to connect enteral feeding tubes to feeding pumps or syringes.', 120, 1, 418, 999999120);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (116, 'Tracheostomy Care Kits', 'Kits containing supplies for cleaning and maintaining tracheostomy tubes.', 123, 0, 419, 999999032);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (117, 'Medical Suction Canisters', 'Canisters used to collect and dispose of suctioned fluids during medical procedures.', 122, 1, 420, 999999019);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (118, 'Orthopedic Tourniquet Systems', 'Systems used to apply and control pressure to extremities to control bleeding during surgery.', 125, 0, 421, 999999022);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (124, 'Medical Waste Bins', 'Bins used for the safe disposal of medical waste such as used needles syringes and dressings.', 131, 0, 403, 999999027);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (125, 'Tracheostomy Tube Holders', 'Devices used to secure tracheostomy tubes in place to prevent accidental removal.', 130, 1, 404, 999999028);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (127, 'Orthopedic Internal Fixation Devices', 'Devices used to stabilize fractured bones internally with screws plates or rods.', 132, 1, 406, 999999030);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (128, 'Intravenous Administration Sets', 'Sets used to administer intravenous fluids or medication from IV bags to patients.', 135, 0, 407, 999999031);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (200, 'Oxygen Tank', 'A kit containing supplies and equipment for administering basic first aid.', 65, 0, 421, 999999317);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (201, 'Tracheostomy Tubes', 'A thin tube inserted into a vein to administer fluids medication or blood products.', 368, 0, 422, 999999330);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (202, 'Intravenous Cannulas', 'Needles used for injections or drawing blood samples.', 160, 0, 418, 999999331);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (203, 'Medical Needles and Syringes', 'Devices specifically designed for managing pediatric airways during resuscitation.', 63, 1, 423, 999999379);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (204, 'Epinephrine Auto-Injector', 'Devices used to apply traction to fractured or dislocated bones for alignment and stabilization.', 145, 1, 406, 999999351);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (205, 'Orthopedic External Fixators', 'A device used to apply pressure to a limb or extremity in order to control bleeding.', 366, 1, 411, 999999305);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (206, 'Tracheostomy Care Kits', 'A device used to immobilize and support fractures or injuries to the arms or legs.', 248, 1, 412, 999999083);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (207, 'Feeding Tube Extensions', 'Materials used to immobilize and support fractures or injuries.', 261, 0, 423, 999999140);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (208, 'Tracheostomy Tubes', 'A device used for immobilizing a fractured or injured bone.', 175, 0, 412, 999999068);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (209, 'Pressure Infusion Bags', 'A medical instrument used to view the inside of the throat and larynx.', 208, 0, 415, 545098765);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (210, 'Blood Collection Tubes', 'Devices used to record the electrical activity of the heart for diagnostic purposes.', 222, 0, 410, 999999238);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (211, 'Intravenous Administration Sets', 'Devices used to stabilize fractured bones internally with screws plates or rods.', 146, 1, 403, 999999036);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (212, 'Medical Suction Catheters', 'Defibrillators designed for easy transport and use in various settings.', 97, 0, 414, 999999072);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (213, 'Feeding Tube Extensions', 'Medication used to relieve pain.', 104, 1, 419, 999999281);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (214, 'Cervical Collar', 'Devices used to record the electrical activity of the heart for diagnostic purposes.', 206, 0, 414, 999999258);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (215, 'Orthopedic Splint', 'Masks used to deliver anesthesia gases or oxygen to patients during surgery or procedures.', 365, 0, 409, 999999000);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (216, 'AED Training Unit', 'Handheld ultrasound devices used for point-of-care diagnostics.', 248, 1, 404, 999999122);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (217, 'Nasopharyngeal Airway', 'A type of adhesive tape used to secure dressings or bandages in place.', 159, 0, 407, 999999230);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (218, 'Medical Ventilator Circuits', 'A device used to assist or replace spontaneous breathing in patients.', 240, 0, 414, 999999369);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (219, 'Tracheostomy Tube Holders', 'Bins used for the safe disposal of medical waste such as used needles syringes and dressings.', 250, 0, 409, 999999022);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (220, 'Tourniquet', 'A dressing used to cover and protect burns.', 303, 0, 407, 999999278);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (221, 'Portable Defibrillators', 'A device used to administer a measured dose of epinephrine in cases of severe allergic reactions.', 312, 0, 423, 999999261);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (222, 'First Aid Kit', 'Masks used to deliver anesthesia gases or oxygen to patients during surgery or procedures.', 206, 0, 414, 999999316);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (223, 'Medical Sterilization Pouches', 'A device that measures and displays the electrical activity of the heart.', 242, 0, 423, 999999242);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (224, 'Suture Kit', 'Devices used to secure tracheostomy tubes in place to prevent accidental removal.', 119, 0, 413, 999999347);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (225, 'Defibrillator pads', 'Strips used with a glucose meter to test the level of glucose in the blood.', 123, 0, 409, 999999176);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (226, 'Laryngeal Mask Airways', 'Syringes designed for single use to administer medication or draw blood.', 99, 0, 418, 999999099);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (227, 'Hemostatic Dressing', 'A device used to remove mucus blood or other fluids from the body.', 206, 0, 409, 999999362);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (228, 'Nebulizer', 'Needles used for injections or drawing blood samples.', 263, 1, 420, 999999055);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (229, 'Feeding Tube Extensions', 'Defibrillators designed for easy transport and use in various settings.', 81, 0, 404, 999999160);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (230, 'Orthopedic External Fixators', 'A type of adhesive tape used to secure dressings or bandages in place.', 318, 0, 417, 999999210);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (231, 'Hypodermic Needles', 'Scales used to measure the weight of patients.', 246, 0, 404, 545678901);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (232, 'Intravenous Catheter', 'Gloves worn by healthcare professionals to prevent contamination and protect against infection.', 248, 1, 403, 999999385);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (233, 'Disinfectant Wipes', 'A device used to apply pressure to a limb or extremity in order to control bleeding.', 104, 0, 420, 999999279);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (234, 'Laryngeal Mask Airways', 'Gloves designed for single use to prevent contamination and infection.', 326, 1, 418, 999999167);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (235, 'Enteral Feeding Tubes', 'Gloves worn by healthcare professionals to prevent contamination and protect against infection.', 382, 1, 407, 999999363);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (236, 'Portable Defibrillators', 'A device that turns liquid medicine into a fine mist that can be inhaled into the lungs.', 98, 0, 406, 999999322);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (237, 'Pulse Oximeter', 'Kits containing supplies for cleaning and maintaining tracheostomy tubes.', 226, 1, 411, 999999101);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (238, 'Burn Dressing', 'A device used to measure the pressure of the blood in the arteries.', 309, 0, 413, 999999244);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (239, 'Medical Feeding Pumps', 'A device used to cover penetrating chest wounds and prevent air from entering the chest cavity.', 83, 0, 416, 999999023);
commit;
prompt 200 records committed...
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (240, 'Orthopedic Walker', 'Materials used to create casts for immobilizing and supporting fractures or injuries.', 280, 1, 409, 999999082);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (241, 'Nasogastric Tubes', 'Materials used to create custom splints for immobilizing and supporting fractures or injuries.', 138, 0, 411, 999999087);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (242, 'IV Fluid Warmers', 'Sets used to administer intravenous fluids or medication from IV bags to patients.', 203, 0, 410, 999999248);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (243, 'Splinter Forceps', 'Braces used to support and stabilize joints or limbs.', 300, 0, 403, 999999075);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (244, 'Chest Seal', 'Stretchers designed for use in ambulances for transporting patients.', 329, 0, 421, 999999168);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (245, 'Neck Brace', 'Boots designed to immobilize and protect the foot and ankle.', 242, 0, 416, 999999241);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (246, 'Urinary Catheters', 'Materials used to immobilize and support fractures or injuries.', 77, 0, 408, 999999285);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (247, 'Medical Sterilization Pouches', 'Pouches used to hold and sterilize medical instruments and supplies.', 65, 1, 416, 999999128);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (248, 'Cardiac Monitor', 'Circuits used to connect patients to mechanical ventilators for assisted breathing.', 144, 1, 413, 999999341);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (249, 'IV Start Kit', 'A device used to measure the oxygen saturation of the blood.', 239, 0, 420, 999999114);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (250, 'Medical Feeding Pumps', 'Devices used to stabilize and support fractured bones externally.', 190, 0, 409, 999999202);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (251, 'Intravenous Administration Sets', 'Devices inserted into the throat to maintain an open airway during anesthesia or resuscitation.', 224, 0, 405, 999999109);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (252, 'Medical Ventilator Circuits', 'Splints used to stabilize and immobilize fractured femurs or lower limbs.', 317, 1, 412, 999999160);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (253, 'Burn Dressing', 'A kit containing devices used to establish or maintain a patient''s airway.', 230, 0, 407, 999999174);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (254, 'Anesthesia Masks', 'A device used to administer a measured dose of epinephrine in cases of severe allergic reactions.', 89, 0, 409, 999999195);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (255, 'Tracheostomy Care Kits', 'Stands used to support bags of intravenous fluids during administration to patients.', 65, 1, 415, 999999156);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (256, 'Epinephrine Auto-Injector', 'Medication used to relieve pain.', 153, 0, 419, 999999268);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (257, 'Intravenous Catheter', 'Extensions used to connect enteral feeding tubes to feeding pumps or syringes.', 334, 0, 408, 999999018);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (258, 'Portable Blood Pressure Monitors', 'Blades used with laryngoscopes for visualizing the larynx and inserting endotracheal tubes.', 370, 1, 423, 999999102);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (259, 'Urinary Catheters', 'Splints used to stabilize and immobilize fractured femurs or lower limbs.', 110, 1, 412, 999999229);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (260, 'Disinfectant Wipes', 'Handheld ultrasound devices used for point-of-care diagnostics.', 359, 1, 419, 999999312);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (261, 'Cervical Collar', 'Devices used to warm intravenous fluids before administration to patients.', 173, 1, 414, 545678901);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (262, 'Splint', 'Masks used to deliver rescue breaths during CPR or respiratory emergencies.', 157, 0, 412, 999999266);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (263, 'Orthopedic Boots', 'Devices inserted into the throat to maintain an open airway during anesthesia or resuscitation.', 108, 0, 418, 999999254);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (264, 'Medical Tourniquets', 'Devices used to deliver fluids medications or nutrients into the bloodstream at a controlled rate.', 116, 1, 408, 999999076);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (265, 'Splint', 'Bandages with a sticky backing used to cover small wounds or hold dressings in place.', 196, 1, 414, 999999068);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (266, 'Orthopedic Splinting Tools', 'A device that turns liquid medicine into a fine mist that can be inhaled into the lungs.', 227, 0, 410, 999999262);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (267, 'Stretcher', 'Kits containing tools and reagents for diagnosing specific medical conditions or infections.', 205, 0, 421, 546789012);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (268, 'Urinary Catheters', 'Masks used to deliver oxygen to patients with respiratory conditions or emergencies.', 134, 1, 406, 999999118);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (269, 'Chest Decompression Needles', 'Pouches used to hold and sterilize medical instruments and supplies.', 203, 1, 412, 999999092);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (270, 'Medical Waste Bins', 'Tourniquets used to control severe bleeding from extremity wounds.', 203, 1, 421, 999999018);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (271, 'Orthopedic Braces', 'A device used to measure the concentration of glucose in the blood.', 312, 1, 409, 999999269);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (272, 'Intravenous Cannulas', 'Devices used to deliver fluids medications or nutrients into the bloodstream at a controlled rate.', 103, 1, 421, 999999288);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (273, 'Nebulizer', 'A device used to support a patient''s neck and head in cases of suspected cervical spine injuries.', 383, 1, 412, 999999139);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (274, 'Cardiac Defibrillator Training Units', 'Wipes saturated with disinfectant solution used to clean surfaces and equipment.', 67, 1, 417, 999999030);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (275, 'Cardiac Defibrillator Training Units', 'Masks used to deliver rescue breaths during CPR or respiratory emergencies.', 320, 1, 412, 999999215);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (276, 'Nebulizer Mask', 'A device used to remove mucus blood or other fluids from the body.', 131, 1, 403, 999999213);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (277, 'Medical Gloves', 'Masks used to deliver rescue breaths during CPR or respiratory emergencies.', 211, 1, 411, 999999192);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (278, 'Medical Suction Canisters', 'Materials used to create casts for immobilizing and supporting fractures or injuries.', 367, 0, 405, 999999274);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (279, 'Medical Sterilization Pouches', 'A device used to remove mucus blood or other fluids from the body.', 168, 1, 404, 544098765);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (280, 'Cardiac Defibrillator Training Units', 'A device used to assist or replace spontaneous breathing in patients.', 221, 0, 403, 999999121);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (281, 'Oxygen Mask', 'Devices specifically designed for managing pediatric airways during resuscitation.', 186, 1, 408, 999999354);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (282, 'Medical Suction Canisters', 'A device used to assist or replace spontaneous breathing in patients.', 135, 0, 410, 999999273);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (283, 'Medical Ventilator Circuits', 'Stretchers designed for use in ambulances for transporting patients.', 102, 1, 418, 999999323);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (284, 'Oxygen Tank', 'Handheld ultrasound devices used for point-of-care diagnostics.', 97, 0, 420, 999999350);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (285, 'Suture Kit', 'Catheters used to remove secretions and fluids from the airway.', 112, 0, 421, 999999369);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (286, 'Orthopedic Splinting Tools', 'A device inserted through the nose to maintain an open airway.', 113, 0, 417, 999999313);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (287, 'Medical Feeding Pumps', 'A training device used to simulate the operation of an automated external defibrillator.', 124, 1, 408, 999999177);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (288, 'Intravenous Infusion Pumps', 'Circuits used to connect patients to mechanical ventilators for assisted breathing.', 380, 0, 415, 999999381);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (289, 'Medical Feeding Pumps', 'A device inserted through the nose to maintain an open airway.', 214, 1, 416, 999999088);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (290, 'Hypodermic Needles', 'Bandages with a sticky backing used to cover small wounds or hold dressings in place.', 381, 1, 419, 999999126);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (291, 'Portable Oxygen Concentrators', 'A sterile solution of salt in water used for various medical purposes.', 293, 1, 405, 999999229);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (292, 'Tourniquet', 'Bandages with a sticky backing used to cover small wounds or hold dressings in place.', 134, 0, 418, 999999245);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (293, 'Pediatric Airway Management Devices', 'Kits containing tools and reagents for diagnosing specific medical conditions or infections.', 118, 1, 414, 999999067);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (294, 'First Aid Kit', 'Defibrillators designed for easy transport and use in various settings.', 318, 1, 423, 999999360);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (295, 'Medical Suction Canisters', 'Devices inserted into the throat to maintain an open airway during anesthesia or resuscitation.', 209, 0, 407, 999999364);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (296, 'Hypodermic Needles', 'Extensions used to connect enteral feeding tubes to feeding pumps or syringes.', 70, 0, 414, 999999215);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (297, 'CPR Mask', 'Sets used to administer intravenous fluids or medication from IV bags to patients.', 346, 1, 413, 999999243);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (298, 'Medical Needles and Syringes', 'Thin tubes inserted into veins to administer fluids or medication.', 238, 0, 403, 999999293);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (299, 'Stretcher', 'Kits containing supplies for cleaning and maintaining tracheostomy tubes.', 355, 1, 408, 999999154);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (300, 'Defibrillator pads', 'Splints used to stabilize and immobilize fractured femurs or lower limbs.', 138, 1, 413, 999999014);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (301, 'Medical Suction Canisters', 'Wipes saturated with disinfectant solution used to clean surfaces and equipment.', 343, 1, 420, 999999374);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (302, 'Intravenous Cannulas', 'Devices inserted into the throat to maintain an open airway during anesthesia or resuscitation.', 70, 1, 404, 999999378);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (303, 'Electrocardiogram (ECG) Machines', 'Needles used for emergency decompression of tension pneumothorax.', 295, 1, 415, 999999290);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (304, 'Disposable Bedpans', 'Braces used to support and stabilize joints or limbs.', 118, 1, 422, 548901234);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (305, 'Cardiac Monitor', 'Gloves designed for single use to prevent contamination and infection.', 336, 0, 418, 999999202);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (306, 'Defibrillator pads', 'Circuits used to connect patients to mechanical ventilators for assisted breathing.', 376, 0, 420, 999999208);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (307, 'Nebulizer', 'A device used to support a patient''s neck and head in cases of suspected cervical spine injuries.', 390, 0, 404, 999999035);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (308, 'Pulse Oximeter', 'Sets used to administer intravenous fluids or medication from IV bags to patients.', 238, 1, 411, 999999198);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (309, 'Adhesive Bandages', 'A flat board used for immobilizing a patient with suspected spinal injuries.', 76, 0, 421, 999999154);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (310, 'Orthopedic Casting Materials', 'Flexible tubes inserted into the bladder to drain urine.', 78, 0, 414, 999999095);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (311, 'Disinfectant Wipes', 'Tubes used for collecting and storing blood samples for laboratory testing.', 369, 0, 416, 999999144);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (312, 'Enteral Feeding Tubes', 'Sets used to administer intravenous fluids or medication from IV bags to patients.', 145, 0, 415, 999999132);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (313, 'Pulse Oximeter', 'Devices that extract oxygen from the air and deliver it to patients via a nasal cannula or mask.', 73, 0, 423, 999999112);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (314, 'Medical Cast Saw Blades', 'A flat board used for immobilizing a patient with suspected spinal injuries.', 162, 0, 408, 999999106);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (315, 'Splinting Materials', 'Syringes designed for single use to administer medication or draw blood.', 88, 0, 412, 999999165);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (316, 'Nebulizer Mask', 'Kits containing tools and reagents for diagnosing specific medical conditions or infections.', 233, 1, 420, 999999148);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (317, 'Burn Dressing', 'Pouches used to hold and sterilize medical instruments and supplies.', 374, 1, 408, 999999377);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (318, 'Neck Brace', 'Manual resuscitators used to provide positive pressure ventilation to patients.', 126, 1, 407, 999999260);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (319, 'Laryngeal Mask Airways', 'Devices specifically designed for managing pediatric airways during resuscitation.', 136, 0, 415, 999999383);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (320, 'Tourniquet', 'Manual resuscitators used to provide positive pressure ventilation to patients.', 322, 1, 423, 999999256);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (321, 'Hemostatic Dressing', 'Sets of needles and syringes used for injections or aspirations.', 190, 0, 416, 999999288);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (322, 'Feeding Tube Extensions', 'A device used to support and assist walking for patients with lower limb injuries or disabilities.', 74, 0, 417, 999999230);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (323, 'Portable Ventilator', 'Kits containing supplies for cleaning and maintaining tracheostomy tubes.', 316, 1, 408, 999999198);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (324, 'Electrocardiogram (ECG) Machines', 'Braces used to support and stabilize joints or limbs.', 362, 0, 406, 999999101);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (325, 'First Aid Kit', 'Systems used to apply and control pressure to extremities to control bleeding during surgery.', 353, 1, 403, 999999253);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (326, 'Laryngoscope Blades', 'A device that measures and displays the electrical activity of the heart.', 176, 1, 403, 999999208);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (327, 'Intravenous Cannulas', 'A device used to administer rescue breaths during cardiopulmonary resuscitation (CPR).', 289, 1, 419, 999999323);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (328, 'Intravenous Catheter', 'Devices that extract oxygen from the air and deliver it to patients via a nasal cannula or mask.', 150, 1, 422, 999999087);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (329, 'Disposable Gloves', 'Implants used to stabilize or repair fractured or damaged bones.', 340, 0, 412, 999999220);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (330, 'Orthopedic Walker', 'Manual resuscitators used to provide positive pressure ventilation to patients.', 157, 0, 411, 999999039);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (331, 'Blood Pressure Cuff', 'Sets used to administer intravenous fluids or medication from IV bags to patients.', 83, 1, 418, 999999193);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (332, 'Intravenous Cannulas', 'Stretchers designed for use in ambulances for transporting patients.', 77, 0, 420, 999999385);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (333, 'Blood Collection Tubes', 'Stretchers designed for use in ambulances for transporting patients.', 107, 0, 422, 999999325);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (452, 'Medical Feeding Pumps', 'Gloves designed for single use to prevent contamination and infection.', 366, 0, 410, 999999306);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (453, 'IV Start Kit', 'Devices used to stabilize and support fractured bones externally.', 246, 1, 419, 999999134);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (454, 'Orthopedic Implants', 'A mask used to deliver aerosolized medication to the lungs.', 170, 0, 419, 999999353);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (455, 'Nebulizer Mask', 'Circuits used to connect patients to mechanical ventilators for assisted breathing.', 357, 1, 410, 999999186);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (456, 'IV Start Kit', 'A device used to remove mucus blood or other fluids from the body.', 147, 1, 409, 999999155);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (457, 'Chest Decompression Needles', 'Blades used for cutting through orthopedic casts during cast removal.', 305, 1, 403, 999999343);
commit;
prompt 300 records committed...
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (458, 'Disinfectant Wipes', 'Canisters used to collect and dispose of suctioned fluids during medical procedures.', 77, 1, 419, 999999270);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (459, 'Tracheostomy Tubes', 'Swabs saturated with alcohol used to clean and disinfect the skin before injections or procedures.', 256, 0, 416, 999999315);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (460, 'Nasopharyngeal Airway', 'A medical instrument used to view the inside of the throat and larynx.', 124, 0, 419, 999999070);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (461, 'AED Training Unit', 'A kit containing supplies and equipment for administering basic first aid.', 164, 0, 403, 999999298);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (462, 'Disposable Bedpans', 'A device used to remove mucus blood or other fluids from the body.', 369, 0, 417, 999999037);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (463, 'Laryngoscope Blades', 'Needles used for injections or drawing blood samples.', 220, 1, 404, 999999377);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (464, 'Epinephrine Auto-Injector', 'Devices specifically designed for managing pediatric airways during resuscitation.', 328, 0, 407, 999999003);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (465, 'Orthopedic Implants', 'A medical device used to support a patient''s neck and head in cases of suspected spinal injuries.', 385, 0, 403, 999999072);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (466, 'Orthopedic Splinting Materials', 'Devices that extract oxygen from the air and deliver it to patients via a nasal cannula or mask.', 332, 0, 420, 999999014);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (467, 'Enteral Feeding Tubes', 'A type of adhesive tape used to secure dressings or bandages in place.', 93, 1, 415, 999999238);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (468, 'Electrocardiogram (ECG) Machines', 'A device used to support a patient''s neck and head in cases of suspected cervical spine injuries.', 376, 0, 403, 999999335);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (469, 'Backboard', 'Tubes inserted through the nose into the stomach for feeding or drainage.', 227, 0, 416, 999999196);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (470, 'Feeding Tube Extensions', 'A flat board used for immobilizing a patient with suspected spinal injuries.', 142, 1, 406, 999999082);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (471, 'Nasogastric Tubes', 'A device used to administer rescue breaths during cardiopulmonary resuscitation (CPR).', 340, 1, 414, 999999313);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (472, 'Electrocardiogram (ECG) Machines', 'Pouches used to hold and sterilize medical instruments and supplies.', 264, 0, 403, 999999244);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (473, 'Medical Needles and Syringes', 'Thin tubes inserted into veins to administer fluids or medication.', 375, 1, 420, 999999231);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (474, 'Neck Brace', 'Pumps used to deliver nutrition or medications directly into the digestive tract.', 100, 0, 423, 999999116);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (475, 'Orthopedic Splinting Tools', 'Devices used to stabilize fractured bones internally with screws plates or rods.', 312, 1, 403, 999999304);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (476, 'Oxygen Tank', 'A device used to immobilize and support fractures or injuries to the arms or legs.', 195, 1, 413, 999999081);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (477, 'Medical Oxygen Masks', 'Canisters used to collect and dispose of suctioned fluids during medical procedures.', 232, 0, 407, 999999339);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (478, 'Stretcher', 'A device used to immobilize and support fractures or injuries to the arms or legs.', 223, 1, 415, 999999381);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (479, 'Orthopedic Traction Devices', 'A device used to apply pressure to a limb or extremity in order to control bleeding.', 350, 1, 407, 999999118);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (480, 'Disinfectant Wipes', 'Bags used to apply controlled pressure to intravenous fluids during rapid infusion.', 101, 1, 412, 546098765);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (481, 'Tracheostomy Tubes', 'Devices used to stabilize and support fractured bones externally.', 353, 0, 407, 999999112);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (482, 'Medical Scales', 'A device used to measure the oxygen saturation of the blood.', 187, 1, 408, 999999218);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (483, 'Laryngeal Mask Airways', 'Tourniquets used to control severe bleeding from extremity wounds.', 92, 1, 405, 999999090);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (484, 'Suture Kit', 'A medical instrument used to view the inside of the throat and larynx.', 166, 1, 423, 999999097);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (485, 'Portable Defibrillators', 'A mask placed over the nose and mouth to deliver oxygen to the patient.', 110, 1, 408, 543456789);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (486, 'Portable Ultrasound Machines', 'A device used to administer a measured dose of epinephrine in cases of severe allergic reactions.', 279, 0, 420, 999999334);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (487, 'IV Start Kit', 'Materials used to immobilize and support fractures or injuries.', 284, 0, 423, 999999109);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (488, 'Intravenous Cannulas', 'Sets used to administer intravenous fluids or medication from IV bags to patients.', 60, 1, 418, 999999182);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (489, 'Nebulizer', 'A device used to immobilize and support fractures or injuries to the arms or legs.', 167, 0, 410, 999999333);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (490, 'Defibrillator pads', 'Kits containing supplies for cleaning and maintaining tracheostomy tubes.', 386, 1, 422, 999999101);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (491, 'Tracheostomy Tube Holders', 'Thin tubes inserted into veins to administer fluids or medication.', 141, 0, 421, 999999096);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (492, 'Backboard', 'Defibrillators designed for easy transport and use in various settings.', 172, 0, 408, 999999138);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (493, 'Enteral Feeding Tubes', 'A dressing used to cover and protect burns.', 189, 0, 409, 999999252);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (494, 'Blood Pressure Cuff', 'Devices used to warm intravenous fluids before administration to patients.', 334, 1, 420, 999999106);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (495, 'Neck Brace', 'A device that turns liquid medicine into a fine mist that can be inhaled into the lungs.', 188, 1, 415, 999999205);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (496, 'Orthopedic Tourniquet Systems', 'Devices used to warm intravenous fluids before administration to patients.', 213, 1, 416, 999999316);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (497, 'Airway Kit', 'Gloves designed for single use to prevent contamination and infection.', 362, 0, 408, 999999199);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (498, 'Medical Tape', 'A device used to cover penetrating chest wounds and prevent air from entering the chest cavity.', 237, 0, 411, 999999116);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (499, 'Pediatric Airway Management Devices', 'Swabs saturated with alcohol used to clean and disinfect the skin before injections or procedures.', 323, 0, 405, 999999331);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (500, 'Electrocardiogram (ECG) Machines', 'Bins used for the safe disposal of medical waste such as used needles syringes and dressings.', 164, 1, 403, 999999176);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (501, 'Orthopedic Tourniquet Systems', 'A device used to measure the concentration of glucose in the blood.', 139, 1, 409, 999999225);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (502, 'Ambu Bags', 'Gloves designed for single use to prevent contamination and infection.', 215, 1, 414, 999999242);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (503, 'Orthopedic Cast', 'A dressing designed to promote blood clotting and control bleeding.', 386, 0, 420, 999999155);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (504, 'Diagnostic Kits', 'A device used to administer rescue breaths during cardiopulmonary resuscitation (CPR).', 248, 1, 410, 999999128);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (505, 'Intravenous Infusion Pumps', 'A tank containing compressed oxygen for medical use.', 134, 1, 423, 999999389);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (506, 'Orthopedic Casting Materials', 'Kits containing tools and reagents for diagnosing specific medical conditions or infections.', 127, 1, 421, 541234567);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (507, 'Orthopedic Splinting Materials', 'Tools used to apply and shape splinting materials for orthopedic injuries.', 251, 0, 423, 999999138);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (508, 'IV Start Kit', 'A device used for immobilizing a fractured or injured bone.', 259, 0, 419, 999999022);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (509, 'Orthopedic Splinting Tools', 'Stands used to support bags of intravenous fluids during administration to patients.', 239, 0, 423, 999999078);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (510, 'Medical Traction Splints', 'A kit containing supplies and equipment for administering basic first aid.', 317, 0, 416, 999999054);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (511, 'Orthopedic External Fixators', 'A device used to administer rescue breaths during cardiopulmonary resuscitation (CPR).', 98, 0, 423, 999999183);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (512, 'Splint', 'A device used to measure the pressure of the blood in the arteries.', 241, 1, 403, 999999021);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (513, 'Cardiac Monitor', 'A kit containing instruments and materials for suturing wounds.', 245, 1, 422, 999999319);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (514, 'Laryngoscope', 'Kits containing tools and reagents for diagnosing specific medical conditions or infections.', 68, 1, 410, 999999045);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (515, 'Blood Collection Tubes', 'A device used to support and assist walking for patients with lower limb injuries or disabilities.', 222, 1, 407, 999999064);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (516, 'IV Fluid Warmers', 'Braces used to support and stabilize joints or limbs.', 186, 0, 413, 999999165);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (517, 'Orthopedic Casting Materials', 'A large sterile dressing used to cover extensive wounds or burns.', 315, 0, 404, 999999068);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (518, 'Orthopedic Tourniquet Systems', 'A device used to immobilize and support fractures or injuries to the arms or legs.', 378, 0, 415, 999999102);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (519, 'Oxygen Tank', 'Handheld devices used to measure blood pressure in clinical or home settings.', 353, 0, 405, 543098765);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (520, 'Medical Cast Saw Blades', 'Thin tubes inserted into veins to administer fluids or medication.', 94, 1, 420, 999999271);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (521, 'Medical Suction Device', 'Materials used to create custom splints for immobilizing and supporting fractures or injuries.', 317, 1, 407, 999999014);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (522, 'Burn Dressing', 'Braces used to support and stabilize joints or limbs.', 132, 1, 408, 999999065);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (523, 'Blood Collection Tubes', 'A flat board used for immobilizing a patient with suspected spinal injuries.', 163, 0, 411, 999999039);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (524, 'Ambu Bags', 'A dressing used to cover and protect burns.', 378, 0, 411, 999999163);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (525, 'Tourniquet', 'A device used to apply pressure to a limb or extremity in order to control bleeding.', 344, 1, 415, 999999352);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (526, 'IV Start Kit', 'A portable bed or litter for transporting patients.', 249, 0, 405, 999999176);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (527, 'Nasal Oxygen Cannulas', 'Implants used to stabilize or repair fractured or damaged bones.', 287, 0, 408, 999999194);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (528, 'Medical Tourniquets', 'A device used to support and assist walking for patients with lower limb injuries or disabilities.', 303, 1, 417, 999999235);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (529, 'Blood Pressure Cuff', 'Stretchers designed for use in ambulances for transporting patients.', 89, 0, 423, 999999335);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (530, 'Portable Ultrasound Machines', 'Materials used to create custom splints for immobilizing and supporting fractures or injuries.', 224, 0, 410, 999999068);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (531, 'Medical Tape', 'Splints used to stabilize and immobilize fractured femurs or lower limbs.', 225, 0, 411, 999999016);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (532, 'Tracheostomy Tubes', 'Medication used to relieve pain.', 93, 0, 404, 999999303);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (533, 'Intravenous Administration Sets', 'A sterile solution of salt in water used for various medical purposes.', 62, 1, 411, 545678901);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (534, 'Orthopedic Splinting Materials', 'A dressing used to cover and protect burns.', 328, 1, 408, 999999137);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (535, 'Tracheostomy Tubes', 'Gloves worn by healthcare professionals to prevent contamination and protect against infection.', 61, 0, 419, 999999143);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (536, 'First Aid Kit', 'A thin tube inserted into a vein to administer fluids medication or blood products.', 73, 0, 406, 999999013);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (537, 'Ambu Bags', 'A device used to measure the pressure of the blood in the arteries.', 351, 0, 416, 999999342);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (538, 'Orthopedic Boots', 'Bandages with a sticky backing used to cover small wounds or hold dressings in place.', 183, 1, 416, 999999373);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (539, 'Hypodermic Needles', 'Forceps designed for removing splinters or foreign objects from the skin.', 65, 0, 415, 999999205);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (540, 'Nasal Oxygen Cannulas', 'A mask used to deliver aerosolized medication to the lungs.', 165, 1, 422, 547098765);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (541, 'Feeding Tube Extensions', 'Canisters used to collect and dispose of suctioned fluids during medical procedures.', 223, 1, 405, 999999051);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (542, 'Medical Gloves', 'Strips used with a glucose meter to test the level of glucose in the blood.', 337, 0, 404, 999999354);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (543, 'Medical Suction Device', 'A device that measures and displays the electrical activity of the heart.', 137, 0, 422, 999999154);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (544, 'Portable Blood Pressure Monitors', 'Bags used to apply controlled pressure to intravenous fluids during rapid infusion.', 69, 0, 403, 999999067);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (545, 'Tracheostomy Tubes', 'A kit containing supplies and equipment for administering basic first aid.', 234, 0, 409, 543456789);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (546, 'Cardiac Defibrillator Training Units', 'Bins used for the safe disposal of medical waste such as used needles syringes and dressings.', 219, 1, 403, 999999382);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (547, 'Stretcher', 'Canisters used to collect and dispose of suctioned fluids during medical procedures.', 107, 1, 406, 999999072);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (548, 'Medical Oxygen Masks', 'A tank containing compressed oxygen for medical use.', 125, 0, 405, 999999246);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (549, 'Medical Cast Saw Blades', 'A training device used to simulate the operation of an automated external defibrillator.', 220, 0, 420, 999999140);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (550, 'Medical Tape', 'Sets of needles and syringes used for injections or aspirations.', 89, 0, 412, 999999091);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (551, 'Medical Oxygen Masks', 'A device used to cover penetrating chest wounds and prevent air from entering the chest cavity.', 220, 1, 417, 999999123);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (552, 'Orthopedic External Fixators', 'Systems used to apply and control pressure to extremities to control bleeding during surgery.', 206, 1, 410, 999999016);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (553, 'Orthopedic Casting Materials', 'Medication used to relieve pain.', 124, 1, 403, 999999339);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (554, 'Epinephrine Auto-Injector', 'Handheld devices used to measure blood pressure in clinical or home settings.', 354, 1, 405, 999999250);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (555, 'Laryngeal Mask Airways', 'Splints used to stabilize and immobilize fractured femurs or lower limbs.', 152, 0, 412, 999999208);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (556, 'Hypodermic Needles', 'A device used to remove mucus blood or other fluids from the body.', 295, 1, 415, 999999008);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (557, 'Diagnostic Kits', 'Devices specifically designed for managing pediatric airways during resuscitation.', 343, 0, 406, 999999285);
commit;
prompt 400 records committed...
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (558, 'Orthopedic Tourniquet Systems', 'Wipes saturated with disinfectant solution used to clean surfaces and equipment.', 253, 1, 403, 544567890);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (559, 'Intravenous Cannulas', 'A type of adhesive tape used to secure dressings or bandages in place.', 194, 1, 415, 999999165);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (560, 'Laryngoscope Blades', 'Circuits used to connect patients to mechanical ventilators for assisted breathing.', 81, 0, 407, 999999300);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (561, 'Disposable Syringes', 'Tubes inserted into the digestive tract for delivering nutrition or medications.', 280, 1, 404, 999999127);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (562, 'Medical Waste Bins', 'Devices used to deliver fluids medications or nutrients into the bloodstream at a controlled rate.', 194, 0, 406, 999999088);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (563, 'Medical Tape', 'A device that measures and displays the electrical activity of the heart.', 313, 0, 408, 999999101);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (564, 'Laryngoscope', 'Defibrillators designed for easy transport and use in various settings.', 236, 1, 413, 999999296);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (565, 'Oxygen Mask', 'Tubes used for collecting and storing blood samples for laboratory testing.', 390, 1, 416, 999999335);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (566, 'Orthopedic Splint', 'A sterile solution of salt in water used for various medical purposes.', 143, 0, 421, 999999046);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (567, 'Orthopedic Splinting Tools', 'Devices inserted into the throat to maintain an open airway during anesthesia or resuscitation.', 386, 1, 414, 999999020);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (568, 'Medical Needles and Syringes', 'Gloves designed for single use to prevent contamination and infection.', 68, 1, 412, 999999157);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (569, 'First Aid Kit', 'A large sterile dressing used to cover extensive wounds or burns.', 108, 1, 410, 999999073);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (570, 'Oxygen Tank', 'Circuits used to connect patients to mechanical ventilators for assisted breathing.', 355, 1, 419, 545098765);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (571, 'Medical Waste Bins', 'Masks used to deliver anesthesia gases or oxygen to patients during surgery or procedures.', 290, 0, 407, 999999006);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (572, 'Tracheostomy Care Kits', 'A kit containing supplies and equipment for administering basic first aid.', 169, 0, 409, 999999114);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (573, 'Disposable Bedpans', 'Masks used to deliver anesthesia gases or oxygen to patients during surgery or procedures.', 268, 0, 403, 999999199);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (574, 'Alcohol Swabs', 'Blades used for cutting through orthopedic casts during cast removal.', 132, 1, 411, 999999050);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (575, 'Hemostatic Dressing', 'A kit containing devices used to establish or maintain a patient''s airway.', 183, 1, 416, 999999107);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (576, 'Ambu Bags', 'Pouches used to hold and sterilize medical instruments and supplies.', 102, 1, 414, 999999108);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (577, 'Defibrillator pads', 'A flat board used for immobilizing a patient with suspected spinal injuries.', 83, 0, 413, 999999251);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (578, 'Disposable Bedpans', 'Catheters used to remove secretions and fluids from the airway.', 252, 1, 421, 999999061);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (579, 'Nebulizer Mask', 'Tubes inserted into the digestive tract for delivering nutrition or medications.', 300, 0, 422, 999999359);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (580, 'Anesthesia Masks', 'A device used to cover penetrating chest wounds and prevent air from entering the chest cavity.', 95, 1, 413, 999999175);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (581, 'Nebulizer Mask', 'A type of adhesive tape used to secure dressings or bandages in place.', 262, 1, 415, 999999070);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (582, 'Medical Traction Splints', 'Flexible tubes inserted into the bladder to drain urine.', 109, 1, 403, 999999015);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (583, 'Chest Decompression Needles', 'Devices used to stabilize and support fractured bones externally.', 285, 1, 423, 999999112);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (584, 'Laryngeal Mask Airways', 'A device used to measure the pressure of the blood in the arteries.', 106, 0, 411, 999999343);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (585, 'Medical Suction Device', 'Pads used with a defibrillator to deliver an electric shock to the heart.', 366, 0, 415, 999999316);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (586, 'Cardiac Monitor', 'Tubes used for collecting and storing blood samples for laboratory testing.', 187, 1, 408, 999999025);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (587, 'Pulse Oximeter', 'Pumps used to deliver nutrition or medications directly into the digestive tract.', 353, 0, 413, 999999361);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (588, 'Epinephrine Auto-Injector', 'Devices used to record the electrical activity of the heart for diagnostic purposes.', 224, 0, 410, 999999049);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (589, 'Orthopedic Splinting Tools', 'Pumps used to deliver nutrition or medications directly into the digestive tract.', 311, 1, 413, 999999250);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (590, 'Pulse Oximeter', 'Medication used to relieve pain.', 237, 1, 408, 999999207);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (591, 'Orthopedic Implants', 'Stretchers designed for use in ambulances for transporting patients.', 329, 1, 410, 999999043);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (592, 'Disposable Bedpans', 'Tubes inserted through the nose into the stomach for feeding or drainage.', 104, 1, 408, 999999337);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (593, 'Portable Oxygen Concentrators', 'Kits containing supplies for cleaning and maintaining tracheostomy tubes.', 80, 0, 423, 999999146);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (594, 'Ambu Bags', 'Devices used to stabilize and support fractured bones externally.', 129, 0, 414, 999999081);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (595, 'Portable Ultrasound Machines', 'A flat board used for immobilizing a patient with suspected spinal injuries.', 192, 1, 418, 999999265);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (596, 'Medical Gloves', 'Devices that extract oxygen from the air and deliver it to patients via a nasal cannula or mask.', 83, 0, 422, 999999249);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (597, 'Defibrillator pads', 'A device that measures and displays the electrical activity of the heart.', 276, 1, 405, 999999150);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (598, 'Ambulance Stretchers', 'A kit containing devices used to establish or maintain a patient''s airway.', 67, 0, 406, 999999350);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (599, 'Blood Glucose Test Strips', 'Blades used for cutting through orthopedic casts during cast removal.', 146, 0, 412, 999999044);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (394, 'Cardiac Monitor', 'Extensions used to connect enteral feeding tubes to feeding pumps or syringes.', 317, 0, 410, 999999357);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (395, 'Intravenous Drip Stands', 'Devices used to warm intravenous fluids before administration to patients.', 330, 0, 410, 999999265);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (396, 'Tracheostomy Tubes', 'A device used to measure the concentration of glucose in the blood.', 380, 1, 419, 999999052);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (397, 'Medical Traction Splints', 'Devices used to warm intravenous fluids before administration to patients.', 90, 1, 419, 999999137);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (398, 'Orthopedic Internal Fixation Devices', 'Devices specifically designed for managing pediatric airways during resuscitation.', 147, 1, 407, 999999223);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (399, 'Ambulance Stretchers', 'A device used to immobilize and support fractures or injuries to the arms or legs.', 72, 0, 419, 999999385);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (400, 'Orthopedic External Fixators', 'A device used to assist or replace spontaneous breathing in patients.', 354, 1, 420, 999999227);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (401, 'Stretcher', 'Needles used for emergency decompression of tension pneumothorax.', 211, 0, 423, 999999125);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (402, 'Cardiac Monitor', 'Cannulas inserted into the nostrils to deliver oxygen to patients.', 254, 0, 421, 999999248);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (403, 'Tracheostomy Care Kits', 'A kit containing supplies and equipment for administering basic first aid.', 322, 1, 421, 999999211);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (404, 'Laryngoscope', 'A device used to measure the concentration of glucose in the blood.', 362, 1, 415, 999999008);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (405, 'Defibrillator pads', 'Materials used to create custom splints for immobilizing and supporting fractures or injuries.', 260, 0, 410, 999999197);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (406, 'Medical Sterilization Pouches', 'A training device used to simulate the operation of an automated external defibrillator.', 219, 0, 416, 999999004);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (407, 'Medical Sterilization Pouches', 'Pouches used to hold and sterilize medical instruments and supplies.', 101, 0, 404, 999999141);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (408, 'Pulse Oximeter', 'Masks used to deliver anesthesia gases or oxygen to patients during surgery or procedures.', 237, 1, 415, 999999358);
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
values (414, 'Disposable Bedpans', 'Stands used to support bags of intravenous fluids during administration to patients.', 170, 1, 412, 999999163);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (415, 'Glucose Meter', 'Gloves worn by healthcare professionals to prevent contamination and protect against infection.', 289, 0, 419, 999999317);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (416, 'Orthopedic Braces', 'Braces used to support and stabilize joints or limbs.', 213, 0, 405, 999999175);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (417, 'Medical Ventilator Circuits', 'Devices specifically designed for managing pediatric airways during resuscitation.', 233, 1, 410, 999999206);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (418, 'Medical Waste Bins', 'A thin tube inserted into a vein to administer fluids medication or blood products.', 226, 0, 413, 999999310);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (419, 'Cervical Collar', 'Canisters used to collect and dispose of suctioned fluids during medical procedures.', 264, 0, 406, 999999193);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (420, 'First Aid Kit', 'A device inserted through the nose to maintain an open airway.', 176, 1, 416, 999999340);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (421, 'Orthopedic Internal Fixation Devices', 'A device used to administer a measured dose of epinephrine in cases of severe allergic reactions.', 120, 1, 406, 999999029);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (422, 'Cervical Collar', 'Pads used with a defibrillator to deliver an electric shock to the heart.', 182, 0, 408, 999999240);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (423, 'Portable Oxygen Concentrators', 'Masks used to deliver oxygen to patients with respiratory conditions or emergencies.', 339, 1, 414, 999999010);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (424, 'Ambulance Stretchers', 'A dressing used to cover and protect burns.', 149, 1, 423, 999999290);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (425, 'Nasal Oxygen Cannulas', 'Masks used to deliver oxygen to patients with respiratory conditions or emergencies.', 117, 0, 403, 999999010);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (426, 'Laryngoscope Blades', 'Handheld ultrasound devices used for point-of-care diagnostics.', 234, 1, 415, 999999180);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (427, 'Splinter Forceps', 'A kit containing supplies and equipment for administering basic first aid.', 97, 0, 418, 999999325);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (428, 'Orthopedic Braces', 'A device used to remove mucus blood or other fluids from the body.', 100, 0, 421, 999999201);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (429, 'Electrocardiogram (ECG) Machines', 'A device used to immobilize and support fractures or injuries to the arms or legs.', 311, 1, 419, 999999087);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (430, 'Medical Suction Catheters', 'Bandages with a sticky backing used to cover small wounds or hold dressings in place.', 297, 1, 413, 999999331);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (431, 'Portable Ultrasound Machines', 'Masks used to deliver rescue breaths during CPR or respiratory emergencies.', 128, 0, 412, 999999172);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (432, 'Disinfectant Wipes', 'A kit containing devices used to establish or maintain a patient''s airway.', 258, 0, 417, 999999085);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (433, 'Medical Waste Bins', 'Catheters used to remove secretions and fluids from the airway.', 187, 0, 412, 549098765);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (434, 'Urinary Catheters', 'A device used to measure the pressure of the blood in the arteries.', 360, 1, 409, 999999062);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (435, 'Cervical Collar', 'Defibrillators designed for easy transport and use in various settings.', 99, 1, 408, 999999262);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (436, 'Cardiac Monitor', 'Gloves worn by healthcare professionals to prevent contamination and protect against infection.', 80, 0, 420, 999999071);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (437, 'Nasogastric Tubes', 'A device used to remove mucus blood or other fluids from the body.', 343, 1, 418, 544567890);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (438, 'Intravenous Cannulas', 'Flexible tubes inserted into the bladder to drain urine.', 196, 0, 421, 999999301);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (439, 'Backboard', 'Splints used to stabilize and immobilize fractured femurs or lower limbs.', 309, 0, 406, 999999154);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (440, 'Tracheostomy Tube Holders', 'A device that turns liquid medicine into a fine mist that can be inhaled into the lungs.', 205, 0, 415, 999999202);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (441, 'Disinfectant Wipes', 'Blades used with laryngoscopes for visualizing the larynx and inserting endotracheal tubes.', 90, 1, 419, 545098765);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (442, 'Blood Pressure Cuff', 'Materials used to create custom splints for immobilizing and supporting fractures or injuries.', 97, 1, 414, 999999121);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (443, 'Defibrillator pads', 'Devices used to warm intravenous fluids before administration to patients.', 130, 0, 414, 999999074);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (444, 'Disposable Syringes', 'A dressing used to cover and protect burns.', 129, 0, 420, 999999153);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (445, 'Medical Cast Saw Blades', 'Scales used to measure the weight of patients.', 200, 1, 417, 999999172);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (446, 'Oxygen Tank', 'Manual resuscitators used to provide positive pressure ventilation to patients.', 290, 1, 415, 999999211);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (447, 'Intravenous Infusion Pumps', 'Defibrillators designed for easy transport and use in various settings.', 264, 0, 406, 541234567);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (448, 'Disposable Gloves', 'Circuits used to connect patients to mechanical ventilators for assisted breathing.', 208, 0, 417, 999999104);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (449, 'Feeding Tube Extensions', 'A device that turns liquid medicine into a fine mist that can be inhaled into the lungs.', 215, 1, 408, 999999384);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (450, 'Intravenous Cannulas', 'Devices used to stabilize fractured bones internally with screws plates or rods.', 386, 1, 410, 999999122);
insert into ITEM (itemid, name, description, quantity, status, categoryid, phonenumber)
values (451, 'Portable Oxygen Concentrators', 'Pumps used to deliver nutrition or medications directly into the digestive tract.', 235, 1, 408, 999999010);
commit;
prompt 500 records loaded
prompt Loading DONATION...
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1000, to_date('19-01-2001', 'dd-mm-yyyy'), 16, 327);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1001, to_date('20-05-1965', 'dd-mm-yyyy'), 33, 208);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1002, to_date('14-04-2005', 'dd-mm-yyyy'), 87, 367);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1003, to_date('11-01-1996', 'dd-mm-yyyy'), 68, 260);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1004, to_date('19-12-2006', 'dd-mm-yyyy'), 106, 300);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1005, to_date('26-08-2017', 'dd-mm-yyyy'), 104, 130);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1006, to_date('03-09-2021', 'dd-mm-yyyy'), 104, 95);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1007, to_date('02-03-2006', 'dd-mm-yyyy'), 83, 295);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1008, to_date('13-08-2021', 'dd-mm-yyyy'), 45, 60);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1009, to_date('25-11-1996', 'dd-mm-yyyy'), 6, 94);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1010, to_date('13-12-1967', 'dd-mm-yyyy'), 87, 229);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1011, to_date('07-01-1963', 'dd-mm-yyyy'), 53, 286);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1012, to_date('01-02-2008', 'dd-mm-yyyy'), 79, 65);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1013, to_date('26-06-2017', 'dd-mm-yyyy'), 14, 367);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1014, to_date('28-01-2023', 'dd-mm-yyyy'), 85, 139);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1015, to_date('13-05-2010', 'dd-mm-yyyy'), 70, 51);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1016, to_date('04-01-1984', 'dd-mm-yyyy'), 6, 282);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1017, to_date('02-07-1987', 'dd-mm-yyyy'), 31, 119);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1018, to_date('10-11-1968', 'dd-mm-yyyy'), 124, 165);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1019, to_date('04-11-1967', 'dd-mm-yyyy'), 36, 111);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1020, to_date('12-03-2006', 'dd-mm-yyyy'), 6, 289);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1021, to_date('18-04-1960', 'dd-mm-yyyy'), 19, 116);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1022, to_date('11-06-1991', 'dd-mm-yyyy'), 111, 50);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1023, to_date('24-08-1978', 'dd-mm-yyyy'), 6, 24);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1024, to_date('05-03-2007', 'dd-mm-yyyy'), 14, 131);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1025, to_date('21-12-1981', 'dd-mm-yyyy'), 77, 261);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1026, to_date('19-05-1979', 'dd-mm-yyyy'), 61, 83);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1027, to_date('23-03-1982', 'dd-mm-yyyy'), 79, 67);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1028, to_date('28-07-2012', 'dd-mm-yyyy'), 17, 346);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1029, to_date('09-09-1994', 'dd-mm-yyyy'), 28, 217);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1030, to_date('04-03-2013', 'dd-mm-yyyy'), 65, 241);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1031, to_date('23-01-1963', 'dd-mm-yyyy'), 39, 357);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1032, to_date('24-03-1968', 'dd-mm-yyyy'), 72, 151);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1033, to_date('08-11-1985', 'dd-mm-yyyy'), 15, 245);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1034, to_date('05-09-1996', 'dd-mm-yyyy'), 4, 349);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1035, to_date('22-05-1983', 'dd-mm-yyyy'), 118, 389);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1036, to_date('22-03-1966', 'dd-mm-yyyy'), 84, 23);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1037, to_date('07-03-2010', 'dd-mm-yyyy'), 42, 284);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1038, to_date('04-07-1999', 'dd-mm-yyyy'), 102, 347);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1039, to_date('18-10-1988', 'dd-mm-yyyy'), 15, 67);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1040, to_date('08-04-2002', 'dd-mm-yyyy'), 124, 237);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1041, to_date('24-02-1985', 'dd-mm-yyyy'), 6, 208);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1042, to_date('20-08-2000', 'dd-mm-yyyy'), 101, 294);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1043, to_date('06-10-1970', 'dd-mm-yyyy'), 8, 216);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1044, to_date('13-06-2021', 'dd-mm-yyyy'), 68, 227);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1045, to_date('06-10-2012', 'dd-mm-yyyy'), 96, 288);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1046, to_date('17-03-1991', 'dd-mm-yyyy'), 113, 188);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1047, to_date('01-07-1992', 'dd-mm-yyyy'), 107, 256);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1048, to_date('16-11-1995', 'dd-mm-yyyy'), 80, 105);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1049, to_date('27-03-2002', 'dd-mm-yyyy'), 87, 194);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1050, to_date('08-03-1995', 'dd-mm-yyyy'), 101, 237);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1051, to_date('24-09-1986', 'dd-mm-yyyy'), 63, 12);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1052, to_date('14-02-1987', 'dd-mm-yyyy'), 128, 219);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1053, to_date('04-01-2022', 'dd-mm-yyyy'), 115, 161);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1054, to_date('19-09-1968', 'dd-mm-yyyy'), 15, 257);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1055, to_date('01-12-2021', 'dd-mm-yyyy'), 29, 349);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1056, to_date('19-03-1969', 'dd-mm-yyyy'), 89, 285);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1057, to_date('22-12-1994', 'dd-mm-yyyy'), 58, 66);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1058, to_date('29-05-2005', 'dd-mm-yyyy'), 53, 235);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1059, to_date('12-09-2012', 'dd-mm-yyyy'), 105, 214);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1060, to_date('15-02-1976', 'dd-mm-yyyy'), 36, 165);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1061, to_date('07-05-2004', 'dd-mm-yyyy'), 6, 223);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1062, to_date('27-01-2004', 'dd-mm-yyyy'), 67, 133);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1063, to_date('07-04-1989', 'dd-mm-yyyy'), 91, 152);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1064, to_date('30-09-1995', 'dd-mm-yyyy'), 95, 40);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1065, to_date('01-01-1985', 'dd-mm-yyyy'), 77, 251);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1066, to_date('11-02-1966', 'dd-mm-yyyy'), 93, 362);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1067, to_date('22-11-1997', 'dd-mm-yyyy'), 78, 104);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1068, to_date('23-06-2013', 'dd-mm-yyyy'), 11, 226);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1069, to_date('09-03-1971', 'dd-mm-yyyy'), 111, 35);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1070, to_date('29-07-1982', 'dd-mm-yyyy'), 92, 21);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1071, to_date('31-07-2007', 'dd-mm-yyyy'), 40, 137);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1072, to_date('18-03-1981', 'dd-mm-yyyy'), 83, 213);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1073, to_date('12-11-1964', 'dd-mm-yyyy'), 44, 106);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1074, to_date('16-06-2016', 'dd-mm-yyyy'), 96, 107);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1075, to_date('15-10-2020', 'dd-mm-yyyy'), 127, 110);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1076, to_date('10-05-2018', 'dd-mm-yyyy'), 24, 157);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1077, to_date('28-07-1984', 'dd-mm-yyyy'), 46, 84);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1078, to_date('01-12-1987', 'dd-mm-yyyy'), 58, 212);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1079, to_date('10-06-2023', 'dd-mm-yyyy'), 42, 351);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1080, to_date('15-07-2009', 'dd-mm-yyyy'), 52, 197);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1081, to_date('12-01-1970', 'dd-mm-yyyy'), 28, 307);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1082, to_date('19-05-1978', 'dd-mm-yyyy'), 64, 99);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1083, to_date('17-04-2004', 'dd-mm-yyyy'), 71, 323);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1084, to_date('25-01-1967', 'dd-mm-yyyy'), 22, 247);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1085, to_date('18-01-2006', 'dd-mm-yyyy'), 66, 279);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1086, to_date('27-09-1999', 'dd-mm-yyyy'), 14, 75);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1087, to_date('23-05-1968', 'dd-mm-yyyy'), 78, 357);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1088, to_date('13-01-1969', 'dd-mm-yyyy'), 12, 225);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1089, to_date('23-01-1994', 'dd-mm-yyyy'), 62, 68);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1090, to_date('16-02-2013', 'dd-mm-yyyy'), 21, 162);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1091, to_date('21-11-2013', 'dd-mm-yyyy'), 81, 49);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1092, to_date('11-08-1979', 'dd-mm-yyyy'), 11, 368);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1093, to_date('29-08-1974', 'dd-mm-yyyy'), 101, 85);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1094, to_date('18-04-1997', 'dd-mm-yyyy'), 111, 169);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1095, to_date('12-09-1978', 'dd-mm-yyyy'), 65, 185);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1096, to_date('09-11-2002', 'dd-mm-yyyy'), 116, 194);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1097, to_date('28-04-2004', 'dd-mm-yyyy'), 80, 379);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1098, to_date('26-03-2011', 'dd-mm-yyyy'), 85, 85);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1099, to_date('04-11-1980', 'dd-mm-yyyy'), 76, 381);
commit;
prompt 100 records committed...
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1100, to_date('17-03-2008', 'dd-mm-yyyy'), 24, 365);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1101, to_date('08-07-1985', 'dd-mm-yyyy'), 91, 274);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1102, to_date('21-11-2018', 'dd-mm-yyyy'), 64, 278);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1103, to_date('16-10-1975', 'dd-mm-yyyy'), 24, 325);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1104, to_date('23-05-1982', 'dd-mm-yyyy'), 57, 208);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1105, to_date('21-11-1993', 'dd-mm-yyyy'), 14, 79);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1106, to_date('20-07-1967', 'dd-mm-yyyy'), 11, 328);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1107, to_date('29-05-2008', 'dd-mm-yyyy'), 95, 194);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1108, to_date('28-01-1964', 'dd-mm-yyyy'), 114, 156);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1109, to_date('13-11-1989', 'dd-mm-yyyy'), 105, 308);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1110, to_date('24-01-1984', 'dd-mm-yyyy'), 21, 180);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1111, to_date('30-09-2022', 'dd-mm-yyyy'), 42, 334);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1112, to_date('04-12-1997', 'dd-mm-yyyy'), 40, 48);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1113, to_date('09-04-2005', 'dd-mm-yyyy'), 22, 339);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1114, to_date('16-06-1990', 'dd-mm-yyyy'), 102, 245);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1115, to_date('25-05-1974', 'dd-mm-yyyy'), 68, 373);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1116, to_date('19-10-1960', 'dd-mm-yyyy'), 96, 369);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1117, to_date('04-09-1981', 'dd-mm-yyyy'), 116, 138);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1118, to_date('02-04-1986', 'dd-mm-yyyy'), 46, 332);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1119, to_date('13-02-1977', 'dd-mm-yyyy'), 40, 70);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1120, to_date('05-12-2000', 'dd-mm-yyyy'), 103, 364);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1121, to_date('14-05-1997', 'dd-mm-yyyy'), 94, 385);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1122, to_date('18-06-2009', 'dd-mm-yyyy'), 52, 237);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1123, to_date('30-01-1974', 'dd-mm-yyyy'), 92, 253);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1124, to_date('07-09-1966', 'dd-mm-yyyy'), 35, 296);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1125, to_date('01-02-1963', 'dd-mm-yyyy'), 76, 35);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1126, to_date('12-03-1962', 'dd-mm-yyyy'), 41, 83);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1127, to_date('08-02-1984', 'dd-mm-yyyy'), 45, 355);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1128, to_date('01-04-2013', 'dd-mm-yyyy'), 10, 398);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1129, to_date('01-12-2005', 'dd-mm-yyyy'), 108, 37);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1130, to_date('27-07-2017', 'dd-mm-yyyy'), 4, 223);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1131, to_date('03-03-1995', 'dd-mm-yyyy'), 54, 300);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1132, to_date('27-12-2023', 'dd-mm-yyyy'), 108, 377);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1133, to_date('17-05-2010', 'dd-mm-yyyy'), 29, 46);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1134, to_date('11-06-1960', 'dd-mm-yyyy'), 87, 212);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1135, to_date('02-10-2008', 'dd-mm-yyyy'), 39, 257);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1136, to_date('10-08-2002', 'dd-mm-yyyy'), 21, 227);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1137, to_date('24-06-2018', 'dd-mm-yyyy'), 89, 273);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1138, to_date('09-02-2012', 'dd-mm-yyyy'), 9, 47);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1139, to_date('23-09-1982', 'dd-mm-yyyy'), 104, 203);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1140, to_date('22-10-2005', 'dd-mm-yyyy'), 47, 5);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1141, to_date('11-02-1990', 'dd-mm-yyyy'), 106, 270);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1142, to_date('29-08-1979', 'dd-mm-yyyy'), 19, 195);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1143, to_date('11-07-2015', 'dd-mm-yyyy'), 57, 205);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1144, to_date('30-04-2003', 'dd-mm-yyyy'), 95, 332);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1145, to_date('03-04-2014', 'dd-mm-yyyy'), 125, 225);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1146, to_date('28-12-2019', 'dd-mm-yyyy'), 116, 199);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1147, to_date('12-07-1972', 'dd-mm-yyyy'), 112, 396);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1148, to_date('15-03-2004', 'dd-mm-yyyy'), 95, 262);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1149, to_date('05-03-2019', 'dd-mm-yyyy'), 34, 361);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1150, to_date('29-12-2019', 'dd-mm-yyyy'), 22, 187);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1151, to_date('12-03-2023', 'dd-mm-yyyy'), 113, 117);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1152, to_date('17-09-1967', 'dd-mm-yyyy'), 67, 95);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1153, to_date('12-10-1975', 'dd-mm-yyyy'), 82, 193);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1154, to_date('23-05-2014', 'dd-mm-yyyy'), 102, 68);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1155, to_date('12-01-1971', 'dd-mm-yyyy'), 102, 213);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1156, to_date('10-08-1998', 'dd-mm-yyyy'), 89, 371);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1157, to_date('05-12-1995', 'dd-mm-yyyy'), 16, 263);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1158, to_date('06-08-1961', 'dd-mm-yyyy'), 102, 143);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1159, to_date('14-10-1970', 'dd-mm-yyyy'), 24, 167);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1160, to_date('26-04-1991', 'dd-mm-yyyy'), 58, 14);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1161, to_date('16-02-2001', 'dd-mm-yyyy'), 101, 287);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1162, to_date('27-03-1980', 'dd-mm-yyyy'), 61, 118);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1163, to_date('02-02-1968', 'dd-mm-yyyy'), 6, 251);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1164, to_date('03-07-1962', 'dd-mm-yyyy'), 81, 279);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1165, to_date('14-12-2003', 'dd-mm-yyyy'), 77, 154);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1166, to_date('15-11-1977', 'dd-mm-yyyy'), 89, 48);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1167, to_date('05-07-1973', 'dd-mm-yyyy'), 118, 166);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1168, to_date('13-07-2011', 'dd-mm-yyyy'), 71, 52);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1169, to_date('26-12-2001', 'dd-mm-yyyy'), 4, 291);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1170, to_date('29-09-1999', 'dd-mm-yyyy'), 22, 388);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1171, to_date('23-12-2017', 'dd-mm-yyyy'), 67, 174);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1172, to_date('18-05-2022', 'dd-mm-yyyy'), 32, 169);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1173, to_date('14-12-1979', 'dd-mm-yyyy'), 77, 36);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1174, to_date('09-11-2003', 'dd-mm-yyyy'), 101, 87);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1175, to_date('06-10-2003', 'dd-mm-yyyy'), 59, 374);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1176, to_date('23-09-2008', 'dd-mm-yyyy'), 80, 104);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1177, to_date('15-11-2016', 'dd-mm-yyyy'), 103, 357);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1178, to_date('13-02-1972', 'dd-mm-yyyy'), 81, 116);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1179, to_date('25-10-2002', 'dd-mm-yyyy'), 72, 335);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1180, to_date('08-04-1961', 'dd-mm-yyyy'), 88, 86);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1181, to_date('30-10-1996', 'dd-mm-yyyy'), 77, 130);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1182, to_date('04-09-1996', 'dd-mm-yyyy'), 65, 330);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1183, to_date('06-02-1962', 'dd-mm-yyyy'), 106, 135);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1184, to_date('23-05-2002', 'dd-mm-yyyy'), 84, 193);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1185, to_date('09-08-1981', 'dd-mm-yyyy'), 106, 123);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1186, to_date('22-08-1996', 'dd-mm-yyyy'), 15, 94);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1187, to_date('16-12-1978', 'dd-mm-yyyy'), 60, 20);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1188, to_date('01-12-1996', 'dd-mm-yyyy'), 63, 97);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1189, to_date('28-12-2003', 'dd-mm-yyyy'), 67, 111);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1190, to_date('26-02-2023', 'dd-mm-yyyy'), 82, 346);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1191, to_date('30-07-2009', 'dd-mm-yyyy'), 17, 335);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1192, to_date('18-10-1970', 'dd-mm-yyyy'), 111, 389);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1193, to_date('25-03-1986', 'dd-mm-yyyy'), 93, 250);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1194, to_date('28-11-2003', 'dd-mm-yyyy'), 45, 141);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1195, to_date('17-10-2012', 'dd-mm-yyyy'), 105, 326);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1196, to_date('19-11-2003', 'dd-mm-yyyy'), 78, 172);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1197, to_date('14-10-1989', 'dd-mm-yyyy'), 58, 356);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1198, to_date('23-06-1981', 'dd-mm-yyyy'), 88, 341);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1199, to_date('23-06-2003', 'dd-mm-yyyy'), 22, 90);
commit;
prompt 200 records committed...
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1200, to_date('04-01-2016', 'dd-mm-yyyy'), 48, 50);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1201, to_date('08-03-1989', 'dd-mm-yyyy'), 11, 392);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1202, to_date('15-02-1986', 'dd-mm-yyyy'), 110, 103);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1203, to_date('12-07-2020', 'dd-mm-yyyy'), 35, 54);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1204, to_date('18-03-2010', 'dd-mm-yyyy'), 41, 191);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1205, to_date('08-03-1987', 'dd-mm-yyyy'), 113, 29);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1206, to_date('20-04-1986', 'dd-mm-yyyy'), 102, 222);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1207, to_date('30-04-1966', 'dd-mm-yyyy'), 46, 57);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1208, to_date('19-02-2002', 'dd-mm-yyyy'), 10, 401);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1209, to_date('12-12-2017', 'dd-mm-yyyy'), 83, 384);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1210, to_date('20-03-1990', 'dd-mm-yyyy'), 31, 381);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1211, to_date('03-01-1998', 'dd-mm-yyyy'), 127, 234);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1212, to_date('05-06-1974', 'dd-mm-yyyy'), 92, 80);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1213, to_date('05-12-1986', 'dd-mm-yyyy'), 38, 381);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1214, to_date('03-01-2002', 'dd-mm-yyyy'), 32, 183);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1215, to_date('09-01-1980', 'dd-mm-yyyy'), 31, 364);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1216, to_date('02-11-2017', 'dd-mm-yyyy'), 77, 16);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1217, to_date('30-11-2019', 'dd-mm-yyyy'), 45, 262);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1218, to_date('01-05-2002', 'dd-mm-yyyy'), 117, 382);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1219, to_date('17-03-1997', 'dd-mm-yyyy'), 39, 73);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1220, to_date('08-10-2000', 'dd-mm-yyyy'), 92, 59);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1221, to_date('02-08-2015', 'dd-mm-yyyy'), 92, 80);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1222, to_date('04-09-2010', 'dd-mm-yyyy'), 53, 23);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1223, to_date('19-07-2019', 'dd-mm-yyyy'), 62, 375);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1224, to_date('18-06-1990', 'dd-mm-yyyy'), 65, 48);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1225, to_date('28-09-2006', 'dd-mm-yyyy'), 115, 304);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1226, to_date('27-02-1981', 'dd-mm-yyyy'), 53, 92);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1227, to_date('07-02-1978', 'dd-mm-yyyy'), 94, 326);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1228, to_date('13-05-1963', 'dd-mm-yyyy'), 67, 235);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1229, to_date('01-06-1992', 'dd-mm-yyyy'), 34, 166);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1230, to_date('12-03-2007', 'dd-mm-yyyy'), 76, 380);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1231, to_date('12-10-1983', 'dd-mm-yyyy'), 76, 274);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1232, to_date('06-10-1995', 'dd-mm-yyyy'), 15, 369);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1233, to_date('04-08-1977', 'dd-mm-yyyy'), 41, 292);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1234, to_date('29-08-1975', 'dd-mm-yyyy'), 82, 377);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1235, to_date('19-03-1986', 'dd-mm-yyyy'), 38, 94);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1236, to_date('03-01-2019', 'dd-mm-yyyy'), 80, 298);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1237, to_date('15-06-2008', 'dd-mm-yyyy'), 16, 227);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1238, to_date('15-06-2014', 'dd-mm-yyyy'), 14, 294);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1239, to_date('19-08-1987', 'dd-mm-yyyy'), 43, 74);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1240, to_date('01-08-1976', 'dd-mm-yyyy'), 78, 238);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1241, to_date('17-03-2007', 'dd-mm-yyyy'), 46, 10);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1242, to_date('24-07-2005', 'dd-mm-yyyy'), 54, 14);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1243, to_date('29-06-2012', 'dd-mm-yyyy'), 125, 249);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1244, to_date('22-03-2014', 'dd-mm-yyyy'), 93, 165);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1245, to_date('05-06-1998', 'dd-mm-yyyy'), 70, 206);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1246, to_date('01-01-1990', 'dd-mm-yyyy'), 102, 299);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1247, to_date('13-11-2014', 'dd-mm-yyyy'), 101, 53);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1248, to_date('13-02-1964', 'dd-mm-yyyy'), 70, 300);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1249, to_date('11-03-1984', 'dd-mm-yyyy'), 64, 154);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1250, to_date('25-12-1961', 'dd-mm-yyyy'), 18, 234);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1251, to_date('05-12-1985', 'dd-mm-yyyy'), 101, 277);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1252, to_date('30-11-1973', 'dd-mm-yyyy'), 96, 325);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1253, to_date('12-07-1963', 'dd-mm-yyyy'), 18, 229);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1254, to_date('09-02-2010', 'dd-mm-yyyy'), 104, 234);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1255, to_date('16-12-1960', 'dd-mm-yyyy'), 106, 213);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1256, to_date('12-06-1965', 'dd-mm-yyyy'), 107, 300);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1257, to_date('12-06-1964', 'dd-mm-yyyy'), 38, 79);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1258, to_date('20-06-1978', 'dd-mm-yyyy'), 113, 5);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1259, to_date('18-02-1963', 'dd-mm-yyyy'), 17, 157);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1260, to_date('17-12-1998', 'dd-mm-yyyy'), 105, 330);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1261, to_date('22-01-1973', 'dd-mm-yyyy'), 76, 56);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1262, to_date('16-08-2023', 'dd-mm-yyyy'), 12, 181);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1263, to_date('08-08-2001', 'dd-mm-yyyy'), 84, 369);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1264, to_date('14-09-1967', 'dd-mm-yyyy'), 24, 135);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1265, to_date('30-10-1981', 'dd-mm-yyyy'), 65, 363);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1266, to_date('25-10-1985', 'dd-mm-yyyy'), 127, 27);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1267, to_date('26-04-2000', 'dd-mm-yyyy'), 107, 53);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1268, to_date('30-01-2023', 'dd-mm-yyyy'), 43, 197);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1269, to_date('04-04-2009', 'dd-mm-yyyy'), 19, 166);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1270, to_date('06-12-2011', 'dd-mm-yyyy'), 96, 128);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1271, to_date('21-04-2000', 'dd-mm-yyyy'), 92, 53);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1272, to_date('19-06-1994', 'dd-mm-yyyy'), 41, 215);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1273, to_date('25-08-2023', 'dd-mm-yyyy'), 68, 195);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1274, to_date('31-08-1994', 'dd-mm-yyyy'), 67, 262);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1275, to_date('13-12-1964', 'dd-mm-yyyy'), 106, 238);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1276, to_date('22-12-2007', 'dd-mm-yyyy'), 30, 343);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1277, to_date('17-12-1976', 'dd-mm-yyyy'), 111, 55);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1278, to_date('01-01-1976', 'dd-mm-yyyy'), 78, 361);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1279, to_date('04-08-2013', 'dd-mm-yyyy'), 17, 255);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1280, to_date('23-06-2021', 'dd-mm-yyyy'), 85, 363);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1281, to_date('05-01-1978', 'dd-mm-yyyy'), 4, 398);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1282, to_date('08-03-2012', 'dd-mm-yyyy'), 42, 181);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1283, to_date('22-09-1994', 'dd-mm-yyyy'), 61, 44);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1284, to_date('20-09-1997', 'dd-mm-yyyy'), 10, 41);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1285, to_date('20-10-2006', 'dd-mm-yyyy'), 82, 169);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1286, to_date('22-11-2007', 'dd-mm-yyyy'), 9, 170);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1287, to_date('19-12-1963', 'dd-mm-yyyy'), 116, 179);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1288, to_date('25-11-2008', 'dd-mm-yyyy'), 104, 35);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1289, to_date('18-05-2003', 'dd-mm-yyyy'), 80, 66);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1290, to_date('17-11-1978', 'dd-mm-yyyy'), 88, 145);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1291, to_date('16-08-1995', 'dd-mm-yyyy'), 83, 233);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1292, to_date('17-02-1968', 'dd-mm-yyyy'), 67, 400);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1293, to_date('06-08-2022', 'dd-mm-yyyy'), 32, 253);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1294, to_date('05-05-1996', 'dd-mm-yyyy'), 70, 95);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1295, to_date('04-03-1960', 'dd-mm-yyyy'), 62, 232);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1296, to_date('02-12-1985', 'dd-mm-yyyy'), 115, 259);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1297, to_date('07-04-1969', 'dd-mm-yyyy'), 95, 32);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1298, to_date('22-10-1982', 'dd-mm-yyyy'), 46, 300);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1299, to_date('10-04-1980', 'dd-mm-yyyy'), 31, 394);
commit;
prompt 300 records committed...
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1300, to_date('08-09-1985', 'dd-mm-yyyy'), 82, 276);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1301, to_date('31-03-1988', 'dd-mm-yyyy'), 65, 137);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1302, to_date('28-10-1995', 'dd-mm-yyyy'), 54, 84);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1303, to_date('08-03-1978', 'dd-mm-yyyy'), 31, 28);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1304, to_date('14-07-1994', 'dd-mm-yyyy'), 61, 111);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1305, to_date('06-07-1962', 'dd-mm-yyyy'), 89, 357);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1306, to_date('11-04-1979', 'dd-mm-yyyy'), 55, 205);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1307, to_date('08-01-1960', 'dd-mm-yyyy'), 46, 167);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1308, to_date('11-06-1968', 'dd-mm-yyyy'), 29, 299);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1309, to_date('02-11-1997', 'dd-mm-yyyy'), 88, 133);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1310, to_date('28-04-1972', 'dd-mm-yyyy'), 88, 385);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1311, to_date('09-07-1996', 'dd-mm-yyyy'), 44, 231);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1312, to_date('14-05-2021', 'dd-mm-yyyy'), 128, 107);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1313, to_date('17-05-1993', 'dd-mm-yyyy'), 106, 251);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1314, to_date('08-12-1980', 'dd-mm-yyyy'), 43, 387);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1315, to_date('02-09-1969', 'dd-mm-yyyy'), 93, 290);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1316, to_date('30-10-2013', 'dd-mm-yyyy'), 20, 237);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1317, to_date('28-11-2015', 'dd-mm-yyyy'), 112, 269);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1318, to_date('12-08-2019', 'dd-mm-yyyy'), 44, 355);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1319, to_date('05-12-2006', 'dd-mm-yyyy'), 88, 211);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1320, to_date('07-09-1981', 'dd-mm-yyyy'), 92, 121);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1321, to_date('01-03-1995', 'dd-mm-yyyy'), 82, 10);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1322, to_date('02-09-2010', 'dd-mm-yyyy'), 16, 208);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1323, to_date('15-08-1967', 'dd-mm-yyyy'), 82, 272);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1324, to_date('09-10-2006', 'dd-mm-yyyy'), 45, 70);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1325, to_date('03-08-1975', 'dd-mm-yyyy'), 106, 340);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1326, to_date('01-08-2016', 'dd-mm-yyyy'), 41, 3);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1327, to_date('03-10-1964', 'dd-mm-yyyy'), 106, 326);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1328, to_date('17-01-2013', 'dd-mm-yyyy'), 76, 231);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1329, to_date('09-09-1988', 'dd-mm-yyyy'), 63, 184);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1330, to_date('28-03-2010', 'dd-mm-yyyy'), 38, 74);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1331, to_date('18-04-1997', 'dd-mm-yyyy'), 62, 289);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1332, to_date('09-09-1987', 'dd-mm-yyyy'), 8, 4);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1333, to_date('02-04-1977', 'dd-mm-yyyy'), 47, 387);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1334, to_date('19-05-2012', 'dd-mm-yyyy'), 81, 249);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1335, to_date('29-08-2000', 'dd-mm-yyyy'), 65, 39);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1336, to_date('25-11-1984', 'dd-mm-yyyy'), 112, 88);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1337, to_date('20-04-1961', 'dd-mm-yyyy'), 24, 370);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1338, to_date('13-01-1962', 'dd-mm-yyyy'), 48, 356);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1339, to_date('23-08-1966', 'dd-mm-yyyy'), 90, 109);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1340, to_date('31-10-1993', 'dd-mm-yyyy'), 61, 197);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1341, to_date('11-09-2008', 'dd-mm-yyyy'), 72, 402);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1342, to_date('10-04-1988', 'dd-mm-yyyy'), 116, 317);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1343, to_date('13-01-1993', 'dd-mm-yyyy'), 55, 249);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1344, to_date('04-02-1961', 'dd-mm-yyyy'), 53, 13);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1345, to_date('13-01-1975', 'dd-mm-yyyy'), 46, 25);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1346, to_date('16-08-1966', 'dd-mm-yyyy'), 112, 244);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1347, to_date('21-08-2010', 'dd-mm-yyyy'), 9, 240);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1348, to_date('01-03-2017', 'dd-mm-yyyy'), 95, 223);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1349, to_date('04-03-2023', 'dd-mm-yyyy'), 127, 57);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1350, to_date('06-05-1961', 'dd-mm-yyyy'), 46, 243);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1351, to_date('06-10-1980', 'dd-mm-yyyy'), 38, 250);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1352, to_date('30-12-2006', 'dd-mm-yyyy'), 40, 211);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1353, to_date('06-05-1989', 'dd-mm-yyyy'), 102, 111);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1354, to_date('09-09-2018', 'dd-mm-yyyy'), 115, 120);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1355, to_date('18-06-2021', 'dd-mm-yyyy'), 95, 99);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1356, to_date('23-07-2014', 'dd-mm-yyyy'), 71, 245);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1357, to_date('04-04-1989', 'dd-mm-yyyy'), 45, 57);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1358, to_date('25-07-1979', 'dd-mm-yyyy'), 38, 116);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1359, to_date('02-01-2001', 'dd-mm-yyyy'), 37, 122);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1360, to_date('27-07-1984', 'dd-mm-yyyy'), 39, 123);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1361, to_date('28-04-1977', 'dd-mm-yyyy'), 56, 359);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1362, to_date('13-02-1996', 'dd-mm-yyyy'), 40, 259);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1363, to_date('25-01-2019', 'dd-mm-yyyy'), 103, 13);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1364, to_date('25-03-1970', 'dd-mm-yyyy'), 128, 332);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1365, to_date('07-12-1976', 'dd-mm-yyyy'), 46, 320);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1366, to_date('02-05-2008', 'dd-mm-yyyy'), 63, 44);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1367, to_date('02-05-1995', 'dd-mm-yyyy'), 83, 132);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1368, to_date('16-09-1978', 'dd-mm-yyyy'), 88, 288);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1369, to_date('09-10-2013', 'dd-mm-yyyy'), 11, 162);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1370, to_date('29-10-1990', 'dd-mm-yyyy'), 37, 257);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1371, to_date('22-01-2011', 'dd-mm-yyyy'), 77, 242);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1372, to_date('16-06-2010', 'dd-mm-yyyy'), 62, 284);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1373, to_date('09-07-2022', 'dd-mm-yyyy'), 22, 179);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1374, to_date('25-10-1965', 'dd-mm-yyyy'), 115, 35);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1375, to_date('25-03-1977', 'dd-mm-yyyy'), 117, 379);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1376, to_date('28-10-2003', 'dd-mm-yyyy'), 89, 342);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1377, to_date('30-06-2013', 'dd-mm-yyyy'), 29, 288);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1378, to_date('17-05-2016', 'dd-mm-yyyy'), 105, 380);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1379, to_date('15-04-1985', 'dd-mm-yyyy'), 80, 223);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1380, to_date('03-08-1991', 'dd-mm-yyyy'), 105, 390);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1381, to_date('08-06-1965', 'dd-mm-yyyy'), 81, 213);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1382, to_date('25-04-1971', 'dd-mm-yyyy'), 116, 219);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1383, to_date('06-08-2010', 'dd-mm-yyyy'), 6, 248);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1384, to_date('28-01-2020', 'dd-mm-yyyy'), 72, 338);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1385, to_date('23-05-2020', 'dd-mm-yyyy'), 53, 228);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1386, to_date('08-01-1993', 'dd-mm-yyyy'), 69, 40);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1387, to_date('15-10-1970', 'dd-mm-yyyy'), 24, 46);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1388, to_date('12-08-1976', 'dd-mm-yyyy'), 31, 312);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1389, to_date('05-07-1964', 'dd-mm-yyyy'), 80, 100);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1390, to_date('22-06-1970', 'dd-mm-yyyy'), 33, 179);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1391, to_date('17-04-1999', 'dd-mm-yyyy'), 117, 95);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1392, to_date('01-11-2001', 'dd-mm-yyyy'), 128, 188);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1393, to_date('15-02-2018', 'dd-mm-yyyy'), 80, 354);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1394, to_date('13-03-2010', 'dd-mm-yyyy'), 117, 196);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1395, to_date('28-01-1974', 'dd-mm-yyyy'), 35, 151);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1396, to_date('20-01-1992', 'dd-mm-yyyy'), 35, 93);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1397, to_date('20-02-2021', 'dd-mm-yyyy'), 90, 96);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1398, to_date('25-11-2023', 'dd-mm-yyyy'), 30, 219);
insert into DONATION (donationid, donationdate, itemid, donorid)
values (1399, to_date('10-05-1995', 'dd-mm-yyyy'), 107, 360);
commit;
prompt 400 records loaded
prompt Loading MAINTENANCE...
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (1, to_date('22-01-2001', 'dd-mm-yyyy'), 'easy', 15);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (2, to_date('03-02-1970', 'dd-mm-yyyy'), 'Need continue', 38);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (3, to_date('18-12-2004', 'dd-mm-yyyy'), 'Need continue', 6);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (4, to_date('23-07-1993', 'dd-mm-yyyy'), 'easy', 9);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (5, to_date('17-08-1981', 'dd-mm-yyyy'), 'easy', 82);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (6, to_date('15-12-1969', 'dd-mm-yyyy'), 'difficult', 76);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (7, to_date('26-06-1961', 'dd-mm-yyyy'), 'easy', 114);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (8, to_date('23-04-1991', 'dd-mm-yyyy'), 'difficult', 124);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (9, to_date('18-04-1998', 'dd-mm-yyyy'), 'easy', 125);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (10, to_date('17-06-1983', 'dd-mm-yyyy'), 'difficult', 96);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (11, to_date('25-11-1978', 'dd-mm-yyyy'), 'difficult', 78);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (12, to_date('10-01-2024', 'dd-mm-yyyy'), 'Need continue', 32);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (13, to_date('08-03-1989', 'dd-mm-yyyy'), 'easy', 40);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (14, to_date('20-05-1998', 'dd-mm-yyyy'), 'Need continue', 44);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (15, to_date('15-10-1994', 'dd-mm-yyyy'), 'Need continue', 20);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (16, to_date('20-09-2014', 'dd-mm-yyyy'), 'Need continue', 14);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (17, to_date('01-10-2001', 'dd-mm-yyyy'), 'difficult', 91);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (18, to_date('28-04-2014', 'dd-mm-yyyy'), 'easy', 41);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (19, to_date('13-01-1979', 'dd-mm-yyyy'), 'easy', 44);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (20, to_date('27-10-1978', 'dd-mm-yyyy'), 'Need continue', 14);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (21, to_date('03-11-2022', 'dd-mm-yyyy'), 'difficult', 36);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (22, to_date('11-05-1963', 'dd-mm-yyyy'), 'Need continue', 28);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (23, to_date('29-09-2019', 'dd-mm-yyyy'), 'Need continue', 69);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (24, to_date('15-03-2017', 'dd-mm-yyyy'), 'easy', 35);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (25, to_date('07-04-2018', 'dd-mm-yyyy'), 'easy', 9);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (26, to_date('12-10-2008', 'dd-mm-yyyy'), 'easy', 34);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (27, to_date('17-04-2013', 'dd-mm-yyyy'), 'easy', 70);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (28, to_date('06-07-1995', 'dd-mm-yyyy'), 'easy', 54);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (29, to_date('17-10-1966', 'dd-mm-yyyy'), 'Need continue', 128);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (30, to_date('14-11-1988', 'dd-mm-yyyy'), 'difficult', 111);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (31, to_date('10-10-1995', 'dd-mm-yyyy'), 'Need continue', 22);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (32, to_date('30-03-1994', 'dd-mm-yyyy'), 'difficult', 108);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (33, to_date('19-06-1995', 'dd-mm-yyyy'), 'difficult', 66);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (34, to_date('01-02-2018', 'dd-mm-yyyy'), 'Need continue', 54);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (35, to_date('16-07-1990', 'dd-mm-yyyy'), 'difficult', 68);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (36, to_date('26-02-2004', 'dd-mm-yyyy'), 'difficult', 113);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (37, to_date('18-12-1971', 'dd-mm-yyyy'), 'Need continue', 80);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (38, to_date('21-10-1973', 'dd-mm-yyyy'), 'difficult', 79);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (39, to_date('09-11-2002', 'dd-mm-yyyy'), 'difficult', 116);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (40, to_date('06-02-2011', 'dd-mm-yyyy'), 'Need continue', 107);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (41, to_date('08-05-2008', 'dd-mm-yyyy'), 'difficult', 54);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (42, to_date('28-09-2019', 'dd-mm-yyyy'), 'difficult', 56);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (43, to_date('28-10-1999', 'dd-mm-yyyy'), 'difficult', 44);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (44, to_date('28-05-1972', 'dd-mm-yyyy'), 'difficult', 17);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (45, to_date('16-11-2011', 'dd-mm-yyyy'), 'Need continue', 128);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (46, to_date('25-03-1976', 'dd-mm-yyyy'), 'difficult', 21);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (47, to_date('10-03-2013', 'dd-mm-yyyy'), 'difficult', 20);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (48, to_date('19-03-1979', 'dd-mm-yyyy'), 'easy', 34);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (49, to_date('23-03-1972', 'dd-mm-yyyy'), 'Need continue', 116);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (50, to_date('08-07-1994', 'dd-mm-yyyy'), 'difficult', 101);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (51, to_date('24-04-2004', 'dd-mm-yyyy'), 'easy', 33);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (52, to_date('01-12-2014', 'dd-mm-yyyy'), 'Need continue', 44);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (53, to_date('09-05-1989', 'dd-mm-yyyy'), 'Need continue', 69);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (54, to_date('25-06-1991', 'dd-mm-yyyy'), 'Need continue', 55);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (55, to_date('12-09-1982', 'dd-mm-yyyy'), 'easy', 92);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (56, to_date('26-02-2022', 'dd-mm-yyyy'), 'Need continue', 17);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (57, to_date('20-05-1962', 'dd-mm-yyyy'), 'Need continue', 85);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (58, to_date('04-07-2012', 'dd-mm-yyyy'), 'Need continue', 45);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (59, to_date('17-02-1985', 'dd-mm-yyyy'), 'difficult', 70);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (60, to_date('06-12-1977', 'dd-mm-yyyy'), 'difficult', 31);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (61, to_date('17-10-1969', 'dd-mm-yyyy'), 'easy', 15);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (62, to_date('18-11-1975', 'dd-mm-yyyy'), 'difficult', 110);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (63, to_date('30-10-1988', 'dd-mm-yyyy'), 'difficult', 22);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (64, to_date('30-12-2013', 'dd-mm-yyyy'), 'easy', 30);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (65, to_date('20-03-2007', 'dd-mm-yyyy'), 'Need continue', 18);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (66, to_date('12-06-1969', 'dd-mm-yyyy'), 'easy', 95);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (67, to_date('23-08-1976', 'dd-mm-yyyy'), 'difficult', 69);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (68, to_date('19-08-1992', 'dd-mm-yyyy'), 'difficult', 89);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (69, to_date('23-06-2016', 'dd-mm-yyyy'), 'easy', 84);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (70, to_date('02-01-1971', 'dd-mm-yyyy'), 'difficult', 88);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (71, to_date('25-07-2002', 'dd-mm-yyyy'), 'easy', 60);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (72, to_date('09-02-2022', 'dd-mm-yyyy'), 'easy', 8);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (73, to_date('24-11-1997', 'dd-mm-yyyy'), 'Need continue', 60);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (74, to_date('24-05-2002', 'dd-mm-yyyy'), 'difficult', 32);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (75, to_date('29-03-1993', 'dd-mm-yyyy'), 'difficult', 91);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (76, to_date('12-06-2003', 'dd-mm-yyyy'), 'easy', 112);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (77, to_date('28-10-2013', 'dd-mm-yyyy'), 'difficult', 4);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (78, to_date('18-10-2006', 'dd-mm-yyyy'), 'difficult', 31);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (79, to_date('28-01-2002', 'dd-mm-yyyy'), 'easy', 90);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (80, to_date('10-03-1982', 'dd-mm-yyyy'), 'easy', 67);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (81, to_date('30-11-1971', 'dd-mm-yyyy'), 'Need continue', 128);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (82, to_date('24-10-1976', 'dd-mm-yyyy'), 'difficult', 105);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (83, to_date('08-03-1976', 'dd-mm-yyyy'), 'difficult', 48);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (84, to_date('03-11-2007', 'dd-mm-yyyy'), 'easy', 4);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (85, to_date('11-02-1993', 'dd-mm-yyyy'), 'easy', 127);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (86, to_date('09-08-1976', 'dd-mm-yyyy'), 'Need continue', 33);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (87, to_date('03-12-1977', 'dd-mm-yyyy'), 'Need continue', 113);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (88, to_date('19-06-2020', 'dd-mm-yyyy'), 'easy', 46);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (89, to_date('07-08-1998', 'dd-mm-yyyy'), 'difficult', 59);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (90, to_date('18-08-1974', 'dd-mm-yyyy'), 'difficult', 72);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (91, to_date('04-11-2017', 'dd-mm-yyyy'), 'Need continue', 70);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (92, to_date('28-07-1978', 'dd-mm-yyyy'), 'Need continue', 45);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (93, to_date('17-12-1995', 'dd-mm-yyyy'), 'easy', 81);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (94, to_date('28-07-1998', 'dd-mm-yyyy'), 'easy', 71);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (95, to_date('30-07-2022', 'dd-mm-yyyy'), 'difficult', 89);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (96, to_date('19-02-2008', 'dd-mm-yyyy'), 'easy', 77);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (97, to_date('08-05-1988', 'dd-mm-yyyy'), 'difficult', 115);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (98, to_date('14-04-1982', 'dd-mm-yyyy'), 'difficult', 113);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (99, to_date('09-11-1962', 'dd-mm-yyyy'), 'difficult', 36);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (100, to_date('25-11-1982', 'dd-mm-yyyy'), 'easy', 69);
commit;
prompt 100 records committed...
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (101, to_date('29-12-1989', 'dd-mm-yyyy'), 'Need continue', 53);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (102, to_date('07-02-1977', 'dd-mm-yyyy'), 'Need continue', 81);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (103, to_date('19-11-1989', 'dd-mm-yyyy'), 'difficult', 34);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (104, to_date('31-03-2020', 'dd-mm-yyyy'), 'Need continue', 39);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (105, to_date('09-04-2004', 'dd-mm-yyyy'), 'easy', 4);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (106, to_date('07-12-2000', 'dd-mm-yyyy'), 'Need continue', 77);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (107, to_date('23-02-1994', 'dd-mm-yyyy'), 'difficult', 4);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (108, to_date('26-03-1984', 'dd-mm-yyyy'), 'easy', 68);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (109, to_date('26-06-1965', 'dd-mm-yyyy'), 'Need continue', 70);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (110, to_date('25-04-1972', 'dd-mm-yyyy'), 'easy', 118);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (111, to_date('29-09-2010', 'dd-mm-yyyy'), 'Need continue', 48);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (112, to_date('28-06-1962', 'dd-mm-yyyy'), 'easy', 28);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (113, to_date('30-11-1982', 'dd-mm-yyyy'), 'difficult', 31);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (114, to_date('27-10-1999', 'dd-mm-yyyy'), 'easy', 88);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (115, to_date('01-01-2017', 'dd-mm-yyyy'), 'difficult', 72);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (116, to_date('18-05-1969', 'dd-mm-yyyy'), 'Need continue', 116);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (117, to_date('17-11-2019', 'dd-mm-yyyy'), 'difficult', 37);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (118, to_date('27-06-1962', 'dd-mm-yyyy'), 'difficult', 106);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (119, to_date('10-10-1999', 'dd-mm-yyyy'), 'difficult', 15);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (120, to_date('18-10-1973', 'dd-mm-yyyy'), 'Need continue', 45);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (121, to_date('04-11-2021', 'dd-mm-yyyy'), 'Need continue', 91);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (122, to_date('08-03-1970', 'dd-mm-yyyy'), 'easy', 48);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (123, to_date('16-09-1963', 'dd-mm-yyyy'), 'Need continue', 48);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (124, to_date('01-07-2015', 'dd-mm-yyyy'), 'easy', 17);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (125, to_date('15-01-1980', 'dd-mm-yyyy'), 'difficult', 71);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (126, to_date('11-04-1964', 'dd-mm-yyyy'), 'Need continue', 32);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (127, to_date('04-04-2018', 'dd-mm-yyyy'), 'difficult', 59);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (128, to_date('09-11-1996', 'dd-mm-yyyy'), 'difficult', 31);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (129, to_date('07-12-2011', 'dd-mm-yyyy'), 'Need continue', 78);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (130, to_date('25-04-2015', 'dd-mm-yyyy'), 'easy', 4);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (131, to_date('20-08-1989', 'dd-mm-yyyy'), 'Need continue', 78);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (132, to_date('09-03-1975', 'dd-mm-yyyy'), 'easy', 92);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (133, to_date('01-04-1977', 'dd-mm-yyyy'), 'Need continue', 128);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (134, to_date('02-03-1996', 'dd-mm-yyyy'), 'difficult', 37);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (135, to_date('13-12-2013', 'dd-mm-yyyy'), 'easy', 72);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (136, to_date('26-10-1995', 'dd-mm-yyyy'), 'difficult', 20);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (137, to_date('08-02-1965', 'dd-mm-yyyy'), 'Need continue', 9);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (138, to_date('07-04-1962', 'dd-mm-yyyy'), 'easy', 33);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (139, to_date('13-12-1981', 'dd-mm-yyyy'), 'easy', 52);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (140, to_date('02-09-2001', 'dd-mm-yyyy'), 'Need continue', 14);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (141, to_date('30-12-1980', 'dd-mm-yyyy'), 'easy', 39);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (142, to_date('11-10-2013', 'dd-mm-yyyy'), 'easy', 56);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (143, to_date('18-12-1966', 'dd-mm-yyyy'), 'easy', 35);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (144, to_date('14-01-1985', 'dd-mm-yyyy'), 'easy', 83);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (145, to_date('11-06-2008', 'dd-mm-yyyy'), 'difficult', 11);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (146, to_date('06-07-1974', 'dd-mm-yyyy'), 'easy', 8);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (147, to_date('07-11-1988', 'dd-mm-yyyy'), 'Need continue', 64);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (148, to_date('04-09-1984', 'dd-mm-yyyy'), 'Need continue', 59);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (149, to_date('09-12-1963', 'dd-mm-yyyy'), 'easy', 69);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (150, to_date('20-12-2009', 'dd-mm-yyyy'), 'difficult', 29);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (151, to_date('10-05-1991', 'dd-mm-yyyy'), 'Need continue', 56);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (152, to_date('28-07-1997', 'dd-mm-yyyy'), 'difficult', 31);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (153, to_date('21-04-1980', 'dd-mm-yyyy'), 'difficult', 82);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (154, to_date('25-09-1978', 'dd-mm-yyyy'), 'easy', 8);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (155, to_date('02-06-1961', 'dd-mm-yyyy'), 'difficult', 28);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (156, to_date('07-05-2019', 'dd-mm-yyyy'), 'easy', 93);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (157, to_date('12-06-1990', 'dd-mm-yyyy'), 'difficult', 87);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (158, to_date('10-07-2022', 'dd-mm-yyyy'), 'Need continue', 22);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (159, to_date('27-08-2006', 'dd-mm-yyyy'), 'easy', 77);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (160, to_date('02-05-1993', 'dd-mm-yyyy'), 'Need continue', 46);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (161, to_date('01-03-1979', 'dd-mm-yyyy'), 'difficult', 9);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (162, to_date('05-12-1963', 'dd-mm-yyyy'), 'Need continue', 83);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (163, to_date('14-10-1965', 'dd-mm-yyyy'), 'easy', 57);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (164, to_date('05-10-1978', 'dd-mm-yyyy'), 'difficult', 22);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (165, to_date('14-07-1971', 'dd-mm-yyyy'), 'Need continue', 17);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (166, to_date('08-01-1985', 'dd-mm-yyyy'), 'easy', 11);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (167, to_date('24-04-2008', 'dd-mm-yyyy'), 'difficult', 116);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (168, to_date('31-03-1964', 'dd-mm-yyyy'), 'Need continue', 103);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (169, to_date('10-12-1999', 'dd-mm-yyyy'), 'easy', 37);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (170, to_date('01-02-1995', 'dd-mm-yyyy'), 'difficult', 69);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (171, to_date('14-03-1965', 'dd-mm-yyyy'), 'Need continue', 58);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (172, to_date('02-12-1990', 'dd-mm-yyyy'), 'difficult', 66);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (173, to_date('25-07-1986', 'dd-mm-yyyy'), 'Need continue', 91);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (174, to_date('26-10-1999', 'dd-mm-yyyy'), 'difficult', 103);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (175, to_date('15-05-1972', 'dd-mm-yyyy'), 'easy', 16);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (176, to_date('31-01-1979', 'dd-mm-yyyy'), 'easy', 91);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (177, to_date('01-07-2008', 'dd-mm-yyyy'), 'Need continue', 37);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (178, to_date('25-10-2005', 'dd-mm-yyyy'), 'difficult', 107);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (179, to_date('23-01-2008', 'dd-mm-yyyy'), 'easy', 77);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (180, to_date('19-04-2019', 'dd-mm-yyyy'), 'Need continue', 56);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (181, to_date('18-01-2014', 'dd-mm-yyyy'), 'Need continue', 62);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (182, to_date('08-01-2004', 'dd-mm-yyyy'), 'difficult', 96);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (183, to_date('22-02-1973', 'dd-mm-yyyy'), 'difficult', 19);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (184, to_date('24-01-1975', 'dd-mm-yyyy'), 'Need continue', 101);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (185, to_date('26-01-2004', 'dd-mm-yyyy'), 'Need continue', 8);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (186, to_date('02-01-2013', 'dd-mm-yyyy'), 'Need continue', 91);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (187, to_date('09-11-1985', 'dd-mm-yyyy'), 'Need continue', 58);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (188, to_date('14-12-1961', 'dd-mm-yyyy'), 'difficult', 78);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (189, to_date('21-12-1971', 'dd-mm-yyyy'), 'difficult', 104);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (190, to_date('06-03-1986', 'dd-mm-yyyy'), 'difficult', 115);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (191, to_date('17-06-1999', 'dd-mm-yyyy'), 'difficult', 124);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (192, to_date('11-09-2003', 'dd-mm-yyyy'), 'difficult', 88);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (193, to_date('23-04-2005', 'dd-mm-yyyy'), 'Need continue', 33);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (194, to_date('19-10-1981', 'dd-mm-yyyy'), 'difficult', 108);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (195, to_date('20-01-1990', 'dd-mm-yyyy'), 'difficult', 46);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (196, to_date('11-12-2011', 'dd-mm-yyyy'), 'easy', 20);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (197, to_date('24-04-2003', 'dd-mm-yyyy'), 'Need continue', 104);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (198, to_date('21-11-1981', 'dd-mm-yyyy'), 'easy', 17);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (199, to_date('29-11-1983', 'dd-mm-yyyy'), 'easy', 96);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (200, to_date('02-02-1966', 'dd-mm-yyyy'), 'difficult', 44);
commit;
prompt 200 records committed...
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (201, to_date('21-04-2024', 'dd-mm-yyyy'), 'easy', 18);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (202, to_date('29-12-1983', 'dd-mm-yyyy'), 'difficult', 128);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (203, to_date('03-08-1981', 'dd-mm-yyyy'), 'easy', 16);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (204, to_date('25-08-1992', 'dd-mm-yyyy'), 'easy', 124);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (205, to_date('24-09-1977', 'dd-mm-yyyy'), 'difficult', 57);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (206, to_date('15-12-1976', 'dd-mm-yyyy'), 'easy', 59);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (207, to_date('15-11-1980', 'dd-mm-yyyy'), 'easy', 37);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (208, to_date('25-06-1995', 'dd-mm-yyyy'), 'Need continue', 55);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (209, to_date('07-03-1964', 'dd-mm-yyyy'), 'difficult', 90);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (210, to_date('20-09-2006', 'dd-mm-yyyy'), 'easy', 78);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (211, to_date('29-12-1994', 'dd-mm-yyyy'), 'easy', 28);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (212, to_date('08-07-1983', 'dd-mm-yyyy'), 'Need continue', 34);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (213, to_date('29-03-2010', 'dd-mm-yyyy'), 'difficult', 17);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (214, to_date('30-04-1975', 'dd-mm-yyyy'), 'easy', 103);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (215, to_date('12-09-1978', 'dd-mm-yyyy'), 'difficult', 63);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (216, to_date('17-08-2007', 'dd-mm-yyyy'), 'easy', 95);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (217, to_date('21-03-2019', 'dd-mm-yyyy'), 'easy', 46);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (218, to_date('04-04-1990', 'dd-mm-yyyy'), 'difficult', 72);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (219, to_date('25-09-1976', 'dd-mm-yyyy'), 'difficult', 128);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (220, to_date('29-12-1984', 'dd-mm-yyyy'), 'difficult', 4);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (221, to_date('27-01-2003', 'dd-mm-yyyy'), 'difficult', 85);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (222, to_date('13-08-1974', 'dd-mm-yyyy'), 'easy', 24);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (223, to_date('09-04-1989', 'dd-mm-yyyy'), 'difficult', 111);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (224, to_date('20-09-1962', 'dd-mm-yyyy'), 'difficult', 19);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (225, to_date('20-06-1969', 'dd-mm-yyyy'), 'difficult', 59);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (226, to_date('05-05-1966', 'dd-mm-yyyy'), 'difficult', 125);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (227, to_date('21-03-1965', 'dd-mm-yyyy'), 'difficult', 104);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (228, to_date('16-06-1973', 'dd-mm-yyyy'), 'Need continue', 72);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (229, to_date('10-08-2011', 'dd-mm-yyyy'), 'Need continue', 87);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (230, to_date('09-10-1977', 'dd-mm-yyyy'), 'easy', 24);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (231, to_date('28-09-1964', 'dd-mm-yyyy'), 'easy', 90);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (232, to_date('14-09-2002', 'dd-mm-yyyy'), 'Need continue', 60);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (233, to_date('26-12-2006', 'dd-mm-yyyy'), 'easy', 88);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (234, to_date('19-05-1975', 'dd-mm-yyyy'), 'difficult', 106);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (235, to_date('26-04-1969', 'dd-mm-yyyy'), 'easy', 69);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (236, to_date('12-02-1960', 'dd-mm-yyyy'), 'easy', 61);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (237, to_date('24-05-2019', 'dd-mm-yyyy'), 'easy', 108);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (238, to_date('22-08-1976', 'dd-mm-yyyy'), 'easy', 105);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (239, to_date('07-08-1991', 'dd-mm-yyyy'), 'difficult', 82);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (240, to_date('24-09-2013', 'dd-mm-yyyy'), 'easy', 125);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (241, to_date('02-05-2006', 'dd-mm-yyyy'), 'easy', 68);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (242, to_date('06-11-2019', 'dd-mm-yyyy'), 'easy', 18);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (243, to_date('21-08-1995', 'dd-mm-yyyy'), 'Need continue', 45);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (244, to_date('14-08-1989', 'dd-mm-yyyy'), 'difficult', 95);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (245, to_date('06-09-2022', 'dd-mm-yyyy'), 'easy', 118);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (246, to_date('03-09-1971', 'dd-mm-yyyy'), 'difficult', 17);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (247, to_date('21-04-1990', 'dd-mm-yyyy'), 'easy', 112);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (248, to_date('18-06-1964', 'dd-mm-yyyy'), 'easy', 68);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (249, to_date('03-02-2005', 'dd-mm-yyyy'), 'easy', 110);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (250, to_date('15-07-1989', 'dd-mm-yyyy'), 'easy', 69);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (251, to_date('23-03-1967', 'dd-mm-yyyy'), 'easy', 127);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (252, to_date('29-01-2014', 'dd-mm-yyyy'), 'difficult', 35);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (253, to_date('14-04-1974', 'dd-mm-yyyy'), 'difficult', 128);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (254, to_date('04-07-1963', 'dd-mm-yyyy'), 'Need continue', 83);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (255, to_date('27-11-2013', 'dd-mm-yyyy'), 'easy', 44);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (256, to_date('07-02-1991', 'dd-mm-yyyy'), 'difficult', 102);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (257, to_date('17-10-1964', 'dd-mm-yyyy'), 'difficult', 24);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (258, to_date('29-11-2008', 'dd-mm-yyyy'), 'Need continue', 94);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (259, to_date('29-12-1983', 'dd-mm-yyyy'), 'easy', 21);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (260, to_date('12-01-1964', 'dd-mm-yyyy'), 'Need continue', 113);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (261, to_date('16-08-1972', 'dd-mm-yyyy'), 'Need continue', 91);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (262, to_date('28-09-1980', 'dd-mm-yyyy'), 'easy', 81);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (263, to_date('16-11-1987', 'dd-mm-yyyy'), 'difficult', 54);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (264, to_date('07-12-1971', 'dd-mm-yyyy'), 'easy', 94);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (265, to_date('14-01-1970', 'dd-mm-yyyy'), 'Need continue', 107);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (266, to_date('25-06-1984', 'dd-mm-yyyy'), 'difficult', 35);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (267, to_date('21-01-1960', 'dd-mm-yyyy'), 'easy', 53);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (268, to_date('24-05-2016', 'dd-mm-yyyy'), 'difficult', 20);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (269, to_date('05-07-1988', 'dd-mm-yyyy'), 'easy', 57);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (270, to_date('28-03-2015', 'dd-mm-yyyy'), 'difficult', 68);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (271, to_date('30-07-1984', 'dd-mm-yyyy'), 'difficult', 93);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (272, to_date('20-04-2006', 'dd-mm-yyyy'), 'Need continue', 125);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (273, to_date('24-04-1965', 'dd-mm-yyyy'), 'easy', 10);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (274, to_date('11-03-1960', 'dd-mm-yyyy'), 'Need continue', 70);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (275, to_date('22-08-1988', 'dd-mm-yyyy'), 'difficult', 11);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (276, to_date('23-12-1965', 'dd-mm-yyyy'), 'Need continue', 58);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (277, to_date('08-10-1965', 'dd-mm-yyyy'), 'Need continue', 128);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (278, to_date('04-08-1993', 'dd-mm-yyyy'), 'Need continue', 18);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (279, to_date('29-04-2003', 'dd-mm-yyyy'), 'easy', 93);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (280, to_date('05-03-1997', 'dd-mm-yyyy'), 'easy', 39);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (281, to_date('20-04-1994', 'dd-mm-yyyy'), 'easy', 64);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (282, to_date('08-06-1994', 'dd-mm-yyyy'), 'difficult', 65);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (283, to_date('22-08-2019', 'dd-mm-yyyy'), 'difficult', 108);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (284, to_date('08-01-2016', 'dd-mm-yyyy'), 'Need continue', 88);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (285, to_date('10-02-1974', 'dd-mm-yyyy'), 'difficult', 53);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (286, to_date('06-10-1977', 'dd-mm-yyyy'), 'difficult', 47);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (287, to_date('16-06-1963', 'dd-mm-yyyy'), 'easy', 105);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (288, to_date('23-07-2009', 'dd-mm-yyyy'), 'Need continue', 24);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (289, to_date('30-11-1976', 'dd-mm-yyyy'), 'Need continue', 9);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (290, to_date('07-12-2008', 'dd-mm-yyyy'), 'Need continue', 48);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (291, to_date('12-06-2007', 'dd-mm-yyyy'), 'easy', 56);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (292, to_date('18-10-1964', 'dd-mm-yyyy'), 'easy', 4);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (293, to_date('24-01-1964', 'dd-mm-yyyy'), 'Need continue', 47);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (294, to_date('20-12-2015', 'dd-mm-yyyy'), 'easy', 69);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (295, to_date('21-10-1974', 'dd-mm-yyyy'), 'difficult', 70);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (296, to_date('15-09-1989', 'dd-mm-yyyy'), 'Need continue', 67);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (297, to_date('12-10-1988', 'dd-mm-yyyy'), 'difficult', 16);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (298, to_date('23-05-1995', 'dd-mm-yyyy'), 'easy', 40);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (299, to_date('10-08-2014', 'dd-mm-yyyy'), 'difficult', 63);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (300, to_date('10-03-2004', 'dd-mm-yyyy'), 'Need continue', 12);
commit;
prompt 300 records committed...
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (301, to_date('10-01-1960', 'dd-mm-yyyy'), 'difficult', 66);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (302, to_date('29-05-1965', 'dd-mm-yyyy'), 'easy', 45);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (303, to_date('27-01-1985', 'dd-mm-yyyy'), 'difficult', 81);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (304, to_date('07-12-2002', 'dd-mm-yyyy'), 'easy', 32);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (305, to_date('02-03-2014', 'dd-mm-yyyy'), 'Need continue', 90);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (306, to_date('10-01-2001', 'dd-mm-yyyy'), 'difficult', 71);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (307, to_date('18-12-2013', 'dd-mm-yyyy'), 'easy', 17);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (308, to_date('23-08-1978', 'dd-mm-yyyy'), 'difficult', 28);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (309, to_date('13-01-1984', 'dd-mm-yyyy'), 'Need continue', 84);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (310, to_date('24-05-1994', 'dd-mm-yyyy'), 'Need continue', 117);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (311, to_date('14-11-1961', 'dd-mm-yyyy'), 'difficult', 79);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (312, to_date('25-11-1960', 'dd-mm-yyyy'), 'easy', 117);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (313, to_date('25-05-2008', 'dd-mm-yyyy'), 'difficult', 110);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (314, to_date('11-09-2021', 'dd-mm-yyyy'), 'easy', 32);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (315, to_date('02-03-1968', 'dd-mm-yyyy'), 'easy', 58);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (316, to_date('31-10-1998', 'dd-mm-yyyy'), 'Need continue', 91);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (317, to_date('15-06-1967', 'dd-mm-yyyy'), 'difficult', 63);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (318, to_date('28-11-1962', 'dd-mm-yyyy'), 'Need continue', 44);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (319, to_date('10-03-1966', 'dd-mm-yyyy'), 'Need continue', 62);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (320, to_date('29-01-1996', 'dd-mm-yyyy'), 'easy', 113);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (321, to_date('21-07-2012', 'dd-mm-yyyy'), 'Need continue', 115);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (322, to_date('19-06-1995', 'dd-mm-yyyy'), 'difficult', 47);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (323, to_date('16-08-1993', 'dd-mm-yyyy'), 'difficult', 77);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (324, to_date('06-12-1965', 'dd-mm-yyyy'), 'easy', 43);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (325, to_date('06-03-1972', 'dd-mm-yyyy'), 'Need continue', 66);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (326, to_date('21-01-1997', 'dd-mm-yyyy'), 'Need continue', 71);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (327, to_date('21-09-1988', 'dd-mm-yyyy'), 'Need continue', 4);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (328, to_date('11-02-2004', 'dd-mm-yyyy'), 'easy', 106);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (329, to_date('04-11-1998', 'dd-mm-yyyy'), 'easy', 81);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (330, to_date('12-01-1961', 'dd-mm-yyyy'), 'easy', 114);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (331, to_date('27-08-1965', 'dd-mm-yyyy'), 'Need continue', 12);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (332, to_date('09-05-2000', 'dd-mm-yyyy'), 'difficult', 52);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (333, to_date('25-11-2013', 'dd-mm-yyyy'), 'Need continue', 62);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (334, to_date('29-04-2006', 'dd-mm-yyyy'), 'easy', 20);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (335, to_date('31-03-1999', 'dd-mm-yyyy'), 'Need continue', 118);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (336, to_date('11-01-1962', 'dd-mm-yyyy'), 'easy', 96);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (337, to_date('22-02-1961', 'dd-mm-yyyy'), 'difficult', 41);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (338, to_date('13-01-1995', 'dd-mm-yyyy'), 'easy', 19);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (339, to_date('28-11-1979', 'dd-mm-yyyy'), 'easy', 15);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (340, to_date('29-01-1974', 'dd-mm-yyyy'), 'easy', 54);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (341, to_date('05-12-2001', 'dd-mm-yyyy'), 'easy', 108);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (342, to_date('17-10-2008', 'dd-mm-yyyy'), 'easy', 43);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (343, to_date('23-01-2016', 'dd-mm-yyyy'), 'easy', 16);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (344, to_date('03-03-1993', 'dd-mm-yyyy'), 'easy', 33);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (345, to_date('22-07-1993', 'dd-mm-yyyy'), 'Need continue', 41);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (346, to_date('04-08-1992', 'dd-mm-yyyy'), 'difficult', 43);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (347, to_date('25-09-1997', 'dd-mm-yyyy'), 'difficult', 108);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (348, to_date('27-09-2011', 'dd-mm-yyyy'), 'difficult', 89);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (349, to_date('18-07-1988', 'dd-mm-yyyy'), 'Need continue', 106);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (350, to_date('07-01-1978', 'dd-mm-yyyy'), 'difficult', 96);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (351, to_date('21-08-2002', 'dd-mm-yyyy'), 'difficult', 127);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (352, to_date('09-12-1985', 'dd-mm-yyyy'), 'Need continue', 127);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (353, to_date('30-11-1970', 'dd-mm-yyyy'), 'easy', 113);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (354, to_date('25-07-1998', 'dd-mm-yyyy'), 'easy', 84);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (355, to_date('19-11-1961', 'dd-mm-yyyy'), 'Need continue', 60);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (356, to_date('28-08-1966', 'dd-mm-yyyy'), 'easy', 102);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (357, to_date('28-05-2020', 'dd-mm-yyyy'), 'easy', 69);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (358, to_date('07-05-1983', 'dd-mm-yyyy'), 'difficult', 6);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (359, to_date('04-04-1977', 'dd-mm-yyyy'), 'difficult', 80);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (360, to_date('18-05-1988', 'dd-mm-yyyy'), 'Need continue', 69);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (361, to_date('09-02-1989', 'dd-mm-yyyy'), 'easy', 57);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (362, to_date('21-02-1996', 'dd-mm-yyyy'), 'Need continue', 127);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (363, to_date('11-08-1996', 'dd-mm-yyyy'), 'Need continue', 81);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (364, to_date('26-04-1994', 'dd-mm-yyyy'), 'difficult', 33);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (365, to_date('09-11-1977', 'dd-mm-yyyy'), 'difficult', 72);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (366, to_date('02-07-1980', 'dd-mm-yyyy'), 'easy', 116);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (367, to_date('01-03-2014', 'dd-mm-yyyy'), 'Need continue', 115);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (368, to_date('02-08-1963', 'dd-mm-yyyy'), 'Need continue', 8);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (369, to_date('04-07-2021', 'dd-mm-yyyy'), 'easy', 89);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (370, to_date('11-11-1988', 'dd-mm-yyyy'), 'easy', 77);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (371, to_date('18-09-1984', 'dd-mm-yyyy'), 'easy', 58);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (372, to_date('10-02-1972', 'dd-mm-yyyy'), 'Need continue', 16);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (373, to_date('29-01-1981', 'dd-mm-yyyy'), 'easy', 113);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (374, to_date('07-04-2024', 'dd-mm-yyyy'), 'difficult', 82);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (375, to_date('02-07-2007', 'dd-mm-yyyy'), 'Need continue', 106);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (376, to_date('13-05-1999', 'dd-mm-yyyy'), 'Need continue', 76);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (377, to_date('16-07-2013', 'dd-mm-yyyy'), 'easy', 106);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (378, to_date('14-03-1990', 'dd-mm-yyyy'), 'easy', 47);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (379, to_date('24-10-2000', 'dd-mm-yyyy'), 'easy', 69);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (380, to_date('09-07-2016', 'dd-mm-yyyy'), 'Need continue', 11);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (381, to_date('03-05-2012', 'dd-mm-yyyy'), 'difficult', 125);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (382, to_date('14-10-2002', 'dd-mm-yyyy'), 'difficult', 15);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (383, to_date('05-12-1969', 'dd-mm-yyyy'), 'easy', 72);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (384, to_date('19-05-2007', 'dd-mm-yyyy'), 'Need continue', 79);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (385, to_date('31-03-1965', 'dd-mm-yyyy'), 'Need continue', 35);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (386, to_date('25-12-1984', 'dd-mm-yyyy'), 'difficult', 77);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (387, to_date('17-11-1992', 'dd-mm-yyyy'), 'Need continue', 77);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (388, to_date('29-03-1975', 'dd-mm-yyyy'), 'difficult', 113);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (389, to_date('30-05-1976', 'dd-mm-yyyy'), 'difficult', 37);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (390, to_date('07-12-1986', 'dd-mm-yyyy'), 'difficult', 104);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (391, to_date('31-05-1965', 'dd-mm-yyyy'), 'easy', 55);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (392, to_date('28-02-2005', 'dd-mm-yyyy'), 'easy', 35);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (393, to_date('27-09-2001', 'dd-mm-yyyy'), 'difficult', 18);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (394, to_date('04-05-1991', 'dd-mm-yyyy'), 'easy', 32);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (395, to_date('12-06-1998', 'dd-mm-yyyy'), 'easy', 19);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (396, to_date('13-09-2016', 'dd-mm-yyyy'), 'Need continue', 93);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (397, to_date('24-03-2006', 'dd-mm-yyyy'), 'difficult', 14);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (398, to_date('23-08-1972', 'dd-mm-yyyy'), 'difficult', 117);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (399, to_date('20-10-1997', 'dd-mm-yyyy'), 'easy', 45);
insert into MAINTENANCE (maintenanceid, maintenancedate, description, itemid)
values (400, to_date('29-03-2016', 'dd-mm-yyyy'), 'difficult', 67);
commit;
prompt 400 records loaded
prompt Loading OPERATOR...
insert into OPERATOR (operatorid, name, expirationdate)
values (100, 'MattCollie', to_date('13-11-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (101, 'JulietPfeiffer', to_date('03-04-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (102, 'ChristianMewes', to_date('22-12-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (103, 'GlenTanon', to_date('06-07-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (104, 'OwenLaPaglia', to_date('18-03-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (105, 'IvanHatchet', to_date('31-01-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (106, 'FranzHunter', to_date('26-05-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (107, 'RobGaines', to_date('18-01-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (108, 'HexFoxx', to_date('17-12-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (109, 'AliciaWinstone', to_date('12-09-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (110, 'PhilipBenson', to_date('09-12-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (111, 'TziMcAnally', to_date('31-10-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (112, 'MarleyBlossoms', to_date('15-03-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (113, 'DaveBuffalo', to_date('24-02-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (114, 'KirkCromwell', to_date('03-09-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (115, 'MarlonSecada', to_date('28-10-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (116, 'MaxDiBiasio', to_date('18-02-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (117, 'CevinBachman', to_date('03-03-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (118, 'MekhiCantrell', to_date('04-04-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (119, 'HarryBrando', to_date('04-06-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (120, 'HarrisonMcPherson', to_date('15-04-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (121, 'LupeRebhorn', to_date('05-12-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (122, 'YolandaJeffreys', to_date('05-07-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (123, 'RadeLogue', to_date('08-01-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (124, 'JuliannePride', to_date('06-01-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (125, 'NikSchwarzenegger', to_date('28-03-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (126, 'HarrisVai', to_date('03-08-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (127, 'ClaireGibson', to_date('09-02-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (128, 'PragaLevin', to_date('31-01-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (129, 'YaphetTierney', to_date('16-12-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (130, 'KathleenBranch', to_date('26-05-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (131, 'ReneeKlugh', to_date('10-03-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (132, 'ChristopherGill', to_date('29-09-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (133, 'TchekyTolkan', to_date('21-03-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (134, 'RachidNeil', to_date('02-07-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (135, 'LenaDaniels', to_date('05-06-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (136, 'EddieCulkin', to_date('16-08-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (137, 'HollandWahlberg', to_date('28-08-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (138, 'AliciaShand', to_date('24-09-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (139, 'ClayTurner', to_date('02-08-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (140, 'JeffreyScorsese', to_date('02-05-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (141, 'BethRicci', to_date('26-10-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (142, 'LucyCoburn', to_date('01-05-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (143, 'JoelyPresley', to_date('07-11-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (144, 'DesmondNuman', to_date('30-07-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (145, 'ChristineGarza', to_date('10-06-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (146, 'HeathHatchet', to_date('18-03-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (147, 'MurrayWhitley', to_date('25-07-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (148, 'TimHeald', to_date('28-03-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (149, 'BrentMueller-Stahl', to_date('15-03-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (150, 'MollyGraham', to_date('22-09-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (151, 'MiaMac', to_date('13-11-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (152, 'RoyCash', to_date('27-08-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (153, 'LauraSepulveda', to_date('02-04-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (154, 'ConnieFuray', to_date('07-01-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (155, 'NicoleMacy', to_date('01-12-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (156, 'DarrenHeslov', to_date('06-02-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (157, 'HectorJackson', to_date('01-07-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (158, 'DebraStarr', to_date('17-11-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (159, 'SharonStills', to_date('17-01-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (160, 'OwenWhite', to_date('11-03-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (161, 'LydiaGriggs', to_date('17-07-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (162, 'ChadFinn', to_date('14-08-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (163, 'PatriciaMoffat', to_date('20-02-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (164, 'NicolePostlethwaite', to_date('07-09-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (165, 'HarveyHayek', to_date('25-09-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (166, 'KeithKapanka', to_date('09-06-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (167, 'AustinLewis', to_date('07-01-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (168, 'PatrickGeldof', to_date('10-12-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (169, 'RandallWillis', to_date('03-09-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (170, 'LiamBalk', to_date('15-04-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (171, 'SigourneyPenders', to_date('23-08-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (172, 'JackHeston', to_date('01-01-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (173, 'MillaHayek', to_date('23-03-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (174, 'SharonAli', to_date('21-02-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (175, 'NigelHeslov', to_date('03-06-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (176, 'CharltonCronin', to_date('13-01-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (177, 'AndieDukakis', to_date('11-10-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (178, 'GarryRhodes', to_date('23-04-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (179, 'HarryRaybon', to_date('27-11-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (180, 'Jean-ClaudeGuzman', to_date('14-08-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (181, 'MaggieGalecki', to_date('23-05-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (182, 'VictorVaughan', to_date('30-01-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (183, 'CarrieFlanagan', to_date('29-09-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (184, 'TommyCraddock', to_date('16-02-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (185, 'KurtSpector', to_date('12-01-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (186, 'AndreaCraig', to_date('12-11-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (187, 'GeenaGilley', to_date('19-07-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (188, 'GailardBrooke', to_date('27-02-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (189, 'LesleyBullock', to_date('05-01-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (190, 'JerryEvans', to_date('10-09-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (191, 'TildaWaits', to_date('24-02-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (192, 'PattyParsons', to_date('04-10-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (193, 'SineadNicholas', to_date('26-05-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (194, 'LeslieCurry', to_date('10-08-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (195, 'GailardCook', to_date('11-05-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (196, 'DomingoImbruglia', to_date('21-12-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (197, 'MiaMargulies', to_date('07-12-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (198, 'SalGriffiths', to_date('09-06-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (199, 'JoaquinHagerty', to_date('14-03-2025', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into OPERATOR (operatorid, name, expirationdate)
values (200, 'NinaSepulveda', to_date('11-11-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (201, 'StephenSanchez', to_date('12-10-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (202, 'SolomonVanian', to_date('05-12-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (203, 'DanielShaw', to_date('01-04-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (204, 'VerticalKapanka', to_date('17-01-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (205, 'BuffyCampbell', to_date('01-03-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (206, 'RitaTennison', to_date('28-02-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (207, 'HarrietPayne', to_date('16-07-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (208, 'CarleneO''Hara', to_date('30-06-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (209, 'AliMcCormack', to_date('12-08-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (210, 'ChristineKaryo', to_date('25-11-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (211, 'ThinStarr', to_date('27-02-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (212, 'LiamGyllenhaal', to_date('08-01-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (213, 'ColeFonda', to_date('23-06-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (214, 'MiaRodriguez', to_date('13-02-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (215, 'DebbieBancroft', to_date('07-07-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (216, 'RheaHawn', to_date('28-09-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (217, 'ElizaBosco', to_date('27-11-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (218, 'GabrielClinton', to_date('07-12-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (219, 'HollyFrakes', to_date('18-11-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (220, 'CesarKramer', to_date('21-06-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (221, 'LisaBlossoms', to_date('28-05-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (222, 'DiamondGyllenhaal', to_date('19-09-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (223, 'CarlWilliams', to_date('19-09-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (224, 'GlenMatheson', to_date('19-10-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (225, 'MintMills', to_date('23-09-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (226, 'MirandaKingsley', to_date('27-01-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (227, 'JoanHaggard', to_date('03-11-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (228, 'CaroleEmmerich', to_date('26-04-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (229, 'KathleenTillis', to_date('06-09-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (230, 'CeiliHimmelman', to_date('12-12-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (231, 'JosephBeckinsale', to_date('25-06-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (232, 'GeggyKadison', to_date('03-04-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (233, 'GilBadalucco', to_date('09-02-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (234, 'BridgetteGold', to_date('21-01-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (235, 'SonaIsaak', to_date('17-10-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (236, 'LeaKlugh', to_date('19-06-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (237, 'DorryRipley', to_date('15-02-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (238, 'BradleyHaslam', to_date('22-06-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (239, 'ReneSingh', to_date('25-04-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (240, 'YolandaHawthorne', to_date('25-07-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (241, 'CarlosSinatra', to_date('21-05-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (242, 'JacksonConnick', to_date('18-12-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (243, 'JeanneLemmon', to_date('28-06-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (244, 'BelindaDonovan', to_date('14-08-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (245, 'GoldieSteagall', to_date('12-12-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (246, 'SelmaMatarazzo', to_date('09-06-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (247, 'JoshCarrack', to_date('01-04-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (248, 'AzucarDiffie', to_date('13-09-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (249, 'PhilipBarrymore', to_date('30-12-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (250, 'AnneGiamatti', to_date('24-08-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (251, 'AniShand', to_date('27-03-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (252, 'RitaHayes', to_date('04-04-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (253, 'ElvisCurry', to_date('10-07-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (254, 'EmilyMarsden', to_date('09-12-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (255, 'RyanMaxwell', to_date('28-02-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (256, 'CornellVan Der Beek', to_date('29-12-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (257, 'MaeWeisz', to_date('16-09-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (258, 'BlairEstevez', to_date('10-10-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (259, 'TraceSpader', to_date('07-06-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (260, 'YaphetO''Neal', to_date('03-11-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (261, 'OlympiaWilson', to_date('01-08-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (262, 'PaulaHong', to_date('17-03-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (263, 'WhoopiLowe', to_date('31-12-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (264, 'FirstWhitford', to_date('25-02-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (265, 'AdinaO''Keefe', to_date('09-04-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (266, 'LynetteCollins', to_date('18-08-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (267, 'WallyMoss', to_date('13-01-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (268, 'JulietBuscemi', to_date('07-03-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (269, 'JesusPonce', to_date('31-10-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (270, 'SpikeFlemyng', to_date('16-06-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (271, 'TeenaFoxx', to_date('19-12-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (272, 'NicholasCash', to_date('04-07-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (273, 'BeverleyHamilton', to_date('09-07-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (274, 'EmmaBrooke', to_date('12-07-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (275, 'TedFranks', to_date('05-12-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (276, 'AliLarter', to_date('27-12-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (277, 'MindyGaynor', to_date('07-01-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (278, 'MichaelRundgren', to_date('06-06-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (279, 'LouNivola', to_date('20-08-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (280, 'AliChesnutt', to_date('19-05-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (281, 'DebiMorse', to_date('29-11-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (282, 'JaimeStiers', to_date('24-12-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (283, 'RobertCole', to_date('17-04-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (284, 'ElvisRuiz', to_date('22-08-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (285, 'AllanViterelli', to_date('18-06-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (286, 'MykeltiMcCracken', to_date('20-08-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (287, 'CarlosMartin', to_date('02-01-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (288, 'WalterHyde', to_date('13-09-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (289, 'ArturoCurry', to_date('04-07-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (290, 'BuddyGarr', to_date('03-07-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (291, 'JosephPurefoy', to_date('05-11-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (292, 'SamuelNuman', to_date('05-02-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (293, 'BurtonHouston', to_date('21-12-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (294, 'TyroneWood', to_date('06-04-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (295, 'AdamLeguizamo', to_date('25-06-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (296, 'ThinVincent', to_date('11-10-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (297, 'AhmadWheel', to_date('14-05-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (298, 'TeenaEsposito', to_date('21-02-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (299, 'WillHoly', to_date('26-01-2029', 'dd-mm-yyyy'));
commit;
prompt 200 records committed...
insert into OPERATOR (operatorid, name, expirationdate)
values (300, 'TerriCash', to_date('13-01-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (301, 'LeonardoWarburton', to_date('28-03-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (302, 'PowersRibisi', to_date('16-10-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (303, 'HalSandler', to_date('25-10-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (304, 'DennyArden', to_date('09-04-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (305, 'IkeHauer', to_date('03-06-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (306, 'NataschaUnion', to_date('01-09-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (307, 'DomingoHagar', to_date('12-05-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (308, 'RosannaDorn', to_date('26-02-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (309, 'MurrayClinton', to_date('24-08-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (310, 'AprilNeeson', to_date('15-04-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (311, 'HexHatosy', to_date('17-12-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (312, 'JulianneHedaya', to_date('29-04-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (313, 'CurtisAtlas', to_date('28-09-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (314, 'RupertTah', to_date('18-06-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (315, 'MartyMitra', to_date('01-02-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (316, 'GranRispoli', to_date('06-09-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (317, 'NedEnglish', to_date('17-07-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (318, 'AlbertinaHenstridge', to_date('19-05-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (319, 'MichaelWillard', to_date('17-11-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (320, 'JulietteColeman', to_date('13-12-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (321, 'ChubbyPleasure', to_date('08-04-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (322, 'RandySimpson', to_date('11-02-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (323, 'MiaMarie', to_date('22-08-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (324, 'YaphetWeaving', to_date('20-01-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (325, 'JulianneWhitmore', to_date('01-12-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (326, 'AdinaKeitel', to_date('12-12-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (327, 'MinnieGoodall', to_date('13-04-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (328, 'AzucarSpeaks', to_date('05-07-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (329, 'PeaboMarsden', to_date('24-12-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (330, 'RobMcGinley', to_date('24-08-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (331, 'ReneSaucedo', to_date('19-05-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (332, 'RhettKirkwood', to_date('15-10-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (333, 'WangAndrews', to_date('15-07-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (334, 'RandallBroderick', to_date('13-06-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (335, 'HoraceCherry', to_date('21-04-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (336, 'MirandaMarie', to_date('17-06-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (337, 'HarryTanon', to_date('26-06-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (338, 'DorryStrong', to_date('02-07-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (339, 'DebraCusack', to_date('13-07-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (340, 'CubaEnglish', to_date('16-07-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (341, 'WallySlater', to_date('07-07-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (342, 'AmandaCalle', to_date('28-12-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (343, 'SalmaShearer', to_date('16-02-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (344, 'SteveColtrane', to_date('05-04-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (345, 'JohnRush', to_date('23-01-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (346, 'TarynMantegna', to_date('02-03-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (347, 'RobertaHaslam', to_date('08-01-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (348, 'MorrisMcCann', to_date('09-05-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (349, 'MurrayShatner', to_date('28-04-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (350, 'FionaDriver', to_date('19-01-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (351, 'PenelopeAndrews', to_date('11-07-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (352, 'MarieMcGriff', to_date('09-06-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (353, 'SaulNelson', to_date('19-02-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (354, 'ReneLewis', to_date('29-06-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (355, 'TreatHagar', to_date('31-03-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (356, 'BoTomei', to_date('09-02-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (357, 'NedHeslov', to_date('22-03-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (358, 'BrianWinter', to_date('24-11-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (359, 'EmmylouChristie', to_date('08-05-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (360, 'CliffBrolin', to_date('25-11-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (361, 'StevieHoliday', to_date('07-03-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (362, 'DenisArkenstone', to_date('23-09-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (363, 'Mary BethPopper', to_date('14-10-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (364, 'SteveCumming', to_date('17-02-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (365, 'MadelineBarnett', to_date('25-02-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (366, 'JaimeWakeling', to_date('13-09-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (367, 'StevieJones', to_date('22-12-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (368, 'CliffParm', to_date('16-05-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (369, 'AngelaPride', to_date('01-02-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (370, 'FairuzaPerrineau', to_date('14-03-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (371, 'KevinShaye', to_date('19-01-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (372, 'DarrenZeta-Jones', to_date('30-12-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (373, 'ChakaWilder', to_date('18-01-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (374, 'KatrinWithers', to_date('29-04-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (375, 'BenicioCleary', to_date('24-08-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (376, 'CrispinLynskey', to_date('26-01-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (377, 'BalthazarRifkin', to_date('07-12-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (378, 'JesseBirch', to_date('13-09-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (379, 'BarryNeill', to_date('07-11-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (380, 'MykeltiMoffat', to_date('21-07-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (381, 'SuziRankin', to_date('06-08-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (382, 'AlessandroOrbit', to_date('24-10-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (383, 'GuyCampbell', to_date('16-10-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (384, 'EmmMaxwell', to_date('16-07-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (385, 'ReneeAmos', to_date('21-03-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (386, 'LisaMraz', to_date('05-08-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (387, 'OdedMoreno', to_date('12-12-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (388, 'BobLangella', to_date('28-01-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (389, 'LindaMifune', to_date('06-06-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (390, 'HugoHolm', to_date('18-07-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (391, 'EmmaPlatt', to_date('03-04-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (392, 'EttaVannelli', to_date('05-09-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (393, 'GwynethRundgren', to_date('07-07-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (394, 'GloriaLarter', to_date('16-07-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (395, 'ChuckBenson', to_date('24-06-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (396, 'RufusLithgow', to_date('02-09-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (397, 'ScarlettReid', to_date('30-09-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (398, 'MichelleCrouch', to_date('13-02-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (399, 'HazelWorrell', to_date('25-06-2024', 'dd-mm-yyyy'));
commit;
prompt 300 records committed...
insert into OPERATOR (operatorid, name, expirationdate)
values (400, 'WesPalmer', to_date('16-12-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (401, 'CrystalManning', to_date('02-08-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (402, 'SaffronMurray', to_date('21-12-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (403, 'NastassjaO''Neal', to_date('19-05-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (404, 'DickKahn', to_date('23-10-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (405, 'RhysDafoe', to_date('27-05-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (406, 'HalleReid', to_date('15-11-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (407, 'GatesElizondo', to_date('20-08-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (408, 'WesKingsley', to_date('29-10-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (409, 'FredaCheadle', to_date('25-11-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (410, 'JoelyMcPherson', to_date('27-03-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (411, 'KaronLavigne', to_date('13-09-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (412, 'MichaelHeron', to_date('05-02-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (413, 'PowersRock', to_date('22-05-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (414, 'BradleyHeche', to_date('17-02-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (415, 'BuffyUtada', to_date('20-08-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (416, 'KingGoldwyn', to_date('20-04-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (417, 'IsabellaO''Connor', to_date('16-08-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (418, 'ElizabethVan Shelton', to_date('23-05-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (419, 'DiamondDiehl', to_date('22-11-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (420, 'FionaGlover', to_date('11-03-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (421, 'WillLunch', to_date('21-10-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (422, 'AdrienHumphrey', to_date('13-02-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (423, 'DerrickLaw', to_date('01-03-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (424, 'AlannahLeto', to_date('01-10-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (425, 'HarryEstevez', to_date('10-01-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (426, 'LaraWitt', to_date('04-10-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (427, 'JodyParish', to_date('02-01-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (428, 'BelindaRush', to_date('09-12-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (429, 'MikeHirsch', to_date('18-03-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (430, 'StephenAlston', to_date('25-07-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (431, 'AndyDeVito', to_date('03-08-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (432, 'IkeDiBiasio', to_date('07-11-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (433, 'JavonThornton', to_date('30-04-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (434, 'MarinaJovovich', to_date('02-02-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (435, 'CoreyMorales', to_date('04-11-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (436, 'AlbertGray', to_date('03-09-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (437, 'LarenzFlanagan', to_date('18-06-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (438, 'JessicaPigott-Smith', to_date('03-01-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (439, 'AdinaRockwell', to_date('28-10-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (440, 'HumbertoSevenfold', to_date('04-10-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (441, 'RhysKaryo', to_date('28-12-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (442, 'CledusHall', to_date('24-06-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (443, 'LynetteBeals', to_date('15-01-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (444, 'NedMcNeice', to_date('24-09-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (445, 'DarrenDillon', to_date('17-12-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (446, 'TerenceLachey', to_date('10-10-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (447, 'DebraDrive', to_date('17-02-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (448, 'JeremyMars', to_date('07-06-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (449, 'TobeyDiCaprio', to_date('10-06-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (450, 'NightPeet', to_date('06-12-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (451, 'MikaMcKennitt', to_date('30-01-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (452, 'GoldieProwse', to_date('11-02-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (453, 'RoscoeDe Almeida', to_date('12-05-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (454, 'VingHutch', to_date('22-08-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (455, 'SethRed', to_date('14-11-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (456, 'KimberlyThewlis', to_date('06-03-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (457, 'HarrySledge', to_date('25-03-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (458, 'GoranIsaacs', to_date('15-08-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (459, 'TimothyHanley', to_date('10-04-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (460, 'SimonKilmer', to_date('21-05-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (461, 'JohnnieTheron', to_date('02-09-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (462, 'VondieSchreiber', to_date('15-03-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (463, 'MintSwayze', to_date('04-03-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (464, 'RuebenJones', to_date('08-05-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (465, 'BernieBerry', to_date('22-08-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (466, 'AshleyJessee', to_date('07-11-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (467, 'HarrisonBell', to_date('17-08-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (468, 'LeonardoBacon', to_date('17-09-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (469, 'AndrewBonham', to_date('08-11-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (470, 'KimberlyThomas', to_date('28-11-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (471, 'MatthewWard', to_date('20-07-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (472, 'ChristopherFrampton', to_date('10-04-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (473, 'GeraldineMacLachlan', to_date('18-09-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (474, 'AidanMewes', to_date('09-09-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (475, 'DiamondFishburne', to_date('15-09-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (476, 'PeteAtkins', to_date('12-02-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (477, 'NightBlack', to_date('23-10-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (478, 'FreddyDriver', to_date('20-10-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (479, 'LouiseClayton', to_date('15-06-2027', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (480, 'DaveyDiggs', to_date('28-04-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (481, 'GarlandDonovan', to_date('26-09-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (482, 'IsaiahPleasure', to_date('15-04-2025', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (483, 'AlanLiu', to_date('18-05-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (484, 'DanielLoring', to_date('05-12-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (485, 'WaymanRooker', to_date('01-11-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (486, 'FrankieMilsap', to_date('09-12-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (487, 'AimeeGambon', to_date('05-10-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (488, 'LucindaAniston', to_date('17-03-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (489, 'BradleyPressly', to_date('18-02-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (490, 'LionelSpears', to_date('28-11-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (491, 'IreneTippe', to_date('18-07-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (492, 'GeraldineDanger', to_date('20-05-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (493, 'DianeNewman', to_date('30-06-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (494, 'DelroyElwes', to_date('27-06-2030', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (495, 'PattiSerbedzija', to_date('19-03-2026', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (496, 'PamelaSantana', to_date('06-06-2029', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (497, 'DianeDavid', to_date('03-11-2024', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (498, 'FayeHolbrook', to_date('13-08-2028', 'dd-mm-yyyy'));
insert into OPERATOR (operatorid, name, expirationdate)
values (499, 'JonnyRippy', to_date('10-10-2024', 'dd-mm-yyyy'));
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
values (128, 221);
insert into OPERATION (itemid, operatorid)
values (128, 224);
commit;
prompt 400 records loaded
prompt Enabling foreign key constraints for ITEM...
alter table ITEM enable constraint SYS_C00707451;
alter table ITEM enable constraint SYS_C00707452;
prompt Enabling foreign key constraints for DONATION...
alter table DONATION enable constraint SYS_C00707469;
alter table DONATION enable constraint SYS_C00707470;
prompt Enabling foreign key constraints for MAINTENANCE...
alter table MAINTENANCE enable constraint SYS_C00707458;
prompt Enabling foreign key constraints for OPERATION...
alter table OPERATION enable constraint SYS_C00707462;
alter table OPERATION enable constraint SYS_C00707463;
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
