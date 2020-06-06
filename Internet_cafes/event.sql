create event surf_time
  on schedule every 30 second
  do update surf set online=online+30;
