--Wk6 Project DROP/CREATE Include Insert statements

--DROP STATEMENTS

DROP TABLE PROGRAMCHANNEL CASCADE CONSTRAINTS PURGE; 
DROP TABLE CUSTOMERPACKAGE CASCADE CONSTRAINTS PURGE; 
DROP TABLE CHANNELPACKAGE CASCADE CONSTRAINTS PURGE; 
DROP TABLE BILLING CASCADE CONSTRAINTS PURGE; 
DROP TABLE PROGRAM CASCADE CONSTRAINTS PURGE;
DROP TABLE SURVEY CASCADE CONSTRAINTS PURGE; 
DROP TABLE CUSTOMER CASCADE CONSTRAINTS PURGE;
DROP TABLE CHANNEL CASCADE CONSTRAINTS PURGE;
DROP TABLE AUDIENCERATE CASCADE CONSTRAINTS PURGE;
DROP TABLE SUPPLIER CASCADE CONSTRAINTS PURGE;
DROP TABLE EMPLOYEE CASCADE CONSTRAINTS PURGE;
DROP TABLE PROGRAMPACKAGE CASCADE CONSTRAINTS PURGE;
DROP TABLE CHANNELTYPE CASCADE CONSTRAINTS PURGE;

--CREATE STATEMENTS

--CHANNELTYPE *BD Inserts
Create table CHANNELTYPE
(ChanTypeId 		NUMBER(1) CONSTRAINT CHANNELTYPE_ChanTypeId_PK PRIMARY KEY,
 ChanTypeName 		VARCHAR2(11) CHECK(ChanTypeName IN ('Movie','News','Lifestyle','Sports','Documentary')));

INSERT INTO CHANNELTYPE (ChanTypeId,ChanTypeName) VALUES (1,'Movie');
INSERT INTO CHANNELTYPE (ChanTypeId,ChanTypeName) VALUES (2,'News');
INSERT INTO CHANNELTYPE (ChanTypeId,ChanTypeName) VALUES (3,'Lifestyle');
INSERT INTO CHANNELTYPE (ChanTypeId,ChanTypeName) VALUES (4,'Sports');
INSERT INTO CHANNELTYPE (ChanTypeId,ChanTypeName) VALUES (5,'Documentary');

--PROGRAMPACKAGE *BD Inserts
Create table PROGRAMPACKAGE
(PckgId		NUMBER(1)	CONSTRAINT PROGRAMPACKGE_PckgId_PK PRIMARY KEY,
PckgName	VARCHAR2(13)	NOT NULL,
PckgCost	NUMBER(10,2)	DEFAULT '30.00' NOT NULL);

INSERT INTO PROGRAMPACKAGE (PckgID,PckgName,PckgCost) VALUES (1,'Movies Galore',30.00);
INSERT INTO PROGRAMPACKAGE (PckgID,PckgName,PckgCost) VALUES (2,'News Globe',30.00);
INSERT INTO PROGRAMPACKAGE (PckgID,PckgName,PckgCost) VALUES (3,'Total Watcher',40.00);
INSERT INTO PROGRAMPACKAGE (PckgID,PckgName,PckgCost) VALUES (4,'Couch Potato',50.00);

Create table EMPLOYEE
(EmpID		NUMBER(10)	CONSTRAINT EMPLOYEE_EmpID_PK PRIMARY KEY,
FirstName	VARCHAR2(25),
LastName	VARCHAR2(25));

INSERT INTO EMPLOYEE (EmpID,FirstName,LastName) VALUES (234, 'Benita', 'Dutton');
INSERT INTO EMPLOYEE (EmpID,FirstName,LastName) VALUES (315, 'Cameron', 'McCrary');
INSERT INTO EMPLOYEE (EmpID,FirstName,LastName) VALUES (467, 'Julian', 'Barber');
INSERT INTO EMPLOYEE (EmpID,FirstName,LastName) VALUES (278, 'Jordan', 'Allen');
INSERT INTO EMPLOYEE (EmpID,FirstName,LastName) VALUES (693, 'Ricky', 'Gorman');

--SUPPLIER *CM Inserts
Create table SUPPLIER
(SupplierID	NUMBER(2)	CONSTRAINT SUPPLIER_SupplierID_PK PRIMARY KEY NOT NULL,
SuppName	VARCHAR2(15)	NOT NULL,
SupAddress	VARCHAR2(25)	NOT NULL,
SupCity		VARCHAR2(25)	NOT NULL,
SupState	VARCHAR2(2)	DEFAULT 'CA',
SupZip		NUMBER(9),
SupContact	VARCHAR2(25)	NOT NULL,
SupPhone	NUMBER(10));

INSERT INTO SUPPLIER (SupplierID,SuppName,SupAddress,SupCity,SupState,SupZip,SupContact,SupPhone) VALUES (3, 'NBC', '10880 Wilshire Blvd #1200', 'Los Angeles', 'CA', '90210', 'Jeff King', '3103695231');
INSERT INTO SUPPLIER (SupplierID,SuppName,SupAddress,SupCity,SupState,SupZip,SupContact,SupPhone) VALUES (12, 'ABC', '2345 Melrose Place', 'Los Angeles', 'CA', '92343', 'Jack Caverisi', '3108409966');
INSERT INTO SUPPLIER (SupplierID,SuppName,SupAddress,SupCity,SupState,SupZip,SupContact,SupPhone) VALUES (7, 'FOX', '10960 Wilshire Blvd', 'Los Angeles', 'CA', '93289', 'Janis Carmikel', '3102355233');
INSERT INTO SUPPLIER (SupplierID,SuppName,SupAddress,SupCity,SupState,SupZip,SupContact,SupPhone) VALUES (36, 'WARNER', '3701 W Oak St', 'Burbank', 'CA', '94354', 'Simon Phillips', '3105326588');

--AUDIENCERATE *CM Inserts
Create table AUDIENCERATE
(RatingId	NUMBER(1) 	CONSTRAINT AUDIENCERATE_RatingId PRIMARY KEY NOT NULL,
 RatingCode	VARCHAR2(2) 	CHECK(RatingCode IN ('G','PG','M','MA','R')),
 RatingDesc	VARCHAR2(50) 	NOT NULL);

