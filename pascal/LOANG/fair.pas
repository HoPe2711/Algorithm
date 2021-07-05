uses math;
const oo=10000000;
      q:array[1..4] of longint=(1,0,0,-1);
      q1:array[1..4] of longint=(0,1,-1,0);
var res,f,r,m,n,x,y:longint;
    a,d:array[0..1000,0..1000] of longint;
    queu,queu1:array[-1000000..1000000] of longint;
procedure nhap;
var i,j:longint;
begin
 read(m,n);
 for i:=1 to m do
  for j:=1 to n do read(a[i,j]);
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
procedure back(i,j:longint);
begin
 dec(f);
 queu[f]:=i;
 queu1[f]:=j;
end;
procedure BFS;
var i,u,v:longint;
begin
 while f<=r do
  begin
   pop;
   for i:=1 to 4 do
    begin
     u:=x+q[i];
     v:=y+q1[i];
     if (u>=1) and (u<=m) and (v>=1) and (v<=n) then
      begin
       if (a[x,y]=a[u,v]) and (d[u,v]>d[x,y]) then
        begin
         d[u,v]:=d[x,y];
         back(u,v);
        end;
       if (a[x,y]<>a[u,v]) and (d[u,v]>d[x,y]+1) then
        begin
         d[u,v]:=d[x,y]+1;
         push(u,v);
        end;
     end;
    end;
  end;
end;
procedure xuli;
var i,j:longint;
begin
 res:=oo;
 f:=1; r:=0;
 for i:=1 to m do
  for j:=1 to n do d[i,j]:=oo;
 for i:=1 to m do
  begin
   push(i,1);
   d[i,1]:=1;
  end;
 BFS;
 for i:=1 to m do res:=min(res,d[i,n]);
 write(res);
end;
begin
 assign(input,'fair.inp'); reset(input);
 assign(output,'fair.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
