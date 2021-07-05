const
  d:array[2..15] of longint=(2,3,3,3,4,2,2,2,3,3,3,4,4,4);
  c:array[2..15] of longint=(3,2,3,4,3,2,3,4,2,3,4,2,3,4);
Var
  res:longint;
  a,b,e:array[1..5,1..5] of longint;
  x:array[1..15] of longint;
Procedure nhap;
Var
  i,j:longint;
  Begin
    for j:= 1 to 3 do
    read(a[1,j]);
    for i:= 2 to 4 do
    for j:= 1 to 5 do
    read(a[i,j]);
    for j:= 1 to 3 do
    read(a[5,j]);
    e:=a;
    for j:= 1 to 3 do
    read(b[1,j]);
    for i:= 2 to 4 do
    for j:= 1 to 5 do
    read(b[i,j]);
    for j:= 1 to 3 do
    read(b[5,j]);
  End;
Function bdtb:longint;
Var
  i,j:longint;
  Begin
    for i:= 1 to 5 do
    for j:= 1 to 5 do
    e[i,j]:=1-e[i,j];
  End;
Function bdhv(u,v:longint):longint;
Var
  i,j:longint;
  Begin
    for i:= u-1 to u+1 do
    for j:= v-1 to v+1 do
    e[i,j]:=1-e[i,j];
  End;
Function bdct(i,j:longint):longint;
  Begin
    e[i,j]:=1-e[i,j];
    e[i,j-1]:=1-e[i,j-1];
    e[i,j+1]:=1-e[i,j+1];
    e[i-1,j]:=1-e[i-1,j];
    e[i+1,j]:=1-e[i+1,j];
  End;
Function check:longint;
Var
  i:longint;
  Begin
    if x[1]=1 then
    Begin
      inc(res);
      bdtb;
    End;
    for i:= 2 to 7 do
    if x[i]=2 then
    Begin
      inc(res);
      bdhv(d[i],c[i]);
    End;
    for i:= 8 to 15 do
    if x[i]=3 then
    Begin
      inc(res);
      bdct(d[i],c[i]);
    End;
  End;
Procedure duyet(i:longint);
Var
  j:longint;
  Begin
    if i=16 then check
    else if i > 16 then write(res)
    else
    for j:= 0 to 1 do
    Begin
      x[i]:=j;
      duyet(i+1);
    End;
  End;
BEGIN
  nhap;
  write(res);
  duyet(1);
END.