INSERT INTO AUDIENCERATE (RatingId,RatingCode,RatingDesc) VALUES (1, 'G', 'Recommended for all ages');
INSERT INTO AUDIENCERATE (RatingId,RatingCode,RatingDesc) VALUES (2, 'PG', 'Some parental guideance suggested');
INSERT INTO AUDIENCERATE (RatingId,RatingCode,RatingDesc) VALUES (3, 'M', 'Mature Audience 15+');
INSERT INTO AUDIENCERATE (RatingId,RatingCode,RatingDesc) VALUES (4, 'MA', 'Mature Audiences Only');
INSERT INTO AUDIENCERATE (RatingId,RatingCode,RatingDesc) VALUES (5, 'R', 'Restricted - Adults Only');

--CHANNEL * JB Inserts
Create table CHANNEL
(ChanId             NUMBER(4)     CONSTRAINT    channel_chanId_PK     PRIMARY KEY    NOT NULL,
ChanNum            NUMBER(4),
ChanTypeId         NUMBER(1)     NOT NULL);

ALTER TABLE CHANNEL
ADD CONSTRAINT    CHAN_CHANTYPE_ChanTypeId_fk    FOREIGN KEY (ChanTyepId) REFERENCES CHANNELTYPE

INSERT INTO CHANNEL (ChanID, ChanNum, ChanTypeId) VALUES (1,1,1);
INSERT INTO CHANNEL (ChanID, ChanNum, ChanTypeId) VALUES (2,2,1);
INSERT INTO CHANNEL (ChanID, ChanNum, ChanTypeId) VALUES (3,3,2);
INSERT INTO CHANNEL (ChanID, ChanNum, ChanTypeId) VALUES (4,4,2);
INSERT INTO CHANNEL (ChanID, ChanNum, ChanTypeId) VALUES (5,5,3);
INSERT INTO CHANNEL (ChanID, ChanNum, ChanTypeId) VALUES (6,6,3);
INSERT INTO CHANNEL (ChanID, ChanNum, ChanTypeId) VALUES (7,7,4);
INSERT INTO CHANNEL (ChanID, ChanNum, ChanTypeId) VALUES (8,8,4);
INSERT INTO CHANNEL (ChanID, ChanNum, ChanTypeId) VALUES (9,9,5);
INSERT INTO CHANNEL (ChanID, ChanNum, ChanTypeId) VALUES (10,10,5);

--CUSTOMER *JB Inserts
Create table CUSTOMER
(CustID             NUMBER(5)     CONSTRAINT    CUSTOMER_CustId_PK    PRIMARY KEY    NOT NULL,
CustFName          VARCHAR2(25),
CustLName          VARCHAR2(25),
CustStreetAddress  VARCHAR2(50),
CustCity           VARCHAR2(25),
CustState          VARCHAR2(2),
CustZip            NUMBER(5),
CustEmail          VARCHAR2(25),
CustSignUpDt       DATE          NOT NULL,
EmpId              NUMBER(10)     NOT NULL,
BillingCycle       NUMBER(2)     NOT NULL,
Status             VARCHAR2(9)   NOT NULL,
StatusDt           DATE,
StatusReason       VARCHAR2(15));

ALTER TABLE CUSTOMER
ADD CONSTRAINT    CUST_EMP_Empid_FK   FOREIGN KEY (EmpId) REFERENCES    EMPLOYEE;

