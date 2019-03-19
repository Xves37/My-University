program test_prog;
uses crt;
const path = 'test.txt';
type 
    tline = array [1..19] of char; {type of one line }
    tfile = file of char;

{convet byte number to hex string}
function to_hex(y : byte) : string;
        const alph : array [0..15] of char = ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'); 
        var
            x : integer;
            work : string;

        begin
            work := '';
            repeat
                x:= y mod 16;
                y:= y div 16;
                work := alph[x] + work;
            until y = 0;
            to_hex := work;
        end;

{print one line with 19 chars and their hex forms}
procedure print_line(pos : integer; var f : tfile; var last_str_len : byte);
    var
        line_in : tline;
        j : integer;
        n : byte;
    begin
        n := 0;
        {read 19 chars} 
        for j := 1 to 19 do 
            begin
                if eof(f) then break;
                inc(n);
                read(f, line_in[j]);             
            end;
        {end for}

        gotoxy(1,pos); write(' ');
        {print 19 chars}
        for j := 1 to n do write(line_in[j]);

        gotoxy(21,pos); write(' ');
        {print its hex forms}
        for j := 1 to n do write(to_hex(ord(line_in[j])), ' ');

        gotoxy(80,pos);
        if pos <> 25 then write(' ');
        last_str_len := n;
    end;

{print full page}
procedure print_page(var f : tfile; var last_str_len : byte);
    var i : byte;
    begin
        for i := 1 to 25 do if not eof(f) then print_line(i, f, last_str_len);
    end;

var
    i : byte;
    point: longint; {menu position}
    f : tfile;
    key : char; {key button}
    last_str_len : byte;  {length of the last line}
begin
    assign(f, path);
    reset(f);

    {prepare screen}
    window(1,1,80, 25);
    textbackground(blue);
    clrscr;
    last_str_len := 0;

    {first page output}
    point := 0;
    print_page(f, last_str_len);

    {control loop}
    repeat
        key := readkey;

        if ord(key) = 0 then key := readkey;

        case ord(key) of
                27 : begin {escape}
                        exit;
                    end;
                72 : begin {up arrow}
                        if point <> 0 then
                            begin;
                                dec(point);
                                {move up (1 string)}
                                seek(f, filepos(f) - 19*25 - last_str_len);
                                print_page(f, last_str_len);
                            end;
                        {end if}
                    end;
                73 : begin {page up}
                        {move up (24 string and change point)}
                        if point < 25 then
                            begin
                                if point <> 0 then
                                    begin
                                        seek(f, filepos(f) - 19 * (24 + point) - last_str_len);
                                        print_page(f, last_str_len);                                
                                        point := 0;
                                    end;
                                {end if}
                            end
                        else
                            begin
                                if point <> 0 then
                                    begin
                                        seek(f, filepos(f) - 19 * (24 + 24)  - last_str_len);
                                        print_page(f, last_str_len);
                                        point := point - 24;
                                    end;
                                {end if}
                            end;
                        {end if}
                    end;
                80 : begin {down arrow}
                        if eof(f) then continue;
                        inc(point);
                        write(' ');
                        {print one line}
                        print_line(25, f, last_str_len);
                    end;
                81 : begin {page down}
                        if eof(f) then continue;
                        {print 24 lines}
                        for i := 1 to 24 do
                            begin
                                write(' ');
                                print_line(25, f, last_str_len);
                                if eof(f) then break;
                            end;
                        {end for}                        
                        point := point + i;
                    end;
                13 : begin
                        {just for debugging}
                        clrscr;
                        gotoxy(2,25);
                        write(point);
                        exit;
                    end;
        end;
    until (False);
    close(f);
end.