uses math;
var n,m,res,k,f,r:longint;
    ke,next:array[-50000..50000] of longint;
    head,a,dd,d,queu:array[0..50000] of longint;
    free:array[0..50000] of boolean;
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
 read(k);
 for i:=1 to k do
  begin
   read(a[i]);
   dd[a[i]]:=1;
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
 f:=1; r:=0;
 push(s);
 while f<=r do
  begin
   u:=pop;
   j:=head[u];
   free[u]:=false;
   while j<>0 do
    begin
     v:=ke[j];
     if free[v] then
      begin
       free[v]:=false;
       d[v]:=d[u]+1;
       push(v);
      end;
     j:=next[j];
    end;
  end;
end;
procedure xuli;
var i,j:longint;
    ok:boolean;
begin
  res:=maxlongint;
  for i:=1 to n do
   if dd[i]=0 then
   begin
    ok:=true;
    fillchar(d,sizeof(d),0);
    fillchar(free,sizeof(free),true);
    bfs(i);
    for j:=1 to k-1 do
     if d[a[j]]<>d[a[j+1]] then
      begin
       ok:=false;
       break;
      end;
    if ok=true then res:=min(res,d[a[1]]);
   end;
  if res=maxlongint then write('NO')
  else write(res);
end;
begin
 assign(input,'worms.inp');reset(input);
 assign(output,'worms.out');rewrite(output);
 nhap;
 xuli;
 close(input);
 close(output);
end.
