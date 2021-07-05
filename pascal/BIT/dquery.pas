var n,q,res:longint;
    a,c,d,next,pos1,t,kq,pos2:array[0..200000] of longint;
    pos:array[0..1000000] of longint;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do read(a[i]);
 read(q);
 for i:=1 to q do
  begin
   read(c[i],d[i]);
   pos2[i]:=i;
  end;
 for i:=1 to n do
  begin
   next[i]:=pos[a[i]];
   pos1[i]:=i;
   pos[a[i]]:=i;
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
    key:=next[l+random(r-l+1)];
    repeat
      while next[i] < key do inc(i);
      while next[j] > key do dec(j);
      if i <= j then
      Begin
        swap(next[i],next[j]);
        swap(pos1[i],pos1[j]);
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
    key:=c[l+random(r-l+1)];
    repeat
      while c[i] < key do inc(i);
      while c[j] > key do dec(j);
      if i <= j then
      Begin
        swap(c[i],c[j]);
        swap(d[i],d[j]);
        swap(pos2[i],pos2[j]);
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
   while (next[j]<=c[i]-1) and (j<=n) do
    begin
     update(pos1[j],1);
     inc(j);
    end;
   res:=get(d[i])-get(c[i]-1);
   kq[pos2[i]]:=res;
  end;
 for i:=1 to q do writeln(kq[i]);
end;
begin
  nhap;
  xuli;
end.
