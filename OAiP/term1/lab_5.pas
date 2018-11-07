program testLIne;
const 
    workers = 1;

type 

    fullName = (first, last);

    address_patern = record
                        city : string[15];
                        street : string[20];
                        house: string[5]
                    end;

    worker_patern = record
                        address : address_patern;
                    case nameKind : fullName of
                        first : (firstName : string[15]);
                        last : (lastName : string[15]);
                    end;

var
    workersList : array [1..workers] of worker_patern; 
    i, f, nameColWidth, lastNameColWidth, addressColWidth : integer;
    ans : 1..2;

procedure printLine (width : integer);
    begin
        for f := 1 to width do
            write('?');
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

procedure printDivision (char1, char2, char3 : string; width1, width2, width3 : integer);
    begin
        write(char1);
        printLine(width1);
        write(char2);
        printLine(width2);
        write(char2);    
        printLine(width3);
        writeln(char3);
    end;

procedure printRightedText (text : string; width : integer);
    begin
        write(text);
        for f := 1 to width - length(text) do
            write(' ')
        {end for}
    end;

begin
    {workers list input}
    writeln();
    writeln('Enter information about workers:');
    for i := 1 to workers do
        with workersList[i] do
            begin
                while(true) do
                    begin
                        write(' Choose how you wanna identify worker number ', i,' (1 - first name, 2 - last name): ');
                        readln(ans);
                        if ans = 1 then
                            begin
                                nameKind := first;
                                write(' Enter first name: ');
                                readln(firstName);
                                break;
                            end
                        else if ans = 2 then
                            begin                                
                                nameKind := last;
                                write(' Enter last name: ');
                                readln(lastName);
                                break;
                            end;
                        {end if}
                    end;
                {end while}
                writeln(' Enter full address:');
                with address do
                    begin
                        write('     City: ');
                        readln(city);
                        write('     Street: ');
                        readln(street);
                        write('     House: ');
                        readln(house);
                    end;
                {end with}
            end;
        {with}
    {end for i}

    {count name-,lastName-,address- ColWidth}
    nameColWidth := 4;
    lastNameColWidth := 9;
    addressColWidth := 8;
    for i := 1 to workers do
        with workersList[i] do
            begin
                if nameKind = first then
                    if length(firstName) > nameColWidth then nameColWidth := length(firstName)
                else 
                    if length(lastName) > lastNameColWidth then lastNameColWidth := length(lastName);
                {end if nameKind = first}
                with address do
                    if (3 + length(house) + length(street) + length(city) > addressColWidth) then
                        addressColWidth := 3 + length(house) + length(street) + length(city);
                    {end if} 
            end;
        {with end}
    {end for i}
    if (nameColWidth mod 2) = 1 then nameColWidth := nameColWidth + 3
    else nameColWidth := nameColWidth + 2;
    if (lastNameColWidth mod 2) = 1 then lastNameColWidth := lastNameColWidth + 3
    else lastNameColWidth := lastNameColWidth + 2;
    if (addressColWidth mod 2) = 0 then addressColWidth := addressColWidth + 3
    else addressColWidth := addressColWidth + 2;

    {print table}
    {print first line}
    printDivision('?', '?', '?', nameColWidth, lastNameColWidth, addressColWidth);
    {print centered headers}
    write('?');
    printCenteredHeader('Name', nameColWidth);
    write('?');
    printCenteredHeader('Last Name', lastNameColWidth);
    write('?');
    printCenteredHeader('Address', addressColWidth);
    writeln('?');
    {print division}
    printDivision('?', '?', '?', nameColWidth, lastNameColWidth, addressColWidth);
    {print content}
    for i := 1 to workers do
        with workersList[i] do
            begin
                write('?');
                if nameKind = first then printRightedText(firstName, nameColWidth)
                else printRightedText('', nameColWidth);
                write('?');
                if nameKind = last then printRightedText(lastName, lastNameColWidth)
                else printRightedText('', lastNameColWidth);
                write('?');
                with address do
                    printRightedText(city + ', ' + street + ' ' + house, addressColWidth);
                {end with}
                writeln('?');
            end;
        {end with}
    {end for}
    {print last line}
    printDivision('?', '?', '?', nameColWidth, lastNameColWidth, addressColWidth);
end.