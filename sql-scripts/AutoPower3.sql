use AutoPower;
#drop table cart;
create table cart(
	`cart_id` int not null auto_increment,
    `buyer_id` varchar(100) ,
    `product_id` int ,
    `quantity` int,
    `price` int,
    primary key(cart_id)
);
Alter table cart 
add column weight int ;
Alter table cart 
add column productname varchar(100);
ALTER TABLE cart
ADD FOREIGN KEY (product_id) REFERENCES product(product_id) on delete cascade;
ALTER TABLE cart
ADD FOREIGN KEY (buyer_id) REFERENCES customer(id) on delete cascade;
Alter table cart
drop  productname;