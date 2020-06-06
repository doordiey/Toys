create table teacherlevel(
  id int auto_increment,
  levelname char(10),
  primary key(id)
); #完成 外键连接老师表，补充老师的级别信息分为：任课老师、机房管理员
create table Class(
  id int auto_increment,
  Classname char(20),
  primary key (id)
);  #完成 班级信息表，包括班级名和班级号
create table student(
  id int auto_increment,
  money float default(0),
  class int,
  name char(20),
  constraint s_c foreign key (class) references Class(id),
  primary key (id)
); #完成 学生信息表，
create table teacher(
  id int auto_increment,
  name char(20),
  teacherlevel int,
  constraint t_l foreign key (teacherlevel) references teacherlevel(id),
  constraint t_c foreign key (teachclass) references Class(id),
  primary key (id)
); #完成 老师信息表，主要记录老师职工号和姓名，外键了老师等级
create table Compute(
  id int auto_increment,
  itsroom int,
  itsstatus int default (0),
  primary key(id)
); # 完成 电脑信息表，记录机房的电脑数，并带有是否使用的状态信息和被使用者学号
create table Computerroom(
  id int auto_increment,
  Computerroomname char(20),
  ComputerNumber int,
  roommanager int,
  constraint rm_i foreign key (roommanager) references teacher(id),
  primary key (id)
); #完成 机房信息表，机房的基础信息
create table Computerroomording (
  id           int,
  computerroom int,
  ordertime    datetime,
  orderclass   int default (0) ,
  whichclass int default (0) check (whichclass>=0 and whichclass<=8),
  constraint c_i foreign key (computerroom) references Computerroom (id),
  constraint o_i foreign key (orderclass) references teacherclass(id),
  primary key (id,ordertime,whichclass,computerroom)
); #完成 机房预订表
create table Price(
  level int auto_increment,
  levelprice float not null,
  primary key (level)
); #完成 网费计算
create table teacherclass(
  teacher int,
  class int,
  lesson int,
  constraint ti foreign key (teacher) references teacher(id),
  constraint ci foreign key (class) references Class(id),
  constraint li foreign key (lesson) references lesson(id),
  primary key (teacher,class,lesson)
); #完成 老师与班级教某任课程的表
create table lesson(
  id int not null auto_increment,
  lessonname char(10),
  primary key (id)
); #完成 课程信息表，包括课程名和课程号
create table surf(
  id int not null ,
  computerid int not null ,
  studentid int not null ,
  online int default (0),
  pricelevel int not null ,
  constraint pl foreign key (pricelevel) references Price(level),
  primary key (computerid,id)
); #完成，上机过程的登记和费用信息的管理
