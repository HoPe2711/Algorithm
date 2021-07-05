uses math;
const oo=100000000000000;
var
    n,w1,w2:longint;
    a:Array[0..200000] of longint;
    f:array[0..100001,0..5] of int64;
procedure nhap;
var i,j:longint;
begin
 read(n,w1,w2);
 for i:=1 to n do read(A[i]);
 for i:=0 to n do
  for j:=0 to 5 do f[i,j]:=-oo;
 f[0,0]:=0;
 for i:=0 to n-1 do
  for j:=0 to 5 do
  if f[i,j]<>-oo then
   begin
    f[i+1,j]:=max(f[i,j],f[i+1,j]);
    if (j<5) then
    begin
    if j=0 then f[i+1,j+1]:=max(f[i+1,j+1],f[i,j]+int64(w1)*a[i+1]);
    if j=1 then f[i+1,j+1]:=max(f[i+1,j+1],f[i,j]+int64(w2)*a[i+1]);
    if j=2 then f[i+1,j+1]:=max(F[i+1,j+1],f[i,j]+a[i+1]);
    if j=3 then f[i+1,j+1]:=max(f[i+1,j+1],f[i,j]+int64(w2)*a[i+1]);
    if j=4 then f[i+1,j+1]:=max(f[i+1,j+1],f[i,j]+int64(w1)*a[i+1]);
    end;
   end;
 write(f[n,5]);
end;
begin
 assign(input,'fiveset.inp');reset(input);
 assign(output,'fiveset.out');rewrite(output);
 nhap;
 //xuli;
 close(input); close(output);
end.