uses math;
var a,b,hailong:array[0..2000000] of longint;
    res:int64;
    m,n,k,tungduong,latdot,ok:longint;

procedure doicho(var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;


procedure qsort(l,r:longint);
var mid,i,j:longint;
begin
 i:=l;
 j:=r;
 mid:=b[l+random(r-l+1)];
 repeat
  while b[i]>mid do inc(i);
  while b[j]<mid do dec(J);
  if i<=j then
   begin
    doicho(b[i],b[j]);
    inc(i); dec(J);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;


procedure nhap;
var  i,j:longint;
begin
 read(m,n,k);
 for i:=1 to m do
  for j:=1 to n do read(A[(i-1)*n+j]);
 for i:=1 to n do
 begin
  for j:=1 to m do b[j]:=a[(j-1)*n+i];
  if m<>1 then qsort(1,m);
  for j:=1 to m do a[(j-1)*n+i]:=b[j];
  hailong[i]:=hailong[i-1]+b[1];
 end;
end;


procedure backtrack(i,sum,x:longint);
var  j,sum1:longint;
begin
 if tungduong>=k then exit;
 if i=n+1 then
  begin
   if sum>=x then inc(tungduong);
   exit;
  end
 else
  for j:=1 to m do
   begin
    sum1:=sum+a[(j-1)*n+i];
    if (sum1+hailong[n]-hailong[i]<x) then break;
    if (i<>n) and (sum1>=x) then
     begin
      tungduong:=tungduong+(n-i)*m;
      if tungduong>=k then exit;
      continue;
     end;
    backtrack(i+1,sum1,x);
    if tungduong>=k then exit;
   end;
end;


function check(x:longint):boolean;
begin
 tungduong:=0;
 backtrack(1,0,x);
 if tungduong>=k then exit(true);
 exit(false);
end;


procedure xuli;
var l,r,mid:longint;
begin
 l:=1;
 r:=hailong[n];
 while l<=r do
  begin
   mid:=(l+r) div 2;
   if check(mid) then
    begin
     latdot:=mid;
     l:=mid+1;
    end
   else r:=mid-1;
  end;
end;

procedure duyet(i,sum:longint);
var j,sum1:longint;
begin
 if ok=k then exit;
 if i=n+1 then
  begin
   if sum>latdot then
    begin
     res:=res+sum;
     inc(ok);
    end;
   exit;
  end;
 for j:=1 to m do
  begin
   sum1:=sum+a[(j-1)*n+i];
   if (sum1+hailong[n]-hailong[i]<=latdot) then break;
   duyet(i+1,sum1);
   if ok=k then exit;
  end;
end;

begin
 assign(input,'landsel.inp');reset(input);
 assign(output,'landsel.out');rewrite(output);
 nhap;
 xuli;
 duyet(1,0);
 res:=res+int64(latdot)*(k-ok);
 write(res);
 close(input); close(output);
end.
