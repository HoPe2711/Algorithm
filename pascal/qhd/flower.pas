uses math;
const base=1000000007;
var m,n,k:longint;
    res:int64;
    f:array[0..50,0..50,0..1,0..1,0..1,0..1] of int64;
function luythua(a,x:int64):int64;
var tg:int64;
begin
 if x=0 then exit(1);
 if x=1 then exit(a mod base);
 tg:=luythua(a,x div 2);
 tg:=tg*tg mod base;
 if x mod 2=1 then exit(tg*a mod base)
 else exit(tg mod base);
end;
procedure nhap;
var i,j,t,l1,l,l2,l3:longint;
begin
 read(m,n,k);
 f[1,1,1,0,0,0]:=1;
 f[1,1,0,1,0,0]:=1;
 f[1,1,0,0,1,0]:=1;
 f[1,1,0,0,0,1]:=1;
 for i:=1 to n-1 do
  for j:=1 to i do
   for t:=1 to 4 do
    for l:=0 to 1 do
     for l1:=0 to 1 do
      for l2:=0 to 1 do
       for l3:=0 to 1 do
     if (l+l1+l2+l3=j) then
      begin
       if j+1<=n then
        if (t=1) and (l=0) then f[i+1,j+1,1,l1,l2,l3]:=(f[i+1,j+1,1,l1,l2,l3]+f[i,j,l,l1,l2,l3]) mod base
        else
        if (t=2) and (l1=0) then f[i+1,j+1,l,1,l2,l3]:=(f[i+1,j+1,l,1,l2,l3]+f[i,j,l,l1,l2,l3]) mod base
        else
        if (t=3) and (l2=0) then f[i+1,j+1,l,l1,1,l3]:=(f[i+1,j+1,l,l1,1,l3]+f[i,j,l,l1,l2,l3]) mod base
        else
        if (t=4) and (l3=0) then f[i+1,j+1,l,l1,l2,1]:=(f[i+1,j+1,l,l1,l2,1]+f[i,j,l,l1,l2,l3]) mod base
        else f[i+1,j,l,l1,l2,l3]:=(f[i+1,j,l,l1,l2,l3]+f[i,j,l,l1,l2,l3]) mod base
      end
end;
procedure writekq;
var i,j,l,l1,l2,l3:longint;
begin
 for i:=k to 4 do
 for l:=0 to 1 do
  for l1:=0 to 1 do
   for l2:=0 to 1 do
    for l3:=0 to 1 do
   if l1+l2+l3+l=i then
   res:=(res+f[n,i,l,l1,l2,l3]) mod base;
 res:=luythua(res,m);
 write(res);
end;
BEGIN
  assign(input,'flower.inp');reset(input);
  assign(output,'flower.out');rewrite(output);
  nhap;
  writekq;
  close(input);close(output);
END.
