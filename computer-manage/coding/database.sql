create table pc(
  id int primary key auto_increment,
  pc_rank int not null,
  status int default(0),
  belong char(20) default (null)
);

create table pc_info(
  id int primary key auto_increment,
  pc_id int not null,
  login datetime not null,
  logout datetime default (null),
  user_id char(20) not null
);

create table task(
  id int primary  key auto_increment,
  content char(200) not null,
  send char(20),
  sendtime datetime
);

create table user(
  int id primary key auto_increment,
  user char(20) unique,
  password char(40) not null,
  who int not null
);