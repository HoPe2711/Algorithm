Var
  n,i:longint;
  a:array[0..100000] of longint;
Procedure nhap;
Var
  i:longint;
Begin
  read(n);
  a[0]:=-100;
  a[n+1]:=100;
  for i:= 1 to n do
  read(a[i]);
End;
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
Procedure inkq;
Var
  i:longint;
  Begin
    for i:= 1 to n do
    write(a[i],' ');
  End;
BEGIN
  assign(input,'Qsort.inp');reset(input);
  assign(output,'Qsort.out');rewrite(output);
  nhap;
  Qsort(1,n);
  inkq;
  close(input);close(output);
END.
