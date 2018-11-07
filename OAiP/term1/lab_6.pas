program lab_6;
type
    seasons = (winter, spring, summer, autumn); {all seasons}
var
    season : winter..autumn; {range of input values}
begin
    write('Enter some season: ');
    readln(season);

    case season of
        winter: write('Winter: December, January, Fabruary.');
        spring: write('Spring: March, April, May.');
        summer: write('Summer: June, July, August.');
        autumn: write('Autumn: September, October, November.');
    end;
end.