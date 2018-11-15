program lab_1;
const 
    n = 10;

type
    res_pattern  = array[1..5, 1..4] of integer;
    arr  = array[1..n] of integer;
    test = array[1..5] of arr;

var 
    a : test = (
            (10,9,8,7,6,5,4,3,2,1),
            (1,2,3,4,5,6,7,8,9,10),
            (2,4,1,3,10,1,9,10,9,10),
            (3,5,7,1,9,10,8,6,2,7),
            (10,4,6,1,8,3,6,1,4,2)
        );
    res : res_pattern;
    i,j : integer;

procedure printArray(a : arr);
    var
        i: integer;
    begin
        for i:= 1 to length(a) do
            write(a[i], ' ')
    end;

function sort_bubble(a : arr) : integer;
    var 
        j, i, min, counter: integer;
        
    begin
        counter := 0;
        for i := 1 to length(a) - 1 do
            begin
                counter := counter + 1;
                if a[i] > a[i + 1] then
                    begin
                        {a[i] and a[i+1] swap}
                        min := a[i];
                        a[i] := a[i + 1];
                        a[i + 1] := min;
                        // printArray(a);
                        // writeln();
                        for j := i downto 2 do
                            begin
                                counter := counter + 1;
                                if a[j] < a[j - 1] then
                                    begin
                                        {a[j] and a[j-1] swap}
                                        min := a[j];
                                        a[j] := a[j - 1];
                                        a[j - 1] := min;
                                        // printArray(a);
                                        // writeln();
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
        sort_bubble := counter;
    end;

function sort_min(a : arr) : integer;
    var 
        j, i, min, pos, counter: integer;
    begin
        counter := 0;
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
        sort_min := counter;
    end;

function sort_dr_f(a : arr) : integer;
    var 
        j, i, min, counter : integer;
        flag : boolean;
    begin
        counter := 0;
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
        sort_dr_f := counter;
    end;

function sort_dr(a : arr) : integer;

    var 
        j, i, min, counter : integer;
    begin
        counter := 0;
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
        sort_dr := counter;
    end;    

begin

    for i := 1 to 5 do
        begin
            res[i][1] := sort_min(a[i]);
            res[i][2] := sort_dr(a[i]);
            res[i][3] := sort_dr_f(a[i]);
            res[i][4] := sort_bubble(a[i]);
        end;
    {end for}
    
    {output}
    writeln('     min     dr   dr_f   bubble');
    for i := 1 to 5 do
        begin
            write(i, ' ');
            for j := 1 to 4 do 
                write(res[i, j] : 7);
            {end for}
            writeln();
        end;
    {end for} 
end.