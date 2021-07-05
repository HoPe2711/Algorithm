uses math;
var ke,next:array[-5000..5000] of longint;
    head,num,low,d,stack,k:array[0..5000] of longint;
    n,m,res1,res,dem,top:longint;
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
procedure push(x:longint);
begin
 inc(top);
 stack[top]:=x;
end;
procedure DFS(u,p:longint);
var v,j:longint;
begin
 d[u]:=1;
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
      d[u]:=d[u]+d[v];
     end
    else low[u]:=min(low[u],num[v]);
   j:=next[j];
  end;
 if (num[u]=low[u]) and (p<>-1) then
  begin
   inc(res1);
   k[res1]:=u;
  end;
end;
procedure xuli;
var i:longint;
begin
 DFS(1,-1);
 for i:=1 to res1 do push(d[k[i]]);
 for i:=1 to top do res:=res+stack[i]*(n-stack[i]);
 write(res);
end;
begin
 assign(input,'weather.inp');reset(input);
 assign(output,'weather.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
