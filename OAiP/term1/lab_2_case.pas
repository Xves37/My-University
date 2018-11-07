program lab_2_case;
var k:1..9;
    res:string;
begin
  write('Enter some number from 1 to 9: ');
  readln(k);
  
  case k of 
    1: res := 'One';
    2: res := 'Two';
    3: res := 'Three';
    4: res := 'Four';
    5: res := 'Five';
    6: res := 'Six';
    7: res := 'Seven';
    8: res := 'Eight';
    9: res := 'Nine';
  end;
    
  write('You wrote: ', res);
end.