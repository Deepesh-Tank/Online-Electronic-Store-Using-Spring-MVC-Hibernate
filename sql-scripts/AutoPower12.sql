use autopower;
#drop table messagetransporter;
create table messagetransporter(
	`message_id` int not null auto_increment,
    `tuser` varchar(100) ,
    `message_date` date,
    `status` int ,
    `message_info` varchar(220),
    `response_info` varchar(220),
    primary key(message_id),
    foreign key(tuser) references transporter(username) on delete cascade
);