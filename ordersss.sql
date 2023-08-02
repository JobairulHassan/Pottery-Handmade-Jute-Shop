drop table order1;
create table order1(
	order_id int, 
	order_amonut float,
	order_category varchar2(20),
	order_quantity int,
	order_date date,
	product_id int, 
	customer_id int,
	PRIMARY KEY (order_id),
	FOREIGN KEY (product_id) REFERENCES product1(product_id),
	FOREIGN KEY (customer_id) REFERENCES customer1(customer_id)
);

drop table order2;
create table order2(
	order_id int, 
	order_date date,
	product_id int, 
	customer_id int,
	PRIMARY KEY (order_id),
	FOREIGN KEY (product_id) REFERENCES product1(product_id),
	FOREIGN KEY (customer_id) REFERENCES customer1(customer_id)
	);
	