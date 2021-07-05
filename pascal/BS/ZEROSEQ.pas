Uses math;
Var
  n:longint;
  a,pos,sum:array[0..100000] of longint;
Procedure nhap;
Var
  i:longint;
Begin
  read(n);
  for i:= 1 to n do
  Begin
    read(a[i]);
    sum[0]:=0;
    sum[i]:=sum[i-1]+a[i];
    pos[i]:=i;
  End;
End;
Procedure swap(var x,y :longint);
Var
  tg:longint;
  Begin
    tg:=x;
    x:=y;
    y:=tg;
  End;
Procedure Qsort(l,r:longint);
Var
  i,j,key1,key2:longint;
  Begin
    i:=l;
    j:=r;
    key1:=sum[(l+r) div 2];
    key2:=pos[(l+r) div 2];
    repeat
    while (sum[i] < key1) or ((sum[i]=key1) and (pos[i] < key2)) do inc(i);
    while (sum[j] > key1) or ((sum[j]=key2) and (pos[j] > key2)) do dec(j);
    if i <= j then
    Begin
      swap(pos[i],pos[j]);
      swap(sum[i],sum[j]);
      inc(i);
      dec(j);
    End;
    until i > j;
    if l < r then Qsort(l,j);
    if i < r then Qsort(i,r);
  End;
Function find(x,l,r:longint):longint;
Var
  mid:longint;
  Begin
    while l <= r do
    Begin
      mid:=(l+r) div 2;
      if sum[mid] = x then exit(pos[mid]);
      if sum[mid] > x then l:=mid+1
      else r:=mid-1;
      exit(pos[mid]);
    End;
  End;
Procedure xuly;
Var
  i,kq:longint;
  Begin
    kq:=0;
    for i:= 1 to n do
    if find(sum[i],1,n) > 0 then kq:=max(kq,pos[i]-find(sum[i],1,n)+1)
    else write(-1 -1);
    write(kq);
  End;
BEGIN
  assign(input,'ZEROSEQ.inp');reset(input);
  assign(output,'ZEROSEQ.out');rewrite(output);
  nhap;
  Qsort(1,n);
  xuly;
  close(input);close(output);
END.