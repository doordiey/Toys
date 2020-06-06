create procedure sumprice(OUT room1 float, OUT room2 float, OUT room3 float, OUT room4 float)
  begin
  select sum(consume) into room1 from surf left join compute on compute.id=computerid where itsroom=1;
  select sum(consume) into room2 from surf left join compute on compute.id=computerid where itsroom=2;
  select sum(consume) into room3 from surf left join compute on compute.id=computerid where itsroom=3;
  select sum(consume) into room4 from surf left join compute on compute.id=computerid where itsroom=4;
end;
