uses math;
const oo=1000000000;
var a:Array[0..200000] of longint;
    n,k:longint;
    res:int64;
    f:array[0..100001,0..101] of int64;
procedure nhap;
var i:longint;
begin
 read(n,k);
 for i:=1 to n do read(a[i]);
end;
procedure xuli;
var i,j:longint;
begin
 //res:=-oo;
 for i:=0 to n do
  for j:=0 to k do f[i,j]:=-oo;
 for i:=0 to n do f[i,0]:=0;
 for i:=0 to n-1 do
  for j:=0 to k do
   if f[i,j]<>-oo then
   begin
    if (a[i+1]<0) and (j<>k) then f[i+1,j+1]:=max(f[i,j]+a[i+1],f[i+1,j+1]);
    if a[i+1]>=0 then f[i+1,j]:=max(f[i+1,j],f[i,j]+a[i+1]);
   end;
 for i:=1 to n do
  for j:=0 to k do res:=max(res,f[i,j]);
 write(res);
end;
begin
 assign(input,'checkpoint.inp');reset(input);
 assign(output,'checkpoint.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
