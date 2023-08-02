CREATE OR REPLACE PROCEDURE place_order(A1 in customer2.customer_id%TYPE,A2 in int, A3 in order2.order_id%TYPE,A4 float, A5 in order2.order_category%TYPE, A6 order2.order_amount%TYPE)
	
	
BEGIN
	IF A5 = 'V' THEN
		insert into order2 (order_id,order_amount, order_category, order_quantity, product_id, customer_id) values(A3,A6,A5,A4,A2,A1);
	ELSIF A5 = 'NV' THEN
		insert into order2 (order_id,order_amount, order_category, order_quantity, product_id, customer_id) values(A3,A6,A5,A4,A2,A1);
	
	END IF;
	
END place_order;
/	
