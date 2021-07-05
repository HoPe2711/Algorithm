Var
  s1,s2:string(10);
Procedure nhap;
Var
  i,j:longint;
  Begin
    read(s1);
    read(s2);
  End;
Procedure duyet(i,j,s:longint);
Var
    Begin
      if i=n+1 and j=m+1 then
      Begin
        if kt(s) then inc(res)
        duyet(i,j)
      End;
        else if i < n+1 then
        Begin
          duyet(i+1,j,st+st[i]);
          duyet(i,j+1,st+st[j]);
        End;
    End;
BEGIN
  assign(input,'PALIN.inp');reset(input);
  assign(output,'')
END.