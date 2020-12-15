use AutoPower;
#Drop table transporter;
create table transporter(
	 `state` varchar(100) ,
     `username` varchar(100) ,
     `name` varchar(100),
     `company` varchar(150),
     `permit` varchar(100),
     `address` varchar(120), 
     `pw` int,
     `email` varchar(150),
     `contacts` varchar(100),
     primary key(username)
);