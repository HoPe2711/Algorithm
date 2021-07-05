uses math;
var n,res:longint;
    a,sum,sum1,pos:array[0..5000] of longint;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do
  begin
   read(a[i]);
   sum[i]:=sum[i-1]+a[i];
   sum1[i]:=sum1[i-1]+a[i];
   pos[i]:=i;
  end;
end;
procedure doicho(var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure qsort(l,r:longint);
var i,j,mid,key,mid1:longint;
begin
 i:=l;
 j:=r;
 key:=l+random(r-l+1);
 mid:=sum[key];
 mid1:=pos[key];
 repeat
  while (sum[i]<mid) or ((sum[i]=mid) and (pos[i]<mid1)) do inc(i);
  while (sum[j]>mid) or ((sum[j]=mid) and (pos[j]>mid1)) do dec(j);
  if i<=j then
   begin
    doicho(sum[i],sum[j]);
    doicho(pos[i],pos[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
function find(x,l,r,i,j:longint):longint;
var mid:longint;
begin
 while l<=r do
  begin
   mid:=(l+r) div 2;
   if (sum[mid]=x) and (pos[mid]>=i) and (pos[mid]<=j) then exit(mid)
   else if (sum[mid]=x) and (pos[mid]<i) then l:=mid+1
   else if (sum[mid]=x) and (pos[mid]>j) then r:=mid-1;
   if sum[mid]<x then l:=mid+1;
   if sum[mid]>x then r:=mid-1;
  end;
 exit(0);
end;
procedure xuli;
var  i,j,x,k:longint;
begin
 qsort(1,n);
 for k:=n downto 2 do
  for i:=1 to n-k+1 do
  begin
 // for j:=i+1 to n do
  j:=i+k-1;
  if (sum1[i-1]+sum1[j]) mod 2=0 then
   begin
    x:=(sum1[i-1]+sum1[j]) div 2 ;
    if find(x,1,n,i,j)<>0  then
     begin
      res:=k;
      write(res);
      halt;
     end;
   end;
  end;
  write(res);
end;
begin
 nhap;
 xuli;
end.