INSERT INTO Customer (CustID, CustFName, CustLName, CustStreetAddress, CustCity, CustState, CustZip, CustEmail, CustSignUpDt, EmpID, BillingCycle, Status, StatusDt, StatusReason)VALUES (1123, 'Julian',  'Barber', '3 New York Drive', 'Austin',   'TX', 32812, 'barber.julian@yahoo.com',   '04-OCT-13', 467, 1, 'ACTIVE', NULL, NULL);
INSERT INTO Customer (CustID, CustFName, CustLName, CustStreetAddress, CustCity, CustState, CustZip, CustEmail, CustSignUpDt, EmpID, BillingCycle, Status, StatusDt, StatusReason)VALUES (1223, 'Benita',  'Dutton', '7 Conneticut Ave', 'Dallas',   'TX', 32815, 'dutton.benita@yahoo.com',   '15-SEP-13', 234, 15, 'ACTIVE', NULL, NULL);
INSERT INTO Customer (CustID, CustFName, CustLName, CustStreetAddress, CustCity, CustState, CustZip, CustEmail, CustSignUpDt, EmpID, BillingCycle, Status, StatusDt, StatusReason)VALUES (1333, 'Cameron', 'McCrary','12 Richmond Drive', 'Dallas',   'TX', 32815, 'mccrary.cameron@yahoo.com','03-SEP-13', 315, 1, 'ACTIVE', NULL, NULL);
INSERT INTO Customer (CustID, CustFName, CustLName, CustStreetAddress, CustCity, CustState, CustZip, CustEmail, CustSignUpDt, EmpID, BillingCycle, Status, StatusDt, StatusReason)VALUES (1344, 'Jordan',  'Allen',  '3245 Dante Blvd',  'Austin',   'TX', 32812, 'allen.jordan@yahoo.com',    '30-SEP-13', 278, 1,  'ACTIVE', NULL, NULL);
INSERT INTO Customer (CustID, CustFName, CustLName, CustStreetAddress, CustCity, CustState, CustZip, CustEmail, CustSignUpDt, EmpID, BillingCycle, Status, StatusDt, StatusReason)VALUES (1444, 'Ricky',   'Gorman', '244 New Jersey',   'Ft Worth', 'TX', 32641, 'gorman.ricky@yahoo.com',    '01-OCT-13', 693, 1,  'ACTIVE', NULL, NULL);
INSERT INTO Customer (CustID, CustFName, CustLName, CustStreetAddress, CustCity, CustState, CustZip, CustEmail, CustSignUpDt, EmpID, BillingCycle, Status, StatusDt, StatusReason)VALUES (1111, 'David',    'Guerrero',  '8 Macarthur',         'Austin',     'TX', 32810, 'david.guerrero@yahoo.com',   '12-AUG-13', 467, 1,  'ACTIVE', NULL, NULL);
INSERT INTO Customer (CustID, CustFName, CustLName, CustStreetAddress, CustCity, CustState, CustZip, CustEmail, CustSignUpDt, EmpID, BillingCycle, Status, StatusDt, StatusReason)VALUES (2222, 'Jared',    'Holley',    '1523 Botanical',      'Dallas',     'TX', 32819, 'holley.jared@yahoo.com',     '15-APR-13', 315, 15, 'ACTIVE', NULL, NULL);
INSERT INTO Customer (CustID, CustFName, CustLName, CustStreetAddress, CustCity, CustState, CustZip, CustEmail, CustSignUpDt, EmpID, BillingCycle, Status, StatusDt, StatusReason)VALUES (3333, 'Joe',      'Hehir',     '324 Freemont Dr.',    'Austin',     'TX', 32813, 'hehir.joe@gmail.com',        '03-SEP-12', 278, 1,  'ACTIVE', NULL, NULL);
INSERT INTO Customer (CustID, CustFName, CustLName, CustStreetAddress, CustCity, CustState, CustZip, CustEmail, CustSignUpDt, EmpID, BillingCycle, Status, StatusDt, StatusReason)VALUES (4444, 'Omid',     'Javin',     '144 Culver Dr.',      'Irving',     'TX', 32143, 'javid.omid@hotmail.com',     '09-MAY-11', 693, 1,  'ACTIVE', NULL, NULL);
INSERT INTO Customer (CustID, CustFName, CustLName, CustStreetAddress, CustCity, CustState, CustZip, CustEmail, CustSignUpDt, EmpID, BillingCycle, Status, StatusDt, StatusReason)VALUES (1234, 'William',  'Jordan',    '1524 Denver Ave',     'Irving',     'TX', 32146, 'william.jordan@yahoo.com',   '24-FEB-13', 467, 1,  'ACTIVE', NULL, NULL);
INSERT INTO Customer (CustID, CustFName, CustLName, CustStreetAddress, CustCity, CustState, CustZip, CustEmail, CustSignUpDt, EmpID, BillingCycle, Status, StatusDt, StatusReason)VALUES (4567, 'Jennifer', 'Kelley',    '293 Jeffery Dr.',     'Dallas',     'TX', 32719, 'kelley.jennifer@yahoo.com',  '21-APR-13', 315, 15, 'ACTIVE', NULL, NULL);
INSERT INTO Customer (CustID, CustFName, CustLName, CustStreetAddress, CustCity, CustState, CustZip, CustEmail, CustSignUpDt, EmpID, BillingCycle, Status, StatusDt, StatusReason)VALUES (8910, 'Alfred',   'Loo',       '423 Downey',          'Amarillo',   'TX', 32310, 'loo.alfred@yahoo.com',       '12-AUG-13', 467, 1,  'ACTIVE', NULL, NULL);
INSERT INTO Customer (CustID, CustFName, CustLName, CustStreetAddress, CustCity, CustState, CustZip, CustEmail, CustSignUpDt, EmpID, BillingCycle, Status, StatusDt, StatusReason)VALUES (1112, 'Keith',    'Kouldis',   '15 Ayres',            'Beeville',   'TX', 32619, 'kouldis.keith@hotmail.com',  '25-APR-13', 315, 15, 'ACTIVE', NULL, NULL);
INSERT INTO Customer (CustID, CustFName, CustLName, CustStreetAddress, CustCity, CustState, CustZip, CustEmail, CustSignUpDt, EmpID, BillingCycle, Status, StatusDt, StatusReason)VALUES (1314, 'Donald',   'Macintosh', '567 Sassafrass',      'Bedford',    'TX', 32010, 'macintosh.don@yahoo.com', '12-MAY-13', 467, 1,  'ACTIVE', NULL, NULL);
INSERT INTO Customer (CustID, CustFName, CustLName, CustStreetAddress, CustCity, CustState, CustZip, CustEmail, CustSignUpDt, EmpID, BillingCycle, Status, StatusDt, StatusReason)VALUES (1516, 'Richard',  'Mitchell',  '932 Nebraska',        'Blue Ridge', 'TX', 32319, 'mitchell.rich@gmail.com', '25-APR-13', 315, 15, 'ACTIVE', NULL, NULL);
INSERT INTO Customer (CustID, CustFName, CustLName, CustStreetAddress, CustCity, CustState, CustZip, CustEmail, CustSignUpDt, EmpID, BillingCycle, Status, StatusDt, StatusReason)VALUES (2000, 'Lionell',  'Monsanto',  '1562 Botanical',      'Belmount',   'TX', 32210, 'monsanto.leo@gmail.com', '12-JUL-13', 467, 1,  'ACTIVE', NULL, NULL);
INSERT INTO Customer (CustID, CustFName, CustLName, CustStreetAddress, CustCity, CustState, CustZip, CustEmail, CustSignUpDt, EmpID, BillingCycle, Status, StatusDt, StatusReason)VALUES (2010, 'Matthew',  'Pascoll',   '64 Oak Creek',        'Baytown',    'TX', 32119, 'pascoll.matt@aol.com',    '05-NOV-13', 315, 15, 'ACTIVE', NULL, NULL);
INSERT INTO Customer (CustID, CustFName, CustLName, CustStreetAddress, CustCity, CustState, CustZip, CustEmail, CustSignUpDt, EmpID, BillingCycle, Status, StatusDt, StatusReason)VALUES (2020, 'James',    'Quinn',     '53 Warner Dr.',       'Blue Ridge', 'TX', 32319, 'quinn.james@gmail.com',      '07-AUG-12', 315, 15, 'ACTIVE', NULL, NULL);
INSERT INTO Customer (CustID, CustFName, CustLName, CustStreetAddress, CustCity, CustState, CustZip, CustEmail, CustSignUpDt, EmpID, BillingCycle, Status, StatusDt, StatusReason)VALUES (3001, 'William',  'Wisley',    '192 Cross Creek',     'Belmount',   'TX', 32210, 'wisley.william@gmail.com',   '16-JAN-13', 467, 1,  'ACTIVE', NULL, NULL);
INSERT INTO Customer (CustID, CustFName, CustLName, CustStreetAddress, CustCity, CustState, CustZip, CustEmail, CustSignUpDt, EmpID, BillingCycle, Status, StatusDt, StatusReason)VALUES (3003, 'Matthew',  'Portluck',  '64 Fairview',         'Baytown',    'TX', 32119, 'portluck.matthew@aol.com',   '18-FEB-10', 315, 15, 'ACTIVE', NULL, NULL);
INSERT INTO Customer (CustID, CustFName, CustLName, CustStreetAddress, CustCity, CustState, CustZip, CustEmail, CustSignUpDt, EmpID, BillingCycle, Status, StatusDt, StatusReason)VALUES (4999, 'Lorne',    'Snyder',    '872 East Yale',       'Bedford',    'TX', 32010, 'snyder.lorne@yahoo.com',     '30-JAN-13', 315, 15, 'ACTIVE', NULL, NULL);
INSERT INTO Customer (CustID, CustFName, CustLName, CustStreetAddress, CustCity, CustState, CustZip, CustEmail, CustSignUpDt, EmpID, BillingCycle, Status, StatusDt, StatusReason)VALUES (6253, 'Joshua',   'Thompson',  '432 Yale ',           'Dallas',     'TX', 32819, 'thompson.joshua@gmail.com',  '30-JUN-13', 467, 1,  'ACTIVE', NULL, NULL);
INSERT INTO Customer (CustID, CustFName, CustLName, CustStreetAddress, CustCity, CustState, CustZip, CustEmail, CustSignUpDt, EmpID, BillingCycle, Status, StatusDt, StatusReason)VALUES (7793, 'Jordan',   'Townes',    '2420 Riverfront Ave', 'Irving',     'TX', 32145, 'townes.jordan@aol.com',      '11-DEC-09', 315, 15, 'ACTIVE', NULL, NULL);
INSERT INTO Customer (CustID, CustFName, CustLName, CustStreetAddress, CustCity, CustState, CustZip, CustEmail, CustSignUpDt, EmpID, BillingCycle, Status, StatusDt, StatusReason)VALUES (8759, 'Timthoy',  'Tuttle',    '5 Kingston Dr',       'Blue Ridge', 'TX', 32319, 'tuttle.timothy@yahoo.com',   '03-JUL-13', 315, 15, 'ACTIVE', NULL, NULL);
INSERT INTO Customer (CustID, CustFName, CustLName, CustStreetAddress, CustCity, CustState, CustZip, CustEmail, CustSignUpDt, EmpID, BillingCycle, Status, StatusDt, StatusReason)VALUES (0010, 'Kirk',     'Warner',    '32 Fairfax',          'Austin',     'TX', 32812, 'warner.kirk@gmail.com',      '12-APR-08', 467, 1,  'ACTIVE', NULL, NULL);
--SURVEY *JB Inserts
Create table SURVEY
(SurveyId	NUMBER(3)	CONSTRAINT SURVEY_SurveyId_PK PRIMARY KEY 	NOT NULL,
SurveyName	VARCHAR2(25),
SurveyDt	DATE	NOT NULL,
CustId		NUMBER(5)	CONSTRAINT SURVEY_CUST_FK REFERENCES CUSTOMER(CustId) NOT NULL,
ChanId		NUMBER(4)	CONSTRAINT SURVEY_CHAN_ChanId_FK REFERENCES CHANNEL(ChanID));


