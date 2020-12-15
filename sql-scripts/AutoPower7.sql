use AutoPower;
create table productreview(
	`rid` int not null auto_increment,
    `pro_id` int not null,
	`user` varchar(100),
	`review` varchar(220),
     primary key(rid)
);
alter table productreview
add column reviewdate date;
ALTER TABLE productreview
ADD FOREIGN KEY (pro_id) REFERENCES product(product_id) on delete cascade;
