program lab_3;
uses crt, menu;
const
     test_arr : tmenu = ('1. Meeow','2. Roof','3. Ko-ko-ko','4. Tmok-tmok-tmok','5. Be-be-be');
var
    i, res : byte;
    {arr : tmenu;}

begin
    vert_menu(test_arr, n, 5, 7, res);

    {print res in the new window}
    textbackground(black);
    clrscr;
    window(1,1,80,25);
    gotoxy(1,1);
    write('Result: ', res);
end.