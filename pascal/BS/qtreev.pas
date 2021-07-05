var
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
var
begin
 read(n,m);
 for i:=1 to n do read(a[i]);
 for i:=1 to n-1 do
  begin
   read(u,v);
   add(i,u,v);
  end;
end;
procedure DFS(u,p:longint);
var
begin
 j:=head[u];
 while j<>0 do
  begin
   v:=ke[j];
   if v<>p then
    begin
     DFS(v,u);

    end;
   j:=next[j];
  end;
end;
procedure xuli;
var
begin
 DFS(1,-1);
end;
begin
 assign(input,'qtreev.inp');reset(input);
 assign(output,'qtreev.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.