uses math;
const oo=1000000000;
var ke,next,head,d,queu,d1:Array[-2000000..2000000] of longint;
    f:array[0..2000000] of longint;
    res,n,m,s,t,ff,r:longint;
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
 read(s,t);
end;
procedure push(x:longint);
begin
 inc(r);
 queu[r]:=x;
end;
function pop:longint;
begin
 pop:=queu[ff];
 inc(ff);
end;
procedure BFS(s:longint);
var u,v,j,i:longint;
begin
 for i:=1 to n do d[i]:=oo;
 d[s]:=0;
 ff:=1; r:=0;
 push(s);
 while ff<=r do
  begin
   u:=pop;
   j:=head[u];
   while j<>0 do
    begin
     v:=ke[j];
     if d[v]>d[u]+1 then
      begin
       d[v]:=d[u]+1;
       push(V);
      end;
     j:=next[j];
    end;
  end;
end;
procedure xuli;
var i:longint;
begin
 BFS(s);
 d1:=d;
 BFS(t);
 for i:=1 to n do
  if d[i]+d1[i]=d[s] then
  if d[i]<>oo then inc(f[d[i]]);
 for i:=1 to n do
  if (i<>S) and (i<>t) then
  if d[i]+d1[i]=d[s] then
  if d[i]<>oo then
   if f[d[i]]=1 then
    begin
     res:=i;
     break;
    end;
 if res=0 then res:=-1;
 write(Res);
end;
begin
 assign(input,'graphg.inp');reset(input);
 assign(output,'graphg.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
