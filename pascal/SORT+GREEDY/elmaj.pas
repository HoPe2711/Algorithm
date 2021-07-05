uses math;
var n,dem:longint;
    a:array[1..1000000] of longint;
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
var i:longint;
begin
 qsort(1,n);
 dem:=1;
 for i:=1 to n-1 do
  if a[i]=a[i+1] then inc(dem)
  else
   begin
    if dem>= n div 2+1 then
     begin
      write(a[i-1],' ',dem);
      halt;
     end;
    dem:=1;
   end;
 write(-1);
end;
begin
  assign(input,'elmaj.inp');reset(input);
  assign(output,'elmaj.out');rewrite(output);
  nhap;
  xuli;
  close(input);close(output);
end.
