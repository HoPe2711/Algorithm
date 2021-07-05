uses math;
const xoay:array[1..16] of longint=(4,8,12,16,3,7,11,15,2,6,10,14,1,5,9,13);
var n,res,dem:longint;
    a,t,p:array[0..2000000] of longint;
procedure doicho(Var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure qsort(l,r:longint);
var i,j,mid:longint;
begin
 i:=l;
 j:=r;
 mid:=a[l+random(r-l+1)];
 repeat
  while (a[i]<mid) do inc(i);
  while (a[j]>mid) do deC(j);
  if i<=j then
   begin
    doicho(a[i],a[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure nhap;
var  i,last:longint;
begin
 read(n);
 for i:=1 to n do read(A[i]);
 qsort(1,n);
 last:=1;
 a[n+1]:=-1;
 for i:=2 to n+1 do
  if a[i]<>a[last] then
   begin
    inc(dem);
    t[dem]:=a[last];
    p[dem]:=i-last;
    last:=i;
   end;
end;
function getbit(i,x:longint):longint;
begin
 exit(1 and (x shr i));
end;
function check(i,j,latdot:longint):longint;
var tmp:longint;
begin
 tmp:=getbit(i-1,latdot)+getbit(j-1,latdot);
 i:=xoay[i]; j:=xoay[j];
 tmp:=max(tmp,getbit(i-1,latdot)+getbit(j-1,latdot));
 i:=xoay[i]; j:=xoay[j];
 tmp:=max(tmp,getbit(i-1,latdot)+getbit(j-1,latdot));
 i:=xoay[i]; j:=xoay[j];
 tmp:=max(tmp,getbit(i-1,latdot)+getbit(j-1,latdot));
 exit(2-tmp);
end;
procedure xuli;
var i,j,hailong,k:longint;
begin
 res:=2000000;
 for i:=1 to 15 do
  for j:=i+1 to 16 do
  begin
   hailong:=0;
   for k:=1 to dem do hailong:=hailong+check(i,j,t[k])*p[k];
   res:=min(res,hailong);
  end;
 write(res);
end;
begin
 assign(input,'punch.inp');reset(input);
 assign(output,'punch.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
