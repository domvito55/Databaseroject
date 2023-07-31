DROP VIEW SS_basketitem_vu;
DROP VIEW SS_ship_vu;
DROP TABLE SS_category CASCADE CONSTRAINTS;
DROP TABLE SS_Advertisement CASCADE CONSTRAINTS;
DROP TABLE SS_Advertisementoption CASCADE CONSTRAINTS;
DROP TABLE SS_Advertisementoptiondetail CASCADE CONSTRAINTS;
DROP TABLE SS_Advertisementoptioncategory CASCADE CONSTRAINTS;
DROP TABLE SS_basketitem CASCADE CONSTRAINTS;
DROP TABLE SS_basket CASCADE CONSTRAINTS;
DROP TABLE SS_shopper CASCADE CONSTRAINTS;
DROP TABLE SS_basketstatus CASCADE CONSTRAINTS;
DROP TABLE SS_tax CASCADE CONSTRAINTS;
DROP TABLE SS_shipping CASCADE CONSTRAINTS;
DROP TABLE SS_promolist CASCADE CONSTRAINTS;
DROP TABLE SS_promo CASCADE CONSTRAINTS;
DROP TABLE SS_test1 CASCADE CONSTRAINTS;
DROP TABLE SS_test2 CASCADE CONSTRAINTS;
DROP TABLE SS_prod_sales CASCADE CONSTRAINTS;
DROP TABLE SS_shop_sales CASCADE CONSTRAINTS;
DROP TABLE SS_audit_logon CASCADE CONSTRAINTS;
DROP TABLE SS_Advertisement_request CASCADE CONSTRAINTS;
DROP TABLE SS_blocktest CASCADE CONSTRAINTS;
DROP TABLE SS_trans_log CASCADE CONSTRAINTS;


drop sequence SS_categoryId_seq;
drop sequence SS_advertisementId_seq;

DROP SEQUENCE SS_adid_seq;
DROP SEQUENCE SS_shopper_seq;
DROP SEQUENCE SS_poption_seq;
DROP SEQUENCE SS_idbasket_seq;
DROP SEQUENCE SS_idbasketitem_seq;
DROP SEQUENCE SS_status_seq;
DROP SEQUENCE SS_prodreq_seq;

-- ################### Category ####################
create sequence SS_categoryId_seq;

CREATE TABLE SS_category (
	categoryId number(2),
	categoryName varchar2(25),
	categoryDesc varchar2(100),
	CONSTRAINT cat_id_pk PRIMARY KEY(categoryId) );
insert into SS_category 
   values(SS_categoryId_seq.nextval,'Art','Painting, Sculpture, and more');
