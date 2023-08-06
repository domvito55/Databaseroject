CREATE OR REPLACE TRIGGER ss_cartItem_trg
   AFTER INSERT OR DELETE OR UPDATE OF quantity ON ss_cartitem
   FOR EACH ROW
BEGIN
 IF INSERTING THEN
  UPDATE ss_cart
   SET quantity = quantity + :NEW.quantity,
     subtotal = subtotal + (:NEW.price*:NEW.quantity),
     shipping = ss_shipcost(subtotal + (:NEW.price*:NEW.quantity)),
     tax = (subtotal + (:NEW.price*:NEW.quantity) + ss_shipcost(subtotal + (:NEW.price*:NEW.quantity))) * 0.13,
     total = 
       subtotal + (:NEW.price*:NEW.quantity) +
       ss_shipcost(subtotal + (:NEW.price*:NEW.quantity)) +
       (subtotal + (:NEW.price*:NEW.quantity) + ss_shipcost(subtotal + (:NEW.price*:NEW.quantity))) * 0.13
    WHERE cartid = :NEW.cartid;
 ELSIF DELETING THEN
  UPDATE ss_cart
   SET quantity = quantity - :OLD.quantity,
     subtotal = subtotal - (:OLD.price*:OLD.quantity),
     shipping = ss_shipcost(subtotal - (:OLD.price*:OLD.quantity)),
     tax = (subtotal - (:OLD.price*:OLD.quantity) + ss_shipcost(subtotal - (:OLD.price*:OLD.quantity))) * 0.13,
     total = subtotal - (:OLD.price*:OLD.quantity) +
       ss_shipcost(subtotal - (:OLD.price*:OLD.quantity)) +
       (subtotal - (:OLD.price*:OLD.quantity) + ss_shipcost(subtotal - (:OLD.price*:OLD.quantity))) * 0.13
    WHERE cartid = :OLD.cartid;
 ELSIF UPDATING THEN
  UPDATE ss_cart
   SET quantity = quantity + (:NEW.quantity - :OLD.quantity)
   WHERE cartid = :NEW.cartid;
 END IF;
END;
/
select ss_cartitem.*,
  ss_cart.quantity as "cart quantity",
  ss_cart.subtotal as "cart subtotal",
  ss_cart.shipping as "cart shipping",
  ss_cart.tax as "cart tax",
  ss_cart.total as "cart total"
 from ss_cartitem, ss_cart
 where ss_cartitem.cartid = 4001
  and ss_cartitem.cartid = ss_cart.cartid;
--Add
INSERT INTO ss_cartitem (idcartitem, advertisementid, cartid, quantity, price)
  VALUES (5014, 2001, 4001, 2, 200);
select ss_cartitem.*,
  ss_cart.quantity as "cart quantity",
  ss_cart.subtotal as "cart subtotal",
  ss_cart.shipping as "cart shipping",
  ss_cart.tax as "cart tax",
  ss_cart.total as "cart total"
 from ss_cartitem, ss_cart
 where ss_cartitem.cartid = 4001
  and ss_cartitem.cartid = ss_cart.cartid;
--increase qty of item
UPDATE ss_cartitem
  SET quantity = 1
  WHERE idcartitem = 5014;
select ss_cartitem.*,
  ss_cart.quantity as "cart quantity",
  ss_cart.subtotal as "cart subtotal",
  ss_cart.shipping as "cart shipping",
  ss_cart.tax as "cart tax",
  ss_cart.total as "cart total"
 from ss_cartitem, ss_cart
 where ss_cartitem.cartid = 4001
  and ss_cartitem.cartid = ss_cart.cartid;
--decrease qty of item
UPDATE ss_cartitem
  SET quantity = 3
  WHERE idcartitem = 5014;
select ss_cartitem.*,
  ss_cart.quantity as "cart quantity",
  ss_cart.subtotal as "cart subtotal",
  ss_cart.shipping as "cart shipping",
  ss_cart.tax as "cart tax",
  ss_cart.total as "cart total"
 from ss_cartitem, ss_cart
 where ss_cartitem.cartid = 4001
  and ss_cartitem.cartid = ss_cart.cartid;
--remove item
DELETE FROM ss_cartitem
  WHERE idcartitem = 5014;
select ss_cartitem.*,
  ss_cart.quantity as "cart quantity",
  ss_cart.subtotal as "cart subtotal",
  ss_cart.shipping as "cart shipping",
  ss_cart.tax as "cart tax",
  ss_cart.total as "cart total"
 from ss_cartitem, ss_cart
 where ss_cartitem.cartid = 4001
  and ss_cartitem.cartid = ss_cart.cartid;

--ROLLBACK;
--ALTER TRIGGER ss_cartItem_trg DISABLE;