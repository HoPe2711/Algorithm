uses math;
var res:int64;
    ke,next,head,sl:array[-100000..100000] of longint;
    n,m,k,dem,kq:longint;
    tt,t,free:array[0..1000] of boolean;
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
var i,u,v,x:longint;
begin
 read(n,m,k);
 for i:=1 to k do
  begin
   read(x);
   tt[x]:=true;
  end;
 for i:=1 to m do
  begin
   read(u,v);
   add(i,u,v);
  end;
end;
procedure DFS(u:longint);
var j,v:longint;
begin
 free[u]:=true;
 j:=head[u];
 while j<>0 do
  begin
   v:=ke[j];
   if free[v]=false then
    begin
     inc(sl[dem]);
     if tt[v] then t[dem]:=true;
     DFS(v);
    end;
   j:=next[j];
  end;
end;
procedure xuli;
var  i:longint;
begin
 for i:=1 to n do
  if free[i]=false then
   begin
    inc(dem);
    sl[dem]:=1;
    if tt[i] then t[dem]:=true;
    dfs(i);
   end;
 for i:=1 to dem do
  if t[i] then
  begin
   res:=res+(sl[i]*(sl[i]-1) div 2) ;
   if kq<sl[i] then kq:=sl[i];
  end;
 for i:=1 to dem do
  if t[i]=false then
   begin
    res:=res+sl[i]*kq+(sl[i]*(sl[i]-1) div 2);
    kq:=kq+sl[i];
   end;
 write(res-m);
end;
begin
// assign(input,'c745.inp');reset(input);
 //assign(output,'c745.out');rewrite(output);
 nhap;
 xuli;
 //close(input); close(output);
end.