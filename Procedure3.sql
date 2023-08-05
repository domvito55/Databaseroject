CREATE OR REPLACE PROCEDURE SS_PlaceOrder (
    p_cartId IN NUMBER,
    p_shipper IN VARCHAR2,
    p_shippingNum IN VARCHAR2
) AS
BEGIN
    UPDATE SS_Cart
    SET OrderPlaced = 1
    WHERE CartId = p_cartId;

    INSERT INTO SS_CartStatus (StatusId, CartId, StageId, dtStage, Notes, shipper, ShippingNum)
    VALUES (SS_status_seq.NEXTVAL, p_cartId, 2, SYSDATE, 'Order placed', p_shipper, p_shippingNum);
END;
/

-- Test valid data
EXEC SS_PlaceOrder(p_cartId => 4003, p_shipper => 'XYZ', p_shippingNum => 'XYZ123');

select * from SS_CartStatus
