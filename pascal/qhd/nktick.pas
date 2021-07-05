uses math;
var a,t,f:array[-1..60000] of longint;
    n:longint;
procedure  nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do read(A[i]);
 for i:=1 to n-1 do read(t[i]);
 f[1]:=a[1];
 for i:=2 to n do f[i]:=min(f[i-1]+a[i],f[i-2]+t[i-1]);
// for i:=1 to n do write(f[i],' ');
 write(f[n]);
end;
begin
 nhap;
end.