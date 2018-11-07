program lab_2_if;
var k: 1..9;
    res: string; 
begin
  write('Enter some number from 1 to 9: ');
  readln(k);
  
  if (1 = k) then
    res:='One'
  else
    if (2 = k) then
      res:= 'Two'
    else
      if (3 = k) then
        res:= 'Three'
      else 
        if (4 = k) then
          res:= 'Four'
        else
          if (5 = k) then
            res:= 'Five'
          else
            if (6 = k) then
              res:= 'Six'
            else
              if (7 = k) then
                res:= 'Seven'
              else
                if (8 = k) then
                  res:= 'Eight'
                else 
                  if (9 = k) then
                    res:= 'Nine';
                  {end if 9 = k}
                {end if 8 = k}
              {end if 7 = k}
            {end if 6 = k}
          {end if 5 = k}
        {end if 4 = k}
      {end if 3 = k}
    {end if 2 = k}
  {end if 1 = k}

  write('You wrote: ', res);
end.