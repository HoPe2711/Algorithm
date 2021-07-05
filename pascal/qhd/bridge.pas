uses math;
const oo=high(int64) div 2;
var n,m:longint;
    res:real;
    x,y:array[0..20] of real;
    f:array[0..20,0..1100000] of real;
    free:array[0..20,0..20] of real;
function tinh(u,v:longint):real;
begin
 exit(sqrt(sqr(x[u]-x[v])+sqr(y[u]-y[v])));
end;
procedure nhap;
var i,j,u,v:longint;
begin
 read(n,m);
 for i:=1 to n do read(x[i],y[i]);
 for i:=1 to n do
  for j:=1 to n do free[i,j]:=-1;
 for i:=1 to m do
  begin
   read(u,v);
   free[u,v]:=0;
   free[v,u]:=0;
  end;
 for i:=1 to n-1 do
  for j:=i+1 to n do
  if free[i,j]=-1 then
   begin
    free[i,j]:=tinh(i,j);
    free[j,i]:=free[i,j];
   end;
end;
function getbit(i,x:longint):longint;
begin
 exit(1 and (x shr i));
end;
procedure hal;
var i,j,k,tt:longint;
begin
 for i:=1 to n do
  for j:=1 to 2**n-1 do f[i,j]:=oo;
 for j:=0 to 2**n-1 do
 for i:=1 to n do
  if (getbit(i-1,j)=0)  then
   begin
    tt:=j or (1 shl (i-1));
    if j=0 then
     begin
      f[i,tt]:=0;
      continue;
     end;
    for k:=1 to n do
     if (getbit(k-1,j)=1) then  f[i,tt]:=min(f[i,tt],f[k,j]+free[i,k]);
   end;
 res:=oo;
 for i:=1 to n do res:=min(res,f[i,2**n-1]);
 if res=0 then write('YES')
 else
  begin
   writeln('NO');
   writeln(res:0:3);
  end;
end;
begin
 assign(input,'bridge.inp');reset(input);
 assign(output,'bridge.out');rewrite(output);
 nhap;
 hal;
 close(input); close(output);
end.
