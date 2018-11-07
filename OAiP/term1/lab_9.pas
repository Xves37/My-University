program lab_9;

var k: 1..9;

function numberNameIf(num : integer) : string;
    begin
        if (1 = num) then
            numberNameIf:='One'
        else
            if (2 = num) then
                numberNameIf:= 'Two'
            else
            if (3 = num) then
                numberNameIf:= 'Three'
            else 
                if (4 = num) then
                    numberNameIf:= 'Four'
                else
                if (5 = num) then
                    numberNameIf:= 'Five'
                else
                    if (6 = num) then
                        numberNameIf:= 'Six'
                    else
                    if (7 = num) then
                        numberNameIf:= 'Seven'
                    else
                        if (8 = num) then
                            numberNameIf:= 'Eight'
                        else 
                        if (9 = num) then
                            numberNameIf:= 'Nine';
                        {end if 9 = k}
                        {end if 8 = k}
                    {end if 7 = k}
                    {end if 6 = k}
                {end if 5 = k}
                {end if 4 = k}
            {end if 3 = k}
            {end if 2 = k}
        {end if 1 = k}
    end;

procedure numberNameCase(num : integer);
    begin
        case k of 
            1: write('One');
            2: write('Two');
            3: write('Three');
            4: write('Four');
            5: write('Five');
            6: write('Six');
            7: write('Seven');
            8: write('Eight');
            9: write('Nine');
        end;
    end;
    
begin
    write('Enter argument k to test fucntion: ');
    readln(k);    
    writeln(numberNameIf(k));
    write('Enter another k to test procedure: ');
    readln(k);
    numberNameCase(k);
end.