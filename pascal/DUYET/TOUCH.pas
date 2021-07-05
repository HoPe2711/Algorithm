Uses math;
Var
  n,kq,res:longint;
  st:string;
  x:array[1..14] of longint;
  a,b:array[0..15,0..15] of longint;
Procedure nhap;
Var
  i,j:longint;
  Begin
    readln(n);
    kq:=n*n+1;
    for i:= 1 to n do
    Begin
      readln(st);
      for j:= 1 to n do
      if st[j]='0' then a[i,j]:=0
      else a[i,j]:=1;
    End;
  End;
Procedure ktra0;
Var
  i,j:longint;
  Begin
    b:=a;
    res:=0;
    for j:=1 to n do
     if x[j]=1 then
      Begin
      inc(res);
      b[1,j]:=1-b[1,j];
      b[1,j-1]:=1-b[1,j-1];
      b[1,j+1]:=1-b[1,j+1];
      b[2,j]:=1-b[2,j];
     End;
    for i:= 2 to n do
    for j:= 1 to n do
    if b[i-1,j]=1 then
    Begin
      b[i,j]:=1-b[i,j];
      b[i+1,j]:=1-b[i+1,j];
      b[i,j-1]:=1-b[i,j-1];
      b[i,j+1]:=1-b[i,j+1];
      inc(res);
    End;
      for j:= 1 to n do
      if b[n,j]=1 then exit;
      kq:=min(kq,res);
  End;
Procedure ktra1;
Var
  i,j:longint;
  Begin
    b:=a;
    res:=0;
    for j:=1 to n do
     if x[j]=1 then
     Begin
       b[1,j]:=1-b[1,j];
       b[1,j-1]:=1-b[1,j-1];
       b[1,j+1]:=1-b[1,j+1];
       b[2,j]:=1-b[2,j];
       inc(res);
     End;
    for i:= 2 to n do
    for j:= 1 to n do
    if b[i-1,j]=0 then
     Begin
      b[i,j]:=1-b[i,j];
      b[i+1,j]:=1-b[i+1,j];
      b[i,j-1]:=1-b[i,j-1];
      b[i,j+1]:=1-b[i,j+1];
      inc(res);
     end;
       for j:= 1 to n do
       if b[n,j]=0 then exit;
       kq:=min(kq,res);
  End;
Procedure duyet(i:longint);
Var
  j:longint;
  Begin
    if i=n+1 then
    Begin
      ktra0;
      ktra1;
    End
    else
    Begin
      for j:= 0 to 1 do
      Begin
        x[i]:=j;
        duyet(i+1);
      End;
    End;
  End;
Procedure inkq;
Begin
  if kq >= n*n+1 then write(-1)
  else write(kq);
End;
BEGIN
  assign(input,'TOUCH.inp');reset(input);
  assign(output,'TOUCH.out');rewrite(output);
  nhap;
  ktra0;
  ktra1;
  duyet(1);
  inkq;
END.
