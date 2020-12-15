use AutoPower;
#drop table jointable;
create table jointable(
	`idd` int not null  auto_increment,
	`username` varchar(200) not null,
    `id` int not null ,
    primary key( idd)
);
alter table jointable
add column orderid int ;
ALTER TABLE jointable
ADD FOREIGN KEY (orderid) REFERENCES Orders(order_id) on delete cascade;
ALTER TABLE jointable
ADD FOREIGN KEY (id) REFERENCES product(product_id) on delete cascade;