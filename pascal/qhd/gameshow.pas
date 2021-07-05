uses math;
const oo=1000000000000;
var n,t:longint;
    f:array[0..5000,0..5000] of int64;
    a:Array[0..5000] of longint;
procedure nhap;
var i,k,j:longint;
begin
 read(n,t);
 for i:=1 to n do read(A[i]);
 for i:=0 to n do
  for j:=0 to n do f[i,j]:=-oo;
 f[0,0]:=0;
 for i:=1 to n do
  for k:=1 to n do
   if (k<=i) and (i<>n) then
    begin
     f[i,k]:=max(f[i-1,k]-t,f[i-1,k-1]+a[i]);
     if f[i,k]<0 then f[i,k]:=-oo;
    end
   else if i=n then
    begin
     f[i,k]:=f[i-1,k-1]+a[i];
     if f[i,k]<0 then f[i,k]:=-oo;
    end;
 for k:=1 to n do
  if f[n,k]>=0 then
   begin
    write(k);
    exit;
   end;
 write(-1);
end;
begin
 assign(input,'gameshow.inp');reset(input);
 assign(output,'gameshow.out');rewrite(output);
 nhap;
 close(input); close(output);
end.
