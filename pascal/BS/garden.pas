uses math;
const oo=1000000000;
var n,m,kq:longint;
    a,tt,free:array[0..1000,0..1000] of longint;
procedure nhap;
var i,j:longint;
begin
 read(n,m);
 for i:=1 to n do
  for j:=1 to m do
   begin
    read(a[i,j]);
    kq:=max(kq,a[i,j]);
   end;
end;
procedure xuli;
var i,j,u,v:longint;
    res,kq:longint;
begin
 kq:=oo;
 res:=0;
 for i:=1 to n-1 do
  for j:=1 to m-1 do
   for u:=i+1 to n do
    for v:=j+1 to m do
    begin
     kq:=min(min(a[i,j],a[i,v]),min(a[u,v],a[u,j]));
     res:=max(kq,res);
    end;
 write(res);
end;
function check(x:longint):boolean;
var i,j,t:longint;
begin
 fillchar(tt,sizeof(tt),0);
 fillchar(free,sizeof(free),0);
 for i:=1 to n do
  for j:=1 to m-1 do
  if a[i,j]>=x then
   for t:=j+1 to m do
    if (tt[j,t]<i) then
    if (a[i,t]>=x) then
     begin
       if (free[j,t]=1) or (free[t,j]=1) then exit(true);
       inc(tt[j,t]);
       inc(tt[t,j]);
       inc(free[j,t]);
       inc(free[t,j]);
     end;
 exit(false);
end;
procedure xuli2;
var l,r,mid,res:longint;
begin
 res:=0;
 l:=0;
 r:=kq;
 while l<=r do
  begin
   mid:=(l+r) div 2;
   if check(mid) then
    begin
     res:=max(res,mid);
     l:=mid+1;
    end
   else r:=mid-1;
  end;
 write(res);
end;
begin
 //assign(input,'garden.inp');reset(input);
 //assign(output,'garden.out');rewrite(output);
 nhap;
// if (n<=50) and (m<=50) then xuli
{ else}  xuli2;
 //close(input); close(output);
end.


