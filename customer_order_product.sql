SET SERVEROUTPUT ON;
SET VERIFY OFF;
DECLARE
		A3 order2.order_id%type := '&or_id';
		A1 customer2.customer_id%TYPE:= '&cust_id';
		A2 product2.product_id%TYPE := '&pro_id';
		
		A4 order2.order_quantity%TYPE := '&or_qty';
		A5 order2.order_category%TYPE := '&or_cat';
		A6 order2.order_amonut%TYPE := '&or_am';
BEGIN
	IF A5 = 'V' THEN
		insert into order2 (order_id,order_amonut, order_category, order_quantity, product_id, customer_id) values(A3,A6,A5,A4,A2,A1);
	ELSIF A5 = 'NV' THEN
		 insert into order12@site_link (order_id,order_amonut, order_category, order_quantity, product_id, customer_id) values (A3,A6,A5,A4,A2,A1);
	
	END IF;
	
END;
/	
