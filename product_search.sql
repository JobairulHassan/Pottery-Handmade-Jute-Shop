SET SERVEROUTPUT ON;
SET VERIFY OFF;
create or replace procedure Search_Product(p_name in product_one@site_link.product_name%type)
IS
--pid product1.product_id%type;
--pprice product1.product_price%type;
--pavailable product1.isavailable%type;

BEGIN
 
 DBMS_OUTPUT.PUT_LINE('product_ID'||'      '||'product_name'||'     '||'product_price'||'      '||'isavailable');
 
 FOR I in (select *from product_one@site_link where product_name=p_name)LOOP
 
 DBMS_OUTPUT.PUT_LINE(I.product_id||'      '||I.product_name||'   '||I.product_price||'       '||I.isavailable);
 end loop;
end Search_Product;
/



DECLARE
p_name product_one@site_link.product_name%type := '&productName';
BEGIN 
Search_Product(p_name);
end;
/