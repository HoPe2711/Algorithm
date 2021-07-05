var n:longint;
procedure nhap;
var  i:longint;
begin
 read(n);
 if n mod 2=0 then
  begin
   writeln(n div 2);
   for i:=1 to n div 2 do write(2,' ');
  end
 else
  begin
   n:=n-3;
   writeln(n div 2+1);
   write(3,' ');
   for i:=1 to n div 2 do writeln(2,' ');
  end;
end;
begin
 nhap;
end.