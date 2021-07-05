uses math;
var n,m:longint;
    a,b:array[0..10000] of longint;
    f:array[-1..10000,-1..10000] of longint;
procedure nhap;
var i,j:longint;
begin
 read(n,m);
 for i:=1 to n do read(A[i]);
 for j:=1 to m do read(b[j]);
 for i:=1 to n do
  for j:=1 to m do
   if a[i]=b[j] then f[i,j]:=max(f[i,j],f[i-2,j-2]+1)
   else f[i,j]:=max(f[i-1,j],f[i,j-1]);
 write(f[n,m]);
end;
begin
// assign(input,'lnacs.inp'); reset(input);
 //assign(output,'lnacs.out');rewrite(output);
 nhap;
 //close(input); close(output);
end.