{---------------------------------------
Small shell utility to convert any texts file
into quoted pascal string variable which then
can be included as part of Pascal program using
directive $INCLUDE

@author irfanbagus
@link http://forum.lazarus.freepascal.org/index.php?topic=20706.0
----------------------------------------}
program txt2inc;

{$mode objfpc}{$H+}

uses
  classes, sysutils;

var
  src, dst: TStringList;
  i: integer;
begin
    if paramCount < 3 then
    begin
        writeLn();
        writeLn(ExtractFileName(ParamStr(0))+' [source] [dest] [const name]');
        exit;
    end;

    src:= TStringList.Create();
    dst:= TStringList.Create();
    try
        src.loadFromFile(paramStr(1));
        dst.add(paramStr(3)+': string = ');

        for i:=0 to src.count-2 do
        begin
            dst.add('    ' + QuotedStr(src[i]) + '+#13#10+');
        end;

        if (src.count > 1) then
        begin
            dst.add('    ' + QuotedStr(src[src.count-1]) + ';');
        end;

        dst.saveToFile(paramStr(2));
    finally
        src.free();
        dst.free();
    end;
end.