INSERT INTO SURVEY (SurveyId, SurveyName, SurveyDt, CustID, ChanID)VALUES (1,   'Channel Line-up',     '12-DEC-13', 1123, 2);
INSERT INTO SURVEY (SurveyId, SurveyName, SurveyDt, CustID, ChanID)VALUES (112, 'Customer Service',    '2-APR-14',  1223, 3);
INSERT INTO SURVEY (SurveyId, SurveyName, SurveyDt, CustID, ChanID)VALUES (10,  'Products',            '23-OCT-13', 1333, 10);
INSERT INTO SURVEY (SurveyId, SurveyName, SurveyDt, CustID, ChanID)VALUES (13,  'Billing',             '4-FEB-14',  1344, 7);
INSERT INTO SURVEY (SurveyId, SurveyName, SurveyDt, CustID, ChanID)VALUES (2,   'New Customer',        '9-DEC-13',  1444, 1);
INSERT INTO SURVEY (SurveyId, SurveyName, SurveyDt, CustID, ChanID)VALUES (3,   'New Customer',        '09-OCT-12', 2010, 10);
INSERT INTO SURVEY (SurveyId, SurveyName, SurveyDt, CustID, ChanID)VALUES (4,   'Products',            '09-MAY-12', 2020, 4);
INSERT INTO SURVEY (SurveyId, SurveyName, SurveyDt, CustID, ChanID)VALUES (5,   'Customer Service',    '15-JUL-12', 3001, 1);
INSERT INTO SURVEY (SurveyId, SurveyName, SurveyDt, CustID, ChanID)VALUES (11,  'Channel Line-up',     '20-FEB-10', 3003, 8);
INSERT INTO SURVEY (SurveyId, SurveyName, SurveyDt, CustID, ChanID)VALUES (12,  'Billing',             '09-AUG-12', 4999, 4);
INSERT INTO SURVEY (SurveyId, SurveyName, SurveyDt, CustID, ChanID)VALUES (20,  'Service Upgrade',     '01-MAY-13', 1111, 3);
INSERT INTO SURVEY (SurveyId, SurveyName, SurveyDt, CustID, ChanID)VALUES (25,  'Need Wireless',       '31-MAY-13', 2222, 2);
INSERT INTO SURVEY (SurveyId, SurveyName, SurveyDt, CustID, ChanID)VALUES (6,   'Documentary Line-up', '10-JUL-12', 3333, 6);
INSERT INTO SURVEY (SurveyId, SurveyName, SurveyDt, CustID, ChanID)VALUES (7,   'Would Like to See',   '10-FEB-11', 4444, 5);
INSERT INTO SURVEY (SurveyId, SurveyName, SurveyDt, CustID, ChanID)VALUES (8,   'Need Wireless',       '10-FEB-13', 1234, 4);
INSERT INTO SURVEY (SurveyId, SurveyName, SurveyDt, CustID, ChanID)VALUES (9,   'Channel Line-up',     '11-AUG-12', 4567, 7);
INSERT INTO SURVEY (SurveyId, SurveyName, SurveyDt, CustID, ChanID)VALUES (15,  'Billing',             '28-SEP-12', 8910, 9);
INSERT INTO SURVEY (SurveyId, SurveyName, SurveyDt, CustID, ChanID)VALUES (14,  'Documentary Line-up', '10-JUL-12', 1314, 9);
INSERT INTO SURVEY (SurveyId, SurveyName, SurveyDt, CustID, ChanID)VALUES (16,  'Channel Line-up',     '15-APR-13', 1516, 10);
INSERT INTO SURVEY (SurveyId, SurveyName, SurveyDt, CustID, ChanID)VALUES (111, 'Documentary Line-up', '23-JUL-13', 2000, 10);
INSERT INTO SURVEY (SurveyId, SurveyName, SurveyDt, CustID, ChanID)VALUES (113, 'Billing',             '01-JUN-12', 6253, 8);
INSERT INTO SURVEY (SurveyId, SurveyName, SurveyDt, CustID, ChanID)VALUES (132, 'Service Upgrade',     '07-JUL-11', 7793, 8);
INSERT INTO SURVEY (SurveyId, SurveyName, SurveyDt, CustID, ChanID)VALUES (290, 'Channel Line-up',     '15-DEC-12', 8759, 7);
INSERT INTO SURVEY (SurveyId, SurveyName, SurveyDt, CustID, ChanID)VALUES (291, 'Service Upgrade',     '10-JUL-09', 0010, 1);


