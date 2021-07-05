type arr=array[0..100001] of longint;
var m,n,res:longint;
    a,b:arr;
procedure nhap;
var i:longint;
begin
 read(m,n);
 for i:=1 to m do read(a[i]);
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
procedure xuli;
var i,j:longint;
begin
 qsort(a,1,m);
 qsort(b,1,n);
 i:=1; j:=1;
 while (i<=m) and (j<=n) do
  begin
   if a[i]>b[j] then
    begin
     inc(res);
     inc(i);
     inc(j);
    end
   else inc(i);
  end;
 write(res);
end;
BEGIN
  assign(input,'dance.inp');reset(input);
  assign(output,'dance.out');rewrite(output);
  nhap;
  xuli;
  close(input);close(output);
END.