SET SERVEROUTPUT ON;
SET VERIFY OFF;	
DECLARE
	C1 seller2.seller_mail%TYPE :='&seller_mail';
	C2 seller1.seller_phone_no%TYPE := '&seller_old_phone_no';
	C3 seller1.seller_phone_no%TYPE := '&seller_new_phone_no';
BEGIN
		product_seller.update_seller_phonenum(C1,C2,C3);
		
	END;
	/