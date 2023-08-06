-- Calculates discounts for orders
CREATE OR REPLACE FUNCTION ord_disc_sf1
  (p_id NUMBER)
  RETURN NUMBER
 IS
  lv_sub_num ss_cart.subtotal%TYPE;
BEGIN
  SELECT subtotal
   INTO lv_sub_num
   FROM ss_cart
   WHERE cartid = p_id;
  IF lv_sub_num >= 1000 THEN
    RETURN lv_sub_num * .20;
  ELSIF lv_sub_num >= 500 THEN
    RETURN lv_sub_num * .10;
  ELSIF lv_sub_num >= 250 THEN
    RETURN lv_sub_num * .05;
  ELSE
    RETURN 0;
  END IF;
END;
/
DECLARE
  lv_id_num NUMBER := 4002;
  lv_disc_num NUMBER;
BEGIN
  lv_disc_num := ord_disc_sf1(lv_id_num);
  DBMS_OUTPUT.PUT_LINE('Discount' || lv_disc_num);
END;
