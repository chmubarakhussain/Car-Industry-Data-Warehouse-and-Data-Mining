

create database DWM

use DWM


--Car Sale Module

CREATE DATABASE CAR_SALE_MODULE

create table Customer(
	customerid				int					Primary key,
	email					nvarchar(40)		NULL,
	phone					nvarchar(40)		NULL	
)


insert into Customer values (1,'sufyan.javed99@gamil.com','03096898062')

insert into Customer values (2,'javed99@gamil.com','03068398462')
insert into Customer values (3,'muabarak99@gamil.com','03096898062')
insert into Customer values (4,'samad99@gamil.com','03096898062')
insert into Customer values (5,'bill99@gamil.com','03096898062')
insert into Customer values (6,'sufyan99@gamil.com','03096898062')

select * from Customer



Create table Customer_Preferences(
	customerPreferenceId	int					Primary key,
	carFeatureId			int					foreign key references Car_Feature(carFeatureId),
	customerId				int					foreign key references Customer(CustomerId),
	customerPreferenceDesc	nvarchar(40)		NULL
)


insert into Customer_Preferences values(1,1,1,'Urgent')
insert into Customer_Preferences values(2,2,2,'Cash')
insert into Customer_Preferences values(3,6,5,'Installment')
insert into Customer_Preferences values(4,4,5,'Urgent')
insert into Customer_Preferences values(5,5,3,'Urgent')
insert into Customer_Preferences values(6,6,2,'Urgent')

select * from Customer_Preferences

create table Car_Feature(
	carFeatureId			int					primary key,
	carFeatureDesc			nvarchar(40)		NULL
)

insert into Car_Feature values(1,'Luxury')
insert into Car_Feature values(2,'Low')
insert into Car_Feature values(3,'Extra')
insert into Car_Feature values(4,'Costy')
insert into Car_Feature values(5,'Cheap')
insert into Car_Feature values(6,'Luxury')

select * from Car_Feature


create table Feature_On_Car_For_Sale(
	carForSaleId			int					NOT NULL,
	carFeatureId			int					foreign key references Car_Feature(carFeatureId),
	primary key(carForSaleId,carFeatureId)
)


insert into Feature_On_Car_For_Sale values(1,1)
insert into Feature_On_Car_For_Sale values(2,5)
insert into Feature_On_Car_For_Sale values(3,6)
insert into Feature_On_Car_For_Sale values(4,2)
insert into Feature_On_Car_For_Sale values(5,2)
insert into Feature_On_Car_For_Sale values(6,1)



create table Car_Sold(
	carSoldId				int					primary key,
	carForSaleId			int					foreign key references Car_For_Sale(carForSaleId),
	customerId				int					foreign key references Customer(customerId),
	agreedPrice				int					,
	dateSold				date				,
	otherDetails			nvarchar(40)		
)

insert into Car_Sold values(1,1,1,20000,'01-12-2019','Paid')
insert into Car_Sold values(2,1,1,20000,'02-11-2019','Paid')
insert into Car_Sold values(3,2,2,20000,'03-09-2019','Paid')
insert into Car_Sold values(4,3,3,20000,'04-08-2019','Paid')
insert into Car_Sold values(5,4,4,20000,'04-07-2019','Paid')


create table Car_For_Sale(
	carForSaleId			int					primary key,
	manufacturerShortName	nvarchar(40)		foreign key references Car_Manufacturer(manufacturerShortName),
	modelCode				int					foreign key references Car_Model(modelCode),
	vehicleCategoryCode		int					foreign key references Vehicle_Category(vehicleCategoryCode),
	askingPrice				int					,
	currentMilage			float				,
	dateAquired				date				,
	registerationYear		nvarchar(5)			,
	otherDetails			nvarchar(40)		

)
insert into Car_For_Sale values(1,'Audi',1,1,2000000,12.2,'11-12-2018',2019,'Done')
insert into Car_For_Sale values(2,'Audi',2,3,300000,22.2,'12-07-2017',2017,'Done')
insert into Car_For_Sale values(3,'Toyota',2,3,1000050,18.2,'12-08-2015',2015,'Done')
insert into Car_For_Sale values(4,'GMC',2,3,1020000,32.2,'09-12-2018',2018,'Done')
insert into Car_For_Sale values(5,'GMC',4,4,1000000,23.2,'01-12-2018',2018,'Done')

select * from Car_For_Sale

create table Car_Manufacturer(
	manufacturerShortName	nvarchar(40)		primary key,
	manufacturerFullName	nvarchar(40)		,
	otherDetails			nvarchar(40)		,
)
insert into Car_Manufacturer values ('Audi','ltd','superior')
insert into Car_Manufacturer values ('Toyota','ltd','low')
insert into Car_Manufacturer values ('GMC','ltd','superior')

select * from Car_Manufacturer


create Table Vehicle_Category(
	vehicleCategoryCode		int					primary key,
	vehicleCategoryDesc		nvarchar(40)		,
)

