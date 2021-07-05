{$H+}
uses math;
var st,st1:string;
    f:array[0..5000,0..5000] of longint;
procedure nhap;
var n,n1,i,j:longint;
begin
  readln(st);
  readln(st1);
  n:=length(St);
  n1:=length(st1);
  for i:=1 to n do
   for j:=1 to n1 do
    if st[i]=st1[j] then f[i,j]:=f[i-1,j-1]+1
    else f[i,j]:=max(f[i-1,j],f[i,j-1]);
  write(f[n,n1]);
end;
begin
// assign(input,'qbstr1.inp'); reset(input);
 nhap;
// reset(input);
end.
