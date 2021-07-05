uses math;
const oo=1000000000;
var x,y,a,b:array[0..10000] of longint;
    c,ts:array[0..200,0..200] of real;
    res:real;
    n,m:longint;
function ccw(x,y,x1,y1,x2,y2:longint):longint;
var vc1x,vc1y,vc2x,vc2y,trans:longint;
begin
 vc1x:=x1-x;
 vc1y:=y1-y;
 vc2x:=x2-x;
 vc2y:=y2-y;
 trans:=vc1x*vc2y-vc1y*vc2x;
 if trans>0 then exit(1);
 if trans<0 then exit(-1);
 exit(0);
end;
function tinh(i,j:longint):real;
begin
 exit(sqrt(sqr(a[i]-a[j])+sqr(b[i]-b[j])));
end;
procedure nhap;
var  trans:real; i,j,dem,ans,k:longint;
begin
 read(n);
 for i:=1 to n do read(X[i],y[i]);
 read(m);
 for i:=1 to m do read(a[i],b[i]);
 for i:=1 to m do
  for j:=1 to m do c[i,j]:=oo;
 for i:=1 to m-1 do
  for j:=i+1 to m do
   begin
    ans:=ccw(a[i],b[i],a[j],b[j],x[1],y[1]);      dem:=1;
    for k:=2 to n do
     if ccw(a[i],b[i],a[j],b[j],x[k],y[k])=ans then inc(Dem);
    if dem=n then
     begin
      trans:=tinh(i,j);
      if ans=1 then
       begin
         ts[i,j]:=trans; c[i,j]:=trans;
       end
      else if ans=-1 then
       begin
        ts[j,i]:=trans; c[j,i]:=trans;
       end;
     end;
   end;
end;
procedure xuli;
var i,j,k:longint;
begin
 for i:=1 to m do c[i,i]:=0;
 for k:=1 to m do
  for i:=1 to m do
   for j:=1 to m do
    if c[i,j]>c[i,k]+c[k,j] then c[i,j]:=c[i,k]+c[k,j];
 res:=oo;
 for i:=1 to m do
  for j:=1 to m do
   if ts[i,j]<>0 then res:=min(Res,c[j,i]+ts[i,j]);
 write(Res:0:2);
end;
begin
 assign(input,'minperim.inp');reset(input);
 assign(output,'minperim.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.