uses math;
Type
  arr1=array[1..50000] of longint;
Var
  m,n,k:longint;
  t,p:arr1;
Procedure nhap;
Var
  i:longint;
  Begin
    read(m,n,k);
    for i:= 1 to m do read(t[i]);
    for i:= 1 to m do read(p[i]);
  End;
Function hatde(a:int64):int64;
Var
  i:longint;
  s:int64;
  Begin
    s:=0;
    for i:= 1 to m do
    s:=s+(a-t[i]) div p[i];
    exit(s);
  End;
Procedure xuly;
Var
  l,r,mid,res:int64;
  Begin
  l:=0;
  r:=100000;
  while l <= r do
  Begin
    mid:=(l+r) div 2;
    if hatde(mid) = k then res:=mid;
    if hatde(mid) > k then r:=mid-1
    else l:=mid+1;
  End;
  write(res);
  End;
BEGIN
  assign(input,'SQUIRR2.inp');reset(input);
  assign(output,'SQUIRR2.out');rewrite(output);
  nhap;
  xuly;
  close(input);close(output);
END.
