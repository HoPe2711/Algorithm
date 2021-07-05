uses math;
var m,n,p,q,res:longint;
    a,b,f,c,g:array[0..2000,0..2000] of int64;
procedure nhap;
var i,j,x:longint;
begin
 read(m,n,p,q);
 read(x);
 for i:=1 to m do
  for j:=1 to n do
   begin
    read(a[i,j]);
    if a[i,j]<=x then b[i,j]:=1;
    if a[i,j]=x then c[i,j]:=1;
    g[i,j]:=g[i,j-1]+g[i-1,j]-g[i-1,j-1]+c[i,j];
    f[i,j]:=f[i,j-1]+f[i-1,j]-f[i-1,j-1]+b[i,j];
   end;
end;
procedure xuli;
var i,j,point,tmp,tmp1:longint;
begin
 point:=(p*q+1) div 2;
 for i:=1 to m do
  for j:=1 to n do
   if (i>=p) and (j>=q) then
    begin
     tmp:=f[i,j]-f[i-p,j]-f[i,j-q]+f[i-p,j-q];
     tmp1:=g[i,j]-g[i-p,j]-g[i,j-q]+g[i-p,j-q];
     if (tmp>=point) and (tmp1>0) and (tmp-tmp1<point) then inc(res);
    end;
 write(res);
end;
begin
 assign(input,'resort.inp');reset(input);
 assign(output,'resort.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
