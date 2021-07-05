uses math;
type arr=array[0..4000010] of longint;
var  n,m:longint;
     pack,res,k,tip:int64;
     a,b,c,d,qq:arr;
     sum:array[0..1000010] of int64;
procedure nhap;
var i:longint;
begin
 read(n,m,k);
 for i:=1 to n do read(a[i]);
 for i:=1 to m do read(b[i]);
end;
procedure doicho(var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure qsort(var x:arr; l,r:longint);
var i,j,mid:longint;
begin
 i:=l;
 j:=r;
 mid:=x[l+random(r-l+1)];
 repeat
  while x[i]>mid do inc(i);
  while x[j]<mid do dec(j);
  if i<=j then
   begin
    doicho(x[i],x[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(x,i,r);
 if l<j then qsort(x,l,j);
end;
function check(u:longint):int64;
var i,j:longint;
    kq,kk:int64;
begin
 pack:=0;  j:=m*m; kq:=0;  tip:=0;
 for i:=1 to n*n do
 begin
  while (j>0) and (c[i]+d[j]<=u) do dec(j);
  kq:=kq+j;
  pack:=pack+sum[j]+int64(c[i])*j;
 // while (k>0) and (c[i]+d[k]<u) do dec(k);
  kk:=j;
  if c[i]+d[j+1]=u then kk:=kk+qq[d[j+1]];
  tip:=tip+kk;
 end;
 exit(kq);
end;


procedure build;
var i,j,canh:longint;
begin
 canh:=0;
 for i:=1 to n do
  for j:=1 to n do
   begin
    inc(Canh);
    c[canh]:=a[j]+a[i];
   end;
  canh:=0;
 for i:=1 to m do
  for j:=1 to m do
   begin
    inc(canh);
    d[canh]:=b[i]+b[j];
   end;
end;


procedure xuli;
var l,r,mid,i,last:longint;
    tt,tt1:int64;
begin
 qsort(c,1,n*n);
 qsort(d,1,m*m);
 for i:=1 to m*m do sum[i]:=sum[i-1]+d[i];
 last:=0;
 for i:=1 to m*m do
  if d[i]<>last then
   begin
    qq[d[i]]:=1 ;
    last:=d[i];
   end
  else inc(qq[d[i]]);
 l:=1;
 r:=4*(10**6);
 while l<=r do
  begin
   mid:=(l+r) div 2;
   tt:=check(mid);
   if (tt<k) and (tip>=k) then
    begin
      res:=int64(mid)*(k-tt)+pack;
      break;
    end
   else
   begin
    if tt>=k then l:=mid+1
    else r:=mid-1;
   end;
  end;
 write(res);
end;
begin
 assign(input,'sumkmax.inp');reset(input);
 assign(output,'sumkmax.out');rewrite(output);
 nhap;
 build;
 xuli;
 close(input); close(output);
end.