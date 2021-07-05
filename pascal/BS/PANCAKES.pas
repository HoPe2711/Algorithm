uses math;
Var
  x,res:int64;
  n:longint;
  a:array[1..20] of longint;
Procedure nhap;
Var
  i:longint;
  Begin
    read(x,n);
    for i:= 1 to n do
    read(a[i]);
  End;
Function sotrung(t:int64):int64;
Var
  i:longint;
  s:int64;
  Begin
    s:=0;
    for i:= 1 to n do
    s:=s+t div a[i];
  End;
Procedure xuly;
Var
  l,r,mid:int64;
  Begin
    l:=0;
    r:=10**18;
    while l <= r do
    Begin
      mid:=(l+r) div 2;
      if sotrung(mid) >= x then
      Begin
        res:=mid;
        r:=mid-1;
      End
      Else l:=mid+1;
    End;
  End;
Procedure inkq;
  Begin
    write(res);
  End;
BEGIN
  assign(input,'PANCAKES.inp');reset(input);
  assign(output,'PANCAKES.out');rewrite(output);
  nhap;
  xuly;
  inkq;
END.
