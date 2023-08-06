CREATE OR REPLACE TRIGGER ss_cartItem_trg
   AFTER INSERT OR DELETE OR UPDATE OF quantity ON ss_cartitem
   FOR EACH ROW
BEGIN
 IF INSERTING THEN
  UPDATE ss_cart
   SET quantity = quantity + :NEW.quantity,
     subtotal = subtotal + :NEW.price,
     total = total + :NEW.price + :NEW.price * 0.13,
     tax = tax + :NEW.price * 0.13
    WHERE cartid = :NEW.cartid;
 ELSIF DELETING THEN
  UPDATE ss_cart
   SET quantity = quantity - :OLD.quantity,
     subtotal = subtotal - :OLD.price,
     total = total - :OLD.price - :OLD.price * 0.13,
     tax = tax - :OLD.price * 0.13
    WHERE cartid = :OLD.cartid;
 ELSIF UPDATING THEN
  UPDATE ss_cart
   SET quantity = quantity + (:NEW.quantity - :OLD.quantity),
     subtotal = subtotal + (:NEW.price - :OLD.price),
     total = total  + (:NEW.price - :OLD.price) * 1.13,
     tax = tax  + (:NEW.price - :OLD.price) * 0.13
    WHERE cartid = :NEW.cartid;
 END IF;
END;
/

select * from ss_cart
 where cartid = 4001;
--Add
INSERT INTO ss_cartitem (idcartitem, advertisementid, cartid, quantity, price)
  VALUES (5014, 2001, 4001, 2, 200);
select * from ss_cart
 where cartid = 4001;
--increase qty of item
UPDATE ss_cartitem
  SET quantity = 7
  WHERE idcartitem = 5014;
select * from ss_cart
 where cartid = 4001;
--decrease qty of item
UPDATE ss_cartitem
  SET quantity = 1
  WHERE idcartitem = 5014;
select * from ss_cart
 where cartid = 4001;
--remove item
DELETE FROM ss_cartitem
  WHERE idcartitem = 5014;
select * from ss_cart
 where cartid = 4001;

ROLLBACK;
ALTER TRIGGER ss_cartItem_trg DISABLE;