insert into SS_category 
   values(SS_categoryId_seq.nextval,'Books','Textbooks, magazines, romances,
            and more');
insert into SS_category 
   values(SS_categoryId_seq.nextval,'Clothes','Shirts, pants, underwear, and more');
insert into SS_category 
   values(SS_categoryId_seq.nextval,'Eletronics','Computers, cellphones, and more');
insert into SS_category 
   values(SS_categoryId_seq.nextval,'Furniture','Sofas, beds, tables, and more');
insert into SS_category 
   values(SS_categoryId_seq.nextval,'Musical Instruments','Guitars, Pianos, Drums,
            and more');
insert into SS_category 
   values(SS_categoryId_seq.nextval,'Real State','Houses, apartments, offices, and
            more for buy or rent');
insert into SS_category 
   values(SS_categoryId_seq.nextval,'Tools','cars, motorcycles, bicycles, and more');
insert into SS_category 
   values(SS_categoryId_seq.nextval,'Toys','Board games, dolls, video games 
            and more');
insert into SS_category 
   values(SS_categoryId_seq.nextval,'Vehicles','Cars, motorcycles, bicycles,
            and more');

-- ################### Advertisement ####################
CREATE SEQUENCE SS_advertisementId_seq;
CREATE TABLE SS_Advertisement (
	advertisementId number,
	advertisementTitle varchar2(25) ,
	advertisementDescription varchar2(100) ,
	advertisementImage blob,
	price number(10,2),
    sold boolean,
	active boolean,
	saleStart date,
	saleEnd date,
	salePrice number(6,2),
	stock number(5),
    idCategory number(2),
	 CONSTRAINT advertisement_id_pk PRIMARY KEY(advertisementId),
         CONSTRAINT advertisement_idCategory_fk FOREIGN KEY (CategoryId)
           REFERENCES SS_category (categoryId) );

--insert into SS_Advertisement(idAdvertisement, type, AdvertisementName, Description, AdvertisementImage, Price, Active, idCategory) 
--  values(1,'E','CapressoBar Model #351', 'A fully programmable pump espresso machine and 10-cup coffee maker complete with GoldTone filter', 'capresso.gif', 99.99, 1, 2);
--
--insert into SS_Advertisement(idAdvertisement, type, AdvertisementName, Description, AdvertisementImage, Price, Active, idCategory) 
--  values(2,'E','Capresso Ultima', 'Coffee and Espresso and Cappuccino Machine. Brews from one espresso to two six ounce cups of coffee', 'capresso2.gif', 129.99, 1, 2);
--
--insert into SS_Advertisement(idAdvertisement, Type, AdvertisementName, Description, AdvertisementImage, Price, Active, idCategory) 
--  values(3,'E','Eileen 4-cup French Press', 'A unique coffeemaker from those proud craftsmen in windy Normandy.', 'frepress.gif', 32.50, 1, 2);
--
--insert into SS_Advertisement(idAdvertisement, Type, AdvertisementName, Description, AdvertisementImage, Price, Active, idCategory) 
--  values(4,'E','Coffee Grinder', 'Avoid blade grinders! This mill grinder allows you to choose a fine grind to a coarse grind.', 'grind.gif', 28.50, 1, 2);
--
--insert into SS_Advertisement(idAdvertisement, Type, AdvertisementName, Description, AdvertisementImage, Price, Active, idCategory) 
--  values(5,'C','Sumatra', 'Spicy and intense with herbal aroma. ', 'sumatra.jpg', 10.50, 1, 1);
--
--insert into SS_Advertisement(idAdvertisement, Type, AdvertisementName, Description, AdvertisementImage, Price, Active, idCategory) 
--  values(6,'C','Guatamala', 'heavy body, spicy twist, aromatic and smokey flavor.', 'Guatamala.jpg', 10.00, 1, 1);
--
--insert into SS_Advertisement(idAdvertisement, Type, AdvertisementName, Description, AdvertisementImage, Price, Active, idCategory) 
--  values(7,'C','Columbia', 'dry, nutty flavor and smoothness', 'columbia.jpg', 10.80, 1, 1);
--
--insert into SS_Advertisement(idAdvertisement, Type, AdvertisementName, Description, AdvertisementImage, Price, Active, idCategory) 
--  values(8,'C','Brazil', 'well-balanced mellow flavor, a medium body with hints of cocoa and a mild, nut-like aftertaste', 'brazil.jpg', 10.80, 1, 1);
--
--insert into SS_Advertisement(idAdvertisement, Type, AdvertisementName, Description, AdvertisementImage, Price, Active, idCategory) 
--  values(9,'C','Ethiopia', 'distinctive berry-like flavor and aroma, reminds many of a fruity, memorable wine. ', 'ethiopia.jpg', 10.00, 1, 1);
--
--insert into SS_Advertisement(idAdvertisement, Type, AdvertisementName, Description, AdvertisementImage, Price, Active, idCategory) 
--  values(10,'C','Espresso', 'dense, caramel-like sweetness with a soft acidity. Roasted somewhat darker than traditional Italian.', 'espresso.jpg', 10.00, 1, 1);
--  
---- ################ Advertisement ###################
--CREATE TABLE SS_Shopper (
--	idShopper number,
--	FirstName varchar2(15),
--	LastName varchar2(20),
--	Address varchar2(40),
--	City varchar2(20),
--	State char(2),
--	Country varchar2(15),
--	ZipCode varchar2(15),
--	Phone varchar2(10),
--	Email varchar2(25),
--	UserName varchar2(8),
--	Password varchar2(8),
--	dtEntered date DEFAULT SYSDATE,
--	CONSTRAINT shopper_id_pk PRIMARY KEY(idShopper) );
--create sequence SS_shopper_seq
--  start with 1;
--insert into SS_shopper
--    values (21, 'John', 'Carter', '21 Front St.', 'Raleigh',
--            'NC', 'USA','54822', '9014317701', 'Crackjack@aol.com', 'Crackj',
--            'flyby', '13-JAN-2012');
--insert into SS_shopper
--    values (22, 'Margaret', 'Somner', '287 Walnut Drive', 'Cheasapeake',
--            'VA', 'USA','23321', '7574216559', 'MargS@infi.net', 'MaryS',
--            'pupper', '03-FEB-2012');
--insert into SS_shopper
--    values (23, 'Kenny', 'Ratman', '1 Fun Lane', 'South Park',
--            'NC', 'USA','54674', '9015680902', 'ratboy@msn.net', 'rat55',
--            'kile', '26-JAN-2012');
--insert into SS_shopper
--    values (24, 'Camryn', 'Sonnie', '40162 Talamore', 'South Riding',
--            'VA','20152', '7035556868', NULL, 'kids2@xis.net', 'kids2',
--            'steel', 1, '19-MAR-2012', NULL, 'USA');
--insert into SS_shopper
--    values (25, 'Scott', 'Savid', '11 Pine Grove', 'Hickory',
--            'VA','22954', '7578221010', NULL, 'scott1@odu.edu', 'fdwell',
--            'tweak', 1, '19-FEB-2012', NULL, 'USA');
--insert into SS_shopper
--    values (26, 'Monica', 'Cast', '112 W. 4th', 'Greensburg',
--            'VA','27754', '7573217384', NULL, 'gma@earth.net', 'gma1',
--            'goofy', 1, '09-FEB-2012', NULL, 'USA');
--insert into SS_shopper
--    values (27, 'Pete', 'Parker', '1 Queens', 'New York',
--            'NY','67233', '1013217384', NULL, 'spider@web.net', '',
--            '', 0, '14-FEB-2012', NULL, 'USA');
--ALter table SS_shopper
--  ADD (promo CHAR(1));
--CREATE TABLE SS_Basket (
--	idBasket number(5),
--	Quantity number(2),
--	idShopper number(4),
--	OrderPlaced number(1),
--	SubTotal number(7,2),
--	Total number(7,2),
--	Shipping number(5,2),
--	Tax number(5,2),
--	dtCreated date DEFAULT SYSDATE,
--	Promo number(2),
--	ShipFirstName varchar2(10),
--	ShipLastName varchar2(20),
--	ShipAddress varchar2(40),
--	ShipCity varchar2(20),
--	ShipState varchar2(2),
--	ShipZipCode varchar2(15),
--	ShipPhone varchar2(10),
--	ShipFax varchar2(10),
--	ShipEmail varchar2(25),
--	BillFirstName varchar2(10),
--	BillLastName varchar2(20),
--	BillAddress varchar2(40),
--	BillCity varchar2(20),
--	BillState varchar2(2),
--	BillZipCode varchar2(15),
--	BillPhone varchar2(10),
--	BillFax varchar2(10),
--	BillEmail varchar2(25),
--	dtOrdered date DEFAULT SYSDATE,
--	ShipProvince varchar2(20),
--	ShipCountry varchar2(20),
--	BillProvince varchar2(20),
--	BillCountry varchar2(20),
--	CardType char(1) ,
--	CardNumber varchar2(20) ,
--	ExpMonth char(2),
--        ExpYear char(4),
--	CardName varchar2(25),
--        shipbill char(1) default 'N',
--        ShipFlag char(1) default 'N',
--        CONSTRAINT bskt_id_pk PRIMARY KEY(idBasket),
--         CONSTRAINT bskt_idshopper_fk FOREIGN KEY (idShopper)
--           REFERENCES SS_Shopper(idShopper) );
--Create sequence SS_idBasket_seq
--   start with 25;
--insert into SS_basket (idbasket, quantity, idshopper,orderplaced, subtotal, total, shipping, tax, dtcreated, promo)
--    values (3, 3, 21, 1, 26.60, 32.40, 5.00, .80, '23-JAN-2012',0);
--insert into SS_basket (idbasket, quantity, idshopper,orderplaced, subtotal, total, shipping, tax, dtcreated, promo)
--    values (4, 1, 21, 1, 28.50, 34.36, 5.00, .86, '12-FEB-2012',0);
--insert into SS_basket (idbasket, quantity, idshopper,orderplaced, subtotal, total, shipping, tax, dtcreated, promo)
--    values (5, 4, 22, 1, 41.60, 48.47, 5.00, 1.87, '19-FEB-2012',0);
--insert into SS_basket (idbasket, quantity, idshopper,orderplaced, subtotal, total, shipping, tax, dtcreated, promo)
--    values (6, 3, 22, 1, 149.99, 161.74, 5.00, 6.75, '01-MAR-2012',0);
--insert into SS_basket (idbasket, quantity, idshopper,orderplaced, subtotal, total, shipping, tax, dtcreated, promo)
--    values (7, 2, 23, 1, 21.60, 27.25, 5.00, .65, '26-JAN-2012',0);
--insert into SS_basket (idbasket, quantity, idshopper,orderplaced, subtotal, total, shipping, tax, dtcreated, promo)
--    values (8, 2, 23, 1, 21.60, 27.25, 5.00, .65, '16-FEB-2012',0);
--insert into SS_basket (idbasket, quantity, idshopper,orderplaced, subtotal, total, shipping, tax, dtcreated, promo)
--    values (9, 2, 23, 1, 21.60, 27.25, 5.00, .65, '02-MAR-2012',0);
--insert into SS_basket (idbasket, quantity, idshopper,orderplaced, subtotal, total, shipping, tax, dtcreated, promo)
--    values (10, 3, 24, 1, 38.90, 45.65, 5.00, 1.75, '07-FEB-2012',0);
--insert into SS_basket (idbasket, quantity, idshopper,orderplaced, subtotal, total, shipping, tax, dtcreated, promo)
--    values (11, 1, 24, 1, 10.00, 15.45, 5.00, .45, '27-FEB-2012',0);
--insert into SS_basket (idbasket, quantity, idshopper,orderplaced, subtotal, total, shipping, tax, dtcreated, promo)
--    values (12, 7, 25, 1, 72.40, 83.66, 8.00, 3.26, '19-FEB-2012',0);
--insert into SS_basket (idbasket, quantity, idshopper,orderplaced, subtotal, total, shipping, tax, dtcreated, promo)
--    values (13, 2, 26, 0, 20.00, 0, 0, 0, '09-FEB-2012',0);
--insert into SS_basket (idbasket, quantity, idshopper,orderplaced, subtotal, total, shipping, tax, dtcreated, promo)
--    values (14, 0, 26, 0, 0, 0, 0, 0, '10-FEB-2012',0);
--insert into SS_basket (idbasket, quantity, idshopper,orderplaced, subtotal, total, shipping, tax, dtcreated, promo)
--    values (15, 2, 27, 0, 16.20, 21.69, 5.00, .49, '14-FEB-2012',0);
--insert into SS_basket (idbasket, quantity, idshopper,orderplaced, subtotal, total, shipping, tax, dtcreated, promo)
--    values (16, 2, 27, 0, 16.20, 21.69, 5.00, .49, '24-FEB-2012',0);
--update SS_basket
-- set dtordered = dtcreated;
--update SS_basket
--  set dtordered = NULL
--  where orderplaced = 0;
--UPDATE SS_basket
--  set shipflag = 'N';
--update SS_basket
-- SET orderplaced = 0
--where idbasket = 12;
--CREATE TABLE SS_basketItem (
--	idBasketItem number(2),
--	idAdvertisement number(2),
--	Price number(6,2),
--	Quantity number(2),
--	idBasket number(5) ,
--	option1 number(2),
--	option2 number(2),
--	CONSTRAINT bsktitem_id_pk PRIMARY KEY (idBasketItem),
--        CONSTRAINT bsktitem_bsktid_fk FOREIGN KEY (idBasket) 
--          REFERENCES SS_Basket(idBasket),
--        CONSTRAINT bsktitem_idprod_fk FOREIGN KEY (idAdvertisement) 
--          REFERENCES SS_Advertisement(idAdvertisement) );
--Create sequence SS_idBasketitem_seq
--  start with 50;
--insert into SS_basketItem
--      values (15, 6, 5.00, 1, 3, 1, 4);
--insert into SS_basketItem
--      values (16, 8, 10.80, 2, 3, 2, 4);
--insert into SS_basketItem
--      values (17, 4, 28.50, 1, 4, NULL, NULL);
--insert into SS_basketItem
--      values (18, 7, 10.80, 1, 5, 2, 3);
--insert into SS_basketItem
--      values (19, 8, 10.80, 1, 5, 2, 3);
--insert into SS_basketItem
--      values (20, 9, 10.00, 1, 5, 2, 3);
--insert into SS_basketItem
--      values (21, 10, 10.00, 1, 5, 2, 3);
--insert into SS_basketItem
--      values (22, 10, 10.00, 2, 6, 2, 4);
--insert into SS_basketItem
--      values (23, 2, 129.99, 1, 6, NULL, NULL);
--insert into SS_basketItem
--      values (24, 7, 10.80, 1, 7, 2, 3);
--insert into SS_basketItem
--      values (25, 8, 10.80, 1, 7, 2, 3);
--insert into SS_basketItem
--      values (26, 7, 10.80, 1, 8, 2, 3);
--insert into SS_basketItem
--      values (27, 8, 10.80, 1, 8, 2, 3);
--insert into SS_basketItem
--      values (28, 7, 10.80, 1, 9, 2, 3);
--insert into SS_basketItem
--      values (29, 8, 10.80, 1, 9, 2, 3);
--insert into SS_basketItem
--      values (30, 6, 5.00,  1, 10, 1, 3);
--insert into SS_basketItem
--      values (31, 8, 5.40,  1, 10, 1, 3);
--insert into SS_basketItem
--      values (32, 4, 28.50, 1, 10, NULL, NULL);
--insert into SS_basketItem
--      values (33, 9, 10.00, 1, 11, 2, 3);
--insert into SS_basketItem
--      values (34, 8, 10.80, 2, 12, 2, 3);
--insert into SS_basketItem
--      values (35, 9, 10.00, 2, 12, 2, 3);
--insert into SS_basketItem
--      values (36, 6, 10.00, 2, 12, 2, 3);
--insert into SS_basketItem
--      values (37, 7, 10.80, 1, 12, 2, 3);
--insert into SS_basketItem
--      values (38, 9, 10.00, 2, 13, 2, 3);
--insert into SS_basketItem
--      values (40, 8, 10.80, 1, 15, 2, 3);
--insert into SS_basketItem
--      values (41, 7, 5.40, 1, 15, 1, 3);
--insert into SS_basketItem
--      values (42, 8, 10.80, 1, 16, 2, 3);
--insert into SS_basketItem
--      values (43, 7, 5.40, 1, 16, 1, 3);
--CREATE TABLE SS_Shipping (
--	idRange NUMBER(2),
--	Low NUMBER(3),
--	High NUMBER(3),
--	Fee NUMBER(6,2),
--	CONSTRAINT ship_idrange_pk PRIMARY KEY (idRange) ); 
--INSERT INTO SS_shipping  VALUES(1,1,5,5.00);
--INSERT INTO SS_shipping  VALUES(2,6,10,8.00);
--INSERT INTO SS_shipping  VALUES(3,11,99,11.00);
--CREATE TABLE SS_BasketStatus (
--	idStatus number(5),
--	idBasket number(5),
--	idStage number(1),
--	dtStage date,
--	Notes varchar2(50),
--        shipper varchar2(5),
--	ShippingNum varchar2(20),
--	CONSTRAINT  basketstatus_pk PRIMARY KEY (idStatus),
--        CONSTRAINT BasketStatus_idBasket_fk FOREIGN KEY (idBasket)
--          REFERENCES SS_basket(idBasket) );
--CREATE SEQUENCE SS_status_seq start with 15;
--INSERT INTO SS_basketstatus (idstatus, idbasket, idstage, dtstage)
--     VALUES (1,3,1,'24-JAN-2012');
--INSERT INTO SS_basketstatus (idstatus, idbasket, idstage, dtstage)
--     VALUES (2,3,5,'25-JAN-2012');
--INSERT INTO SS_basketstatus (idstatus, idbasket, idstage, dtstage)
--     VALUES (3,4,1,'13-FEB-2012');
--INSERT INTO SS_basketstatus (idstatus, idbasket, idstage, dtstage)
--     VALUES (4,4,5,'14-FEB-2012');
--INSERT INTO SS_basketstatus
--   VALUES (SS_status_seq.NEXTVAL, 12, 3, NULL, NULL, NULL, NULL);
--update SS_basketstatus
--  SET shipper = 'UPS', shippingnum = 'ZW845584GD89H569',
--                  notes = 'Customer called to confirm shipment'
-- WHERE idstatus = 2;
--create view SS_basketitem_vu as
--   select * from SS_basketitem;
--create table SS_prod_sales (
--     idAdvertisement NUMBER(2),
--     month char(3),
--     year char(4),
--     qty number(5),
--     total number(6,2) );
--create table SS_shop_sales (
--     idshopper NUMBER(4),
--     total number(6,2) );
--CREATE SEQUENCE SS_prodreq_seq;
--CREATE OR REPLACE VIEW SS_ship_vu
-- AS SELECT b.idbasket, b.shipflag, bs.idstage, bs.dtstage, bs.notes,
--            bs.shipper, bs.shippingnum
--      FROM SS_basket b, SS_basketstatus bs
--      WHERE b.idBasket = bs.idBasket;
--CREATE TABLE SS_audit_logon
--  ( userid VARCHAR2(10),
--    logdate DATE );
--UPDATE SS_basket
--  SET shipfirstname='John',shiplastname='Carter',
--      shipaddress='21 Front St.',shipcity='Raleigh',
--      shipstate='NC',shipzipcode='54822'
--   WHERE idBasket = 4;
--UPDATE SS_basket
--  SET shipfirstname='Margaret',shiplastname='Somner',
--      shipaddress='287 Walnut Drive',shipcity='Chesapeake',
--      shipstate='VA',shipzipcode='23321'
--   WHERE idBasket = 6;
--COMMIT;
--