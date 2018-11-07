program lab_8;

const
  cars = 3; {amount of cars}
  
type
  car_and_price = record {type of one list element}
                    car: string[20];
                    price: string[10];
                  end;

  file_pattern = file of car_and_price; 
  
  
 var
  cars_and_prices_list: array [1..cars] of car_and_price; {list of cars and prices}
  i, j, f: integer; {parameters of for loops}
  cars_col_width, prices_col_width: integer; {width of each column}
  file_list : file_pattern; 

procedure printLine (width : integer);
    begin
        for f := 1 to width do
            write('Ä');
        {end for i}
    end;

procedure printCenteredHeader (header : string; width : integer);
    begin
        for f := 1 to trunc((width - length(header))/2) do
            write(' ');
        {end for i}
        write(header);
        for f := 1 to round((width - length(header))/2) do
            write(' ');
        {end for i}
    end;

procedure printDivision (char1, char2, char3 : string; width1, width2: integer);
    begin
        write(char1);
        printLine(width1);
        write(char2);
        printLine(width2);
        writeln(char3);
    end;

begin
  assign(file_list, './list.txt');
  rewrite(file_list);

  {cars_and_prices_list input and file_list writing}
  for i := 1 to cars do
      begin
          with cars_and_prices_list[i] do
              begin
                  writeln('Enter information about car number ', i ,': ');
                  write(' Car: ');
                  readln(car);
                  write(' Price: ');
                  readln(price);
              end;          
          write(file_list, cars_and_prices_list[i]);
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

  reset(file_list);

  {file_list reading and table printing}
  printDivision('Ú','Â','¿', cars_col_width, prices_col_width);

  write('³');
  printCenteredHeader('Cars',cars_col_width);
  write('³');
  printCenteredHeader('Prices($)',prices_col_width);
  writeln('³');

  printDivision('Ã','Å','´', cars_col_width, prices_col_width);
  
  // for i:= 1 to cars do
  //   begin
  //     write('³');
  //     write(cars_and_prices_list[i].car);
  //     for j:=1 to (cars_col_width - length(cars_and_prices_list[i].car)) do
  //       write(' ');
  //     {end for j}
  //     write('³'); 
  //     write(cars_and_prices_list[i].price:(prices_col_width));
  //     writeln('³'); 
  //   end;
  // {end for i}
  while not eof(file_list) do
    begin    
      read(file_list, cars_and_prices_list[1]);
      with cars_and_prices_list[1] do
        begin
          write('³');
          write(car);
          for j:=1 to (cars_col_width - length(car)) do
            write(' ');
          {end for j}
          write('³');
          write(price:(prices_col_width));
          writeln('³');
        end;
      {end with}
    end;
  {while i}
  printDivision('À','Á','Ù', cars_col_width, prices_col_width);
end.