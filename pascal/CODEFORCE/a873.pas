var n,k,x,res:longint;
    a:array[0..200] of longint;
procedure nhap;
var i:longint;
begin
 read(n,k,x);
 for i:=1 to n do read(a[i]);
 for i:=1 to n-k do res:=res+a[i];
 res:=x*k+res;
 write(res);
end;
begin
 nhap;
end.