--PROGRAM
Create table PROGRAM
(ProgId		NUMBER(4)	CONSTRAINT PROGRAM_Progid_pk PRIMARY KEY 	NOT NULL,
ProgName	VARCHAR2(50),
ProgShortDesc	VARCHAR2(100),
ProgLength	NUMBER(3)	NOT NULL,
ChanTypeId	NUMBER(1)	CONSTRAINT PROGRAM_CHAN_ChanTypeId_FK REFERENCES CHANNELTYPE(ChanTypeId) NOT NULL,
RatingId	NUMBER(1)	CONSTRAINT PROGRAM_AUDRATE_RatingId_FK  REFERENCES AUDIENCERATE(RatingId) NOT NULL,
SupplierId	NUMBER(2)	CONSTRAINT PROGRAM_SUP_SupplierId_FK  REFERENCES SUPPLIER(SupplierId) NOT NULL);

INSERT INTO PROGRAM (ProgId, ProgName, ProgShortDesc, ProgLength, ChanTypeId, RatingId, SupplierId) VALUES (1,'Sale of the Year','Game Show Lifestyle',24,3,1,3);
INSERT INTO PROGRAM (ProgId, ProgName, ProgShortDesc, ProgLength, ChanTypeId, RatingId, SupplierId) VALUES (2,'Opera of the Nile','Luciano Pavorotti sings opera on the Nile',240,5,1,3);
INSERT INTO PROGRAM (ProgId, ProgName, ProgShortDesc, ProgLength, ChanTypeId, RatingId, SupplierId) VALUES (3,'Fky Killers are Back','Flies attack the city once again; the Bygone Brigade are back',175,1,4,3);
INSERT INTO PROGRAM (ProgId, ProgName, ProgShortDesc, ProgLength, ChanTypeId, RatingId, SupplierId) VALUES (4,'NBC Tonight','News from around the world',360,2,2,3);
INSERT INTO PROGRAM (ProgId, ProgName, ProgShortDesc, ProgLength, ChanTypeId, RatingId, SupplierId) VALUES (5,'The Shopping Show','The sites to see when you shoppe online',120,3,1,3);
INSERT INTO PROGRAM (ProgId, ProgName, ProgShortDesc, ProgLength, ChanTypeId, RatingId, SupplierId) VALUES (6,'Angle Fire','Angel is back on the street',120,1,5,3);
INSERT INTO PROGRAM (ProgId, ProgName, ProgShortDesc, ProgLength, ChanTypeId, RatingId, SupplierId) VALUES (7,'Lawn Bowl Championships','Live from Canberra',400,4,1,3);
INSERT INTO PROGRAM (ProgId, ProgName, ProgShortDesc, ProgLength, ChanTypeId, RatingId, SupplierId) VALUES (8,'Mud Wrestling','The mud pits come alive for the muddy challenge',120,4,3,3);
INSERT INTO PROGRAM (ProgId, ProgName, ProgShortDesc, ProgLength, ChanTypeId, RatingId, SupplierId) VALUES (9,'Starry Wars the Trilogy', 'Science Fiction epic about the generation of a brave new world',150,1,4,12);
INSERT INTO PROGRAM (ProgId, ProgName, ProgShortDesc, ProgLength, ChanTypeId, RatingId, SupplierId) VALUES (10,'Fantasia','Disney Favorites',30,3,1,12);
INSERT INTO PROGRAM (ProgId, ProgName, ProgShortDesc, ProgLength, ChanTypeId, RatingId, SupplierId) VALUES (11,'Dancing with the Moon','Reality Dance Show',60,3,1,12);
INSERT INTO PROGRAM (ProgId, ProgName, ProgShortDesc, ProgLength, ChanTypeId, RatingId, SupplierId) VALUES (12,'FOX Commentary', 'Latest News Reports',60,2,2,7);
INSERT INTO PROGRAM (ProgId, ProgName, ProgShortDesc, ProgLength, ChanTypeId, RatingId, SupplierId) VALUES (13,'EAGLES Nest', 'EAGLES Sports Updates', 120,4,1,7);
INSERT INTO PROGRAM (ProgId, ProgName, ProgShortDesc, ProgLength, ChanTypeId, RatingId, SupplierId) VALUES (14,'The Great White Whale','White Whale Migration',180,5,1,7);
INSERT INTO PROGRAM (ProgId, ProgName, ProgShortDesc, ProgLength, ChanTypeId, RatingId, SupplierId) VALUES (15,'Breaking Loose','Mystery of the Suburbs',60,3,2,36);
INSERT INTO PROGRAM (ProgId, ProgName, ProgShortDesc, ProgLength, ChanTypeId, RatingId, SupplierId) VALUES (16,'Broke Lottery Winners','Lottery winners explai,n how they loose their fortunes',90,5,3,36);
INSERT INTO PROGRAM (ProgId, ProgName, ProgShortDesc, ProgLength, ChanTypeId, RatingId, SupplierId) VALUES (17,'NFBAL','National Fooseball Amatuer League',240,4,2,36);

