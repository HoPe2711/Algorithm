uses math;
const base=1000000007;
var m,n,k:longint;
    u,v:array[0..100001] of longint;
    gt,f:array[0..200002] of longint;
procedure nhap;
var i:longint;
begin
 read(m,n,k);
 for i:=1 to k do read(u[i],v[i]);
 u[k+1]:=m; v[k+1]:=n;
end;
function pow(a,x:longint):longint;
var tg:longint;
begin
 if x=0 then exit(1);
 tg:=pow(a,x div 2);
 tg:=int64(tg)*tg mod base;
 if x mod 2 =1 then exit(int64(tg)*a mod base)
 else exit(tg);
end;
function c(h,h1:longint):longint;
var pp,res:longint;
begin
 pp:=(int64(gt[h])*gt[h1-h]) mod base;
 res:=(int64(gt[h1])*pow(pp,base-2)) mod base;
 exit(res);
end;
procedure doicho(var x,y:longint);
var
 tg:longint;
 begin
  tg:=x;
  x:=y;
  y:=tg;
 end;
procedure qsort(l,r:longint);
var i,j,mid,mid1,key:longint;
begin
 i:=l;
 j:=r;
 key:=l+random(r-l+1);
 mid:=u[key];
 mid1:=v[key];
 repeat
  while ((u[i]<mid)) or ((u[i]=mid) and (v[i]<mid1)) do inc(i);
  while ((u[j]>mid)) or ((u[j]=mid) and (v[j]>mid1)) do dec(j);
  if i<=j then
   begin
    doicho(u[i],u[j]);
    doicho(v[i],v[j]);
    inc(i);
    dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure xuli;
var i,j,hailong,tungduong,kq,oo:longint;
begin
 qsort(1,k);
 gt[0]:=1;
 for i:=1 to m+n-2 do gt[i]:=int64(gt[i-1])*i mod base;
 for i:=1 to k+1 do
 begin
  f[i]:=c(v[i]-1,u[i]+v[i]-2);
  kq:=0;
  for j:=1 to i-1 do
  if (u[i]>=u[j]) and (v[i]>=v[j]) then
   begin
    hailong:=u[i]-u[j]+1;
    tungduong:=v[i]-v[j]+1;
    oo:=(int64(f[j])*c(tungduong-1,hailong+tungduong-2)) mod base;
    kq:=(kq+oo) mod base;
   end;
   f[i]:=(f[i]-kq+base) mod base;
 end;
 write(f[k+1]);
end;

begin
 assign(input,'chess.inp');reset(input);
 assign(output,'chess.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.