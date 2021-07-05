uses math;
var ke,next,head,f,f1,f2,g,g1,cha,ff,ff1,g2:array[-500000..500000] of longint;
    n,res:longint;
procedure add(i,u,v:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
end;
procedure nhap;
var i,u,v:longint;
begin
 read(n);
 for i:=1 to n-1 do
  begin
   read(u,v);
   add(i,u,v);
   add(-i,v,u);
  end;
end;

procedure DFS(u,p:longint);
var j,v:longint;
begin
 j:=head[u];
 while j<>0 do
  begin
   v:=ke[j];
   if v<>p then
    begin
     cha[v]:=u;
     DFS(v,u);
     if f[u]<=f[v]+1 then
      begin
       f2[u]:=f1[u];
       f1[u]:=f[u];
       f[u]:=f[v]+1;
      end
     else if f1[u]<=f[v]+1 then
      begin
       f2[u]:=f1[u];
       f1[u]:=f[v]+1;
      end
     else if f2[u]<f[v]+1 then f2[u]:=f[v]+1;
     g1[u]:=max(max(g1[v],g1[u]),f[u]+f1[u]);
    end;
   j:=next[j];
  end;
end;
procedure  DFS1(u,p:longint);
var  j,v:longint;
begin
 j:=head[u];
 while j<>0 do
  begin
   v:=ke[j];
   if v<>p then
    begin
     DFS1(v,u);
     if ff[u]<=g1[v] then
      begin
       ff1[u]:=ff[u];
       ff[u]:=g1[v];
      end
     else if ff1[u]<g1[v] then ff1[u]:=g1[v];
    end;
   j:=next[j];
  end;
end;
procedure DFSS(u,p:longint);
var v,j:longint;
begin
 j:=head[u];
 while j<>0 do
  begin
   v:=ke[j];
   if v<>p then
    begin
     if g1[v]<>ff[u] then g2[v]:=max(g2[u],ff[u]) else g2[v]:=max(g2[u],ff1[u]);
     res:=max(Res,g2[v]+g1[v]);
     if f[v]+1=f[u] then
      begin
       res:=max(max(g[u]+f1[u],f1[u]+f2[u])+g1[v],res);
       g[v]:=max(g[u],f1[u])+1;
      end
     else
      if f1[u]=f[v]+1 then
       begin
        res:=max(Res,max(g[u]+f[u],f[u]+f2[u])+g1[v]);
        g[v]:=max(g[u],f[u])+1;
       end
      else
       begin
        res:=max(res,max(g[u]+f[u],f[u]+f1[u])+g1[v]);
        g[v]:=max(g[u],f[u])+1;
       end;
     DFSS(v,u);
    end;
   j:=next[j];
  end;
end;
procedure xuli;
var u,p:longint;
begin
 DFS(1,-1);   DFS1(1,-1);
 DFSS(1,-1);
 write(Res+1);
end;
begin
 assign(input,'diameter.inp');reset(input);
 assign(output,'diameter.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
