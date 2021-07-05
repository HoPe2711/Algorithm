Var
  n,k:longint;
  x:array[1..100] of longint;
  free:array[1..100] of boolean;
Procedure nhap;
Var
  i:longint;
  Begin
    read(n,k);
    for i:= 1 to n do free[i]:=true;
  End;
Procedure inkq;
Var
  i:longint;
  Begin
    for i:= 1 to k do write(x[i],' ');
    writeln;
  End;
Procedure duyet(i:longint);
Var
  j:longint;
  Begin
    if i=k+1 then inkq
    else
    for j:= 1 to n do
    if free[j] then
    Begin
      x[i]:=j;
      free[j]:=false;
      duyet(i+1);
      free[j]:=true;
    End;
  End;
BEGIN
  nhap;
  inkq;
  duyet(1);
END.