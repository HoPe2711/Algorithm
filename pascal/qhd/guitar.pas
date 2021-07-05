uses math;
const oo=high(int64) div 2;
var n,k:longint;
    res:int64;
    d:array[0..20000] of longint;
    f:array[0..10000,0..1000] of int64;
procedure nhap;
var i:longint;
begin
 read(n,k);
 for i:=1 to n do read(d[i]);
end;
procedure xuli;
var i,j:longint;
begin
 for i:=1 to n do
  for j:=0 to k do
   begin
    if j<>k then f[i,j+1]:=max(F[i,j+1],f[i-1,j]+d[i]);
    f[i,0]:=max(F[i,0],f[i-1,j]);
   end;
 res:=-oo;
 for i:=0 to k do res:=max(res,f[n,i]);
 writeln(res);
end;
begin
 assign(input,'guitar.inp');reset(input);
 assign(output,'guitar.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.