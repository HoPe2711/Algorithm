uses math;
const oo=1000000000;
var ke,next,head,ts,child,cha:array[-100000..100000] of longint;
    f:array[0..10000,0..20] of longint;
    n,k,root,res:longint;
procedure add(i,u,v,c:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 ts[i]:=c;
 ke[-i]:=u;
 next[-i]:=head[v];
 head[v]:=-i;
 ts[-i]:=c;
end;
procedure nhap;
var i,u,v,c:longint;
begin
 read(n,k);
 for i:=1 to n-1 do
  begin
   read(u,v,c);
   add(i,u,v,c);
  end;
end;
procedure DFS(u:longint);
var j,v,p,t,l:longint;
begin
 j:=head[u];
 for l:=1 to k do f[u,l]:=oo;
 F[U,0]:=0;
 while j<>0 do
  begin
   v:=ke[j];
   if v<>cha[u] then
    begin
     DFS(v);
     for p:=min(child[u]-1,k) downto 1 do
     begin
      f[u,p]:=f[u,p]+f[v,0]+ts[j];
      for t:=1 to min(p,child[v]-1) do f[u,p]:=min(f[v,t]+f[u,p-t]+ts[j],f[u,p]) ;
      if p>= child[v] then f[u,p]:=min(f[u,p],f[u,p-child[v]]);
     end;
     f[u,0]:=f[u,0]+f[v,0]+ts[j];
     if child[u]<=k then f[u,child[u]]:=0;
    end;
   j:=next[j];
  end;
end;
procedure build(u:longint) ;
var j,v:longint;
begin
 j:=head[u];
 child[u]:=1;
 while j<>0 do
  begin
   v:=ke[j];
   if v<> cha[u] then
    begin
     cha[v]:=u;
     build(v);
     child[u]:=child[u]+child[v];
    end;
   j:=next[j];
  end;
end;
procedure xuli;
var i,j:longint;
begin
 root:=0;
 build(root);
 DFS(root);
 res:=oo;
 for i:=0 to n-1 do
 if k-(n-child[i])>=0 then res:=min(Res,f[i,k-(n-child[i])]);
 write(res*2);
end;
begin
 assign(input,'quadrant.inp');reset(input);
 assign(output,'quadrant.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
