Var
  n:longint;
  x:array[1..100] of longint;
  free:array[1..100] of boolean;
Procedure nhap;
Var
  i:longint;
  Begin
    read(n);
    for i:= 1 to n do free[i]:=true;
  End;
Procedure inkq;
Var
  i:longint;
  Begin
    for i:= 1 to n do write(x[i],' ');
    writeln;
  End;
Procedure duyet(i:longint);
Var
  j:longint;
  Begin
    if i=n+1 then inkq
    else
    for j:= 1 to n do
    Begin
      if free[j] then
      Begin
        x[i]:=j;
        free[j]:=false;
        duyet(i+1);
        free[j]:=true;
      End;
    End;
  End;
BEGIN
  nhap;
  inkq;
  duyet(1);
END.