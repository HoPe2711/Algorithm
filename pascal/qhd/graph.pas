const oo=1000000000;
VAR n,m,x,y,f,r,dem:longint;
    ke,next,head,queu,tt,tp,d,d1,tp1:array[-50000..50000] of longint;
procedure add(i,u,v:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 ke[-i]:=u;
 next[-i]:=head[v];
 head[v]:=-i;
end;
PROCEDURE NHAP;
VAR i,u,v:longint;
BEGIN
 read(n,m,x,y);
 for i:=1 to m do
   begin
    read(u,v);
    add(i,u,v);
   end;
END;
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
procedure bfs(x:longint);
var u,j,v,i:longint;
begin
 f:=1; r:=0;
 push(x);
 for i:=1 to n do d[i]:=oo;
 d[x]:=0;
 while f<=r do
  begin
   u:=pop;
   j:=head[u];
   while j<>0 do
    begin
     v:=ke[j];
     if d[v]>d[u]+1 then
      begin
       d[v]:=d[u]+1;
       tp[v]:=tp[u];
       push(v);
      end
     else if d[v]=d[u]+1 then tp[v]:=tp[v]+tp[u];
     j:=next[j];
    end;
  end;
end;
procedure bfs1(x:longint);
var u,j,v,i:longint;
begin
 f:=1; r:=0;
 push(x);
 for i:=1 to n do d1[i]:=oo;
 d1[x]:=0;
 while f<=r do
  begin
   u:=pop;
   j:=head[u];
   while j<>0 do
    begin
     v:=ke[j];
     if d1[v]>d1[u]+1 then
      begin
       d1[v]:=d1[u]+1;
       tp1[v]:=tp1[u];
       push(v);
      end
     else if d1[v]=d1[u]+1 then tp1[v]:=tp1[v]+tp1[u];
     j:=next[j];
    end;
  end;
end;
procedure xuli;
var i:longint;
begin
 tp[x]:=1;
 bfs(x);
 tp1[y]:=1;
 bfs1(y);
 for i:=1 to n do
  if (d[i]+d1[i]=d[y]) and (tp[i]*tp1[i]=tp[y]) then
   begin
    inc(dem);
    tt[dem]:=i;
   end;
 writeln(dem);
 for i:=1 to dem do write(tt[i],' ');
end;
begin
 assign(input,'graph.inp'); reset(input);
 assign(output,'graph.out'); rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
