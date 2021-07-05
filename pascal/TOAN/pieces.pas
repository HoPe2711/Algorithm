const base=1000000007;
var n:longint;  s:int64;
    g,tt,tt1,tt2,f,sum,tt3:array[0..1000000] of int64;
    a:array[0..1000000] of longint;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do
  begin
   read(A[i]);
   sum[i]:=(sum[i-1]+a[i]) mod base;
  end;
end;
procedure xuli;
var i:longint;
begin
 g[1]:=1;   tt3[0]:=1;
 for i:=2 to n do g[i]:=(g[i-1]*2) mod base ;
 for i:=1 to n do
  begin
   tt[i]:=(tt[i-1]+sum[i]*g[i] mod base) mod base ;
   tt3[i]:=(tt3[i-1]+g[i]) mod base;
   tt1[i]:=(tt1[i-1]+((i*sum[i]) mod base)*g[i] mod base) mod base;
   tt2[i]:=(tt2[i-1]+i*g[i] mod base ) mod base;
  end;
 for i:=1 to n do
  begin
   f[i]:=(s+((tt3[i-1]*i mod base)*sum[i]) mod base-(i*tt[i-1]) mod base-(sum[i]*tt2[i-1]) mod base+tt1[i-1] mod base+2*base) mod base ;
   s:=(s+f[i]) mod base ;
  end;
 //write(base);
 write(f[n]);
end;
begin
 assign(input,'pieces.inp'); reset(input);
 assign(output,'pieces.out'); rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.