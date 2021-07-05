Var
  n,m,l,r,k,sum:longint;
  a:array[1..1000] of longint;
Procedure nhap;
Var
  i:longint;
  Begin
    read(n,m);
    for i:= 1 to n do read(a[i]);
  End;
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
        swap(a[i],a[j]);
        inc(i);
        dec(j);
      End;
    until i > j;
    if l < j then Qsort(l,j);
    if i < r then Qsort(i,r);
  End;
Function find(t,c,b:longint):boolean;
Var
  mid:longint;
  Begin
    while t <= c do
    Begin
      mid:=(t+c) div 2;
      if a[mid] = b then exit(true);
      if a[mid] < b then t:=mid+1
      else c:=mid-1;
    End;
    exit(false);
  End;
Procedure xuly;
Var
  i,k:longint;
  b:longint;
  Begin
    for i:= l to r do
    Begin
      b:=sum-a[i];
      if find(l,r,b)= true then
      Begin
        write(1);
        break;
      End
      else
      Begin
        write(0);
        break;
      End;
    End;
  End;
BEGIN
  assign(input,'SUMQ.inp');reset(input);
  assign(output,'SUMQ.out');rewrite(output);
  nhap;
  for k:= 1 to m do
  Begin
    read(l,r,sum);
    Qsort(l,r);
    xuly;
  End;
END.
