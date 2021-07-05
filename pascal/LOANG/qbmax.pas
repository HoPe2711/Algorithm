uses math;
var m,n,x,y,res,f,r:longint;
    queu,queu1:array[0..20000000] of longint;
    a,d:array[0..100,0..100] of longint;
procedure nhap;
var i,j:longint;
begin
 read(m,n);
 for i:=1 to m do
  for j:=1 to n do read(A[i,j]);
end;
procedure push(i,j:longint);
begin
 inc(r);
 queu[r]:=i;
 queu1[r]:=j;
end;
procedure pop;
begin
 x:=queu[f];
 y:=queu1[f];
 inc(f);
end;
procedure BFS;
var i,u,v:longint;
begin
 while f<=r do
  begin
   pop;
   v:=y+1;
   for i:=-1 to 1 do
    begin
     u:=x+i;
     if (u<=m) and (v<=n) and (u>=1) then
      if d[u,v]<d[x,y]+a[u,v] then
       begin
        d[u,v]:=d[x,y]+a[u,v];
        push(u,v);
       end;
    end;
  end;
end;
procedure xuli;
var i,j:longint;
begin
 res:=-500000;
 for i:=1 to m do
  for j:=1 to n do d[i,j]:=-500000;
 f:=1; r:=0;
 for i:=1 to m do
  begin
   push(i,1);
   d[i,1]:=a[i,1];
  end;
 BFS;
 for i:=1 to m do res:=max(res,d[i,n]);
 write(res);
end;
begin
 nhap;
 xuli;
end.