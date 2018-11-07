program lab_3;
var matrix: array [1..100, 1..100] of real;
    rows, cols: 1..100;
    i, j, count: integer;
    a: real;
begin

  write('Enter amount of rows (max: 100): ');
  readln(rows);
  write('Enter amount of columns (max: 100): ');
  readln(cols);
  
  writeln('Enter elements of ', rows, 'x', cols, ' matrix.');
  for i:= 1 to rows do
    begin
     writeln('Line ', i, ':');
     for j:= 1 to cols do
      begin
        write(' Element ', j, ': ');
        readln(matrix[i][j]);
       end;
     {end for j}
    end;
  {end for i}
  
  write('Enter A: ');
  readln(a);
  
  count:= 0;
  for i:= 1 to rows do
    begin
      if (i mod 2 = 1) then continue;
      for j:= 1 to cols do
        begin
          if (j mod 2 = 1) then continue;
          if (matrix[i, j] > a) then count:=count+1;          
        end;
      {end for j}
    end;
  {end for i}
  
  write('Count of better than ', a, ' elements in odd rows and columns is ', count);
  
  
end.