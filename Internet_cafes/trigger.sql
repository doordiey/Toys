create trigger studentprice
  before insert on surf
  for each row
  begin
    declare msg varchar(20);
    if ((select money from student where id=New.studentid)<=0)
      then
        set msg = concat('您账户余额不足，请充值后启动');
        signal sqlstate 'HY000' set message_text = msg;
    else
      update computer set itsstatus=1 where computeid=New.computerid;
    end if;
  end;
create trigger charges
  before update on surf
  for each row
  begin
    declare newmoney float;
    declare havemoney float;
    if NEW.Outstanding=1
      then
        select money into havemoney from student where id=old.studentid;
        set newmoney = havemoney - Old.consume;
        update student set money = newmoney where id=old.studentid;
    end if;
  end;

