uses math;
const base=1000000007;
      maxn=4001;
var a:array[0..maxn] of longint;
    f:array[0..maxn,0..maxn] of longint;
    dd:array[0..maxn,0..maxn] of boolean;
    n,res:longint;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do read(a[i]);
end;
Procedure doicho(var x,y:longint);
Var
  tg:longint;
  Begin
    tg:=x;
    x:=y;
    y:=tg;
  End;
Procedure Qsort(l,r:longint);
Var
  i,j,key:longint;
  Begin
    i:=l;
    j:=r;
    key:=a[l+random(r-l+1)];
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
procedure xuli;
var i,j:longint;
begin
 qsort(1,n);    f[0,0]:=1;
 for i:=0 to n-1 do
  for j:=0 to a[n]+1 do
   begin
    f[i+1,min(a[n]+1,j+a[i+1])]:=(f[i+1,min(a[n]+1,j+a[i+1])]+f[i,j]) mod base;
    f[i+1,j]:=(f[i+1,j]+f[i,j]) mod base;
   end;
 for i:=2 to n do
  for j:=a[i]+1 to a[n]+1 do res:=(res+f[i-1,j]) mod base;
 write(res);
end;
begin
 assign(input,'polyfenc.inp');reset(input);
 assign(output,'polyfenc.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
