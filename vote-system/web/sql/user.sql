create table user(
  id int primary key auto_increment,
  user char(20) unique ,
  password char(40),
  who int
);