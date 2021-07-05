Uses math;
Type
  arr1=array[1..1000] of longint;
  arr2=array[1..1000000] of longint;
Var
  n:longint;
  a:arr1;
  b,dd:arr2;
Procedure nhap;
Var
  i,j,q:longint;
  Begin
    read(n);
    for i:= 1 to n do
    read(a[i]);
    q:=0;
    for i:= 1 to n-2 do
    for j:= i+1 to n-1 do
    Begin
      inc(q);
      b[q]:=a[i]+b[j];
      dd[q]:=j;
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
Function Find(x,y:longint):boolean;
Var
  l,r,mid:longint;
  Begin
    l:=1;
    r:=n;
    while l <= r do
    Begin
      mid:=(l+r) div 2;
      if (b[mid] = x) and (dd[mid] < y ) then exit(true);
      if b[mid] > x then r:=mid-1
      else l:=mid+1;
    End;
  End;
Procedure xuly;
Var
  p,k,res:longint;
  Begin
    for p:= 1 to n do
      for k:= 3 to n do
      if find(3*a[p]-a[k],k) then inc(res);
      write(res);
  End;
BEGIN
  assign(input,'TBC.inp');reset(input);
  assign(output,'TBC.out');rewrite(output);
  nhap;
  Qsort(1,n);
  xuly;
END.
