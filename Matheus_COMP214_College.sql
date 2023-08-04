--DROP VIEW SS_basketitem_vu;
--DROP VIEW SS_ship_vu;
DROP TABLE SS_category CASCADE CONSTRAINTS;
DROP TABLE SS_Advertisement CASCADE CONSTRAINTS;
DROP TABLE SS_Shopper CASCADE CONSTRAINTS;
DROP TABLE SS_Cart CASCADE CONSTRAINTS;
DROP TABLE SS_CartItem CASCADE CONSTRAINTS;
DROP TABLE SS_Shipping CASCADE CONSTRAINTS;
DROP TABLE SS_CartStatus CASCADE CONSTRAINTS;
DROP TABLE SS_Cat_Sales CASCADE CONSTRAINTS;
DROP TABLE SS_Shop_Sales CASCADE CONSTRAINTS;
DROP TABLE SS_Audit_Logon CASCADE CONSTRAINTS;


--DROP TABLE SS_Advertisementoption CASCADE CONSTRAINTS;
--DROP TABLE SS_Advertisementoptiondetail CASCADE CONSTRAINTS;
--DROP TABLE SS_Advertisementoptioncategory CASCADE CONSTRAINTS;
--DROP TABLE SS_basketitem CASCADE CONSTRAINTS;
--DROP TABLE SS_basket CASCADE CONSTRAINTS;
--DROP TABLE SS_basketstatus CASCADE CONSTRAINTS;
--DROP TABLE SS_tax CASCADE CONSTRAINTS;
--DROP TABLE SS_promolist CASCADE CONSTRAINTS;
--DROP TABLE SS_promo CASCADE CONSTRAINTS;
--DROP TABLE SS_test1 CASCADE CONSTRAINTS;
--DROP TABLE SS_test2 CASCADE CONSTRAINTS;
--DROP TABLE SS_audit_logon CASCADE CONSTRAINTS;
--DROP TABLE SS_Advertisement_request CASCADE CONSTRAINTS;
--DROP TABLE SS_blocktest CASCADE CONSTRAINTS;
--DROP TABLE SS_trans_log CASCADE CONSTRAINTS;


DROP SEQUENCE SS_categoryId_seq;
DROP SEQUENCE SS_advertisementId_seq;
DROP SEQUENCE SS_shopper_seq;
DROP SEQUENCE SS_CartId_seq;
DROP SEQUENCE SS_CartItemId_seq;
DROP SEQUENCE SS_RangeId_seq;
DROP SEQUENCE SS_Status_seq;
DROP SEQUENCE SS_Cat_Sales_seq;

--DROP SEQUENCE SS_adid_seq;
--DROP SEQUENCE SS_poption_seq;
--DROP SEQUENCE SS_idbasket_seq;
--DROP SEQUENCE SS_idbasketitem_seq;
--DROP SEQUENCE SS_status_seq;
--DROP SEQUENCE SS_prodreq_seq;
--DROP SEQUENCE SS_cat_sales_seq;

-- ################### Category ####################
CREATE SEQUENCE SS_categoryId_seq;
--###########Table 1###########
CREATE TABLE SS_category (
	categoryId number(2),
	categoryName varchar2(25),
	categoryDesc varchar2(100),
	CONSTRAINT cat_id_pk PRIMARY KEY(categoryId) );
insert into SS_category 
   values(SS_categoryId_seq.nextval,'Art','Painting, Sculpture, and more');
insert into SS_category 
   values(SS_categoryId_seq.nextval,'Books','Textbooks, magazines, romances, and more');
insert into SS_category 
   values(SS_categoryId_seq.nextval,'Clothes','Shirts, pants, underwear, and more');
insert into SS_category 
   values(SS_categoryId_seq.nextval,'Eletronics','Computers, cellphones, and more');
insert into SS_category 
   values(SS_categoryId_seq.nextval,'Furniture','Sofas, beds, tables, and more');
insert into SS_category 
   values(SS_categoryId_seq.nextval,'Musical Instruments','Guitars, Pianos, Drums, and more');
insert into SS_category 
   values(SS_categoryId_seq.nextval,'Real State','Houses, apartments, offices, and more for buy or rent');
insert into SS_category 
   values(SS_categoryId_seq.nextval,'Tools','cars, motorcycles, bicycles, and more');
insert into SS_category 
   values(SS_categoryId_seq.nextval,'Toys','Board games, dolls, video games, and more');
insert into SS_category 
   values(SS_categoryId_seq.nextval,'Vehicles','Cars, motorcycles, bicycles, and more');

-- ################### Advertisement ####################
CREATE SEQUENCE SS_advertisementId_seq;
--###########Table 2###########
CREATE TABLE SS_Advertisement (
	advertisementId number,
	advertisementTitle varchar2(25) ,
	advertisementDescription varchar2(200) ,
	advertisementImage blob,
	price number(10,2),
    sold char(1),
	active char(1),
    new char(1),
	saleStart date,
	saleEnd date,
	salePrice number(6,2),
	stock number(5),
    idcategory number(2),
	 CONSTRAINT advertisement_id_pk PRIMARY KEY(advertisementId),
         CONSTRAINT advertisement_idCategory_fk FOREIGN KEY (idcategory)
           REFERENCES SS_category (categoryId) );


