uses math;
var  ke,next,ke1,next1,free:array[-100001..100001] of longint;
     num,low,check,head,head1,tt:array[0..100001] of longint;
     n,m,dem,qq:longint;
     res:int64;
procedure add(i,u,v:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 ke[-i]:=u;
 next[-i]:=head[v];
 head[v]:=-i;
end;
procedure add1(i,u,v:longint);
begin
 ke1[i]:=v;
 next1[i]:=head1[u];
 head1[u]:=i;
 ke1[-i]:=u;
 next1[-i]:=head1[v];
 head1[v]:=-i;
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
procedure DFS(u,p,edge:longint);
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
     DFS(v,u,j);
     low[u]:=min(low[u],low[v]);
    end
   else low[u]:=min(low[u],num[v]);
   j:=next[j];
  end;
 if (num[u]=low[u]) and (p<>-1) then
  begin
   free[edge]:=1;
   free[-edge]:=1;
  end;
end;
procedure DFS1(u:longint);
var j,v:longint;
begin
 j:=head1[u];
 while j<>0 do
  begin
   v:=ke1[j];
   if check[v]=0 then
    begin
     inc(qq);
     check[v]:=1;
     DFS1(v);
    end;
   j:=next1[j];
  end;
end;
procedure xuli;
var i,canh:longint;
begin
 canh:=0;
 for i:=1 to n do
  if num[i]=0 then
   begin
    dem:=0;
    DFS(i,-1,0);
   end;
 for i:=1 to m do
  if free[i]=1 then
   begin
    inc(canh);
    tt[ke[i]]:=1;
    tt[ke[-i]]:=1;
    add1(canh, ke[i],ke[-i]);
   end;
 for i:=1 to n do
  if (check[i]=0) and (tt[i]=1) then
   begin
    qq:=1;
    check[i]:=1;
    DFS1(i);
    res:=res+int64((qq-1))*(qq-2) div 2;
   end;
 write(res);
end;
begin
 assign(input,'addedge.inp');reset(input);
 assign(output,'addedge.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
