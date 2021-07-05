uses math;
const oo=high(int64) div 2;
var n,dem:longint;
    res:int64;
    d,tt,tt1:array[0..200001] of int64;
    free:array[0..200001] of boolean;
    ke,next,head,child,a,tp:array[-200000..200000] of longint;
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
 for i:=1 to n do read(a[i]);
 for i:=1 to n-1 do
  begin
   read(u,v);
   add(i,u,v);
  end;
end;
procedure DFS(u:longint);
var j,v:longint;
begin
 inc(dem);
 free[u]:=true;
 tp[dem]:=u;
 d[u]:=a[u];
 child[u]:=1;
 j:=head[u];
 while j<>0 do
  begin
   v:=ke[j];
   if free[v]=false then
    begin
     dfs(v);
     child[u]:=child[u]+child[v];
     d[u]:=d[u]+d[v];
    end;
   j:=next[j];
  end;
end;
procedure xuli;
var i,u:longint;  pp:int64;
begin
 //d[1]:=a[1];
 DFS(1);
 {tt[0]:=-oo;
 for i:=1 to n do tt[i]:=max(tt[i-1],d[tp[i]]);  }
 tt1[n+1]:=-oo;
 for i:=n downto 1 do tt1[i]:=max(tt1[i+1],d[tp[i]]);
 res:=-oo;
 for i:=1 to n do
  begin
   u:=tp[i];
   pp:=tt1[i+child[u]];
   if pp<>-oo then
   res:=max(res,pp+d[u]);
  end;
 if res=-oo then
  begin
   writeln('Impossible');
   exit;
  end;
 write(res);
end;
begin
 //assign(input,'d743.inp');reset(input);
// assign(output,'d743.out');rewrite(output);
 nhap;
 xuli;
 //close(input); close(output);
end.
