Uses math;
Var
  n,a,b,sum,res,kq:longint;
  cot,cot1:array[1..12] of longint;
  dong:array[1..12] of boolean;
  cc:array[2..24] of boolean;
  cp:array[-11..11] of boolean;
Procedure nhap;
Var
  i:longint;
  Begin
    kq:=3*n;
    read(n);
      for i:= 1 to n do
        Begin
          read(a,b);
          cot[a]:=b;
        End;
        fillchar(dong,sizeof(dong),true);
        fillchar(cc,sizeof(cc),true);
        fillchar(cp,sizeof(cp),true);
  End;
Procedure inkq;
Var
  i:longint;
  Begin
    for i:= 1 to n do
    write('(',i,',',cot1[i],')',' ');
    writeln;
  End;
Procedure duyet(i:longint);
Var
  j:longint;
  Begin
    cot1:=cot;
    if i=n+1 then inkq
    else
      for j:= 1 to n do
      if dong[j] and cc[i+j] and cp[i-j] then
        Begin
          cot1[i]:=j;
          res:=j-cot[a];
          dong[j]:=false;cc[i+j]:=false;cp[i-j]:=false;
          duyet(i+1);
          dong[j]:=true;cc[i+j]:=true;cp[i-j]:=true;
        End;
  End;
BEGIN
  assign(input,'QUEEN.inp');reset(input);
  assign(output,'QUEEN.out');rewrite(output);
  nhap;
  duyet(1);
  inkq;
END.
