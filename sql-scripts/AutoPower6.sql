use AutoPower;
#drop table payment;
create table payment(
	`pid` int not null auto_increment,
    `oid` int not null,
	`payment_info` varchar(100),
     primary key(pid),
     foreign key(oid) references Orders(order_id) on delete cascade
);
