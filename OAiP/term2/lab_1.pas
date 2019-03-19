program lab_1;
const 
    n = 10; {number of elements in 1 array}
    width = 14;

type
    res_pattern  = array[1..5, 1..4] of integer; {type of major storage}
    arr  = array[1..n] of integer;
    test = array[1..5] of arr;

var 
    a : test = ( {testing arrays}
            (10,9,8,7,6,5,4,3,2,1),
            (1,2,3,4,5,6,7,8,9,10),
            (2,4,1,3,1,1,9,1,9,10),
            (3,5,7,1,9,10,8,6,2,7),
            (1,2,3,10,8,3,6,1,4,2)
        );
    res : res_pattern; {stucture that store number of comparisons}
    i,j : integer;

procedure printArray(a : arr);
    var
        i: integer;
    begin
        for i:= 1 to length(a) do
            write(a[i], ' ')
    end;

procedure printLine (len : integer);
    var
        f : integer;
    begin
        for f := 1 to len do
            write(chr(196));
        {end for i}
    end;

procedure printCenteredHeader (header : string);
    var
        f : integer;
    begin
        for f := 1 to trunc((width - length(header))/2) do
            write(' ');
        {end for i}
        write(header);
        for f := 1 to round((width - length(header))/2) do
            write(' ');
        {end for i}
    end;

procedure printDivision (char1, char2, char3 : string);
    var
        f : integer;
    begin
        write(char1);
        for f := 1 to 4 do
            begin
                printLine(width);
                write(char2);                 
            end;          
        {end for}
        printLine(width);
        writeln(char3);
    end;

function sort_bubble(a : arr) : integer;
    var 
        j, i, min, counter: integer;
        
    begin
        counter := 0;

        write('Bubble:            '); printArray(a); write('-> ');

        {bubble sort algorithm}
        for i := 1 to length(a) - 1 do
            begin
                counter := counter + 1;
                if a[i] > a[i + 1] then
                    begin
                        {a[i] and a[i+1] swap}
                        min := a[i];
                        a[i] := a[i + 1];
                        a[i + 1] := min;
                        for j := i downto 2 do
                            begin
                                counter := counter + 1;
                                if a[j] < a[j - 1] then
                                    begin
                                        {a[j] and a[j-1] swap}
                                        min := a[j];
                                        a[j] := a[j - 1];
                                        a[j - 1] := min;
                                    end
                                else 
                                    break;
                            end;
                            {end if}
                        {end for}
                    end;
                {end if}
            end;
        {end for}

        printArray(a); writeln();

        sort_bubble := counter;
    end;

function sort_min(a : arr) : integer;
    var 
        j, i, min, pos, counter: integer;
    begin
        counter := 0;

        write('Min:               '); printArray(a); write('-> ');

        {min element sort algorithm}
        for i:= 1 to length(a) - 1 do
            begin
                min := a[i];
                pos := i;
                for j := i + 1 to length(a) do
                    begin
                        counter := counter + 1;                   
                        if min > a[j] then 
                            begin 
                                min := a[j];
                                pos := j;
                            end;
                        {end if}
                    end;
                {end for}
                a[pos] := a[i];
                a[i] := min;
            end;
        {end for}

        printArray(a); writeln();

        sort_min := counter;
    end;

function sort_clocker_flag(a : arr) : integer;
    var 
        j, i, min, counter : integer;
        flag : boolean;
    begin

        write('Clocker with flag: '); printArray(a); write('-> ');

        counter := 0;
        {clocker sort algorithm with flag}
        for i := 1 to length(a) - 1 do
            begin
                flag := true;
                for j := 1 to length(a) - i do
                    begin
                        counter := counter + 1;
                        if a[j] > a[j + 1] then
                            begin
                                min := a[j];
                                a[j] := a[j + 1];
                                a[j + 1] := min;
                                flag := false;
                            end;
                        {end if}
                    end;
                {end for}
                if flag then break;        
            end;
        {end for}

        printArray(a); writeln();

        sort_clocker_flag := counter;
    end;

function sort_clocker(a : arr) : integer;
    var 
        j, i, min, counter : integer;
    begin
        write('Clocker:           '); printArray(a); write('-> ');

        counter := 0;
        {clocker sort algorithm}
        for i := 1 to length(a) - 1 do
            begin
                for j := 1 to length(a) - i do
                    begin
                        counter := counter + 1;
                        if a[j] > a[j + 1] then
                            begin
                                min := a[j];
                                a[j] := a[j + 1];
                                a[j + 1] := min;
                            end;
                        {end if}
                    end;
                {end for}      
            end;
        {end for}

        printArray(a); writeln();

        sort_clocker := counter;
    end;    

begin
    {sort all arrays and count comparisons}
    for i := 1 to 5 do
        begin
            res[i][1] := sort_min(a[i]);
            res[i][2] := sort_clocker(a[i]);
            res[i][3] := sort_clocker_flag(a[i]);
            res[i][4] := sort_bubble(a[i]);
        end;
    {end for}

    {print table with output}
    printDivision(chr(218), chr(194), chr(191));
    write(chr(179));
    printCenteredHeader('Array/Sort');
    write(chr(179));
    printCenteredHeader('Min');
    write(chr(179));
    printCenteredHeader('Clocker');
    write(chr(179));
    printCenteredHeader('Clock. Flag');
    write(chr(179));
    printCenteredHeader('Bubble');
    writeln(chr(179));
    printDivision(chr(195), chr(197), chr(180));
    for i := 1 to 5 do
        begin
            write(chr(179));
            write(' ', i, '.');
            for j := 1 to 11 do write(' ');
            write(chr(179));
            for j := 1 to 4 do 
                write(res[i, j] : 14, chr(179));
            writeln();
        end;
    {end for}
    printDivision(chr(192), chr(193), chr(217));
end.