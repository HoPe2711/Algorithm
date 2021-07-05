uses math;
var n,m,u,v,k,res,p:longint;
    a:array[0..200000] of longint;
    f:array[0..200000,0..15] of longint;
procedure nhap;
var i,j:longint;
begin
 read(n,m);
 for i:=1 to m do
  begin
   read(u,v,k);
   a[u]:=a[u]+k;
   a[v+1]:=a[v+1]-k;
  end;
 for i:=1 to n do a[i]:=a[i]+a[i-1];
 for i:=1 to n do f[i,0]:=a[i];
 for j:=1 to trunc(log2(n)) do
  for i:=1 to n-1 shl j+1 do f[i,j]:=max(f[i,j-1],f[i+1 shl (j-1),j-1]);
 read(p);
 for i:=1 to p do
  begin
   read(u,v);
   for j:=trunc(log2(n)) downto 0 do
    if u+1 shl j-1<=v then
     begin
      res:=max(res,f[u,j]);
      u:=u+1 shl j;
     end;
   writeln(res);
   res:=0;
  end;
end;
begin
 nhap;
end.