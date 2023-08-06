CREATE OR REPLACE PROCEDURE SS_CalculateCartTotal (
    p_shopperId IN NUMBER,
    p_cartId IN NUMBER,
    p_shippingFee OUT NUMBER,
    p_taxAmount OUT NUMBER,
    p_totalAmount OUT NUMBER
) AS
BEGIN
    SELECT SUM(a.price * ci.Quantity) INTO p_totalAmount
    FROM SS_CartItem ci
    INNER JOIN SS_Advertisement a ON ci.AdvertisementId = a.AdvertisementId
    WHERE ci.CartId = p_cartId;

    IF p_totalAmount IS NULL THEN
        RAISE_APPLICATION_ERROR(-20002, 'Cart is empty or does not exist.');
    END IF;
    dbms_output.put_line(p_totalAmount);
    -- Calculate shipping fee based on total amount
    --SELECT Fee INTO p_shippingFee
    --FROM SS_Shipping
    --WHERE p_totalAmount BETWEEN Low AND High;
    p_shippingFee:=111;
    IF SQL%NOTFOUND THEN
        p_shippingFee:=111;
    END IF;

    -- Calculate tax amount (assuming 10% tax rate)
    p_taxAmount := p_totalAmount * 0.10;
END;
/

-- Test valid data
DECLARE
    v_shippingFee NUMBER;
    v_taxAmount NUMBER;
    v_totalAmount NUMBER;
BEGIN
    SS_CalculateCartTotal(p_shopperId => 3005, p_cartId => 4005, p_shippingFee => v_shippingFee, p_taxAmount => v_taxAmount, p_totalAmount => v_totalAmount);
    DBMS_OUTPUT.PUT_LINE('Shipping Fee: ' || v_shippingFee);
    DBMS_OUTPUT.PUT_LINE('Tax Amount: ' || v_taxAmount);
    DBMS_OUTPUT.PUT_LINE('Total Amount: ' || v_totalAmount);
END;
