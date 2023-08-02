SET SERVEROUTPUT ON;
SET VERIFY OFF;	
DECLARE
	i int := '&seller_id';
BEGIN
		product_seller.view_Details(i);
		
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE('USER does not exist');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Other errors');
	END;
	/