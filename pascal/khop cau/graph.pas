uses math;
var ke,next,head,num,low,child:array[-50000..50000] of longint;
    n,m,tplt,dem:longint;
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
 read(n,m);
 for i:=1 to m do
  begin
   read(u,v);
   add(i,u,v);
  end;
end;
procedure DFS(u,p:longint);
var j,v:longint;
begin
 inc(dem);
 num[u]:=dem;
 low[u]:=dem;
 j:=head[u];
 while j<>0 do
  begin
   v:=ke[j];
   if v<>p then
    if num[v]=0 then
     begin
      DFS(v,u);
      low[u]:=min(low[u],low[v]);
     end
    else low[u]:=min(low[u],num[v]);
   j:=next[j];
  end;
 if (num[u]=low[u]) and (p<>-1) then
  begin
   inc(child[u]);
  end;
end;
procedure xuli;
var i:longint;
begin
 for i:=1 to n do
 if num[i]=0 then
  begin
    dem:=0;
    DFS(i,-1);
  end;
 for i:=1 to n do writeln(child[i]);
end;
BEGIN
  assign(input,'graph.inp');reset(input);
  assign(output,'graph.out');rewrite(output);
  nhap;
  xuli;
 close(input);close(output);
END.
