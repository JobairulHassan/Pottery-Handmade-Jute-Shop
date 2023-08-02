PROCEDURE update_customer_phonenum(D1 in  customer2.customer_email%TYPE, D2_old in customer2.customer2_phone_no%TYPE, D3_new in customer2.customer_phone_no%TYPE)
	IS
	a customer2.customer_id%TYPE;
	b customer2.customer_phone_no%TYPE;
	excp EXCEPTION;
	BEGIN
		select customer_id into a from customer2 where seller_mail = D1;
		select seller_phone_no into b from seller1 where seller_id = a;
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