--BILLING
Create table BILLING
(BillingId	NUMBER(2)	CONSTRAINT BILLING_BillingId_PK  PRIMARY KEY	NOT NULL,
BillingDueDt	DATE	NOT NULL,
CustID		NUMBER(5)	CONSTRAINT BILLING_CUST_FK REFERENCES CUSTOMER(CustId) NOT NULL,
BillingDt	DATE	NOT NULL,
DueAmt		NUMBER(10,2),
PaidDt		DATE,
PaidAmt		NUMBER(10,2));

INSERT INTO BILLING (BillingId, BillingDueDt, CustID, BillingDt, DueAmt, PaidDt, PaidAmt) VALUES (1, '28-OCT-13', 1123, '01-OCT-13', 50.00, NULL,        NULL);
INSERT INTO BILLING (BillingId, BillingDueDt, CustID, BillingDt, DueAmt, PaidDt, PaidAmt) VALUES (2, '09-OCT-13', 1223, '15-SEP-13', 50.00, '01-SEP-13', 50.00);
INSERT INTO BILLING (BillingId, BillingDueDt, CustID, BillingDt, DueAmt, PaidDt, PaidAmt) VALUES (3, '27-SEP-13', 1333, '03-SEP-13', 40.00, '01-OCT-13', 40.00);
INSERT INTO BILLING (BillingId, BillingDueDt, CustID, BillingDt, DueAmt, PaidDt, PaidAmt) VALUES (4, '23-OCT-13', 1344, '30-SEP-13', 30.00, '29-SEP-13', 50.00);
INSERT INTO BILLING (BillingId, BillingDueDt, CustID, BillingDt, DueAmt, PaidDt, PaidAmt) VALUES (5, '01-SEP-13', 1444, '07-AUG-13', 30.00, NULL,        NULL);
INSERT INTO BILLING (BillingId, BillingDueDt, CustID, BillingDt, DueAmt, PaidDt, PaidAmt) VALUES (6, '27-SEP-13', 1111, '01-SEP-13', 50.00, NULL,        NULL);
INSERT INTO BILLING (BillingId, BillingDueDt, CustID, BillingDt, DueAmt, PaidDt, PaidAmt) VALUES (7, '07-OCT-13', 2222, '15-SEP-13', 40.00, NULL,        NULL);
INSERT INTO BILLING (BillingId, BillingDueDt, CustID, BillingDt, DueAmt, PaidDt, PaidAmt) VALUES (8, '29-SEP-13', 3333, '01-SEP-13', 40.00, NULL,        NULL);
INSERT INTO BILLING (BillingId, BillingDueDt, CustID, BillingDt, DueAmt, PaidDt, PaidAmt) VALUES (9, '25-AUG-13', 4444, '01-AUG-13', 30.00, NULL,        NULL);
INSERT INTO BILLING (BillingId, BillingDueDt, CustID, BillingDt, DueAmt, PaidDt, PaidAmt) VALUES (10, '05-APR-13', 1234, '15-MAR-13', 30.00, '15-APR-13', 100.00);
INSERT INTO BILLING (BillingId, BillingDueDt, CustID, BillingDt, DueAmt, PaidDt, PaidAmt) VALUES (11, '06-MAY-13', 4567, '15-SEP-13', 50.00, NULL,        NULL);
INSERT INTO BILLING (BillingId, BillingDueDt, CustID, BillingDt, DueAmt, PaidDt, PaidAmt) VALUES (12, '06-OCT-13', 8910, '01-OCT-13', 50.00, '02-OCT-13', 25.00);
INSERT INTO BILLING (BillingId, BillingDueDt, CustID, BillingDt, DueAmt, PaidDt, PaidAmt) VALUES (13, '07-OCT-13', 1314, '15-SEP-13', 40.00, NULL,        NULL);
INSERT INTO BILLING (BillingId, BillingDueDt, CustID, BillingDt, DueAmt, PaidDt, PaidAmt) VALUES (14, '19-SEP-13', 1516, '15-SEP-13', 30.00, NULL,        NULL);
INSERT INTO BILLING (BillingId, BillingDueDt, CustID, BillingDt, DueAmt, PaidDt, PaidAmt) VALUES (15, '05-SEP-13', 2000, '01-SEP-13', 50.00, NULL,        NULL);
INSERT INTO BILLING (BillingId, BillingDueDt, CustID, BillingDt, DueAmt, PaidDt, PaidAmt) VALUES (16, '28-SEP-13', 2010, '01-SEP-13', 50.00, '30-SEP-13', 50.00);
INSERT INTO BILLING (BillingId, BillingDueDt, CustID, BillingDt, DueAmt, PaidDt, PaidAmt) VALUES (17, '31-OCT-13', 2020, '01-OCT-13', 50.00, NULL,        NULL);
INSERT INTO BILLING (BillingId, BillingDueDt, CustID, BillingDt, DueAmt, PaidDt, PaidAmt) VALUES (18, '09-SEP-13', 3001, '01-SEP-13', 40.00, NULL,        NULL);
INSERT INTO BILLING (BillingId, BillingDueDt, CustID, BillingDt, DueAmt, PaidDt, PaidAmt) VALUES (19, '14-AUG-13', 3003, '15-SEP-13', 30.00, NULL,        NULL);
INSERT INTO BILLING (BillingId, BillingDueDt, CustID, BillingDt, DueAmt, PaidDt, PaidAmt) VALUES (20, '24-SEP-13', 4999, '01-SEP-13', 30.00, '21-SEP-13', 30.00);
INSERT INTO BILLING (BillingId, BillingDueDt, CustID, BillingDt, DueAmt, PaidDt, PaidAmt) VALUES (21, '05-OCT-13', 6253, '01-SEP-13', 50.00, NULL,        NULL);
INSERT INTO BILLING (BillingId, BillingDueDt, CustID, BillingDt, DueAmt, PaidDt, PaidAmt) VALUES (22, '03-SEP-13', 7793, '15-AUG-13', 50.00, NULL,        NULL);
INSERT INTO BILLING (BillingId, BillingDueDt, CustID, BillingDt, DueAmt, PaidDt, PaidAmt) VALUES (23, '27-SEP-13', 8759, '01-SEP-13', 40.00, NULL,        NULL);
INSERT INTO BILLING (BillingId, BillingDueDt, CustID, BillingDt, DueAmt, PaidDt, PaidAmt) VALUES (24, '09-SEP-13', 0010, '05-SEP-13', 30.00, NULL,        NULL);


