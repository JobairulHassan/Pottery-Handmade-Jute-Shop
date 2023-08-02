drop table product2;
create table product2(
	product_id int, 
	product_rating float,
	product_category varchar2(20),
	product_description varchar2(200),
	PRIMARY KEY (product_id)
);

drop table product3;
create table product3(
	product_id int, 
	product_rating float,
	product_category varchar2(20),
	product_description varchar2(200),
	PRIMARY KEY (product_id)
);

drop table seller2;
create table seller2(
	seller_id int, 
	seller_mail varchar2(20) unique,
	seller_password varchar2(20),
	PRIMARY KEY (seller_id)
);
--momo site
drop table seller1;
create table seller1(
	seller_id int, 
	seller_name varchar2(20),
	seller_phone_no varchar2(20) unique,
	seller_city varchar2(50),
	PRIMARY KEY (seller_id)
);
-- momo site
drop table product1;
create table product1(
	product_id int,
	product_name varchar2(20),
	product_price float, 
	isavailable int,
	seller_id int,
	PRIMARY KEY (product_id),
	FOREIGN KEY (seller_id) REFERENCES seller1(seller_id)
);
--momo site
drop table order1;
create table order1(
	order_id int, 
	order_amonut float,
	order_category varchar2(20),
	order_quantity int,
	order_date date,
	PRIMARY KEY (order_id)
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
  PRIMARY KEY (customer_id) 
  );
drop table order2;
create table order2(
	order_id int, 
	order_amonut float,
	order_category varchar2(20),
	order_quantity int,
	order_date date,
	product_id int, 
	customer_id int,
	PRIMARY KEY (order_id),
	FOREIGN KEY (customer_id) REFERENCES customer2(customer_id)
);