insert into Vehicle_Category values (1,'Sports')
insert into Vehicle_Category values (2,'Roof')
insert into Vehicle_Category values (3,'Roofless')
insert into Vehicle_Category values (4,'Rover')

select * from Vehicle_Category


create table Car_Model(
	modelCode				int					primary key,
	manufacturerCode		int					,
	modelName				nvarchar(20)		,
)
insert into Car_Model values(1,1,'Alto')
insert into Car_Model values(2,1,'Wagon R')
insert into Car_Model values(3,2,'ferari')
insert into Car_Model values(4,3,'XLI')
insert into Car_Model values(5,3,'GLI')

select * from Car_Model

create table dbo.Address(
	addressId				int					primary key,
	customerId				int					foreign key references Customer(customerId),
	addressLine1			nvarchar(40)		,
	addressLine2			nvarchar(40)		,
	addressLine3			nvarchar(40)		,
	addressLine4			nvarchar(40)		,
	townCity				nvarchar(15)		,
	[state]					nvarchar(15)		,
	country					nvarchar(15)		,
	postalCode				nvarchar(15)		,
	otherAddressDetails		nvarchar(40)		,
)

insert into dbo.Address values(1,1,'house # 122,Valencia','','','','Lahore','punjab','Pakistan','54000','')
insert into dbo.Address values(2,2,'house # 150,Valencia','','','','Lahore','punjab','Pakistan','54000','')
insert into dbo.Address values(3,3,'house # 132,Johar Town','','','','Lahore','punjab','Pakistan','14020','')
insert into dbo.Address values(4,4,'house # 92,Johar Town','','','','Lahore','punjab','Pakistan','14020','')




select * from Car_Feature
select * from Car_For_Sale
select * from Customer
select * from Customer_Preferences
select * from Car_Model
select * from Car_Sold
select * from Car_Manufacturer
select * from Address
select * from Feature_On_Car_For_Sale
select * from Vehicle_Category


--CAR SALES MODULE


CREATE DATABASE DWMTWO
use DWMTWO

create table Ref_Car_Manufacturer
(
	carManufacturerCode	int					primary key,
	carManufacturerName	nvarchar(20)		NOT NULL

)

select * from Ref_Car_Manufacturer




create table Car
(
	carId					int					primary key,
	carManufacturerCode		int					foreign key references Ref_Car_Manufacturer(carManufacturerCode),
	carYearOfManufacture	nvarchar(40)		,
	model					int					,
	otherCarDetail			nvarchar(40)		
)

create table Supplier
(
	supplierId				int					primary key,
	supplierDetail			nvarchar(40)		
)

create table Ref_Part_Types
(
	partTypeCode			int					primary key,
	partTypeDesc			nvarchar(40)
)

create table Ref_Part_Levels
(
	partLevelCode			int					primary key,
	partLevelDesc			nvarchar(40)		,
)


create table Ref_Part_Manufacturer
(
	partManufacturerCode	int					primary key,
	partManufacturerName	nvarchar(20)		NOT NULL

)

insert into Ref_Part_Manufacturer values (1,'Bill')
insert into Ref_Part_Manufacturer values (3,'Sufi')
insert into Ref_Part_Manufacturer values (2,'Mubarak')
insert into Ref_Part_Manufacturer values (4,'samad')
create table Parts
(
	partID					int					primary key,
	carId					int					foreign key references Car(carId),
	parentPartId			int					foreign key references Parts(partId),
	partLevelCode			int					foreign key references Ref_Part_Levels(partLevelCode),
	partManufacturerCode	int					foreign key references Ref_Part_Manufacturer(partManufacturerCode),
	partTypeCode			int					foreign key references Ref_Part_Types(partTypeCode),
	supplierId				int					foreign key references Supplier(supplierId),
	partName				nvarchar(40)		,
	weight					nvarchar(40)		,
	condition				nvarchar(40)		,
	mileageDonorVehicle		nvarchar(40)		,
	otherPartDetail			nvarchar(40)		
)


CREATE TABLE BaseFactTable
( 
	PartId               integer  NOT NULL ,
	BookingId            integer  NOT NULL ,
	ContactId            integer  NOT NULL ,
	MechanicID           integer  NOT NULL ,
	licenseNo            integer  NOT NULL 
)
go



ALTER TABLE BaseFactTable
	ADD CONSTRAINT XPKBaseFactTable PRIMARY KEY (ContactId ASC,PartId ASC,BookingId ASC,MechanicID ASC,licenseNo ASC)
go



CREATE TABLE CarPartAggregateFact
( 
	PartId               integer  NOT NULL ,
	BookingId            integer  NOT NULL 
)
go



ALTER TABLE CarPartAggregateFact
	ADD CONSTRAINT XPKCarPartAggregateFact PRIMARY KEY (PartId ASC,BookingId ASC)
go



