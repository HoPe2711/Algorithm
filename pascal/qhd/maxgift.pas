uses  math;
const oo=1000000001;
var n,p,dem:longint;
    a,r:array[0..300] of longint;
    g,trace:array[0..300,0..300] of longint;
    f:array[0..300,0..300] of int64;
procedure nhap;
var  i,j,k:longint;
begin
 read(n,p);
 for i:=1 to n do read(a[i]);
 for i:=1 to n do
  for j:=1 to i do g[j,i]:=oo;
 for i:=1 to n do
  for j:=1 to i do
   for k:=j to i do g[j,i]:=min(g[j,i],a[k]);
end;
procedure truyvet(x,y:longint);
begin
 if y=0 then exit;
 x:=trace[x,y];
 dec(y);
 inc(dem);
 r[dem]:=x;
 truyvet(x,y);
end;
procedure xuli;
var i,j,k:longint;
begin
 for i:=1 to n do f[i,1]:=g[1,i];
 for i:=1 to n do
  for k:=2 to p do
   if k<=i then
    for j:=1 to i-1 do
    if f[i,k]<f[j,k-1]+g[j+1,i] then
     begin
      f[i,k]:=max(f[j,k-1]+g[j+1,i],f[i,k]);
      trace[i,k]:=j;
     end;
 writeln(f[n,p]);
 truyvet(n,p);
 for i:=dem-1 downto 1 do write(r[i],' ');
end;
begin
 assign(input,'maxgift.inp');reset(input);
 assign(output,'maxgift.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.