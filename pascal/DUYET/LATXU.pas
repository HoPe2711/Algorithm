Uses math;
Var
  kq:longint;
  a,b:array[0..5,0..5] of longint;
Procedure nhap;
Var
  i,j:longint;
  Begin
    for i:= 1 to 4 do
      Begin
      for j:= 1 to 4 do
      Begin
      read(a[i,j]);
      b[i,j]:=a[i,j];
      End;
      readln;
      End;
  End;
Procedure inkq;
  Begin
    write(kq);
  End;
Procedure duyet(i,j:longint);
Var
  k,res:longint;
  Begin
    if i=5 then inkq
    else
    for i:= 1 to 4 do
      for j:= 1 to 4 do
      if b[i,j]=1 then
      Begin
        inc(res);
        b[i,j]:=1-b[i,j];
        b[i-1,j]:=1-b[i-1,j];
        b[i,j+1]:=1-b[i,j+1];
        b[i,j-1]:=1-b[i,j-1];
      End;
      for k:=0 to 1 do
        Begin
          a[i,j]:=k;
          if j=4 then duyet(i+1,1)
          else duyet(i,j+1);
        End;
      Begin
        kq:=min(kq,res);
      End;
  End;
BEGIN
  assign(input,'LATXU.inp');reset(input);
  assign(input,'LATXU.out');rewrite(output);
  nhap;
  inkq;
  duyet(1,1);
  close(input);close(output);
END.
