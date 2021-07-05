Var
  m,n,p,t,q:longint;
  a,b,c:array[1..1000] of longint;
  d:array[0..1000000] of longint;
Procedure nhap;
Var
  i,j:longint;
  Begin
    read(m,n,p);
    for i:= 1 to m do read(a[i]);
    for i:= 1 to n do read(b[i]);
    for i:= 1 to p do read(c[i]);
    for i:= 1 to m do
      for j:= 1 to n do
      q:=0;
      Begin
        inc(q);
        d[q]:=a[i]+b[j];
      End;
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
    key:=c[l+random(r-l+1)];
    repeat
      while c[i] < key do inc(i);
      while c[j] > key do dec(j);
      if i <= j then
      Begin
        swap(c[i],c[j]);
        inc(i);
        dec(j);
      End;
    until i > j;
    if l < j then Qsort(l,j);
    if i < r then Qsort(i,r);
  End;
Function find(l,r,x:longint):boolean;
Var
  mid:longint;
  Begin
  While l <= r do
    Begin
    mid:=(l+r) div 2;
    if c[mid]=x then exit(true);
    if c[mid] > x then r:=mid-1
    else l:=mid+1;
    End;
    exit(false);
  End;
Procedure xuly;
Var
  i,x:longint;
  Begin
    for i:= 1 to q do
    Begin
      x:=d[i];
      if find(1,p,-x)=true then
      Begin
        write(1);
        exit;
      End;
    End;
    write(0);
  End;
BEGIN
  assign(input,'ZSUM.inp');reset(input);
  assign(output,'ZSUM.out');rewrite(output);
  for t:= 1 to 2 do
  Begin
    nhap;
    Qsort(1,p);
    xuly;
  End;
  close(input);close(output);
END.
