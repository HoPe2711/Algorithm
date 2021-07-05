uses math;
const base=2111992;
var n,k:longint;
    f:array[0..300000] of longint;
procedure nhap;
var i:longint;
begin
 read(n,k);
 f[0]:=1;
 for i:=1 to n do
 begin
  if i-k-1>0 then f[i]:=(f[i-1]+f[i-k-1]) mod base
  else f[i]:=(f[i-1]+1) mod base;
 end;
 write(f[n]);
end;
begin
 assign(input,'ctnbulls.inp');reset(input);
 assign(output,'ctnbulls.out');rewrite(output);
 nhap;
 close(input); close(output);
end.
