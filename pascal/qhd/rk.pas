const base=111539786;
var n,m:longint;
    free:array[0..5000,0..5000] of boolean;
    f,a,b:array[0..5000,0..5000] of longint;
procedure nhap;
var i,u,v:longint;
begin
 read(n,m);
 for i:=1 to m do
  begin
   read(u,v);
   free[u,v]:=true;
  end;
end;
procedure xuli;
var i,j,k:longint;
begin
 f[1,1]:=1;
 for i:=1 to n do
  for j:=1 to n do
  if free[i,j]=false then
   begin
      if f[i,j]=0 then f[i,j]:=(a[i-1,j] +b[i,j-1] ) mod base;
      a[i,j]:=(f[i,j] +a[i-1,j] ) mod base;
      b[i,j]:=(f[i,j] +b[i,j-1] ) mod base;
   end;
  write(f[n,n] mod base);
end;
BEGIN
  assign(input,'rk.inp');reset(input);
  assign(output,'rk.out');rewrite(output);
  nhap;
  xuli;
  close(input);close(output);
END.
