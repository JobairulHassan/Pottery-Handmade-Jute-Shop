SET VERIFY OFF;
SET SERVEROUTPUT ON;
declare 

	id_to_delete product2.product_id%type;
	myExp EXCEPTION;
	a varchar2(50);
begin
	
	id_to_delete := &id;
	
	delete from product_one@site_link where product_id = id_to_delete;
	--delete from product2@site_link where product_id = id_to_delete;
	
	select product_category into a from product2 
		where product_id=id_to_delete 
		union 
		select product_category from product3 
		where product_id=id_to_delete;
		
		
	if (a ='Jute') THEN
		
		delete from product2 where product_id = id_to_delete;
		
	ELSE
	  delete from product3 where product_id = id_to_delete;
		
		end if;
	IF id_to_delete < 0 THEN
		RAISE myExp;
	END IF;
	
	
	
	
	EXCEPTION
		WHEN myExp THEN
			DBMS_OUTPUT.PUT_LINE('ID Cannot be Negative!');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Others Errors!');
	
end;
/


create or replace trigger trigDeleteproduct
after delete on product_one@site_link


declare
	
begin

	dbms_output.put_line('product Deleted!');
	
end;
/

--commit;