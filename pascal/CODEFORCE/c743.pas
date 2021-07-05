var n:longint;
procedure nhap;
begin
 read(n);
 if n=1 then
  begin
   write(-1);
   exit;
  end;
// write(n,' ',2*n,' ',2*n);
 writeln(n,' ',1+n,' ',n*n+n);
end;
begin
 nhap;
end.