INSERT INTO SS_Advertisement (advertisementId, advertisementTitle, advertisementDescription, advertisementImage, price, sold, active, new, saleStart, saleEnd, salePrice, stock, idcategory)
VALUES (SS_advertisementId_seq.nextval,'Rich Dad Poor Dad','Rich Dad Poor Dad is the #1 personal finance book of all time. 
 Buy today to set yourself up for a wealthy, happy future.',EMPTY_BLOB(), 99.99, 'N', 'Y', 'Y', TO_DATE('2023-08-01', 'YYYY-MM-DD'), TO_DATE('2023-08-15', 'YYYY-MM-DD'), 89.99, 100, 2);

INSERT INTO SS_Advertisement (advertisementId, advertisementTitle, advertisementDescription, advertisementImage, price, sold, active, new, saleStart, saleEnd, salePrice, stock, idcategory)
VALUES (SS_advertisementId_seq.nextval,'Nike Air Jordan 1','Own the OG Nike Sneakers in white.',
EMPTY_BLOB(), 149.99, 'N', 'Y', 'Y', TO_DATE('2023-08-01', 'YYYY-MM-DD'), TO_DATE('2023-08-15', 'YYYY-MM-DD'), 129.99, 200, 3);

INSERT INTO SS_Advertisement (advertisementId, advertisementTitle, advertisementDescription, advertisementImage, price, sold, active, new, saleStart, saleEnd, salePrice, stock, idcategory)
VALUES (SS_advertisementId_seq.nextval,'Adidas track pants','Meet your new favorite track pants. These adidas Firebird track pants were made for icons',
EMPTY_BLOB(), 99.99, 'N', 'Y', 'Y', TO_DATE('2023-08-01', 'YYYY-MM-DD'), TO_DATE('2023-08-15', 'YYYY-MM-DD'), 89.99, 100, 3);

INSERT INTO SS_Advertisement (advertisementId, advertisementTitle, advertisementDescription, advertisementImage, price, sold, active, new, saleStart, saleEnd, salePrice, stock, idcategory)
VALUES (SS_advertisementId_seq.nextval,'Airpods 2nd Gen','These airpods are almost as good as new ones. They work perfectly.',
EMPTY_BLOB(), 59.99, 'N', 'Y', 'N', TO_DATE('2023-08-01', 'YYYY-MM-DD'), TO_DATE('2023-08-15', 'YYYY-MM-DD'), 59.99, 1, 4);

INSERT INTO SS_Advertisement (advertisementId, advertisementTitle, advertisementDescription, advertisementImage, price, sold, active, new, saleStart, saleEnd, salePrice, stock, idcategory)
VALUES (SS_advertisementId_seq.nextval,'Bed Mattress','Used for an year and a half. The mattress is very comfortable and has minimal stains.',
EMPTY_BLOB(), 39.99, 'N', 'Y', 'N', TO_DATE('2023-08-01', 'YYYY-MM-DD'), TO_DATE('2023-08-15', 'YYYY-MM-DD'), 39.99, 2, 5);

INSERT INTO SS_Advertisement (advertisementId, advertisementTitle, advertisementDescription, advertisementImage, price, sold, active, new, saleStart, saleEnd, salePrice, stock, idcategory)
VALUES (SS_advertisementId_seq.nextval,'Honda Civic 2016','2016 built Honda Civic. Blue color. Used for 109k kms.',
EMPTY_BLOB(), 9999.99, 'N', 'Y', 'N', TO_DATE('2023-08-01', 'YYYY-MM-DD'), TO_DATE('2023-08-15', 'YYYY-MM-DD'), 8889.99, 1, 10);

INSERT INTO SS_Advertisement (advertisementId, advertisementTitle, advertisementDescription, advertisementImage, price, sold, active, new, saleStart, saleEnd, salePrice, stock, idcategory)
VALUES (SS_advertisementId_seq.nextval,'Barbie doll','New Barbie merchandise from Mattel. Exclusive to Canada.',
EMPTY_BLOB(), 69.99, 'N', 'Y', 'Y', TO_DATE('2023-08-01', 'YYYY-MM-DD'), TO_DATE('2023-08-15', 'YYYY-MM-DD'), 69.99, 75, 9);

INSERT INTO SS_Advertisement (advertisementId, advertisementTitle, advertisementDescription, advertisementImage, price, sold, active, new, saleStart, saleEnd, salePrice, stock, idcategory)
VALUES (SS_advertisementId_seq.nextval,'Drilling Machine','My old drilling machine is up for sale because I do not use it no more.',
EMPTY_BLOB(), 39.99, 'N', 'Y', 'N', TO_DATE('2023-08-01', 'YYYY-MM-DD'), TO_DATE('2023-08-15', 'YYYY-MM-DD'), 35.99, 1, 8);

INSERT INTO SS_Advertisement (advertisementId, advertisementTitle, advertisementDescription, advertisementImage, price, sold, active, new, saleStart, saleEnd, salePrice, stock, idcategory)
VALUES (SS_advertisementId_seq.nextval,'Electric Guitar','Are you into heavy metal music? You found the right instrument for you.',
EMPTY_BLOB(), 199.99, 'N', 'Y', 'Y', TO_DATE('2023-08-01', 'YYYY-MM-DD'), TO_DATE('2023-08-15', 'YYYY-MM-DD'), 189.99, 15, 6);

INSERT INTO SS_Advertisement (advertisementId, advertisementTitle, advertisementDescription, advertisementImage, price, sold, active, new, saleStart, saleEnd, salePrice, stock, idcategory)
VALUES (SS_advertisementId_seq.nextval,'Sculpture of Prometheus','Sculpture of Prometheus. he gave fire to humans. He was chained and punished for it.',
EMPTY_BLOB(), 9.99, 'N', 'Y', 'Y', TO_DATE('2023-08-01', 'YYYY-MM-DD'), TO_DATE('2023-08-15', 'YYYY-MM-DD'), 8.99, 1, 1);

-- ################### SHOPPER ####################
--###########Table 3###########
CREATE TABLE SS_Shopper (
	shopperId number,
	FirstName varchar2(15),
	LastName varchar2(20),
	Address varchar2(40),
	City varchar2(20),
	Province char(2),
	Country varchar2(15),
	ZipCode varchar2(15),
	Phone varchar2(10),
	Email varchar2(25),
	UserName varchar2(8),
	Password varchar2(16),
	dtEntered date DEFAULT SYSDATE,
	CONSTRAINT SS_shopper_id_pk PRIMARY KEY(shopperId) );

create sequence SS_shopper_seq
  start with 1001;

-- Entry 1
INSERT INTO SS_shopper
    values (SS_shopper_seq.nextval, 'John', 'Doe', '21 Front St.', 'Scarborough',
            'ON', 'Canada','A2H2E2', '9014317701', 'JohnD@aol.com', 'JohnD',
            'Spotsalescool1', '13-JAN-2023');
-- Entry 2
INSERT INTO SS_shopper
    values (SS_shopper_seq.nextval, 'Maria', 'Somner', '287 Walnut Drive', 'Calgary',
            'AB', 'Canada','H3K4B2', '7574216559', 'MarS@infi.net', 'MarS',
            'Mypassword1@', '03-FEB-2023');
-- Entry 3
INSERT INTO SS_shopper 
VALUES (SS_shopper_seq.nextval, 'Michael', 'Smith', '123 Main St.', 'Vancouver',
        'BC', 'Canada', 'V6C3K9', '6049876543', 'm.smith@example.com', 'miksmith',
        'P@ssw0rd123', '15-MAR-2023');

-- Entry 4
INSERT INTO SS_shopper 
VALUES (SS_shopper_seq.nextval, 'Emily', 'Johnson', '456 Oak Ave.', 'Toronto',
        'ON', 'Canada', 'M4B2R7', '4167890123', 'emily.j@example.com', 'emilyj',
        'Qwerty!23', '27-APR-2023');

-- Entry 5
INSERT INTO SS_shopper 
VALUES (SS_shopper_seq.nextval, 'David', 'Lee', '789 Elm St.', 'Montreal',
        'QC', 'Canada', 'H1A3S6', '5142345678', 'davidl@example.com', 'davidlee',
        'Pa$$word456', '10-MAY-2023');

-- Entry 6
INSERT INTO SS_shopper 
VALUES (SS_shopper_seq.nextval, 'Sarah', 'Wilson', '987 Pine Ave.', 'Ottawa',
        'ON', 'Canada', 'K2P1Z8', '6135432198', 's.wilson@example.com', 'sarahw',
        'MySecr3t!', '22-JUN-2023');

-- Entry 7
INSERT INTO SS_shopper 
VALUES (SS_shopper_seq.nextval, 'Andrew', 'Anderson', '111 Cherry St.', 'Edmonton',
        'AB', 'Canada', 'T5J2S4', '7807654321', 'a.anderson@example.com', 'andrewa',
        'Pass123$', '05-JUL-2023');

-- Entry 8
INSERT INTO SS_shopper 
VALUES (SS_shopper_seq.nextval, 'Olivia', 'Brown', '222 Maple Ave.', 'Winnipeg',
        'MB', 'Canada', 'R3B1P7', '2048765432', 'olivia.b@example.com', 'oliviab',
        'P@ssword987', '18-AUG-2023');

-- Entry 9
INSERT INTO SS_shopper 
VALUES (SS_shopper_seq.nextval, 'William', 'Taylor', '333 Birch Rd.', 'Quebec City',
        'QC', 'Canada', 'G1R2V3', '4189876543', 'wtaylor@example.com', 'willt',
        'Taylored1!', '30-SEP-2023');

-- Entry 10
INSERT INTO SS_shopper 
VALUES (SS_shopper_seq.nextval, 'Sophia', 'Martin', '444 Cedar St.', 'Halifax',
        'NS', 'Canada', 'B3J1R7', '9026543210', 's.martin@example.com', 'sophiam',
        'M@rtin567', '12-OCT-2023');



--ALter table SS_shopper
--  ADD (promo CHAR(1));

--###########Table 4###########
CREATE TABLE SS_Cart (
	CartId number(5),
	Quantity number(2),
	ShopperId number(4),
	OrderPlaced number(1),
	SubTotal number(7,2),
	Total number(7,2),
	Shipping number(5,2),
	Tax number(5,2),
	dtCreated date DEFAULT SYSDATE,
	Promo number(2),
	ShipFirstName varchar2(10),
	ShipLastName varchar2(20),
	ShipAddress varchar2(40),
	ShipCity varchar2(20),
	ShipState varchar2(2),
	ShipZipCode varchar2(15),
	ShipPhone varchar2(10),
	ShipFax varchar2(10),
	ShipEmail varchar2(25),
	ShipProvince varchar2(20),
	ShipCountry varchar2(20),
	BillFirstName varchar2(10),
	BillLastName varchar2(20),
	BillAddress varchar2(40),
	BillCity varchar2(20),
	BillState varchar2(2),
	BillZipCode varchar2(15),
	BillPhone varchar2(10),
	BillFax varchar2(10),
	BillEmail varchar2(25),
	BillProvince varchar2(20),
	BillCountry varchar2(20),
	dtOrdered date DEFAULT SYSDATE,
	CardType char(1) ,
	CardNumber varchar2(20) ,
	ExpMonth char(2),
        ExpYear char(4),
	CardName varchar2(25),
        shipbill char(1) default 'N',
        ShipFlag char(1) default 'N',
        CONSTRAINT SS_cart_id_pk PRIMARY KEY(CartId),
         CONSTRAINT SS_cart_shopperId_fk FOREIGN KEY (ShopperId)
           REFERENCES SS_Shopper(ShopperId) );
           
CREATE SEQUENCE SS_CartId_seq
   start with 20;

-- Insert 1
INSERT INTO SS_Cart (CartId, Quantity, shopperId, OrderPlaced, SubTotal, Total, Shipping, Tax,
                       ShipFirstName, ShipLastName, ShipAddress, ShipCity, ShipState, ShipZipCode,
                       ShipPhone, ShipEmail, BillFirstName, BillLastName, BillAddress, BillCity,
                       BillState, BillZipCode, BillPhone, BillEmail, CardType, CardNumber, ExpMonth,
                       ExpYear, CardName)
                       
VALUES (SS_CartId_seq.nextval, 2, 1001, 1, 60.00, 50.50, 6.50, 3.00,
        'John', 'Doe', '21 Front St.', 'Scarborough', 'ON', 'A2H2E2',
        '9014317701', 'JohnD@aol.com', 'John', 'Doe', '21 Front St.', 'Scarborough',
        'ON', 'A2H2E2', '9014317701', 'JohnD@aol.com', 'V', '************1234', '12', '2025', 'John Doe');

-- Insert 2
INSERT INTO SS_Cart (CartId, Quantity, shopperId, OrderPlaced, SubTotal, Total, Shipping, Tax,
                       ShipFirstName, ShipLastName, ShipAddress, ShipCity, ShipState, ShipZipCode,
                       ShipPhone, ShipEmail, BillFirstName, BillLastName, BillAddress, BillCity,
                       BillState, BillZipCode, BillPhone, BillEmail, CardType, CardNumber, ExpMonth,
                       ExpYear, CardName)
VALUES (SS_CartId_seq.nextval, 1, 1002, 1, 41.00, 34.50, 4.50, 2.00,
        'Maria', 'Somner', '287 Walnut Drive', 'Calgary', 'AB', 'H3K4B2',
        '7574216559', 'MarS@infi.net', 'Maria', 'Somner', '287 Walnut Drive', 'Calgary',
        'AB', 'H3K4B2', '7574216559', 'MarS@infi.net', 'M', '************5678', '09', '2026', 'Maria Somner');

-- Insert 3
INSERT INTO SS_Cart (CartId, Quantity, shopperId, OrderPlaced, SubTotal, Total, Shipping, Tax,
                       ShipFirstName, ShipLastName, ShipAddress, ShipCity, ShipState, ShipZipCode,
                       ShipPhone, ShipEmail, BillFirstName, BillLastName, BillAddress, BillCity,
                       BillState, BillZipCode, BillPhone, BillEmail, CardType, CardNumber, ExpMonth,
                       ExpYear, CardName)
VALUES (SS_CartId_seq.nextval, 3, 1003, 0, 299.97, 299.97, 0.00, 0.00,
        'Michael', 'Smith', '123 Main St.', 'Vancouver', 'BC', 'V6C3K9',
        '6049876543', 'm.smith@example.com', 'Michael', 'Smith', '123 Main St.', 'Vancouver',
        'BC', 'V6C3K9', '6049876543', 'm.smith@example.com', 'A', '************9876', '06', '2024', 'Michael Smith');

-- Insert 4
INSERT INTO SS_Cart (CartId, Quantity, shopperId, OrderPlaced, SubTotal, Total, Shipping, Tax,
                       ShipFirstName, ShipLastName, ShipAddress, ShipCity, ShipState, ShipZipCode,
                       ShipPhone, ShipEmail, BillFirstName, BillLastName, BillAddress, BillCity,
                       BillState, BillZipCode, BillPhone, BillEmail, CardType, CardNumber, ExpMonth,
                       ExpYear, CardName)
VALUES (SS_CartId_seq.nextval, 2, 1004, 1, 52.40, 45.20, 5.20, 2.00,
        'Emily', 'Johnson', '456 Oak Ave.', 'Toronto', 'ON', 'M4B2R7',
        '4167890123', 'emily.j@example.com', 'Emily', 'Johnson', '456 Oak Ave.', 'Toronto',
        'ON', 'M4B2R7', '4167890123', 'emily.j@example.com', 'V', '************2345', '11', '2025', 'Emily Johnson');

-- Insert 5
INSERT INTO SS_Cart (CartId, Quantity, shopperId, OrderPlaced, SubTotal, Total, Shipping, Tax,
                       ShipFirstName, ShipLastName, ShipAddress, ShipCity, ShipState, ShipZipCode,
                       ShipPhone, ShipEmail, BillFirstName, BillLastName, BillAddress, BillCity,
                       BillState, BillZipCode, BillPhone, BillEmail, CardType, CardNumber, ExpMonth,
                       ExpYear, CardName)
VALUES (SS_CartId_seq.nextval, 1, 1005, 0, 20.00, 20.00, 0.00, 0.00,
        'David', 'Lee', '789 Elm St.', 'Montreal', 'QC', 'H1A3S6',
        '5142345678', 'davidl@example.com', 'David', 'Lee', '789 Elm St.', 'Montreal',
        'QC', 'H1A3S6', '5142345678', 'davidl@example.com', 'M', '************4567', '04', '2023', 'David Lee');

-- Insert 6
INSERT INTO SS_Cart (CartId, Quantity, shopperId, OrderPlaced, SubTotal, Total, Shipping, Tax,
                       ShipFirstName, ShipLastName, ShipAddress, ShipCity, ShipState, ShipZipCode,
                       ShipPhone, ShipEmail, BillFirstName, BillLastName, BillAddress, BillCity,
                       BillState, BillZipCode, BillPhone, BillEmail, CardType, CardNumber, ExpMonth,
                       ExpYear, CardName)
VALUES (SS_CartId_seq.nextval, 4, 1006, 1, 78.60, 67.80, 7.80, 3.00,
        'Sarah', 'Wilson', '987 Pine Ave.', 'Ottawa', 'ON', 'K2P1Z8',
        '6135432198', 's.wilson@example.com', 'Sarah', 'Wilson', '987 Pine Ave.', 'Ottawa',
        'ON', 'K2P1Z8', '6135432198', 's.wilson@example.com', 'A', '************7654', '10', '2023', 'Sarah Wilson');

-- Insert 7
INSERT INTO SS_Cart (CartId, Quantity, shopperId, OrderPlaced, SubTotal, Total, Shipping, Tax,
                       ShipFirstName, ShipLastName, ShipAddress, ShipCity, ShipState, ShipZipCode,
                       ShipPhone, ShipEmail, BillFirstName, BillLastName, BillAddress, BillCity,
                       BillState, BillZipCode, BillPhone, BillEmail, CardType, CardNumber, ExpMonth,
                       ExpYear, CardName)
VALUES (SS_CartId_seq.nextval, 2, 1010, 1, 92.20, 79.10, 9.10, 4.00,
        'Sophia', 'Martin', '444 Cedar St.', 'Halifax', 'NS', 'B3J1R7',
        '9026543210', 's.martin@example.com', 'Sophia', 'Martin', '444 Cedar St.', 'Halifax',
        'NS', 'B3J1R7', '9026543210', 's.martin@example.com', 'V', '************3210', '02', '2026', 'Sophia Martin');

-- Insert 8
INSERT INTO SS_Cart (CartId, Quantity, shopperId, OrderPlaced, SubTotal, Total, Shipping, Tax,
                       ShipFirstName, ShipLastName, ShipAddress, ShipCity, ShipState, ShipZipCode,
                       ShipPhone, ShipEmail, BillFirstName, BillLastName, BillAddress, BillCity,
                       BillState, BillZipCode, BillPhone, BillEmail, CardType, CardNumber, ExpMonth,
                       ExpYear, CardName)
VALUES (SS_CartId_seq.nextval, 1, 1007, 0, 129.99, 129.99, 0.00, 0.00,
        'Andrew', 'Anderson', '111 Cherry St.', 'Edmonton', 'AB', 'T5J2S4',
        '7807654321', 'a.anderson@example.com', 'Andrew', 'Anderson', '111 Cherry St.', 'Edmonton',
        'AB', 'T5J2S4', '7807654321', 'a.anderson@example.com', 'M', '************5432', '07', '2023', 'Andrew Anderson');

-- Insert 9
INSERT INTO SS_Cart (CartId, Quantity, shopperId, OrderPlaced, SubTotal, Total, Shipping, Tax,
                       ShipFirstName, ShipLastName, ShipAddress, ShipCity, ShipState, ShipZipCode,
                       ShipPhone, ShipEmail, BillFirstName, BillLastName, BillAddress, BillCity,
                       BillState, BillZipCode, BillPhone, BillEmail, CardType, CardNumber, ExpMonth,
                       ExpYear, CardName)
VALUES (SS_CartId_seq.nextval, 3, 1008, 1, 66.00, 56.50, 6.50, 3.00,
        'Olivia', 'Brown', '222 Maple Ave.', 'Winnipeg', 'MB', 'R3B1P7',
        '2048765432', 'olivia.b@example.com', 'Olivia', 'Brown', '222 Maple Ave.', 'Winnipeg',
        'MB', 'R3B1P7', '2048765432', 'olivia.b@example.com', 'V', '************8765', '08', '2025', 'Olivia Brown');

-- Insert 10
INSERT INTO SS_Cart (CartId, Quantity, shopperId, OrderPlaced, SubTotal, Total, Shipping, Tax,
                       ShipFirstName, ShipLastName, ShipAddress, ShipCity, ShipState, ShipZipCode,
                       ShipPhone, ShipEmail, BillFirstName, BillLastName, BillAddress, BillCity,
                       BillState, BillZipCode, BillPhone, BillEmail, CardType, CardNumber, ExpMonth,
                       ExpYear, CardName)
VALUES (SS_CartId_seq.nextval, 2, 1006, 0, 99.98, 99.98, 0.00, 0.00,
        'Sarah', 'Wilson', '987 Pine Ave.', 'Ottawa', 'ON', 'K2P1Z8',
        '6135432198', 's.wilson@example.com', 'Sarah', 'Wilson', '987 Pine Ave.', 'Ottawa',
        'ON', 'K2P1Z8', '6135432198', 's.wilson@example.com', 'A', '************7654', '10', '2023', 'Sarah Wilson');




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

--###########Table 5###########
CREATE TABLE SS_CartItem (
	CartItemId number(2),
	AdvertisementId number(2),
	Price number(6,2),
	Quantity number(2),
	CartId number(5) ,
	option1 number(2),
	option2 number(2),
	CONSTRAINT SS_CartItem_id_pk PRIMARY KEY (CartItemId),
        CONSTRAINT SS_CartItem_CartId_fk FOREIGN KEY (CartId) 
          REFERENCES SS_Cart(CartId),
        CONSTRAINT SS_CartItem_idprod_fk FOREIGN KEY (AdvertisementId) 
          REFERENCES SS_Advertisement(AdvertisementId) );
          
CREATE SEQUENCE SS_CartItemId_seq
  start with 50;

-- Insert 1
INSERT INTO SS_CartItem (CartItemId, AdvertisementId, Price, Quantity, CartId, option1, option2)
VALUES (SS_CartItemId_seq.NEXTVAL, 1, 25.50, 2, 25, 1, NULL);

-- Insert 2
INSERT INTO SS_CartItem (CartItemId, AdvertisementId, Price, Quantity, CartId, option1, option2)
VALUES (SS_CartItemId_seq.NEXTVAL, 2, 15.75, 1, 25, 2, NULL);

-- Insert 3
INSERT INTO SS_CartItem (CartItemId, AdvertisementId, Price, Quantity, CartId, option1, option2)
VALUES (SS_CartItemId_seq.NEXTVAL, 3, 50.00, 3, 26, 1, NULL);

-- Insert 4
INSERT INTO SS_CartItem (CartItemId, AdvertisementId, Price, Quantity, CartId, option1, option2)
VALUES (SS_CartItemId_seq.NEXTVAL, 4, 12.25, 2, 26, 2, NULL);

-- Insert 5
INSERT INTO SS_CartItem (CartItemId, AdvertisementId, Price, Quantity, CartId, option1, option2)
VALUES (SS_CartItemId_seq.NEXTVAL, 5, 18.99, 1, 27, 1, NULL);

-- Insert 6
INSERT INTO SS_CartItem (CartItemId, AdvertisementId, Price, Quantity, CartId, option1, option2)
VALUES (SS_CartItemId_seq.NEXTVAL, 6, 5.50, 4, 27, 3, NULL);

-- Insert 7
INSERT INTO SS_CartItem (CartItemId, AdvertisementId, Price, Quantity, CartId, option1, option2)
VALUES (SS_CartItemId_seq.NEXTVAL, 7, 10.00, 1, 28, 1, NULL);

-- Insert 8
INSERT INTO SS_CartItem (CartItemId, AdvertisementId, Price, Quantity, CartId, option1, option2)
VALUES (SS_CartItemId_seq.NEXTVAL, 8, 7.99, 2, 28, 2, NULL);

-- Insert 9
INSERT INTO SS_CartItem (CartItemId, AdvertisementId, Price, Quantity, CartId, option1, option2)
VALUES (SS_CartItemId_seq.NEXTVAL, 9, 30.75, 3, 29, 1, 1);

-- Insert 10
INSERT INTO SS_CartItem (CartItemId, AdvertisementId, Price, Quantity, CartId, option1, option2)
VALUES (SS_CartItemId_seq.NEXTVAL, 10, 9.49, 1, 29, 2, NULL);


--###########Table 6###########
CREATE TABLE SS_Shipping (
    RangeId NUMBER(3),
	Low NUMBER(3),
	High NUMBER(3),
	Fee NUMBER(6,2),
	CONSTRAINT SS_ship_idrange_pk PRIMARY KEY (RangeId) ); 

CREATE SEQUENCE SS_RangeId_seq
  start with 101;
    
-- Insert 1
INSERT INTO SS_Shipping (RangeId, Low, High, Fee)
VALUES (SS_RangeId_seq.nextval, 0, 50, 5.99);

-- Insert 2
INSERT INTO SS_Shipping (RangeId, Low, High, Fee)
VALUES (SS_RangeId_seq.nextval, 51, 100, 8.99);

-- Insert 3
INSERT INTO SS_Shipping (RangeId, Low, High, Fee)
VALUES (SS_RangeId_seq.nextval, 101, 150, 10.99);

-- Insert 4
INSERT INTO SS_Shipping (RangeId, Low, High, Fee)
VALUES (SS_RangeId_seq.nextval, 151, 200, 12.99);

-- Insert 5
INSERT INTO SS_Shipping (RangeId, Low, High, Fee)
VALUES (SS_RangeId_seq.nextval, 201, 250, 15.99);

-- Insert 6
INSERT INTO SS_Shipping (RangeId, Low, High, Fee)
VALUES (SS_RangeId_seq.nextval, 251, 300, 18.99);

-- Insert 7
INSERT INTO SS_Shipping (RangeId, Low, High, Fee)
VALUES (SS_RangeId_seq.nextval, 301, 350, 21.99);

-- Insert 8
INSERT INTO SS_Shipping (RangeId, Low, High, Fee)
VALUES (SS_RangeId_seq.nextval, 351, 400, 24.99);

-- Insert 9
INSERT INTO SS_Shipping (RangeId, Low, High, Fee)
VALUES (SS_RangeId_seq.nextval, 401, 450, 27.99);

-- Insert 10
INSERT INTO SS_Shipping (RangeId, Low, High, Fee)
VALUES (SS_RangeId_seq.nextval, 451, 500, 29.99);


--###########Table 7###########
CREATE TABLE SS_CartStatus (
	StatusId number(5),
	CartId number(5),
	StageId number(1),
	dtStage date,
	Notes varchar2(50),
        shipper varchar2(5),
	ShippingNum varchar2(20),
	CONSTRAINT  SS_CartStatus_pk PRIMARY KEY (StatusId),
        CONSTRAINT SS_CartStatus_CartId_fk FOREIGN KEY (CartId)
          REFERENCES SS_Cart(CartId) );
          
CREATE SEQUENCE SS_status_seq start with 11;

-- Insert 1
INSERT INTO SS_CartStatus (StatusId, CartId, StageId, dtStage, Notes, shipper, ShippingNum)
VALUES (SS_status_seq.NEXTVAL, 20, 1, SYSDATE, 'Order placed', 'UPS', 'UPSNY12345');

-- Insert 2
INSERT INTO SS_CartStatus (StatusId, CartId, StageId, dtStage, Notes, shipper, ShippingNum)
VALUES (SS_status_seq.NEXTVAL, 21, 1, SYSDATE, 'Order placed', 'FedEx', 'FEDEXCA67890');

-- Insert 3
INSERT INTO SS_CartStatus (StatusId, CartId, StageId, dtStage, Notes, shipper, ShippingNum)
VALUES (SS_status_seq.NEXTVAL, 22, 0, SYSDATE, 'Order not placed', null, null);

-- Insert 4
INSERT INTO SS_CartStatus (StatusId, CartId, StageId, dtStage, Notes, shipper, ShippingNum)
VALUES (SS_status_seq.NEXTVAL, 23, 1, SYSDATE, 'Order placed', 'USPS', 'USPSUS23456');

-- Insert 5
INSERT INTO SS_CartStatus (StatusId, CartId, StageId, dtStage, Notes, shipper, ShippingNum)
VALUES (SS_status_seq.NEXTVAL, 24, 0, SYSDATE, 'Order not placed', null, null);

-- Insert 6
INSERT INTO SS_CartStatus (StatusId, CartId, StageId, dtStage, Notes, shipper, ShippingNum)
VALUES (SS_status_seq.NEXTVAL, 25, 1, SYSDATE, 'Order placed', 'FedEx', 'FEDEXCA01234');

-- Insert 7
INSERT INTO SS_CartStatus (StatusId, CartId, StageId, dtStage, Notes, shipper, ShippingNum)
VALUES (SS_status_seq.NEXTVAL, 26, 1, SYSDATE, 'Order placed', 'DHL', 'DHLGER56789');

-- Insert 8
INSERT INTO SS_CartStatus (StatusId, CartId, StageId, dtStage, Notes, shipper, ShippingNum)
VALUES (SS_status_seq.NEXTVAL, 27, 0, SYSDATE, 'Order not placed', null, null);

-- Insert 9
INSERT INTO SS_CartStatus (StatusId, CartId, StageId, dtStage, Notes, shipper, ShippingNum)
VALUES (SS_status_seq.NEXTVAL, 28, 1, SYSDATE, 'Order placed', 'UPS', 'UPSNY89012');

-- Insert 10
INSERT INTO SS_CartStatus (StatusId, CartId, StageId, dtStage, Notes, shipper, ShippingNum)
VALUES (SS_status_seq.NEXTVAL, 29, 0, SYSDATE, 'Order not placed', null, null);



--update SS_basketstatus
--  SET shipper = 'UPS', shippingnum = 'ZW845584GD89H569',
--                  notes = 'Customer called to confirm shipment'
-- WHERE idstatus = 2;


--###########Table 8###########
CREATE TABLE SS_cat_sales (
    CatSalesId NUMBER(2),
     AdvertisementId NUMBER(2),
     month varchar2(3),
     year varchar2(4),
     qty number(5),
     total number(6,2),
     CONSTRAINT  SS_cat_sales_pk PRIMARY KEY (CatSalesId),
     CONSTRAINT SS_cat_sales_idAd_fk FOREIGN KEY (AdvertisementId)
          REFERENCES SS_Advertisement(AdvertisementId) );
          
CREATE SEQUENCE SS_cat_sales_seq start with 1;

-- Insert 1
INSERT INTO SS_cat_sales (CatSalesId, AdvertisementId, month, year, qty, total)
VALUES (SS_cat_sales_seq.NEXTVAL, 1, 'Jan', '2023', 100, 2500.00);

-- Insert 2
INSERT INTO SS_cat_sales (CatSalesId, AdvertisementId, month, year, qty, total)
VALUES (SS_cat_sales_seq.NEXTVAL, 2, 'Jan', '2023', 75, 1500.00);

-- Insert 3
INSERT INTO SS_cat_sales (CatSalesId, AdvertisementId, month, year, qty, total)
VALUES (SS_cat_sales_seq.NEXTVAL, 3, 'Jan', '2023', 50, 1000.00);

-- Insert 4
INSERT INTO SS_cat_sales (CatSalesId, AdvertisementId, month, year, qty, total)
VALUES (SS_cat_sales_seq.NEXTVAL, 4, 'Jan', '2023', 200, 4000.00);

-- Insert 5
INSERT INTO SS_cat_sales (CatSalesId, AdvertisementId, month, year, qty, total)
VALUES (SS_cat_sales_seq.NEXTVAL, 5, 'Jan', '2023', 150, 3000.00);

-- Insert 6
INSERT INTO SS_cat_sales (CatSalesId, AdvertisementId, month, year, qty, total)
VALUES (SS_cat_sales_seq.NEXTVAL, 6, 'Jan', '2023', 80, 2000.00);

-- Insert 7
INSERT INTO SS_cat_sales (CatSalesId, AdvertisementId, month, year, qty, total)
VALUES (SS_cat_sales_seq.NEXTVAL, 7, 'Jan', '2023', 120, 3000.00);

-- Insert 8
INSERT INTO SS_cat_sales (CatSalesId, AdvertisementId, month, year, qty, total)
VALUES (SS_cat_sales_seq.NEXTVAL, 8, 'Jan', '2023', 60, 1500.00);

-- Insert 9
INSERT INTO SS_cat_sales (CatSalesId, AdvertisementId, month, year, qty, total)
VALUES (SS_cat_sales_seq.NEXTVAL, 9, 'Jan', '2023', 100, 2500.00);

-- Insert 10
INSERT INTO SS_cat_sales (CatSalesId, AdvertisementId, month, year, qty, total)
VALUES (SS_cat_sales_seq.NEXTVAL, 10, 'Jan', '2023', 50, 1250.00);


--###########Table 9###########
CREATE TABLE SS_shop_sales (
     ShopperId NUMBER(4),
     total number(6,2),
     CONSTRAINT SS_shop_sales_idShopper_fk FOREIGN KEY (ShopperId)
          REFERENCES SS_Shopper(ShopperId) );
--CREATE SEQUENCE SS_prodreq_seq;

-- Insert 1
INSERT INTO SS_shop_sales (ShopperId, total)
VALUES (1001, 500.00);

-- Insert 2
INSERT INTO SS_shop_sales (ShopperId, total)
VALUES (1002, 300.00);

-- Insert 3
INSERT INTO SS_shop_sales (ShopperId, total)
VALUES (1003, 150.00);

-- Insert 4
INSERT INTO SS_shop_sales (ShopperId, total)
VALUES (1004, 800.00);

-- Insert 5
INSERT INTO SS_shop_sales (ShopperId, total)
VALUES (1005, 600.00);

-- Insert 6
INSERT INTO SS_shop_sales (ShopperId, total)
VALUES (1006, 250.00);

-- Insert 7
INSERT INTO SS_shop_sales (ShopperId, total)
VALUES (1007, 350.00);

-- Insert 8
INSERT INTO SS_shop_sales (ShopperId, total)
VALUES (1008, 180.00);

-- Insert 9
INSERT INTO SS_shop_sales (ShopperId, total)
VALUES (1009, 400.00);

-- Insert 10
INSERT INTO SS_shop_sales (ShopperId, total)
VALUES (1010, 200.00);



--###########Table 10###########
CREATE TABLE SS_audit_logon
  ( userid VARCHAR2(10),
    logdate DATE );
---- Insert 1
--INSERT INTO SS_audit_logon (userid, logdate)
--VALUES ('user1', TO_DATE('2023-01-01', 'YYYY-MM-DD'));
--
---- Insert 2
--INSERT INTO SS_audit_logon (userid, logdate)
--VALUES ('user2', TO_DATE('2023-02-05', 'YYYY-MM-DD'));
--
---- Insert 3
--INSERT INTO SS_audit_logon (userid, logdate)
--VALUES ('user3', TO_DATE('2023-03-12', 'YYYY-MM-DD'));
--
---- Insert 4
--INSERT INTO SS_audit_logon (userid, logdate)
--VALUES ('user4', TO_DATE('2023-04-20', 'YYYY-MM-DD'));
--
---- Insert 5
--INSERT INTO SS_audit_logon (userid, logdate)
--VALUES ('user5', TO_DATE('2023-05-17', 'YYYY-MM-DD'));
--
---- Insert 6
--INSERT INTO SS_audit_logon (userid, logdate)
--VALUES ('user6', TO_DATE('2023-06-11', 'YYYY-MM-DD'));
--
---- Insert 7
--INSERT INTO SS_audit_logon (userid, logdate)
--VALUES ('user7', TO_DATE('2023-07-28', 'YYYY-MM-DD'));
--
---- Insert 8
--INSERT INTO SS_audit_logon (userid, logdate)
--VALUES ('user8', TO_DATE('2023-08-09', 'YYYY-MM-DD'));
--
---- Insert 9
--INSERT INTO SS_audit_logon (userid, logdate)
--VALUES ('user9', TO_DATE('2023-09-14', 'YYYY-MM-DD'));
--
---- Insert 10
--INSERT INTO SS_audit_logon (userid, logdate)
--VALUES ('user10', TO_DATE('2023-10-30', 'YYYY-MM-DD'));

    
--###########View 1###########
--create view SS_basketitem_vu as
--   select * from SS_basketitem;
----###########View 2###########
--CREATE OR REPLACE VIEW SS_ship_vu
-- AS SELECT b.idbasket, b.shipflag, bs.idstage, bs.dtstage, bs.notes,
--            bs.shipper, bs.shippingnum
--      FROM SS_basket b, SS_basketstatus bs
--      WHERE b.idBasket = bs.idBasket;

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