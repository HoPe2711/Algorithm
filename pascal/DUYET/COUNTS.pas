Var
  n,s,res,mx,my:longint;
  a,b:array[1..20] of longint;
  x,y:array[1..20] of longint;
Procedure nhap;
Var
  i:longint;
  Begin
    read(n);
    for i:= 1 to n div 2 do
    read(a[i]);
    for i:= n div 2 + 1 to n do
    read(b[i]);
    read(s);
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
    key:=x[l+random(r-l+1)];
    repeat
      while x[i] < key do inc(i);
      while x[j] > key do dec(j);
      if i <= j then
      Begin
        swap(x[i],x[j]);
        inc(i);
        dec(j);
      End;
    until i > j;
    if l < j then Qsort(l,j);
    if i < r then Qsort(i,r);
  End;
Function find(k,l,r:longint):longint;
Var
  mid:longint;
  Begin
  While l <= r do
    Begin
    mid:=(l+r) div 2;
    if y[mid]= k then inc(res);
    if y[mid] > k then r:=mid-1
    else l:=mid+1;
    End;
  End;
Function xuly:longint;
Var
  i:longint;
  Begin
    for i:= 1 to mx do
    find(s-x[i],1,my);
  End;
Procedure duyet1(i,suma:longint);
Var
  j:longint;
  Begin
    if i=n div 2 + 1 then
      Begin
        inc(mx);
        x[mx]:=suma;
        xuly;
      End
      else
        Begin
          duyet1(i+1,suma+a[i]);
          duyet1(i+1,suma);
        End;
  End;
Procedure duyet2(i,sumb:longint);
Var
  j:longint;
  Begin
    if i= n + 1 then
      Begin
        inc(my);
        y[my]:=sumb;
      End
      else
        Begin
          duyet2(i+1,sumb+b[i]);
          duyet2(i+1,sumb);
        End;
  End;
BEGIN
  assign(input,'COUNTS.inp');reset(input);
  assign(output,'COUNTS.out');rewrite(output);
  nhap;
  duyet1(1,0);
  duyet2(n div 2+1,0);
  Qsort(1,n div 2 + 1);
  xuly;
  write(res);
  close(input);close(output);
END.































































