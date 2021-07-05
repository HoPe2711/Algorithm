var n,m,res:longint;
    ke,next,head:array[-200000..200000] of longint;
    free:array[0..2000] of boolean;
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
procedure DFS(u:longint);
var v,j:longint;
begin
 j:=head[u];
 free[u]:=true;
 while j<>0 do
  begin
   v:=ke[j];
   if free[v]=false then DFs(v);
   j:=next[j];
  end;
end;
procedure xuli;
var i:longint;
begin
 for i:=1 to n do
  if free[i]=false then
   begin
    inc(res);
    DFS(i);
   end;
 write(m-n+res);
end;
begin
 nhap;
 xuli;
end.