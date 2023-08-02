drop table customer1;
create table customer1(
  customer_id int,
  customer_name varchar2(50),
  customer_phone_no varchar2(200),
  customer_email varchar2(50),
  customer_country varchar2(50),
  product_id int,
  order_id int,   
  PRIMARY KEY (customer_id),
  FOREIGN KEY (product_id) REFERENCES product1(product_id),
  FOREIGN KEY (order_id) REFERENCES order1(order_id) 
  );
  
  
  drop table customer2;	
create table customer2(
  customer_id int,
  customer_name varchar2(50),
  customer_phone_no varchar2(50),
  customer_email varchar2(50),
  customer_country varchar2(50),
  product_id int,
  order_id int,   
  PRIMARY KEY (customer_id),
  FOREIGN KEY (product_id) REFERENCES product1(product_id),
  FOREIGN KEY (order_id) REFERENCES order1(order_id) 
  );
  
  INSERT INTO customer1(customer_id,customer_name,customer_phone_no,customer_email,customer_country) values (1,'A','01892345123','a@gmail.com','Banglades');
  INSERT INTO customer1(customer_id,customer_name,customer_phone_no,customer_email,customer_country) values (2,'A','01992876564','a@gmail.com','Banglades');