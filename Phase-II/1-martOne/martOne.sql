USE martOne

CREATE TABLE Address
( 
	address_id           integer  NOT NULL ,
	address_desc         varchar(20)  NULL ,
	post_zip_id          integer  NULL ,
	Address_Line_1       char(18)  NULL ,
	Address_Line_2       char(18)  NULL ,
	Address_Line_3       char(18)  NULL ,
	Address_Line_5       char(18)  NULL 
)
go



ALTER TABLE Address
	ADD CONSTRAINT XPKAddress PRIMARY KEY  NONCLUSTERED (address_id ASC)
go



CREATE TABLE Car
( 
	car_id               integer  NOT NULL ,
	car_desc             varchar(20)  NULL ,
	model_id             integer  NULL 
)
go



ALTER TABLE Car
	ADD CONSTRAINT XPKCar PRIMARY KEY  NONCLUSTERED (car_id ASC)
go



CREATE TABLE Car_Demand_Agg_Fact_Table
( 
	customer_id          integer  NOT NULL ,
	model_id             integer  NOT NULL ,
	car_pref_id          integer  NOT NULL ,
	rating               integer  NULL 
)
go



ALTER TABLE Car_Demand_Agg_Fact_Table
	ADD CONSTRAINT XPKCar_Demand_Agg_Fact_Table PRIMARY KEY  NONCLUSTERED (customer_id ASC,model_id ASC,car_pref_id ASC)
go



CREATE TABLE Car_Feature
( 
	car_feature_id       integer  NOT NULL ,
	car_feature_detail   varchar(20)  NULL 
)
go



ALTER TABLE Car_Feature
	ADD CONSTRAINT XPKCar_Feature PRIMARY KEY  NONCLUSTERED (car_feature_id ASC)
go



CREATE TABLE Car_Feature_Agg_Fact_Table
( 
	customer_id          integer  NOT NULL ,
	car_id               integer  NOT NULL ,
	car_feature_id       integer  NOT NULL ,
	sale                 integer  NULL ,
	cost                 integer  NULL 
)
go



ALTER TABLE Car_Feature_Agg_Fact_Table
	ADD CONSTRAINT XPKCar_Feature_Agg_Fact_Table PRIMARY KEY  NONCLUSTERED (customer_id ASC,car_id ASC,car_feature_id ASC)
go



CREATE TABLE Car_Preference
( 
	car_pref_id          integer  NOT NULL ,
	car_pref_desc        varchar(20)  NULL 
)
go



ALTER TABLE Car_Preference
	ADD CONSTRAINT XPKCar_Preference PRIMARY KEY  NONCLUSTERED (car_pref_id ASC)
go



CREATE TABLE Car_Sale_Base_Fact_Table
( 
	customer_id          integer  NOT NULL ,
	car_id               integer  NOT NULL ,
	customer_pref_id     integer  NOT NULL ,
	car_feature_id       integer  NOT NULL ,
	address_id           integer  NOT NULL ,
	car_sold_id          integer  NOT NULL ,
	car_quantity         integer  NULL ,
	profit_margin        float  NULL ,
	sale                 integer  NULL ,
	cost                 integer  NULL 
)
go



ALTER TABLE Car_Sale_Base_Fact_Table
	ADD CONSTRAINT XPKCar_Sale_Base_Fact_Table PRIMARY KEY  NONCLUSTERED (customer_id ASC,car_id ASC,customer_pref_id ASC,car_feature_id ASC,address_id ASC,car_sold_id ASC)
go



CREATE TABLE Car_Sold
( 
	car_sold_id          integer  NOT NULL ,
	agreed_price         integer  NULL ,
	other_details        char(18)  NULL ,
	date_sold            char(18)  NULL 
)
go



ALTER TABLE Car_Sold
	ADD CONSTRAINT XPKCar_Sold PRIMARY KEY  NONCLUSTERED (car_sold_id ASC)
go



CREATE TABLE City
( 
	town_city_id         integer  NOT NULL ,
	town_city_desc       varchar(20)  NULL ,
	state_county_province_id integer  NULL 
)
go



ALTER TABLE City
	ADD CONSTRAINT XPKCity PRIMARY KEY  NONCLUSTERED (town_city_id ASC)
go



CREATE TABLE Country
( 
	country_id           integer  NOT NULL ,
	country_desc         varchar(20)  NULL 
)
go



ALTER TABLE Country
	ADD CONSTRAINT XPKCountry PRIMARY KEY  NONCLUSTERED (country_id ASC)
go



CREATE TABLE Customer
( 
	customer_id          integer  NOT NULL ,
	cell_mobile_phone    varchar(20)  NULL ,
	email_address        varchar(20)  NULL ,
	other_details        varchar(20)  NULL 
)
go



ALTER TABLE Customer
	ADD CONSTRAINT XPKCustomer PRIMARY KEY  NONCLUSTERED (customer_id ASC)
go



CREATE TABLE Customer_Preference
( 
	customer_pref_id     integer  NOT NULL ,
	customer_pref_desc   varchar(20)  NULL 
)
go



ALTER TABLE Customer_Preference
	ADD CONSTRAINT XPKCustomer_Preference PRIMARY KEY  NONCLUSTERED (customer_pref_id ASC)
go



CREATE TABLE Manufacturer
( 
	shortName       nvarchar(20)  NOT NULL ,
	fullName    varchar(20)  NULL ,
	desc    varchar(20)  NULL ,
	vehicle_category_id  integer  NULL 
)
go



