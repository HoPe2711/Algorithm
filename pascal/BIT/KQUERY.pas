var n,q,res:longint;
    c,d,k,kq,pos1,a,pos,t:array[0..200000] of longint;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do
  begin
   read(a[i]);
   pos[i]:=i;
  end;
 read(q);
 for i:=1 to q do
  begin
   read(c[i],d[i],k[i]);
   pos1[i]:=i;
  end;
end;
procedure update(i,x:longint);
begin
 while i<=n do
  begin
   t[i]:=t[i]+x;
   i:=i+(i and (-i));
  end;
end;
function get(i:longint):longint;
var x:longint;
begin
  x:=0;
  while i>0 do
   begin
    x:=x+t[i];
    i:=i-(i and (-i));
   end;
  exit(x);
end;
Procedure swap(var x,y:longint);
Var
  tg:longint;
  Begin
    tg:=x;
    x:=y;
    y:=tg;
  End;
Procedure Qsort(l,r:longint);
Var
  i,j:longint;
  key:longint;
  Begin
    i:=l;
    j:=r;
    key:=a[l+random(r-l+1)];
    repeat
      while a[i] < key do inc(i);
      while a[j] > key do dec(j);
      if i <= j then
      Begin
        swap(a[i],a[j]);
        swap(pos[i],pos[j]);
        inc(i);
        dec(j);
      End;
    until i > j;
    if l < j then Qsort(l,j);
    if i < r then Qsort(i,r);
  End;
Procedure Qsort1(l,r:longint);
Var
  i,j:longint;
  key:longint;
  Begin
    i:=l;
    j:=r;
    key:=k[l+random(r-l+1)];
    repeat
      while k[i] < key do inc(i);
      while k[j] > key do dec(j);
      if i <= j then
      Begin
        swap(k[i],k[j]);
        swap(c[i],c[j]);
        swap(d[i],d[j]);
        swap(pos1[i],pos1[j]);
        inc(i);
        dec(j);
      End;
    until i > j;
    if l < j then Qsort1(l,j);
    if i < r then Qsort1(i,r);
  End;
procedure xuli;
var i,j:longint;
begin
 qsort(1,n);
 qsort1(1,q);
 j:=1;
 for i:=1 to q do
  begin
   while (a[j]<=k[i]) and (j<=n) do
    begin
     update(pos[j],1);
     inc(j);
    end;
   res:=d[i]-c[i]+1-(get(d[i])-get(c[i]-1));
   kq[pos1[i]]:=res;
  end;
 for i:=1 to q do writeln(kq[i]);
end;
begin
  assign(input,'KQUERY.inp');reset(input);
  assign(output,'KQUERY.out');rewrite(output);
  nhap;
  xuli;
  close(input);close(output);
end.
