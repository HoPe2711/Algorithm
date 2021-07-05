uses math;
var n:longint;
    a:array[0..1000000] of longint;
    f:array[0..1000000,0..1] of int64;
procedure nhap;
var  i:longint;
begin
 read(n);
 for i:=1 to n do read(a[i]);
end;
procedure xuli;
var  i,j:longint;
begin
  for i:=1 to n do
   for j:=0 to 1 do f[i,j]:=-(high(int64) div 2) ;
 for i:=1 to n do
  for j:=0 to 1 do
   begin
    if j=0 then f[i,j]:=max(max(f[i-1,j],f[i-1,1]+a[i]),a[i])
    else if i>1 then f[i,j]:=max(f[i-1,j],f[i-1,0]-a[i]);
   end;
  //for i:=1 to n do writeln(f[i,0],' ',f[i,1]);
 write(max(f[n,1],f[n,0]));
end;
begin
 nhap;
 xuli;
end.