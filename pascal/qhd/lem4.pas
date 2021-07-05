uses math;
const oo=maxlongint;
var n,res:longint;
    a:Array[0..17,0..17] of longint;
    f:array[0..17,0..150000,0..17] of longint;
procedure nhap;
var i,j:longint;
begin
 read(n);
 for i:=1 to n do
  for j:=1 to n do read(a[i,j]);
end;
function batbit(i,x:longint):longint;
begin
 exit(x or (1 shl i));
end;
function getbit(i,x:longint):longint;
begin
 exit(1 and (x shr i));
end;
procedure xuli;
var  i,j,k,m,tt,t:longint;
begin
 m:=2**n-1;
 for i:=1 to n do
  for j:=0 to m do
   for t:=1 to n do f[i,j,t]:=oo;
 for i:=0 to n-1 do f[1,2**i,i+1]:=0;
  //for j:=0 to m do f[i,j]:=oo;
 //f[0,0]:=0;
 for i:=1 to n-1 do
  for j:=0 to m do
  for t:=1 to n do
   if f[i,j,t]<>oo then
   for k:=1 to n do
    if getbit(k-1,j)=0 then
     begin
      tt:=batbit(k-1,j);
      f[i+1,tt,k]:=min(f[i+1,tt,k],f[i,j,t]+a[t,k]);
     end;
 res:=oo;
 for i:=1 to n do res:=min(res,f[n,m,i]);
 write(res);
end;
begin
 assign(input,'lem3.inp');reset(input);
 assign(output,'lem3.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.