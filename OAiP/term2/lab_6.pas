program lab_6;
var path1, path2 : string;

{procedure that copy file with path1 to file with path2}
procedure copy(path1, path2: string);
    type tbuffer = array [1..512] of byte;
    var         
        f1, f2 : file; {variables of main file and its copy}
        file_size, blocks_n, i, file_end : longint; {file size and number of blocks}
        buffer : tbuffer; {size of one block}

    begin
        {open file (f1, f2) with 1 byte size}
        assign(f1, path1);
        assign(f2, path2);
        reset(f1, 1);
        rewrite(f2, 1);

        {count size of file (file_size)}
        file_size := filesize(f1);

        {count number of blocks (blocks_n)}
        blocks_n := file_size div 512;

        {count fize of file end (file_end)}
        file_end := file_size mod 512;

        writeln('File size: ', file_size);
        writeln('Number of blocks: ', blocks_n);
        writeln('File end: ', file_end);

        {open files (f1, f2) with 512 byte size}
        reset(f1, 512);
        reset(f2, 512);

        {copy 512 byte blocks}
        for i := 1 to blocks_n do
            begin
                blockread(f1,buffer,1);
                blockwrite(f2, buffer,1);
            end;
        {end for}

        {open files (f1, f2) with 1 byte size}
        reset(f1, 1);
        reset(f2, 1);

        {move pointers of files (f1, f2) to the end (512 * blocks_n)}
        seek(f1, 512 * blocks_n);
        seek(f2, 512 * blocks_n);

        blockread(f1, buffer, file_end);
        blockwrite(f2, buffer, file_end);

        writeln('File ', path1, ' was copied into ', path2);
    end;

begin
    {path1 and path2 input}
    write('Enter path of file you want to copy: ');
    readln(path1);
    write('Enter path of file you copy into: ');
    readln(path2);

    copy(path1, path2);
end.