--****NEW CUSTOMERS TO BE ADDED WITH CORRECT DUE DATE, WHICH IS 24 DAYS FROM SIGNUP DATA VIA CUSTOMER TABLE.

--CHANNELPACKAGE  TABLE 1 FOR SAMPLE DATA
Create table CHANNELPACKAGE
(ChanId		NUMBER(4) 	CONSTRAINT CHANPCKG_CHAN_ChanId_FK REFERENCES CHANNEL(ChanID),
 PckgId		NUMBER(1)	CONSTRAINT CHANPCKG_PROPCKG_FK REFERENCES PROGRAMPACKAGE(PckgId),
 CONSTRAINT CHANPCKG_ChanId_PckgId_PK PRIMARY KEY(ChanId,PckgId));


INSERT INTO CHANNELPACKAGE (ChanId, PckgId) VALUES (1,1);
INSERT INTO CHANNELPACKAGE (ChanId, PckgId) VALUES (2,1);
INSERT INTO CHANNELPACKAGE (ChanId, PckgId) VALUES (1,2);
INSERT INTO CHANNELPACKAGE (ChanId, PckgId) VALUES (1,3);
INSERT INTO CHANNELPACKAGE (ChanId, PckgId) VALUES (2,3);
INSERT INTO CHANNELPACKAGE (ChanId, PckgId) VALUES (1,4);
INSERT INTO CHANNELPACKAGE (ChanId, PckgId) VALUES (2,4);
INSERT INTO CHANNELPACKAGE (ChanId, PckgId) VALUES (3,1);
INSERT INTO CHANNELPACKAGE (ChanId, PckgId) VALUES (3,2);
INSERT INTO CHANNELPACKAGE (ChanId, PckgId) VALUES (4,2);
INSERT INTO CHANNELPACKAGE (ChanId, PckgId) VALUES (3,3);
INSERT INTO CHANNELPACKAGE (ChanId, PckgId) VALUES (3,4);
INSERT INTO CHANNELPACKAGE (ChanId, PckgId) VALUES (4,4);
INSERT INTO CHANNELPACKAGE (ChanId, PckgId) VALUES (6,1);
INSERT INTO CHANNELPACKAGE (ChanId, PckgId) VALUES (6,2);
INSERT INTO CHANNELPACKAGE (ChanId, PckgId) VALUES (6,3);
INSERT INTO CHANNELPACKAGE (ChanId, PckgId) VALUES (5,4);
INSERT INTO CHANNELPACKAGE (ChanId, PckgId) VALUES (6,4);
INSERT INTO CHANNELPACKAGE (ChanId, PckgId) VALUES (7,1);
INSERT INTO CHANNELPACKAGE (ChanId, PckgId) VALUES (7,2);
INSERT INTO CHANNELPACKAGE (ChanId, PckgId) VALUES (7,3);
INSERT INTO CHANNELPACKAGE (ChanId, PckgId) VALUES (8,3);
INSERT INTO CHANNELPACKAGE (ChanId, PckgId) VALUES (7,4);
INSERT INTO CHANNELPACKAGE (ChanId, PckgId) VALUES (8,4);
INSERT INTO CHANNELPACKAGE (ChanId, PckgId) VALUES (9,1);
INSERT INTO CHANNELPACKAGE (ChanId, PckgId) VALUES (9,2);
INSERT INTO CHANNELPACKAGE (ChanId, PckgId) VALUES (9,3);
INSERT INTO CHANNELPACKAGE (ChanId, PckgId) VALUES (10,3);
INSERT INTO CHANNELPACKAGE (ChanId, PckgId) VALUES (9,4);
INSERT INTO CHANNELPACKAGE (ChanId, PckgId) VALUES (10,4);

--CUSTOMERPACKAGE
Create table CUSTOMERPACKAGE
(CustId		NUMBER(5)	CONSTRAINT CUSTPCKG_CUST_FK REFERENCES CUSTOMER(CustId),
 PckgId		NUMBER(1)	CONSTRAINT CUSTPCKG_PROPCKG_FK REFERENCES PROGRAMPACKAGE(PckgId),
 SubscribeDt	DATE,
 CONSTRAINT CUSTPCKG_CustId_PckgId_PK PRIMARY KEY (CustId,PckgId));

