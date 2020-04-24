create table player(
  id int auto_increment,
  nickname char(20) not null unique,
  score int default 0,
  playnumber int default 0,
  winnumber int default 0,
  primary key(id)
);