program lab_1_while;
var n,m,sum: integer;
begin
  readln(n);
  readln(m);
  sum:=0;
  
  while n >= m do 
    begin
      if (m mod 2 = 0) then sum:=sum+m;      
      m:=m+1;
    end;
    
  {end while n > m}
  writeln(sum);
end.