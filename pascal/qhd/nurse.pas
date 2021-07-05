uses math;
const base=1000000007;
var n,k,k1:longint;   res:int64;
    f:array[0..2000] of int64;
procedure nhap;
var  i,j,t:longint;
begin
 read(n,k,k1);
 f[1]:=1;
 for i:=k+1 to k1+1 do f[i]:=1;
 for i:=k+1 to n do
  for j:=k to k1 do
   if i-j-1>=0 then f[i]:=(f[i-j-1]+f[i]) mod base;
 res:=f[n];
 for i:=n-k1 to n-k do res:=(res+f[i]) mod base;
 write(res);
end;
begin
 assign(input,'nurse.inp');reset(input);
 assign(output,'nurse.out');rewrite(output);
 nhap;
 close(input); close(output);
end.
