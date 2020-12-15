use autopower;
create table messagebuyer(
	`message_id` int not null auto_increment,
    `buser` varchar(100) ,
    `message_date` date,
    `status` int ,
    `message_info` varchar(220),
    `response_info` varchar(220),
    primary key(message_id),
    foreign key(buser) references customer(id) on delete cascade
);