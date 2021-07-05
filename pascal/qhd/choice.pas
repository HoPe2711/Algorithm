uses math;
const base=1000000007;
var n:longint;
    f:array[0..100000,0..1] of int64;
    a,b:array[0..100000] of longint;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do read(a[i]);
 for i:=1 to n-1 do read(b[i]);
end;
procedure xuli;
var i:longint;
begin
 f[1,0]:=b[1]; f[1,1]:=a[1];
 for i:=2 to n do
  begin
   f[i,0]:=(f[i-1,0]+f[i-1,1])*b[i] mod base ;
   f[i,1]:=(((f[i-1,1]+f[i-1,0])*b[i-1] mod base-f[i-1,0]+base) mod base +(f[i-1,0]+f[i-1,1])*a[i] mod base) mod base;
  end;
 write((f[n,0]+f[n,1]) mod base);
end;
begin
 assign(input,'choice.inp');reset(input);
 assign(output,'choice.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.