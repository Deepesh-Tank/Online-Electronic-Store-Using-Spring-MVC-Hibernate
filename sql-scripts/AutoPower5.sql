use AutoPower;
#drop table orders;
create table orders(
	`order_id` int not null auto_increment,
    `order_description` varchar(220),
    `amount` int,
    `samount` int,
    `state` varchar(100),
    `address` varchar(120),
    `tuser` varchar(150),
    `status` varchar(3),
    `buser` varchar(100),
    primary key(order_id)
);
alter table orders
add column sw int ;
alter table orders
add column orderdate date;
ALTER TABLE orders
ADD FOREIGN KEY (tuser) REFERENCES transporter(username) on delete cascade;
ALTER TABLE orders
ADD FOREIGN KEY (buser) REFERENCES customer(id) on delete cascade;
