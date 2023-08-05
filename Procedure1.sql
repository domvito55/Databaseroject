CREATE OR REPLACE PROCEDURE SS_AddToCart (
    p_shopperId IN NUMBER,
    p_advertisementId IN NUMBER,
    p_quantity IN NUMBER
) AS
    v_cartId NUMBER;
    v_price NUMBER(10, 2);
BEGIN
    -- Check if the shopper has an active cart
    SELECT CartId INTO v_cartId
    FROM SS_Cart
    WHERE ShopperId = p_shopperId AND OrderPlaced = 0;
    dbms_output.put_line(v_cartId);
    IF v_cartId IS NULL THEN
        -- If no active cart, create a new one
        INSERT INTO SS_Cart (CartId, ShopperId, OrderPlaced, dtCreated)
        VALUES (SS_CartId_seq.nextval, p_shopperId, 0, SYSDATE);

        SELECT CartId INTO v_cartId
        FROM SS_Cart
        WHERE ShopperId = p_shopperId AND OrderPlaced = 0;
    END IF;

    -- Check if the item is already in the cart
    SELECT price INTO v_price
    FROM SS_Advertisement
    WHERE AdvertisementId = p_advertisementId;

    IF v_price IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'Invalid advertisementId. Item not found.');
    END IF;

    UPDATE SS_CartItem
    SET Quantity = Quantity + p_quantity
    WHERE CartId = v_cartId AND AdvertisementId = p_advertisementId;

    IF SQL%NOTFOUND THEN
        -- If the item is not in the cart, insert a new entry
        INSERT INTO SS_CartItem (CartId, AdvertisementId, Quantity)
        VALUES (v_cartId, p_advertisementId, p_quantity);
    END IF;
END;
/


-- Test valid data
EXEC SS_AddToCart(p_shopperId => 3005, p_advertisementId => 2001, p_quantity => 2);

select * from SS_CartItem;