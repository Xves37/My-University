unit menu; {module with tools to printing vertical menu and return result of choosing}
interface
     uses crt;
     const n = 5; {number of elements}
     type tmenu = array [1..n] of string;  {type of main array}
     procedure vert_menu(arr : tmenu; n, x1, y1 : byte; var res : byte);

implementation
     procedure vert_menu;
     var
          i, j, x2, y2, max, point : byte;
          key : char;
     begin
          textbackground(black);
          clrscr;
               {calculate max length of array of strings}
               max := 1;
               for i := 1 to n do if length(arr[max]) < length(arr[i]) then max := i;

               {calculate x2, y2}
               x2 := x1 + length(arr[max]);
               y2 := y1 + n;

               {fill all strings with spaces}
               for i := 1 to n do for j := 1 to length(arr[max]) - length(arr[i]) do arr[i] := arr[i] + ' ';

               window(x1,y1,x2,y2);
               textbackground(blue);
               gotoxy(1,1);

               {menu string output}
               for i := 1 to n do
                    begin
                         writeln(arr[i]);
                    end;
               {end for}

               {cursor size to 0 (assembly code)}
               asm
               MOV AH,01;
               MOV CL,00;
               INT 10H;
               end;

               {select first string}
               point := 1;
               gotoxy(1,1);
               textbackground(magenta);
               write(arr[1]);


               repeat
                    key := readkey;

                    if ord(key) = 0 then key := readkey;

                    textbackground(blue);
                    gotoxy(1,point);
                    write(arr[point]);

                    case ord(key) of
                         27 : begin {escape}
                                   res := 0;
                                   exit;
                              end;
                         13 : begin {enter}
                                   res := point;
                                   exit;
                              end;
                         72 : begin {up arrow}
                                   point := point - 1;
                                   if point = 0 then point := n;
                              end;
                         80 : begin {down arrow}
                                   point := point + 1;
                                   if point > n then point := 1;
                              end;
                    end;

                    {select point element}
                    textbackground(magenta);
                    gotoxy(1, point);
                    write(arr[point]);
               until (False);

     end;
     end.