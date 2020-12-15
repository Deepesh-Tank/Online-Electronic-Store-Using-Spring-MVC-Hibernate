use `AutoPower`;
create table `product`(
	`product_id` int not null auto_increment,
    `product_name` varchar(100),
    `price` int ,
    `weight` int,
    `description` varchar(200) ,
    primary key(product_id)
);
Alter table productcategory
add column category_description varchar(200) ;
