var s,res,n,m,s1:longint;
    ke,next,head,ts:array[-100000..100000] of longint;
    trace,cha,trace1:array[0..2000] of longint;
    free:array[0..2000] of boolean;
procedure add(i,u,v,c:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 ke[-i]:=u;
 next[-i]:=head[v];
 head[v]:=-i;
 ts[i]:=c;
 ts[-i]:=c;
end;
procedure dfs(u:longint);
var j,v:longint;
begin
 j:=head[u];
 while j<>0 do
  begin
   v:=ke[j];
   if v<>cha[u] then
    if ts[j]<=s1 then
     begin
      inc(res);
      dfs(v);
     end;
   j:=next[j];
  end;
end;
procedure khoitao(u:longint);
var j,v:longint;
begin
 j:=head[u];
 free[u]:=true;
 while j<>0 do
  begin
   v:=ke[j];
   if free[v]=false then
    begin
     cha[v]:=u;
     khoitao(v);
    end;
   j:=next[j];
  end;
end;
procedure td(u:longint);
var j,v:longint;
begin
 free[u]:=true;
 j:=head[u];
 while j<>0 do
  begin
   v:=ke[j];
   if free[v]=false then
    begin
     td(v);
     trace[v]:=u;
     trace1[v]:=ts[j];
    end;
   j:=next[j];
  end;
end;
procedure truyvet(u:longint);
begin
 if u=s then exit;
 if trace1[u]<=s1 then inc(res);
 truyvet(trace[u]);
end;
procedure nhap;
var i,u,v,c:longint;
    x:char;
begin
 readln(n,m);
 for i:=1 to n-1 do
  begin
   readln(u,v,c);
   add(i,u,v,c);
  end;
 khoitao(1);
 for i:=1 to m do
  begin
   read(x);
   if x='T' then
    begin
     read(u,s1);
     res:=0;
     dfs(u);
     writeln(res);
    end
   else
    begin
     read(s,v,s1);
     fillchar(free,sizeof(free),false);
     fillchar(trace,sizeof(trace),0);
     res:=0;
     td(s);
     truyvet(v);
     writeln(res);
    end;
   readln;
  end;
end;
begin
 assign(input,'tree.inp');reset(input);
 assign(output,'tree.out');rewrite(output);
 nhap;
 close(input); close(output);
end.
