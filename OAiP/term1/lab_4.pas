program lab_4;

const
  cars = 5; {amount of cars}
  
type
  car_and_price = record {type of one list element}
    car: string[20];
    price: string[10];
  end;
  
 var
  cars_and_prices_list: array [1..cars] of car_and_price; {list of cars and prices}
  i, j: integer; {parameters of for loops}
  cars_col_width, prices_col_width: integer; {width of each column}
  
begin

  {car_and_price_list input}
  for i:= 1 to cars do
    begin
      writeln('Enter data of ', i, ' car: ');
      write(' Car: ');
      readln(cars_and_prices_list[i].car);
      write(' Price(USD): ');
      readln(cars_and_prices_list[i].price);
    end;
  {end for i}
  
  {width of column with car names counter}
  cars_col_width:= 6;
  for i:=1 to cars do
    if length(cars_and_prices_list[i].car) > cars_col_width then
      cars_col_width := length(cars_and_prices_list[i].car);
  {end for i}
  if cars_col_width mod 2 = 1 then {if width if odd add 1 to it}
    cars_col_width:= cars_col_width + 1;
  {end if}
  
  {width of column with prices counter}
  prices_col_width:= 12;
  for i:=1 to cars do
    if length(cars_and_prices_list[i].price) > prices_col_width then
      prices_col_width := length(cars_and_prices_list[i].price);
  {end for i}
  if prices_col_width mod 2 = 1 then {if width if odd add 1 to it}
    prices_col_width:= prices_col_width + 1;
  {end if}
  
  {print table}
  {print first line}
  write('┌'); {print top right angle}
  for i:= 1 to cars_col_width do {print line with cars_col_width width}
    write('─');
  {end for i}
  write('┬'); {print cross without top line}
  for i:= 1 to prices_col_width do {print line with prices_col_width width}
    write('─');
  {end for i}  
  writeln('┐');{print top left angle and move to the next line}
  
  {print table header}
  write('│'); {print vertical line}
  {print centered header of the first column}
  for i:= 1 to round((cars_col_width-4)/2) do
    write(' ');
  {end for i}
  write('Cars');
  for i:= 1 to trunc((cars_col_width-4)/2) do
    write(' ');
  {end for i}
  write('│'); {print vertical line}
  {print centered header of the second column}
  for i:= 1 to round((prices_col_width-9)/2) do
    write(' ');
  {end for i}
  write('Prices($)');
  for i:= 1 to trunc((prices_col_width-9)/2) do
    write(' ');
  {end for i}
  writeln('│'); {print vertical line and move to the next line}
  
  {print another line}
  write('├'); {print cross without left line}
  for i:= 1 to cars_col_width do {print line with cars_col_width width}
    write('─');
  {end for i}
  write('┼'); {print cross}
  for i:= 1 to prices_col_width do {print line with prices_col_width width}
    write('─');
  {end for i}  
  writeln('┤');{print cross without right line and move to next line}
  
  {print content}
  for i:= 1 to cars do
    begin
      write('│'); {print vertical line}
      write(cars_and_prices_list[i].car); {print car name}
      {fill empty space after car name}
      for j:=1 to (cars_col_width - length(cars_and_prices_list[i].car)) do
        write(' ');
      {end for j}
      write('│'); {print vertical line}
      {fill empty space after price}
      write(cars_and_prices_list[i].price:(prices_col_width));
      writeln('│'); {print vertical line and move to the next line}
    end;
  {end for i}
  
  {print last line}
  write('└'); {print bottom right angle}
  for i:= 1 to cars_col_width do {print line with cars_col_width width}
    write('─');
  {end for i}
  write('┴'); {print cross without bottom line}
  for i:= 1 to prices_col_width do {print line with prices_col_width width}
    write('─');
  {end for i}  
  writeln('┘');{print bottom left angle and move to the next line}
end.