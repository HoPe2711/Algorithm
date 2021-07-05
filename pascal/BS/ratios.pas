uses math;
const oo=1000000;
var n,k,m:longint;
    res:int64;
    a,c,xh,s:array[0..100000] of longint;
procedure nhap;
var i:longint;
begin
 read(n,k);
 for i:=1 to n do read(a[i]);
end;
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
    key:=a[l+random(r-l+1)];
    repeat
      while a[i] < key do inc(i);
      while a[j] > key do dec(j);
      if i <= j then
      Begin
      doicho(a[i],a[j]);
      inc(i);
      dec(j);
      End;
    until i > j;
    if l < j then Qsort(l,j);
    if i < r then Qsort(i,r);
  End;
function find(x:int64;l,r:longint):longint;
var kq,mid:longint;
begin
 kq:=0;
 if x>=c[m] then exit(m);
 while l<=r do
  begin
   mid :=(l+r) div 2;
   if c[mid]<=x then
    begin
     kq:=mid;
     l:=mid+1;
    end
   else r:=mid-1;
  end;
 exit(kq);
end;
procedure xuli;
var i,j,tt:longint;
begin
 qsort(1,n);
 a[0]:=-1;
 for i:=1 to n do
  if a[i]<>a[i-1] then
   begin
    inc(m);
    c[m]:=a[i];
    xh[m]:=1;
   end
  else inc(xh[m]);
  for i:=1 to m do
   if xh[i]>=2 then s[i]:=s[i-1]+1
   else s[i]:=s[i-1];
  for i:=1 to m do
   if xh[i]>=3 then inc(res);

   for i:=1 to m do
   if xh[i]>=2 then
    begin
     tt:=find(int64(k)*c[i],1,m);
     res:=res+int64(3)*(tt-i);
    end;

   for i:=1 to m do
    begin
     tt:=find(int64(k)*c[i],1,m);
     res:=res+int64(3)*(s[tt]-s[i]);
    end;
  for i:=1 to m do
   begin
      tt:=find(int64(k)*c[i],1,m);
      if tt>i+1 then res:=res+int64(3)*(tt-i-1)*(tt-i);
   end;
  write(res);
end;
BEGIN
  assign(input,'ratios.inp');reset(input);
  assign(output,'ratios.out');rewrite(output);
  nhap;
  xuli;
  close(input);close(output);
END.