INSERT INTO CUSTOMERPACKAGE (CustId, PckgId, SubscribeDt) VALUES (1123,4,'03-SEP-13');
INSERT INTO CUSTOMERPACKAGE (CustId, PckgId, SubscribeDt) VALUES (1223,4,'29-AUG-13');
INSERT INTO CUSTOMERPACKAGE (CustId, PckgId, SubscribeDt) VALUES (1333,3,'05-JUN-13');
INSERT INTO CUSTOMERPACKAGE (CustId, PckgId, SubscribeDt) VALUES (1344,2,'10-JUL-13');
INSERT INTO CUSTOMERPACKAGE (CustId, PckgId, SubscribeDt) VALUES (1444,1,'12-JUL-13');
INSERT INTO CUSTOMERPACKAGE (CustId, PckgId, SubscribeDt) VALUES (2010,4,'03-SEP-12');
INSERT INTO CUSTOMERPACKAGE (CustId, PckgId, SubscribeDt) VALUES (2020,4,'29-APR-12');
INSERT INTO CUSTOMERPACKAGE (CustId, PckgId, SubscribeDt) VALUES (3001,3,'05-JUN-12');
INSERT INTO CUSTOMERPACKAGE (CustId, PckgId, SubscribeDt) VALUES (3003,2,'10-JAN-10');
INSERT INTO CUSTOMERPACKAGE (CustId, PckgId, SubscribeDt) VALUES (4999,1,'12-JUL-12');
INSERT INTO CUSTOMERPACKAGE (CustId, PckgId, SubscribeDt) VALUES (1111,4,'03-APR-13');
INSERT INTO CUSTOMERPACKAGE (CustId, PckgId, SubscribeDt) VALUES (2222,4,'29-MAR-13');
INSERT INTO CUSTOMERPACKAGE (CustId, PckgId, SubscribeDt) VALUES (3333,3,'05-JUN-12');
INSERT INTO CUSTOMERPACKAGE (CustId, PckgId, SubscribeDt) VALUES (4444,2,'10-JAN-11');
INSERT INTO CUSTOMERPACKAGE (CustId, PckgId, SubscribeDt) VALUES (1234,1,'12-JAN-13');
INSERT INTO CUSTOMERPACKAGE (CustId, PckgId, SubscribeDt) VALUES (4567,4,'03-SEP-12');
INSERT INTO CUSTOMERPACKAGE (CustId, PckgId, SubscribeDt) VALUES (8910,4,'29-AUG-12');
INSERT INTO CUSTOMERPACKAGE (CustId, PckgId, SubscribeDt) VALUES (1314,3,'05-JUN-12');
INSERT INTO CUSTOMERPACKAGE (CustId, PckgId, SubscribeDt) VALUES (1516,2,'10-MAR-13');
INSERT INTO CUSTOMERPACKAGE (CustId, PckgId, SubscribeDt) VALUES (2000,1,'12-JUN-13');
INSERT INTO CUSTOMERPACKAGE (CustId, PckgId, SubscribeDt) VALUES (6253,4,'03-MAY-12');
INSERT INTO CUSTOMERPACKAGE (CustId, PckgId, SubscribeDt) VALUES (7793,4,'29-AUG-09');
INSERT INTO CUSTOMERPACKAGE (CustId, PckgId, SubscribeDt) VALUES (8759,3,'05-JUN-12');
INSERT INTO CUSTOMERPACKAGE (CustId, PckgId, SubscribeDt) VALUES (0010,2,'10-JAN-08');


--PROGRAMCHANNEL
Create table PROGRAMCHANNEL
(ProgChanId	NUMBER(3)	CONSTRAINT PROGCHAN_ProgChanID_PK PRIMARY KEY,
 ChanId		NUMBER(4) NOT NULL	CONSTRAINT PROGCHAN_CHAN_FK REFERENCES CHANNEL(ChanId),
 ProgId		NUMBER(4) NOT NULL	CONSTRAINT PROGCHAN_PROG_FK REFERENCES PROGRAM(ProgId),
 ShowDateTime	VARCHAR2(10));

INSERT INTO PROGRAMCHANNEL (ProgChanId, ChanId, ProgId, ShowDateTime) VALUES (1,1,3,'1:00 AM');
INSERT INTO PROGRAMCHANNEL (ProgChanId, ChanId, ProgId, ShowDateTime) VALUES (2,2,6,'1:30 AM');
INSERT INTO PROGRAMCHANNEL (ProgChanId, ChanId, ProgId, ShowDateTime) VALUES (3,3,4,'6:00 AM');
INSERT INTO PROGRAMCHANNEL (ProgChanId, ChanId, ProgId, ShowDateTime) VALUES (4,4,15,'9:00 AM');
INSERT INTO PROGRAMCHANNEL (ProgChanId, ChanId, ProgId, ShowDateTime) VALUES (5,5,5,'1:00 PM');
INSERT INTO PROGRAMCHANNEL (ProgChanId, ChanId, ProgId, ShowDateTime) VALUES (6,6,11,'8:30 PM');
INSERT INTO PROGRAMCHANNEL (ProgChanId, ChanId, ProgId, ShowDateTime) VALUES (7,7,13,'2:00 PM');
INSERT INTO PROGRAMCHANNEL (ProgChanId, ChanId, ProgId, ShowDateTime) VALUES (8,8,17,'12:00 PM');
INSERT INTO PROGRAMCHANNEL (ProgChanId, ChanId, ProgId, ShowDateTime) VALUES (9,9,2,'3:00 PM');
INSERT INTO PROGRAMCHANNEL (ProgChanId, ChanId, ProgId, ShowDateTime) VALUES (10,10,16,'5:00 PM');

--MODIFY STATEMENTS
--BENITA
SELECT * FROM CUSTOMER;
UPDATE CUSTOMER
   SET STATUS = 'INACTIVE'
WHERE CUSTID IN
	(SELECT BILLING.CUSTID FROM BILLING
	 WHERE TO_DATE(SYSDATE,'DD-MM-YYYY') - TO_DATE(BILLINGDUEDT,'DD-MM-YYYY') >30 AND PAIDAMT IS NULL);
SELECT * FROM CUSTOMER;
ROLLBACK;

--CAMERON
SELECT CustID, CustFName, CustLName, Status FROM CUSTOMER;
UPDATE CUSTOMER 
SET STATUS = 'INACTIVE'
WHERE CustId IN 
(SELECT BILLING.CUSTID FROM BILLING WHERE 
to_Date(SYSDATE, 'DD-MM-YYYY') - to_Date(BillingDueDt, 'DD-MM-YYYY') > 30 AND PaidAmt IS NULL);

SELECT * FROM CUSTOMER;
ROLLBACK;
.
--JORDAN
SELECT CustStreetAddress, CustCity, CustState, CustZip FROM CUSTOMER;
UPDATE CUSTOMER
   SET STATUS = 'INACTIVE'
WHERE CUSTID IN 
	(SELECT BILLING.CUSTID FROM BILLING
	 WHERE TO_DATE(SYSDATE,'DD-MM-YYYY') - TO_DATE(BILLINGDUEDT,'DD-MM-YYYY') >30 AND PAIDAMT IS NULL);
SELECT * FROM CUSTOMER;
ROLLBACK;


--JULIAN
SELECT * 
FROM CUSTOMER;
UPDATE CUSTOMER
 SET STATUS = 'INACTIVE'
WHERE CUSTID IN
 (SELECT BILLING.CUSTID FROM BILLING
   WHERE TO_DATE(SYSDATE,'DD-MM-YYYY') -
   TO_DATE(BILLINGDUEDT,'DD-MM-YYYY') > 
   30 AND PAIDAMT IS NULL);
SELECT *
FROM CUSTOMER;
ROLLBACK;


