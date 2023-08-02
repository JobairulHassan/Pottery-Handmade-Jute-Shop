SET SERVEROUTPUT ON;
SET VERIFY OFF;	

DECLARE
	C1 seller2.seller_mail%TYPE :='&seller_mail';
	C2 seller2.seller_password%TYPE := '&seller_password';
BEGIN
		product_seller.remove_account(C1,C2);
		
	END;
	/