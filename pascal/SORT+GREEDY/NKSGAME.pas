type
  arr=array[1..100001] of longint;
var
    a,b:arr;
    n:longint;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do read(a[i]);
 for i:=1 to n do read(b[i]);
end;
Procedure doicho(var x,y:longint);
Var
  tg:longint;
  Begin
    tg:=x;
    x:=y;
    y:=tg;
  End;
Procedure Qsort(var x:arr;l,r:longint);
Var
  i,j,key:longint;
  Begin
    i:=l;
    j:=r;
    key:=x[l+random(r-l+1)];
    repeat
      while x[i] < key do inc(i);
      while x[j] > key do dec(j);
      if i <= j then
      Begin
      doicho(x[i],x[j]);
      inc(i);
      dec(j);
      End;
    until i > j;
    if l < j then Qsort(x,l,j);
    if i < r then Qsort(x,i,r);
  End;

function res:longint;
var i,j,k:longint;
begin
 res:=high(longint);
 i:=1; j:=n;
 repeat
   k:=a[i]+b[i];
   if k=0 then exit(0);
   if res>abs(k) then res:=abs(k);
   if k<0 then inc(i)
   else dec(j);
  until (j<1) or (i>n);
end;
begin
 nhap;
 qsort(a,1,n);
 qsort(b,1,n);
 write(res);
end.