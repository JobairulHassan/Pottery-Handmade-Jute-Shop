SET VERIFY OFF;
SET SERVEROUTPUT ON;
declare 
	product_id int := &productid;
	product_name varchar2(20):= '&productName' ; 
	product_price float := &productPrice;	
	isavailable int := &available;
	seller_id int := &sellerId;
	product_category varchar2(20) :='&productcategory';
	product_rating float := '&rating';
	product_description varchar2(200) :='&description';
	
begin

   
	insert into product_one@site_link values(product_id,product_name,product_price,isavailable,seller_id);
	IF product_category='jute' THEN
	insert into product2 values(product_id,product_rating,product_category,product_description);
	ELSIF product_category='pottery' THEN
	insert into product3 values(product_id,product_rating,product_category,product_description);
	end if;
	
end;
/
/*
create or replace trigger trigInsertProductOne
after insert on product_one@site_link

declare
	
begin

	dbms_output.put_line('Product Inserted!');
	
end;
/
*/
commit;