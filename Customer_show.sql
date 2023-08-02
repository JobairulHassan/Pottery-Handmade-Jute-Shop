SET SERVEROUTPUT ON;
SET VERIFY OFF;
--Show ALL CUSTOMER detail-----------	
DECLARE
	cname customer2.customer_name%TYPE;
	cphn customer2.customer_phone_no%TYPE;
	cmail customer2.customer_email%TYPE;
	ccountry customer2.customer_country%TYPE;
BEGIN
		DBMS_OUTPUT.PUT_LINE('customer_name'||'             '||'customer_phone_no'||'          '||'customer_email'||'             '||'customer_COUNTRY');

 
		for R IN (select customer_name,customer_phone_no,customer_email,customer_COUNTRY from customer2 
		where customer_country = 'Dhaka' 
		union 
		select customer_name,customer_phone_no,customer_email,customer_COUNTRY from customer_one@site_link 
		where customer_country='Mymensingh')LOOP
			
			DBMS_OUTPUT.PUT_LINE(R.customer_name||'                  '||R.customer_phone_no||'              '||R.customer_email||'            '||R.customer_COUNTRY||'  ');
		END LOOP;  
		
		
END ;
/
--Show ALL seller Detail------------------
DECLARE
	cname customer2.customer_name%TYPE;
	cphn customer2.customer_phone_no%TYPE;
	cmail customer2.customer_email%TYPE;
	ccountry customer2.customer_country%TYPE;
BEGIN
		DBMS_OUTPUT.PUT_LINE('customer_name'||'             '||'customer_phone_no'||'          '||'customer_email'||'             '||'customer_COUNTRY');

 
		for R IN (SELECT s1.SELLER_NAME,s1.SELLER_PHONE_NO,s1.SELLER_CITY,s2.seller_mail 
		FROM seller1@site_link s1 JOIN seller2 s2 ON 
		s2.seller_id = s1.seller_id)LOOP
			
			DBMS_OUTPUT.PUT_LINE(R.seller_name||'                  '||R.seller_phone_no||'              '||R.seller_city||'            '||R.seller_mail||'  ');
		END LOOP;
		
	END;
	/
	

