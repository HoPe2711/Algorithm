var m,n,q,x1,y1,u1,v1:longint;
    res:int64;
    f,a:array[0..1000,0..1000] of int64;
    x,y,u,v:array[0..1000000] of longint;
    b,f1:array[-1000000..1000000] of int64;
procedure nhap;
var i,j:longint;
begin
 for i:=1 to m do
  for j:=1 to n do read(a[i,j]);
 for i:=1 to q do read(x[i],y[i],u[i],v[i]);
end;
procedure xuli;
var i,j,k:longint;
begin
 for i:=1 to m do
  for j:=1 to n do f[i,j]:=f[i-1,j]+f[i,j-1]-f[i-1,j-1]+a[i,j];
 for k:=1 to q do
  begin
   res:=f[u[k],v[k]]-f[x[k]-1,v[k]]-f[u[k],y[k]-1]+f[x[k]-1,y[k]-1];
   writeln(res);
  end;
end;
procedure xuli2;
var i,j,h:longint;
begin
 for i:=1 to m do
  for j:=1 to n do read(b[j+n*(i-1)]);
 for i:=1 to m do
  for j:=1 to n do f1[j+n*(i-1)]:=f1[j+n*(i-2)]+f1[j-1+n*(i-1)]-f1[j-1+n*(i-2)]+b[j+n*(i-1)];
 for h:=1 to q do
  begin
   read(x1,y1,u1,v1);
   res:=f1[v1+n*(u1-1)]-f1[v1+n*(x1-2)]-f1[y1-1+n*(u1-1)]+f1[y1-1+n*(x1-2)];
   writeln(res);
  end;
end;
BEGIN
  assign(input,'bonus.inp');reset(input);
  assign(output,'bonus.out');rewrite(output);
  read(m,n,q);
  if (m<=1000) and (n<=1000) then
   begin
    nhap;
    xuli;
   end
  else xuli2;
  close(input);close(output);
END.
