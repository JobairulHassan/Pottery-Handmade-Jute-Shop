----------- Seller sign_up  DONE
SET SERVEROUTPUT ON;
SET VERIFY OFF;	
DECLARE
	sid seller2.seller_id%TYPE := '&seller_id';
	smail seller2.seller_mail%TYPE := '&seller_mail';
	spass seller2.seller_password%TYPE := '&seller_password';
	m seller1.seller_name%TYPE := '&seller_name';
	n seller1.seller_phone_no%TYPE := '&seller_phn';
	o seller1.seller_city%TYPE := '&seller_city';
BEGIN
	product_seller.sign_up(sid,smail,spass);
	insert into seller1@site_link values(sid,m,n,o);

END;
/
 ----------- Seller sign_up  DONE