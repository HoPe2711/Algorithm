var head,next,ke:array[-200000..200000] of longint;
    free:array[0..20000] of boolean;
    d,da,db,queu:array[0..20000] of longint;
    res,n,m,a,b,r,f:longint;
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
   free[u]:=false;
   j:=head[u];
   while j<>0 do
    begin
     v:=ke[j];
     if free[v] then
      begin
       d[v]:=d[u]+1;
       push(v);
       free[v]:=false;
      end;
     j:=next[j];
    end;
  end;
end;
procedure xuli;
var i,j:longint;
begin
 for j:=1 to 2 do
  begin
   res:=0;
   fillchar(d,sizeof(d),0);
   read(a,b);
   r:=0;
   f:=1;
   fillchar(free,sizeof(free),true);
   BFS(a);
   for i:=1 to n do da[i]:=d[i];
   fillchar(d,sizeof(d),0);
   fillchar(free,sizeof(free),true);
   f:=1;
   r:=0;
   BFS(b);
   for i:=1 to n do db[i]:=d[i];
   for i:=1 to n do
    if da[i]+db[i]<>da[b] then inc(res);
   write(res,' ');
  end;
end;
begin
 assign(input,'RINGS.inp');reset(input);
 assign(output,'RINGS.out');rewrite(output);
 nhap;
 xuli;
 close(input);
 close(output);
end.
