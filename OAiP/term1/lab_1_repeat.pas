program lab_1_repeat;
var n,m,sum: integer;
begin
  readln(n);
  readln(m);
  sum:=0;
  
  repeat
    if (m mod 2 = 0) then sum:=sum+m;;      
    m:=m+1;
  until m > n;
  
  writeln(sum);
end.