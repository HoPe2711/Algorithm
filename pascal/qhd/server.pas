uses math;
const oo=1000000000;
var  n,m,l:longint;
     free:Array[0..20,0..20] of longint;
     f,cp:array[0..2000000] of longint;
function getbit(i,x:longint):longint;
begin
 exit(1 and (x shr i));
end;
function batbit(i,x:longint):longint;
begin
 exit(x or (1 shl i));
end;
function tatbit(i,x:longint):longint;
begin
 exit(x and (not(1 shl i)));
end;
procedure nhap;
var i,u,v:longint;
begin
 read(n);
 read(m);
 for i:=1 to m do
  begin
   read(u,v);
   free[u,v]:=1;
   free[v,u]:=1;
  end;
end;
procedure xuli;
var i,j,tt,tt1:longint;
begin
 l:=2**n-1;
 for tt:=0 to l do
  begin
   i:=0;
   for j:=1 to n do
    if getbit(j-1,tt)=1 then
     begin
      i:=j;
      break;
     end;
   if i=0 then continue;
   tt1:=tatbit(i-1,tt);
   cp[tt]:=cp[tt1];
   for j:=1 to n do
    if (i<>j) and (free[i,j]=1) then
     if getbit(j-1,tt)=0 then inc(cp[tt])
     else dec(cp[tt]);
  end;
 for i:=0 to l do f[i]:=oo;
 for i:=1 to n do
  begin
   f[2**(i-1)]:=0;
  end;
 for tt:=0 to l do
  if f[tt]<>oo then
   for i:=1 to n do
    if getbit(i-1,tt)=0 then
     begin
      tt1:=batbit(i-1,tt);
      f[tt1]:=min(f[tt1],f[tt]+cp[tt]);
     end;
  write(f[l]);
end;
begin
 assign(input,'server.inp');reset(inpuT);
 assign(output,'server.out');rewrite(output);
 nhap;
 xuli;
 close(input); closE(output);
end.