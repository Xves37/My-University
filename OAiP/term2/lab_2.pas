program lab_2_test;
const
    path = './list.txt'; {file path}
    
type
    el = ^list_type; {type of link element of major list}

    info = record {type of information list}
            num: integer;
        end;
    
    list_type = record
            prev: el;
            value: info;
            next: el;
        end;

    f_type = file of info;

var
    start: el; {global var that store start of list}
    i : byte;
    output : info; {variable to read output from file}
    f : f_type; {output file}

function create_list() : el;
    var
        work : el;
        ans : string[3];
    begin
        new(work);
        create_list := work;

        {create first element}
        write('Value: ');
        readln(work^.value.num);
        work^.prev := nil;
        work^.next := nil;

        {list creating}
        repeat
            {add elements while user what}
            new(work^.next);  
            work^.next^.prev := work;      
            work := work^.next;

            write('Value: ');
            readln(work^.value.num);
            work^.next:=nil;

            write('Repeat(yes/no)? : ');
            readln(ans);
        until (ans='no');
    end;

procedure write_file(start : el; var f : f_type);
    begin
        reset(f);
        write(f, start^.value);
        repeat
            start := start^.next;
            write(f, start^.value);
        until (start^.next = nil);
    end;

function file_to_list(var f : f_type) : el;
    var
        work : el;
    begin
        reset(f);
        new(work);
        file_to_list := work;

        {create first element}
        read(f, work^.value);
        work^.prev := nil;
        work^.next := nil;

        {list creating}
        while not eof(f) do
            begin                
                new(work^.next);  
                work^.next^.prev := work;      
                work := work^.next;
                
                read(f, work^.value);
                work^.next:=nil;
            end;
    end;

procedure print_file(var f : f_type);
    begin
       reset(f);
       write('File(' , path ,'): ');
       while not eof(f) do
            begin
                {get and print information from the file}
                read(f, output);
                write(output.num ,' ');
            end;
        {end while}
        writeln;
    end;

procedure swap(p1, p2 : el; var start : el);
    begin
        if p1^.prev = nil then p2^.prev := nil
        else p2^.prev := p1^.prev;
        
        if p2^.next = nil then p1^.next := nil
        else p1^.next := p2^.next;

        if p1^.prev <> nil then p1^.prev^.next := p2;
        if p2^.next <> nil then p2^.next^.prev := p1;

        p1^.prev := p2;
        p2^.next := p1;

        if start = p1 then start := p2;
    end;

procedure print_list(start : el);
    begin
        write('List: ');
        while start^.next <> nil do 
        begin
            write(start^.value.num, ' ');
            start := start^.next;
        end;
        write(start^.value.num);
    end;

procedure sort(var start : el);
    var
        work, stand : el;
    begin
        writeln('Sorting...');
        work := start;
        while work^.next <> nil do
            if work^.value.num > work^.next^.value.num then
                begin
                    // writeln('Swap: ', work^.value.num, ' ' ,work^.next^.value.num);
                    swap(work, work^.next, start);
                    // write('List: ');print_list(start);writeln;
                    stand := work;
                    while work^.prev <> nil do
                            if work^.value.num < work^.prev^.value.num then
                                swap(work^.prev, work, start)
                            else work := work^.prev;
                    {end while}
                    work := stand;
                end
            else work := work^.next;
        {end while}
    end;

begin
    assign(f, path);
    rewrite(f);

    {testing}
    // print_file(f);
    // start := file_to_list(f);
    // writeln;
    // sort(start);
    // print_list(start);

    {part 1}
        {list creating, writing list to the file, file printing}
        start := create_list();
        write_file(start, f);
        print_file(f);

    {part 2}
        {from file to dinamic, sorting, writing list to the file, file printing}
        start := file_to_list(f);
        sort(start);
        write_file(start, f);
        print_file(f);
    close(f);
end.    