-- Trigger to update stocks of the advertisements
CREATE OR REPLACE TRIGGER product_inventory_trg
 AFTER UPDATE OF orderplaced ON ss_cart
 FOR EACH ROW
 WHEN (OLD.orderplaced <> 1 AND NEW.orderplaced = 1)
DECLARE
 CURSOR cartitem_cur IS
 SELECT advertisementid, quantity
  FROM ss_cartitem
  WHERE cartid = :NEW.cartid;
 lv_chg_num NUMBER(3,1);
BEGIN
 FOR cartitem_rec IN cartitem_cur LOOP
   lv_chg_num := cartitem_rec.quantity;
  UPDATE ss_advertisement
   SET stock = stock - lv_chg_num
   WHERE advertisementid = cartitem_rec.advertisementid;
 END LOOP;
END;
/