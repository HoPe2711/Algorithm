uses math;
var n,res,a,b:longint;
    ke,next,head,d,d1,gg,free,gg1,g,g1:array[-500000..500000] of longint;
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
 read(a,b);
end;
procedure DFS(u,p:longint);
var  j,v:longint;
begin
 j:=head[u];
 while j<>0 do
  begin
   v:=ke[j];
   if v<>p then
    begin
     d[v]:=d[u]+1;
     DFS(v,u);
    end;
   j:=next[j];
  end;
end;
procedure DFSS(u,p:longint);
var j,v:longint;
begin
 j:=head[u];
 while j<>0 do
  begin
   v:=ke[j];
   if v<>p then
    begin
    // if free[v]=0 then g[u]:=max(g[u],d[v]-d[u]);
     DFSS(v,u);
     if free[v]=0 then g[u]:=max(g[u],g[v]+1);
    end;
   j:=next[j];
  end;
end;
procedure DS(u,p:longint);
var j,v:longint;
begin
 j:=head[u];
 while j<>0 do
  begin
   v:=ke[j];
   if v<>p then
    begin
     if free[v]=1 then gg[v]:=max(Gg[u],d[v]+g[v]);
     DS(v,u);
    end;
   j:=next[j];
  end;
end;
procedure xuli;
var  i,u,v,tmp,j:longint;
begin
 DFS(a,-1);
 d1:=d;
 for i:=1 to n do d[i]:=0;
 DFS(b,-1);
 for u:=1 to n do
  begin
   j:=head[u];
   while j<>0 do
    begin
     v:=ke[j];
     if ((d1[u]+d[v]+1=d1[b])) then
      begin
       free[u]:=1; free[v]:=1;
      end;
     j:=next[j];
    end;
  end;
 DFSS(b,-1);
 DS(b,-1);
 g1:=g; gg1:=gg;    d1:=d;
 for i:=1 to n do
  begin
   g[i]:=0; gg[i]:=0;  d[i]:=0;
  end;
 DFS(a,-1);
 DFSS(a,-1);
 DS(a,-1);
 for u:=1 to n do
  begin
   j:=head[u];
   while j<>0 do
    begin
     V:=ke[j];
     if ((d[u]+d1[v]+1=d[b])) then
      begin
       tmp:=min(max(gg[u],g[a]),max(Gg1[v],g1[b]));
       res:=max(REs,tmp+1);
      end;
     j:=next[j];
    end;
  end;
 write(Res);
end;
begin
 assign(input,'wedding.inp');reset(input);
 assign(output,'wedding.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
