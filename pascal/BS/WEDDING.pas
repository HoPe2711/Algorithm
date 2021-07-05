Type
  arr1=array[1..100000] of longint;
Var
  n,m:longint;
  a,b:arr1;
Procedure nhap;
Var
  i,j:longint;
  Begin
    read(n,m);
    for i:= 1 to n do read(a[i]);
    for j:= 1 to m do read(b[j]);
  End;
Procedure swap(var x,y:longint);
Var
  tg:longint;
  Begin
    tg:=x;
    x:=y;
    y:=tg;
  End;
Procedure Qsort(var c:arr1;l,r:longint);
Var
  i,j,key:longint;
  Begin
    i:=l;
    j:=r;
    key:=c[(l+r) div 2];
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
    if l < j then Qsort(c,l,j);
    if i < r then Qsort(c,i,r);
  End;
Function check(t:longint):boolean;
Var
  l,r,dem,i:longint;
  Begin
    l:=1;
    r:=m-t+1;
    if m div 2 < t then exit(false);
    dem:=0;
    for i:= 1 to n do
    Begin
      if (b[l] < a[i]) and (a[i] < b[r]) then
      Begin
        inc(l);
        inc(r);
        inc(dem);
      End;
      if r > m then break;
    End;
    exit(dem >= t);
  End;
Procedure xuly;
Var
  l,r,res,mid:longint;
  Begin
    l:=1;
    r:=m;
    res:=0;
    while l <= r do
    Begin
      mid:=(l+r) div 2;
      if check(mid) then
      Begin
        res:=mid;
        l:=mid+1;
      End
      else r:=mid-1;
    End;
    write(res);
  End;
BEGIN
  assign(input,'WEDDING.inp');reset(input);
  assign(output,'WEDDING.out');rewrite(output);
  nhap;
  Qsort(a,1,n);
  Qsort(b,1,m);
  xuly;
  close(input);close(output);
END.