CREATE TABLE Contact
( 
	ContactId            integer  NOT NULL ,
	FirstName            varchar(50)  NULL ,
	LastName             varchar(50)  NULL ,
	MiddleName           varchar(18)  NULL ,
	Gender               varchar(5)  NULL ,
	Email                varchar(30)  NULL ,
	PhoneNo              varchar(25)  NULL ,
	address_line1		 varchar(100) NULL,
	address_line2		 varchar(100) NULL,
	address_line3		 varchar(100) NULL,
	address_line4		 varchar(100) NULL,
	town_city_id         integer  NULL 
)
go



ALTER TABLE Contact
	ADD CONSTRAINT XPKContact PRIMARY KEY (ContactId ASC)
go



CREATE TABLE Country
( 
	countryID            integer  NOT NULL ,
	Country              varchar(20)  NULL 
)
go



ALTER TABLE Country
	ADD CONSTRAINT XPKCountry PRIMARY KEY (countryID ASC)
go



CREATE TABLE District
( 
	District_id          integer  NOT NULL ,
	District             varchar(20)  NULL ,
	state_id             integer  NULL 
)
go



ALTER TABLE District
	ADD CONSTRAINT XPKDistrict PRIMARY KEY (District_id ASC)
go



CREATE TABLE Manufacturer
( 
	ManufacturerCode     integer  NOT NULL ,
	ManufacturerName     varchar(50)  NULL ,
	ManufacturerDetails  varchar(50)  NULL ,
	Model_number         integer  NULL 
)
go



ALTER TABLE Manufacturer
	ADD CONSTRAINT XPKManufacturer PRIMARY KEY (ManufacturerCode ASC)
go



CREATE TABLE ManufacturerAggregateFact
( 
	BookingId            integer  NOT NULL ,
	ManufacturerCode     integer  NOT NULL ,
	licenseNo            integer  NOT NULL 
)
go



ALTER TABLE ManufacturerAggregateFact
	ADD CONSTRAINT XPKManufacturerAggregateFact PRIMARY KEY (BookingId ASC,ManufacturerCode ASC,licenseNo ASC)
go



CREATE TABLE Mechanic
( 
	MechanicID           int  NOT NULL ,
	MechanicDetails      varchar(30)  NULL ,
	MechanicName         varchar(30)  NULL 
)
go



ALTER TABLE Mechanic
	ADD CONSTRAINT XPKMechanic PRIMARY KEY (MechanicID ASC)
go



CREATE TABLE MechanicAggregateFact
( 
	MechanicId           char(18)  NOT NULL ,
	BookingId            char(18)  NOT NULL ,
	MechanicID           int  NOT NULL ,
	licenseNo            integer  NOT NULL 
)
go



ALTER TABLE MechanicAggregateFact
	ADD CONSTRAINT XPKMechanicAggregateFact PRIMARY KEY (MechanicId ASC,BookingId ASC,MechanicID ASC,licenseNo ASC)
go



CREATE TABLE Model
( 
	Model_number         integer  NOT NULL ,
	ModelName            varchar(10)  NULL ,
	licenseNo            integer  NULL 
)
go



ALTER TABLE Model
	ADD CONSTRAINT XPKModel PRIMARY KEY (Model_number ASC)
go



CREATE TABLE State
( 
	state_id             integer  NOT NULL ,
	state                varchar(20)  NULL ,
	countryID            integer  NULL 
)
go



ALTER TABLE State
	ADD CONSTRAINT XPKState PRIMARY KEY (state_id ASC)
go



CREATE TABLE Town_City
( 
	town_city_id         integer  NOT NULL ,
	town_city            varchar(20)  NULL ,
	District_id          integer  NULL 
)
go



ALTER TABLE Town_City
	ADD CONSTRAINT XPKTown_City PRIMARY KEY (town_city_id ASC)
go




ALTER TABLE BaseFactTable
	ADD CONSTRAINT R_1 FOREIGN KEY (ContactId) REFERENCES Contact(ContactId)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE BaseFactTable
	ADD CONSTRAINT R_3 FOREIGN KEY (MechanicID) REFERENCES Mechanic(MechanicID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Contact
	ADD CONSTRAINT R_6 FOREIGN KEY (town_city_id) REFERENCES Town_City(town_city_id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE District
	ADD CONSTRAINT R_8 FOREIGN KEY (state_id) REFERENCES State(state_id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Manufacturer
	ADD CONSTRAINT R_13 FOREIGN KEY (Model_number) REFERENCES Model(Model_number)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE ManufacturerAggregateFact
	ADD CONSTRAINT R_16 FOREIGN KEY (ManufacturerCode) REFERENCES Manufacturer(ManufacturerCode)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE MechanicAggregateFact
 	ADD CONSTRAINT R_11 FOREIGN KEY (MechanicID) REFERENCES Mechanic(MechanicID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE State
	ADD CONSTRAINT R_15 FOREIGN KEY (countryID) REFERENCES Country(countryID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Town_City
	ADD CONSTRAINT R_7 FOREIGN KEY (District_id) REFERENCES District(District_id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




