program lab_7;

var 
    str: string[255];
    i: byte;
    k, letter: char;
    letters: array ['f'..'t'] of byte;
    alphabeth, alphabethUp: set of char;
  
begin
    alphabeth:= ['f', 'k', 'p', 's', 't'];
    alphabethUp:= ['F', 'K', 'P', 'S', 'T'];

    {str input}
    write('Enter some string(max length = 256): ');
    readln(str);

    for k:='f' to 't' do
       letters[k]:= 0;
    {end for}

    for i:=1 to length(str) do
        begin
            {make letter in lower case}
            if (str[i] in alphabeth) then 
             letter:= str[i]        
            else if (str[i] in alphabethUp)then
             letter:= chr(ord(str[i]) + 32);
            {end if}
            
            if letter in alphabeth then
             letters[letter]:= letters[letter] + 1;
            {end}
        end;
    {end for}

    {letters output}
    for k:='f' to 't' do
      if letters[k] <> 0 then
          writeln(k, ': ', letters[k]);
      {end if}
    {end for}
end.