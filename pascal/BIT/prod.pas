uses math;
var a,pos,b,t,trace,f,a1:array[0..200001] of longint;
    res:int64;
    n,limit:longint;
Procedure doicho(var x,y:longint);
Var
  tg:longint;
  Begin
    tg:=x;
    x:=y;
    y:=tg;
  End;
Procedure Qsort(l,r:longint);
Var
  i,j,key:longint;
  Begin
    i:=l;
    j:=r;
    key:=a[(l+r) div 2];
    repeat
      while a[i] < key do inc(i);
      while a[j] > key do dec(j);
      if i <= j then
      Begin
      doicho(a[i],a[j]);
      doicho(pos[i],pos[j]);
      inc(i);
      dec(j);
      End;
    until i > j;
    if l < j then Qsort(l,j);
    if i < r then Qsort(i,r);
  End;
function get(i:longint):longint;
begin
 get:=0;
 while i>0 do
  begin
   get:=max(t[i],get);
   i:=i - (i and (-i));
  end;
end;
procedure update(i,x:longint);
begin
 while i<=limit do
  begin
   t[i]:=max(t[i],x);
   i:=i+(i and (-i));
  end;
end;
procedure nhap;
var i,tmp,tmp1:longint;
begin
 while not seekeof do
  begin
   inc(n);
   read(a[n]);
   pos[n]:=n;
   a1[n]:=a[n];
  end;
 for i:=n downto 1 do f[i]:=max(f[i+1],a[i]);
 limit:=1;
 qsort(1,n);
 b[pos[1]]:=limit;
 trace[1]:=pos[1];
 for i:=2 to n do
 begin
  if a[i]<>a[i-1] then inc(limit);
  b[pos[i]]:=limit;
  trace[limit]:=pos[i];
 end;
 res:=0;
 for i:=1 to n do
  begin
   tmp:=get(b[i]-1);
   if f[trace[b[i]]+1]>a1[trace[b[i]]] then res:=max(res,int64(a1[trace[tmp]])*a1[trace[b[i]]]*f[trace[b[i]]+1]);
   update(b[i],b[i]);
  end;
 write(res);
end;
begin
 assign(input,'prod.inp');reset(input);
 assign(output,'prod.out');rewrite(output);
 nhap;
 close(input); close(output);
end.
