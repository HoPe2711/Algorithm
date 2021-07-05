Type
  arr1=array[1..100000] of longint;
Var
  m,n,t:longint;
  a,b:arr1;
Procedure nhap;
Var
  i,j:longint;
  Begin
    read(t);
    read(n);
    for i:= 1 to n do read(a[i]);
    read(m);
    for j:= 1 to m do read(b[j]);
  End;
Function F(y:longint):int64;
Var
  i:longint;
  s:int64;
  Begin
    s:=0;
    for i:= 1 to n do
    s:=s+y div a[i];
    exit(s);
  End;
Function G(z:longint):int64;
Var
  j:longint;
  s1:int64;
  Begin
    s1:=0;
    for j:= 1 to m do
    s1:=s1+z div b[j];
    exit(s1);
  End;
Procedure xuly;
Var
  l,r,res,x:int64;
  Begin
    l:=0;
    r:=t;
    while l <= r do
    Begin
      x:=(l+r) div 2;
      if F(x) <= G(t-x) then
      Begin
        l:=x+1;
        res:=F(x);
      End
      else r:=x-1;
    End;
    write(res);
  End;
BEGIN
  assign(input,'POTTERY.inp');reset(input);
  assign(output,'POTTERY.out');rewrite(output);
  nhap;
  xuly;
  close(input);close(output);
END.
