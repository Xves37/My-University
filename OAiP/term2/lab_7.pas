program lab_7;
const
    limit = 10;
type
    basis_limit = 2..16; {range of basis values}

var
    basis: basis_limit; {basis variable with the range from 2 to 16}
    answer : string[10];
    dec_num : real;
    nth_num : string;

function char_to_num(chr : char) : byte;
    const
        digits = '0123456789abcdef';
    var
        i : byte;
    begin
        {take digit and convert it to number}
        for i := 1 to 16 do
            if chr = digits[i] then
                char_to_num := i - 1
    end;

function dec_to_nth(dec_num: real) : string;
    var
        int : integer;
        frac: real;
        alph : array [0..15] of char = ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'); 

    function int_calc(y : integer) : string;
        const alph : array [0..15] of char = ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'); 
        var
            x : integer;
        
        begin
            int_calc := '';
            repeat
                x:= y mod basis;
                y:= y div basis;
                int_calc := alph[x] + int_calc;
            until y = 0;
        end;

    function frac_calc(frac: real) : string;
        begin
            frac_calc := '';
            while (length(frac_calc) <> limit) and (frac <> 1) do
              begin
                frac := frac * basis;
                if frac > basis then
                  begin
                    frac_calc := frac_calc + alph[trunc(frac) - basis * (trunc(frac) div basis)];
                    frac := frac - basis * (trunc(frac) div basis);
                  end
                else frac_calc := frac_calc + alph[trunc(frac)];
              end;
            {end while}
        end;
         
    begin
        {int: find integer part}        
        int := trunc(dec_num);
        {frac: find fractal part)}
        frac := dec_num - trunc(dec_num);

        {return result of calculations}
        dec_to_nth := int_calc(int) + '.' +  frac_calc(frac);
    end;


function  nth_to_dec(nth_num: string) : real;
    var
        int: string;
        frac: string;
    function int_calc(int : string) : integer;
        var
            num, i : byte;
            powered : integer;
        begin
            {calculate integer part of number of n-th basis}
            {powered and frac_calc init}
            int_calc:=0;
            powered := 1;
            for i:=1 to length(int) do
                begin
                    {convert n-th char to integer num}
                    num := char_to_num(int[i]);

                    {math fomula}
                    int_calc := int_calc + num * powered;

                    {change powered for the next calculation}
                    powered := powered * basis;
                end;
            {end for i}
        end;

    function frac_calc(frac: string) : real;    
        var
            num, i : byte;
            powered : real;
        begin
            {calculate fractal part of number of n-th basis}
            {powered and frac_calc init}
            frac_calc:=0;
            powered := 1/basis;
            for i:=1 to length(frac) do
                begin
                    {convert n-th char to integer num}
                    num := char_to_num(frac[i]);

                    {math formula}
                    frac_calc := frac_calc + num * powered;

                    {change powered for the next calculation}
                    powered := powered / basis;
                end;
            {end for i}
        end;
    begin
        {int: find integer part}
        int := copy(nth_num, 1, pos('.', nth_num) - 1);
        if int = '' then int := nth_num;
        {frac: find fractal part)}
        if pos('.', nth_num) = 0 then frac := ''
        else frac := copy(nth_num, pos('.', nth_num) + 1, length(nth_num));

        {return result of calculations}
        nth_to_dec := int_calc(int) + frac_calc(frac);
    end;

function is_valid(nth_num : string) : boolean;
    const
        digits = '0123456789abcdef.';
    var
        i : byte;
    begin
        is_valid := True;

        for i := 1 to length(nth_num) do
            begin
                if pos(nth_num[i], digits) = 0 then
                    begin
                        writeln('Invalid char: ', nth_num[i]);
                        is_valid := False;
                    end;
                {end for}
            end;
        {end for}        
    end;
    
begin
    {menu}
    repeat
        {function name, num, basis}
        writeln('Choose function (dec_to_nth/nth_to_dec): ');
        readln(answer);

        if answer = 'dec_to_nth' then
            begin
                {input num and basis}
                write('Enter basis: '); readln(basis);
                write('Enter decimal number: '); readln(dec_num);

                writeln('Result: ', dec_to_nth(dec_num))
            end
        else if answer = 'nth_to_dec' then
            begin
                {input num and basis}
                write('Enter basis: '); readln(basis);

                repeat
                    write('Enter number: '); readln(nth_num);
                    if is_valid(nth_num) then break;
                until (False);

                writeln('Result: ', nth_to_dec(nth_num)) 
            end
        else
            begin
                {error alert}
                writeln('Wrong input!');
                continue;
            end;

        {ask to continue}
        write('Continue? (y/n): ');
        readln(answer);
    until answer = 'n';
end.