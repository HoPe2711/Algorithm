Var
  n:longint;
  a:array[1..100] of longint;
Procedure nhap;
  Begin
    read(n);
  End;
Procedure inkq;
Var
  i:longint;
  Begin
    for i:= 1 to n do write(a[i],' ');
    writeln;
  End;
Procedure duyet(i:longint);
Var
  j:longint;
  Begin
    if i= n+1 then inkq
    else
    for j:= 0 to 1 do
    Begin
      a[i]:=j;
      duyet(i+1);
    End;
  End;
BEGIN
  nhap;
  inkq;
  duyet(1);
END.