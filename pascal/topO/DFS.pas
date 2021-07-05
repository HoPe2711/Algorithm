var ke,next:array[-200000..200000] of longint;
    head:array[0..100000] of longint;
    free:array[0..100000] of boolean;
    n,m,res:longint;
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
 free[u]:=false;
 j:=head[u];
 while j<>0 do
 begin
  v:=ke[j];
  if free[v] then DFS(v);
  j:=next[j];
 end;
end;
procedure xuli;
var i:longint;
begin
 fillchar(free,sizeof(free),true);
 for i:=1 to n do
  if free[i] then
   begin
    inc(res);
    DFS(i);
   end;
 write(res);
end;
begin
 assign(input,'DFS.inp');reset(input);
 assign(output,'DFS.out');rewrite(output);
 nhap;
 xuli;
 close(input);
 close(output);
end.
