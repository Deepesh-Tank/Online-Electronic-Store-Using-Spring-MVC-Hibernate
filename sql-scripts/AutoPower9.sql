use AutoPower;
#drop table states;
create table states(
	`state` varchar(100) not null,
    `active` int ,
    primary key(state)
);
use autopower;
alter table states
drop active;
desc states;