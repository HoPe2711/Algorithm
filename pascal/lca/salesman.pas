uses math;
var ke,next,head,tin,tout,d:array[-200000..200000] of longint;
    f:array[0..30000,0..20] of longint;
    res,n,m,l,dem:longint;
procedure add(i,u,v:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 ke[-i]:=u;
 next[-i]:=head[v];
 head[v]:=-i;
end;
procedure nhap;
var i,u,v:longint;
begin
 read(n);
 for i:=1 to n-1 do
  begin
   read(u,v);
   add(i,u,v);
  end;
 l:=trunc(log2(n)); f[1,0]:=1;
end;
procedure DFS(u:longint);
var j,v:longint;
begin
 inc(dem);
 tin[u]:=dem;
 for j:=1 to l do f[u,j]:=f[f[u,j-1],j-1];
 j:=head[u];
 while j<>0 do
  begin
   v:=ke[j];
   if v<>f[u,0] then
    begin
     f[v,0]:=u;
     d[v]:=d[u]+1;
     DFS(v);
    end;
   j:=next[j];
  end;
 inc(dem);
 tout[u]:=dem;
end;
function anc(u,v:longint):boolean;
begin
 if (tin[u]<=tin[v]) and (tout[u]>=tout[v]) then exit(true);
 exit(falsE);
end;
function LCA(u,v:longint):longint;
var j:longint;
begin
 if anc(u,v) then exit(u);
 if anc(v,u) then exit(v);
 for j:=l downto 0 do
  if anc(f[u,j],v)=false then u:=f[u,j];
 exit(f[u,0]);
end;
procedure xuli;
var i,last,x:longint;
begin
 DFS(1);
 read(m);
 last:=-1;
 for i:=1 to m do
  begin
   read(x);
   if last<>-1 then res:=res+d[x]+d[last]-2*d[lca(x,last)];
   last:=x;
  end;
 write(res);
end;
begin
 assign(input,'salesman.inp');reset(input);
 assign(output,'salesman.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
