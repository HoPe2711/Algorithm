uses math;
var n:longint;
    a:array[1..10000] of real;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do read(a[i]);
end;
function tinh(a,b,c:real):real;
begin
 exit(arccos((a*a+b*b-c*c)/(2*a*b)));
end;
function check(r:real):real;
var kq:real;
    i:longint;
begin
 kq:=tinh(r+a[n],r+a[1],a[n]+a[1]);
 for i:=1 to n-1 do
  kq:=kq+tinh(r+a[i],r+a[i+1],a[i]+a[i+1]);
 exit(kq);
end;
procedure xuli;
var i:longint;
    l,r,goc,mid:real;
begin
 l:=0;
 for i:=1 to n do r:=r+a[i];
 mid:=(l+r)/2;
 while (l<>mid) and (r<>mid) do
  begin
   goc:=check(mid);
   if (goc=2*pi) then break;
   if (goc>2*pi) then l:=mid
   else r:=mid;
   mid:=(l+r)/2;
  end;
 write(mid:0:3);
end;
begin
 nhap;
 xuli;
end.
