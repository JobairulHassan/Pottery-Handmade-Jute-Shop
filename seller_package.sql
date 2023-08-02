CREATE OR REPLACE PACKAGE product_seller AS
	FUNCTION login(A1 in seller2.seller_mail%TYPE, A2 in seller2.seller_password%TYPE)
	RETURN seller2.seller_id%TYPE;

	PROCEDURE sign_up(B1 in seller2.seller_id%TYPE, B2 in seller2.seller_mail%TYPE, B3 in seller2.seller_password%TYPE);
	
	PROCEDURE view_details(i in int);
	
	PROCEDURE remove_account(C1 in seller2.seller_mail%TYPE, C2 in seller2.seller_password%TYPE);
	
	PROCEDURE update_seller_phonenum(D1 in seller2.seller_mail%TYPE, D2_old in seller1.seller_phone_no%TYPE, D3_new in seller1.seller_phone_no%TYPE);--phn num update  ,password update

END product_seller;
/

CREATE OR REPLACE PACKAGE BODY product_seller AS
	
	function login(A1 in seller2.seller_mail%TYPE, A2 in seller2.seller_password%TYPE)
	return seller2.seller_id%TYPE
	is
	--DECLARE
	a seller2.seller_id%TYPE;
	b seller2.seller_password%TYPE;
	--x seller2.seller_id%TYPE;
	BEGIN
	
		select seller_id,seller_password into a,b from seller2 where seller_mail = A1;
		IF A2 = b THEN
			DBMS_OUTPUT.PUT_LINE('Login Success');
		ELSE
			DBMS_OUTPUT.PUT_LINE('Password Mismatch');
		END IF;
		RETURN a;
	
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE('USER does not exist');
			RETURN NULL;
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Other errors');
			RETURN NULL;
	end login;
	
	PROCEDURE sign_up(B1 in seller2.seller_id%TYPE, B2 in seller2.seller_mail%TYPE, B3 in seller2.seller_password%TYPE)
	IS
	
	BEGIN
		insert into seller2 values(B1,B2,B3);
	EXCEPTION
		WHEN DUP_VAL_ON_INDEX THEN
			DBMS_OUTPUT.PUT_LINE('This email is already exist. Try another one.');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Other errors');
	END sign_up;
	
	PROCEDURE view_details(i in int)
	IS
	
	BEGIN
		DBMS_OUTPUT.PUT_LINE('Seller_name'||'             '||'Seller_phone_no'||'          '||'seller_city'||'             '||'seller_email');
		for R IN (SELECT s1.SELLER_NAME,s1.SELLER_PHONE_NO,s1.SELLER_CITY,s2.seller_mail 
		FROM seller1 s1 JOIN seller2 s2 ON 
		s2.seller_id = i and s1.seller_id = i)LOOP
		
			DBMS_OUTPUT.PUT_LINE(R.seller_name||'                  '||R.seller_phone_no||'              '||R.seller_city||'            '||R.seller_mail||'  ');
		END LOOP;
		
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE('USER does not exist');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Other errors');
	END view_details;
	
	PROCEDURE remove_account(C1 in seller2.seller_mail%TYPE, C2 in seller2.seller_password%TYPE)
	IS
	
	a seller2.seller_id%TYPE;
	b seller2.seller_password%TYPE;
	BEGIN
	
		select seller_id,seller_password into a,b from seller2 where seller_mail = C1;
		IF C2 = b THEN
			DELETE from seller1@site_link where seller_id = a;
			DELETE from seller2 where seller_id = a;
			DBMS_OUTPUT.PUT_LINE('Your ID is removed');
		ELSE
			DBMS_OUTPUT.PUT_LINE('Password Mismatch');
		END IF;
	
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE('USER does not exist');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Other errors');
	end remove_account;
	
	PROCEDURE update_seller_phonenum(D1 in seller2.seller_mail%TYPE, D2_old in seller1.seller_phone_no%TYPE, D3_new in seller1.seller_phone_no%TYPE)
	IS
	a seller2.seller_id%TYPE;
	b seller1.seller_phone_no%TYPE;
	excp EXCEPTION;
	BEGIN
		select seller_id into a from seller2 where seller_mail = D1;
		select seller_phone_no into b from seller1@site_link where seller_id = a;
		IF b = D2_old THEN
			update seller1 set seller_phone_no = D3_new where seller_id = a;
			DBMS_OUTPUT.PUT_LINE('Phone Number updated.');
		ELSE
			RAISE excp;
			
		END IF;
	EXCEPTION
		WHEN excp THEN
			DBMS_OUTPUT.PUT_LINE('Previous Phone number Mismatch');
		WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE('USER does not exist');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Other errors');
	END update_seller_phonenum;	
end product_seller;
/

commit;