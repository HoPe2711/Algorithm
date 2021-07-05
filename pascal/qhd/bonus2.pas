uses math;
var n,k,res,kq,kq1:longint;
    a,f,s,h:array[0..1001,0..1001] of longint;
procedure nhap;
var i,j:longint;
begin
 read(n,k);
 for i:=1 to n do
  for j:=1 to n do read(a[i,j]);
end;
procedure khoitao;
var i,j:longint;
begin
  for i:=1 to n do
   for j:=1 to n do f[i,j]:=f[i-1,j]+f[i,j-1]-f[i-1,j-1]+a[i,j];
  for i:=1 to n-k+1 do
   for j:=1 to n-k+1 do
    s[i,j]:=f[i+k-1,j+k-1]-f[i-1,j+k-1]-f[i+k-1,j-1]+f[i-1,j-1];
end;
procedure xuli;
var i,j:longint;
begin
 for i:=n-k+1 downto 1 do
  for j:=n-k+1 downto 1 do h[i,j]:=max(max(h[i,j+1],h[i+1,j]),s[i,j]);
 for i:=k to n do
  for j:=k to n do
   res:=max(res,s[i-k+1,j-k+1]+max(h[i+1,1],h[1,j+1]));
 write(res);
end;
begin
 assign(input,'bonus2.inp');reset(input);
 assign(output,'bonus2.out');rewrite(output);
 nhap;
 khoitao;
 xuli;
 close(input);
 close(output);
end.