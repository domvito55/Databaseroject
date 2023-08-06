-- Calculates shipping values based on shipping_table
CREATE OR REPLACE function SS_ShipCost (
    p_price IN NUMBER
) Return number
AS
  p_ship number;
BEGIN
 select fee into p_ship
  from ss_shipping
  where (p_price >= low)
   and (p_price <= high);
   
 return p_ship;  
END;
/

-- Test valid data
DECLARE
    v_shippingFee NUMBER;
BEGIN
    v_shippingFee := SS_ShipCost(250);
    DBMS_OUTPUT.PUT_LINE('Shipping Fee: ' || v_shippingFee);
END;
