uses math;
var n,m:longint;
    res:int64;
    a,p:array[1..100000] of longint;
procedure nhap;
var i:longint;
begin
 read(n,m);
 for i:=1 to n do read(a[i]);
end;
procedure doicho(var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
Procedure Qsort(l,r:longint);
Var
  i,j,key:longint;
  Begin
    i:=l;
    j:=r;
    key:=a[(l+r) div 2];
    repeat
      while a[i] < key do inc(i);
      while a[j] > key do dec(j);
      if i <= j then
      Begin
      doicho(a[i],a[j]);
      inc(i);
      dec(j);
      End;
    until i > j;
    if l < j then Qsort(l,j);
    if i < r then Qsort(i,r);
  End;
function Find(x:longint):longint;
Var
  l,r,mid,kq:longint;
  Begin
    kq:=n;
    l:=1;
    r:=n;
    while l <= r do
    Begin
      mid:=(l+r) div 2;
      if a[mid] = x then exit(mid);
      if a[mid] > x then
       begin
        kq:=min(kq,mid);
        r:=mid-1;
       end
      else l:=mid+1;
    End;
   exit(kq);
  End;
procedure xuli;
var i:longint;
begin
 qsort(1,n);
 for i:=1 to n do
  if m-a[i]>0 then res:=res+find(m-a[i]);
 write(res);
end;
{procedure xuli;
var t,i,j:longint;
begin
 for t:=1 to m do
   for i:=1 to n do
    for j:=1 to n do
     if a[i]+a[j]=t then inc(p[t]);
 for i:=1 to m do res:=res+p[i];
 write(res);
end;          }
begin
  assign(input,'fm.inp');reset(input);
  assign(output,'fm.out');rewrite(output);
  nhap;
  xuli;
  close(input);close(output);
end.
