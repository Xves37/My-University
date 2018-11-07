program lab_1_for;
var n,m,i,sum: integer;
begin
  readln(n);
  readln(m);
  sum:=0;
  
  for i:= m to n do
   if (i mod 2 = 0) then sum:=sum+i;
  {end for n > m}
  
  writeln(sum);
end.