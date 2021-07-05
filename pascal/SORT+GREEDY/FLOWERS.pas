Type
  arr1=array[1..100000] of longint;
  arr2=array[1..100000] of real;
Var
  n:longint;
  t,d:arr1;
  a:arr2;
Procedure nhap;
Var
  i:longint;
  Begin
    read(n);
    for i:= 1 to n do
    Begin
      read(t[i],d[i]);
      a[i]:= t[i]/d[i];
    End;

  End;
Procedure swap(var x,y:real);
Var
  tg:real;
  Begin
    tg:=x;
    x:=y;
    y:=tg;
  End;
Procedure swap1(var x,y:longint);
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
  key:real;
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
      swap1(d[i],d[j]);
      swap1(t[i],t[j]);
      inc(i);
      dec(j);
    End;
    until i > j;
    if l < j then Qsort(l,j);
    if i < r then Qsort(i,r);
  End;
Procedure xuly;
Var
  i,sum:longint;
  res:int64;
  Begin
    sum:=0;
    res:=0;
    for i:= 1 to n do sum:=sum+d[i];
    for i:= 1 to n do
    Begin
      sum:=sum-d[i];
      res:=res+2*t[i]*sum;
    End;
    write(res);
  End;
BEGIN
  assign(input,'FLOWERS.inp');reset(input);
  assign(output,'FLOWERS.out');rewrite(output);
  nhap;
  Qsort(1,n);
  xuly;
  close(input);close(output);
END.
