SET SERVEROUTPUT ON;
SET VERIFY OFF;
PROMPT WELCOME TO JUTE AND CRAFTY SHOP;
PROMPT Are you a customer or seller? Insert -;
PROMPT 1 for seller;
PROMPT 2 for customer;
ACCEPT X NUMBER PROMPT "Enter your Choice: ";
DECLARE
	SELECTION number;
	A3 seller2.seller_mail%TYPE;
	B3 seller2.seller_password%TYPE;
	x seller2.seller_id%TYPE ;
BEGIN
	SELECTION := &x;
	DBMS_OUTPUT.NEW_LINE;
	CASE SELECTION
		WHEN 1 THEN
			A3 :='&seller_mail';
			B3 :='&seller_password';
			x:=product_seller.login(A3,B3);
			DBMS_OUTPUT.PUT_LINE('Your ID is: '||x);
		WHEN 2 THEN
			DBMS_OUTPUT.PUT_LINE('ONE');
		ELSE
			DBMS_OUTPUT.PUT_LINE('TWO');
	
	END CASE;
	
	
END;
/
--@@"G:\4.1 materials\DDS+LAB\project\temp2.sql"
--set linesize 200;