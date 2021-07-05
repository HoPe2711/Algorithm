var ke,next:array[-200000..200000] of longint;
    head,queu:array[0..100000] of longint;
    free:array[0..100000] of boolean;
    n,m,res,r,f:longint;
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
 inc(r);
 queu[r]:=x;
end;
function pop:longint;
begin
 pop:=queu[f];
 inc(f);
end;
procedure BFS(s:longint);
var u,v,j:longint;
begin
 push(s);
 while f<=r do
  begin
   u:=pop;
   j:=head[u];
   free[u]:=false;
   while j<>0 do
    begin
     v:=ke[j];
     if free[v] then push(v);
     j:=next[j];
    end;
  end;
end;
procedure xuli;
var  i:longint;
begin
 fillchar(free,sizeof(free),true);
 f:=1;
 for i:=1 to n do
  if free[i] then
   begin
    inc(res);
    BFS(i);
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