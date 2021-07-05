uses math;
type arr=array[0..10] of longint;
var v:array[0..22,0..10] of longint;
    first,last:arr;
    tt,tt1:array[0..200000] of string;
    val,val1:array[0..200000] of arr;
    dem,dem1,m,n:longint;
procedure nhap;
var i,j:longint;
begin
 read(m,n);
 for i:=1 to m do
  for j:=1 to n do read(v[i,j]);
 for i:=1 to n do read(last[i]);
end;

function cal(x,y:longint;a:arr):arr;
var i:longint;
begin
 cal:=a;
 if x=1 then
  for i:=1 to n do cal[i]:=a[i]+v[y,i]
 else if x=2 then
 begin
  for i:=1 to n do
   if i mod 2=0 then cal[i]:=a[i]+v[y,i];
 end
 else for i:=1 to n do
  if i mod 2=1 then cal[i]:=a[i]+v[y,i];
end;
procedure duyet(i:longint;xucxac:arr;st:string);
begin
 if i=m div 2+1 then
  begin
   inc(dem);
   tt[dem]:=st;
   val[dem]:=xucxac;
   exit;
  end;
 duyet(i+1,cal(1,i,xucxac),st+'a');
 duyet(i+1,cal(2,i,xucxac),st+'b');
 duyet(i+1,cal(3,i,xucxac),st+'c');
end;

function cal1(x,y:longint;a:arr):arr;
var i:longint;
begin
 cal1:=a;
 if x=1 then
  for i:=1 to n do cal1[i]:=a[i]-v[y,i]
 else if x=2 then
 begin
  for i:=1 to n do
   if i mod 2=0 then cal1[i]:=a[i]-v[y,i];
 end
 else for i:=1 to n do
  if i mod 2=1 then cal1[i]:=a[i]-v[y,i];
end;
procedure duyet1(i:longint;xucxac:arr;st:string);
begin
 if i=m div 2 then
  begin
   inc(dem1);
   tt1[dem1]:=st;
   val1[dem1]:=xucxac;
   exit;
  end;
 duyet1(i-1,cal1(1,i,xucxac),'a'+st);
 duyet1(i-1,cal1(2,i,xucxac),'b'+st);
 duyet1(i-1,cal1(3,i,xucxac),'c'+st);
end;


procedure doicho(var x,y:arr);
var tg:arr;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure doicho1(var x,y:string);
var tg:string;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
function ss(x,y:arr):longint;
var i:longint;
begin
 for i:=1 to n do
  if x[i]<y[i] then exit(1)
  else if x[i]>y[i] then exit(2);
 exit(0);
end;
procedure qsort(l,r:longint);
var i,j,key:longint; mid:arr; mid1:string;
begin
 i:=l;
 j:=r;
 key:=l+random(r-l+1);
 mid:=val1[key]; mid1:=tt1[key];
 repeat
  while (ss(val1[i],mid)=1) or ((ss(val1[i],mid)=0) and (tt1[i]<mid1)) do inc(i);
  while (ss(val1[j],mid)=2) or ((ss(val1[j],mid)=0) and (tt1[j]>mid1)) do dec(j);
  if i<=j then
   begin
    doicho(val1[i],val1[j]);
    doicho1(tt1[i],tt1[j]);
    inc(i);
    dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;



function find(l,r:longint;x:arr):longint;
var mid,kq:longint;
begin
 kq:=0;
 while l<=r do
  begin
   mid:=(l+r) div 2;
   if ss(val1[mid],x)=0 then
    begin
     kq:=mid;
     r:=mid-1;
    end
   else
   if ss(val1[mid],x)=1 then l:=mid+1
   else r:=mid-1;
  end;
 exit(kq);

end;
procedure xuli;
var st,kq,res,res1:string;
    i,vt:longint;
begin
 st:='';
 duyet(1,first,st);
 st:='';
 duyet1(m,last,st);
 qsort(1,dem1);
 res:='';
 for i:=1 to m do res:=res+'z';
 res1:=res;
 for i:=1 to dem do
  begin
   vt:=find(1,dem1,val[i]);
   if vt<>0 then
    begin
     kq:=tt[i]+tt1[vt];
     if kq<res then res:=kq;
    end;
  end;
 if res=res1 then
  begin
   write(-1);
   exit;
  end;
 writeln(res);
end;
begin
 assign(input,'diga.inp');reset(input);
 assign(output,'diga.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