ALTER TABLE Manufacturer
	ADD CONSTRAINT XPKManufacturer PRIMARY KEY  NONCLUSTERED (shortName ASC)
go



CREATE TABLE Model
( 
	model_id             integer  NOT NULL ,
	model_desc           varchar(20)  NULL ,
	manufacture_id       integer  NULL 
)
go



ALTER TABLE Model
	ADD CONSTRAINT XPKModel PRIMARY KEY  NONCLUSTERED (model_id ASC)
go



CREATE TABLE Preferred_Car_Agg_Fact_Table
( 
	customer_id          integer  NOT NULL ,
	car_id               integer  NOT NULL ,
	car_pref_id          integer  NOT NULL ,
	preference           char(18)  NULL ,
	contribution         integer  NULL 
)
go



ALTER TABLE Preferred_Car_Agg_Fact_Table
	ADD CONSTRAINT XPKPreferred_Car_Agg_Fact_Table PRIMARY KEY  NONCLUSTERED (customer_id ASC,car_id ASC,car_pref_id ASC)
go



CREATE TABLE Province
( 
	state_county_province_id integer  NOT NULL ,
	state_county_province_desc varchar(20)  NULL ,
	country_id           integer  NULL 
)
go



ALTER TABLE Province
	ADD CONSTRAINT XPKProvince PRIMARY KEY  NONCLUSTERED (state_county_province_id ASC)
go



CREATE TABLE Vehicle_Category
( 
	vehicle_category_id  integer  NOT NULL ,
	vehicle_category_desc varchar(20)  NULL 
)
go



ALTER TABLE Vehicle_Category
	ADD CONSTRAINT XPKVehicle_Category PRIMARY KEY  NONCLUSTERED (vehicle_category_id ASC)
go



CREATE TABLE Zip_Code
( 
	post_zip_id          integer  NOT NULL ,
	post_zip_desc        varchar(20)  NULL ,
	town_city_id         integer  NULL 
)
go



ALTER TABLE Zip_Code
	ADD CONSTRAINT XPKZip_Code PRIMARY KEY  NONCLUSTERED (post_zip_id ASC)
go




ALTER TABLE Address
	ADD CONSTRAINT R_28 FOREIGN KEY (post_zip_id) REFERENCES Zip_Code(post_zip_id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Car
	ADD CONSTRAINT R_18 FOREIGN KEY (model_id) REFERENCES Model(model_id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Car_Demand_Agg_Fact_Table
	ADD CONSTRAINT R_19 FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Car_Demand_Agg_Fact_Table
	ADD CONSTRAINT R_20 FOREIGN KEY (model_id) REFERENCES Model(model_id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Car_Demand_Agg_Fact_Table
	ADD CONSTRAINT R_21 FOREIGN KEY (car_pref_id) REFERENCES Car_Preference(car_pref_id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Car_Feature_Agg_Fact_Table
	ADD CONSTRAINT R_25 FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Car_Feature_Agg_Fact_Table
	ADD CONSTRAINT R_26 FOREIGN KEY (car_id) REFERENCES Car(car_id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Car_Feature_Agg_Fact_Table
	ADD CONSTRAINT R_27 FOREIGN KEY (car_feature_id) REFERENCES Car_Feature(car_feature_id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Car_Sale_Base_Fact_Table
	ADD CONSTRAINT R_11 FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Car_Sale_Base_Fact_Table
	ADD CONSTRAINT R_12 FOREIGN KEY (car_id) REFERENCES Car(car_id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Car_Sale_Base_Fact_Table
	ADD CONSTRAINT R_13 FOREIGN KEY (customer_pref_id) REFERENCES Customer_Preference(customer_pref_id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Car_Sale_Base_Fact_Table
	ADD CONSTRAINT R_14 FOREIGN KEY (car_feature_id) REFERENCES Car_Feature(car_feature_id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Car_Sale_Base_Fact_Table
	ADD CONSTRAINT R_15 FOREIGN KEY (address_id) REFERENCES Address(address_id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Car_Sale_Base_Fact_Table
	ADD CONSTRAINT R_30 FOREIGN KEY (car_sold_id) REFERENCES Car_Sold(car_sold_id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE City
	ADD CONSTRAINT R_6 FOREIGN KEY (state_county_province_id) REFERENCES Province(state_county_province_id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Manufacturer
	ADD CONSTRAINT R_16 FOREIGN KEY (vehicle_category_id) REFERENCES Vehicle_Category(vehicle_category_id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Model
	ADD CONSTRAINT R_17 FOREIGN KEY (manufacture_id) REFERENCES Manufacturer(manufacture_id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Preferred_Car_Agg_Fact_Table
	ADD CONSTRAINT R_22 FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Preferred_Car_Agg_Fact_Table
	ADD CONSTRAINT R_23 FOREIGN KEY (car_id) REFERENCES Car(car_id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Preferred_Car_Agg_Fact_Table
	ADD CONSTRAINT R_24 FOREIGN KEY (car_pref_id) REFERENCES Car_Preference(car_pref_id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Province
	ADD CONSTRAINT R_5 FOREIGN KEY (country_id) REFERENCES Country(country_id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE Zip_Code
	ADD CONSTRAINT R_8 FOREIGN KEY (town_city_id) REFERENCES City(town_city_id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


