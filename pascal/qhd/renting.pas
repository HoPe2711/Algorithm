uses math;
var n:longint;
    res:int64;
    d,c,p,f:array[0..1000] of int64;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do read(d[i],c[i],p[i]);
end;
Procedure swap(var x,y:int64);
Var
  tg:int64;
  Begin
    tg:=x;
    x:=y;
    y:=tg;
  End;
Procedure Qsort(l,r:longint);
Var
  i,j,key:longint;
  key1,key2:int64;
  Begin
    i:=l;
    j:=r;
    key:=l+random(r-l+1);
    key1:=d[key];
    key2:=c[key];
    repeat
      while (d[i] < key1) or ( (d[key]=key1) and (c[key]<key2) ) do inc(i);
      while (d[j] > key1) or ( (c[key]=key1) and (c[key]>key2) ) do dec(j);
      if i <= j then
      Begin
        swap(d[i],d[j]);
        swap(c[i],c[j]);
        swap(p[i],p[j]);
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
 qsort(1,n);
 for i:=1 to n do
  begin
   f[i]:=p[i];
   for j:=1 to i-1 do
    if (f[i]<f[j]+p[i]) and (c[j]<d[i]) then f[i]:=f[j]+p[i];
  end;
 write(f[n]);
end;
BEGIN
  assign(input,'renting.in');reset(input);
  assign(output,'renting.out');rewrite(output);
  nhap;
  xuli;
  close(input);close(output);
END.

