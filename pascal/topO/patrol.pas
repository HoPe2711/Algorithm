uses math;
var queu,head,d:Array[0..100000] of longint;
    next,ke:array[-100000..100000] of longint;
    n,res,f,r:longint;
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
 for i:=1 to n-1 do
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
   while j<>0 do
    begin
     v:=ke[j];
     if d[v]=0 then
      begin
       d[v]:=d[u]+1;
       push(v);
      end;
     j:=next[j];
    end;
  end;
end;
procedure xuli;
var i,t:longint;
begin
 t:=1;
 f:=1;
 r:=0;
 BFS(1);
 for i:=2 to n do
  if d[1]<=d[i] then
   begin
    t:=i;
    d[1]:=d[i];
   end;
 fillchar(d,sizeof(d),0);
 r:=0;
 f:=1;
 BFS(t);
 for i:=1 to n do res:=max(res,d[i]);
 write(2*(n-1)-res+1);
end;
begin
 assign(input,'PATROL.inp');reset(input);
 assign(output,'PATROL.out');rewrite(output);
 nhap;
 xuli;
 close(input);
 close(output);
end.
