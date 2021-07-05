uses math;
var ke,next,head,child,c,t,cha,nguoc,next1:array[-10000..10000] of longint;
    n,p,res:longint;
    f,trc:array[0..10000,0..10000] of longint;
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
var i,u,v,j:longint;
begin
 read(n,p);
 for i:=1 to n do read(c[i]);
 for i:=1 to n-1 do
  begin
   read(u,v);
   add(i,u,v);
  end;
 for i:=1 to n do
  begin
   j:=head[i];
   while j<>0 do
    begin
     nguoc[i]:=j;
     next1[next[j]]:=j;
     j:=next[j];
    end;
  end;
end;
procedure DFS(u,x:longint);
var j,v,ju,jv:longint;
begin
 j:=head[u];
 child[u]:=1;
 while j<>0 do
  begin
   v:=ke[j];
   if (v<>x) then
    begin
     cha[v]:=u;
     DFS(v,u);
     for ju:=child[u] downto 1 do
      for jv:=1 to child[v] do
       if f[u,ju+jv]<f[u,ju]+f[v,jv] then
        begin
         f[u,ju+jv]:=f[u,ju]+f[v,jv];
         trc[v,ju+jv]:=jv;
        end;
     child[u]:=child[u]+child[v];
    end;
   j:=next[j];
  end;
end;
procedure truyvet(u,i:longint);
var j,v:longint;
begin
 write(u,' ');
 j:=nguoc[u];
 while j<>0 do
  begin
   v:=ke[j];
   if cha[u]<>v then
    if trc[v,i]>0 then
     begin
      truyvet(v,trc[v,i]);
      dec(i,trc[v,i]);
     end;
    j:=next1[j];
  end;
end;
procedure xuli;
var i,j,kq:longint;
begin
 res:=-maxlongint;
 for i:=1 to n do
  for j:=1 to p do f[i,j]:=-maxlongint;
 for i:=1 to n do f[i,1]:=c[i];
 DFS(1,-1);
 for i:=1 to n do
  if f[i,p]>=res then
   begin
    res:=f[i,p];
    kq:=i;
   end;
 truyvet(kq,p);
end;
begin
 assign(input,'ptree.inp');reset(input);
 assign(output,'ptree.out');rewrite(output);
 nhap;
 xuli;
 close(input);close(output);
end.
