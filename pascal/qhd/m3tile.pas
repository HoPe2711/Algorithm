var f:array[0..30] of longint;
    n:longint;
procedure xuli;
var i:longint;
begin
 f[0]:=1;
 f[2]:=3;
 i:=4;
 while i<=30 do
  begin
   f[i]:=4*f[i-2]-f[i-4];
   i:=i+2;
  end;
end;
begin
 xuli;
 while not seekeof do
  begin
   read(n);
   if n=-1 then halt;
   writeln(f[n]);
  end;
end.