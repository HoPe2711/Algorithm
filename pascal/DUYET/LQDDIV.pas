uses math;
const oo=high(int64) div 2;
type arr=array[0..100000] of int64;
var res1,res,sum:int64;
    n,tt,tt1,dem,dem1:longint;
    a:array[0..32] of longint;
    s,s1,c,c1,dd,dd1:array[0..100000] of int64;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do
  begin
   read(a[i]);
   sum:=sum+a[i];
  end;
end;


procedure duyet(i:longint;summ:int64);
begin
 if i=n div 2+1 then
  begin
   inc(dem);
   s[dem]:=summ;
   exit;
  end;
 duyet(i+1,summ);
 duyet(i+1,summ+a[i]);
end;
procedure duyet1(i:longint;summ:int64);
begin
 if i=n+1 then
  begin
   inc(dem1);
   s1[dem1]:=summ;
   exit;
  end;
 duyet1(i+1,summ);
 duyet1(i+1,summ+a[i]);
end;
procedure doicho(var x,y:int64);
var tg:int64;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure qsort(var x:arr;l,r:longint);
var i,j:longint;
    mid:int64;
begin
 i:=l;
 j:=r;
 mid:=x[l+random(r-l+1)];
 repeat
  while x[i]<mid do inc(i);
  while x[j]>mid do dec(j);
  if i<=j then
   begin
    doicho(x[i],x[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(x,i,r);
 if l<j then qsort(x,l,j);
end;
function find(l,r:longint;x:int64):longint;
var mid,kq:longint;
begin
 kq:=0;
 while l<=r do
  begin
   mid:=(l+r) div 2;
   if c1[mid]>=x then
    begin
     kq:=mid;
     r:=mid-1;
    end
   else l:=mid+1;
  end;
 exit(kq);
end;
function find1(l,r:longint;x:int64):longint;
var mid,kq:longint;
begin
 kq:=0;
 while l<=r do
  begin
   mid:=(l+r) div 2;
   if c1[mid]<=x then
    begin
     kq:=mid;
     l:=mid+1;
    end
   else r:=mid-1;
  end;
 exit(kq);
end;


procedure xuli;
var last,x,i,y:longint;
    kk:int64;
begin
 duyet(1,0);
 duyet1(n div 2+1,0);
 qsort(s,1,dem);
 qsort(s1,1,dem1);
 last:=-1;
 for i:=1 to dem do
  if s[i]<>last then
   begin
    inc(tt);       last:=s[i];
    C[tt]:=s[i];
    dd[tt]:=1;
   end
  else inc(dd[tt]);
 last:=-1;
 for i:=1 to dem1 do
  if s1[i]<> last then
   begin
    inc(tt1);       last:=s1[i];
    C1[tt1]:=s1[i];
    dd1[tt1]:=1;
   end
  else inc(dd1[tt1]);
 res:=oo;
 for i:=1 to tt do
 begin
  kk:=(sum-2*c[i]);
  x:=find(1,tt1,kk div 2+kk mod 2);
  y:=find1(1,tt1,kk div 2);
  if (x<>0) and  (res>abs(2*(c[i]+c1[x])-sum)) then
   begin
    res:=abs(2*(c[i]+c1[x])-sum);
    res1:=dd[i]*dd1[x];
   end
  else if (x<>0) and  (res=abs(2*(c[i]+c1[x])-sum)) then res1:=res1+dd[i]*dd1[x];
  if x<>y then
  if (y<>0) and  (res>abs(2*(c[i]+c1[y])-sum)) then
   begin
    res:=abs(2*(c[i]+c1[y])-sum);
    res1:=dd[i]*dd1[y];
   end
  else if (y<>0) and  (res=abs(2*(c[i]+c1[y])-sum)) then res1:=res1+dd[i]*dd1[y];
 end;
 write(res,' ',res1 div 2);
end;
begin
 //assign(input,'lqddiv.inp'); reset(input);
 nhap;
 xuli;
 //close(input);
end.
