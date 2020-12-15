use autopower;
create table pin(
		`pin_id` int not null auto_increment,
        `order_id` int ,
        `pin` char(8) ,
        primary key(pin_id),
        foreign key(order_id) references Orders(order_id)
);
