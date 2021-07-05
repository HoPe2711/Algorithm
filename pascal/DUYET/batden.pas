Uses math;
Var
  n,res,kq,sum:longint;
  a,b,x:array[0..11] of longint;
Procedure nhap;
Var
  i:longint;
  Begin
    read(n);
    for i:= 1 to n do
    Begin
      read(a[i]);
      b[i]:=a[i];
    End;
  End;
Function check:boolean;
Var
  i:longint;
  Begin
    for i:= 1 to n do
    if a[i] <> 1 then exit(false)
    else exit(true);
  End;
Function kt:longint;
Var
  i,j:longint;
    Begin
      res:=0;
      kq:=11;
      for i:= 1 to n do
      if x[i]=1 then
      Begin
        inc(res);
        for j:= 1 to n do
        b[j]:=1-b[j];
      End
      else if x[i]=2 then
      Begin
        inc(res);
        b[i-1]:=1-b[i-1];
        b[i]:=1-b[i];
        b[i+1]:=1-b[i+1];
      End
      else if x[i]=3 then
      Begin
        inc(res);
        b[i]:=1-b[i];
      End;
      if check then kq:=min(kq,res);
    End;
Procedure duyet(i:longint);
Var
  j:longint;
  Begin
    if i=n+1 then kt
    else
    for j:= 0 to 3 do
    Begin
      x[i]:=j;
      duyet(i+1);
    End;
  End;
BEGIN
  assign(input,'BATDEN.inp');reset(input);
  assign(output,'BATDEN.out');rewrite(output);
  nhap;
  duyet(1);
  write(kq);
  close(input);close(output);
END.


































































































