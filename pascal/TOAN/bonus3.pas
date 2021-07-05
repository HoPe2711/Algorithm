uses math;
var n,m,miny,maxx,maxy,res,l,minx:longint;
    a,b,f:array[-1000..1000,-1000..1000] of longint;
    free:array[-1000..1000,-1000..1000] of boolean;
procedure nhap;
var i,j:longint;
begin
 res:=low(longint);
 read(n,m);
 for i:=1 to n do
  for j:=1 to m do
   begin
    read(a[i,j]);
    b[i+j,i-j]:=a[i,j];
    free[i+j,i-j]:=true;
   end;
 miny:=1-m;
 maxx:=n+m;
 minx:=2;
 maxy:=n-1;
end;
procedure xuli;
var i,j,k:longint;
begin
 for i:=minx to maxx do
  for j:=miny to maxy do f[i,j]:=f[i-1,j]+f[i,j-1]-f[i-1,j-1]+b[i,j];
 for k:=1 to min(n div 2,m div 2) do
 for i:=minx to maxx-2*k do
  for j:=miny to maxy-2*k do
    begin
     l:=2*k+1;
     if (free[i+l-1,j+l-1]=true) and (free[i+l-1,j]=true) then
      if (free[i,j+l-1]=true) and (free[i,j]=true) then res:=max(f[i+l-1,j+l-1]-f[i+l-1,j-1]-f[i-1,j+l-1]+f[i-1,j-1],res);
    end;
 write(res);
end;
begin
 assign(input,'bonus3.inp');reset(input);
 assign(output,'bonus3.out');rewrite(output);
 nhap;
 xuli;
 close(input);close(output);
end.
