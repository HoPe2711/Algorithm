uses math;
const oo=1000000000;
var ke,next,head,ts,t1,heap,pos,pack,trace:Array[-200000..200000] of longint;
    n,m,s,t,kq,nheap:longint;
    free:array[0..200000] of boolean;
    d:array[0..200000] of int64;
procedure add(i,u,v,h,d:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 ts[i]:=d;
 t1[i]:=h;
 ke[-i]:=u;
 next[-i]:=head[v];
 head[v]:=-i;
 ts[-i]:=d;
 t1[-i]:=h;
end;
procedure nhap;
var i,u,v,h,d:longint;
begin
 read(n,m,s,t);
 for i:=1 to m do
  begin
   read(u,v,h,d);
   add(i,u,v,h,d);
  end;
end;
procedure dfs(u,l:longint);
var j,v:longint;
begin
 j:=head[u];
 while j<>0 do
  begin
   v:=ke[j];
   if free[v]=false then
   if t1[j]>=l then
    begin
     free[v]:=true;
     dfs(v,l);
    end;
   j:=next[j];
  end;
end;
procedure khoitao;
var i:longint;
begin
 d[s]:=0;
 for i:=1 to n do
  if i<>s then d[i]:=high(int64);
end;
function check(x:longint):boolean;
begin
 fillchar(free,sizeof(free),false);
 free[s]:=true;
 DFS(s,x);
 if free[t]=true then exit(true)
 else exit(false);
end;
procedure doicho(var x,y:longint);
var tmp:longint;
begin
 tmp := x;
 x := y;
 y := tmp;
end;
procedure upheap(i:longint);
begin
 if (i=1) or (d[heap[i]]>=d[heap[i div 2]]) then exit;
 doicho(heap[i],heap[i div 2]);
 doicho(pos[heap[i]],pos[heap[i div 2]]);
 upheap(i div 2);
end;
procedure downheap(i:longint);
var j:longint;
begin
 j:=2*i;
 if j>nheap then exit;
 if (j<nheap) and (d[heap[j]]>d[heap[j+1]]) then inc(j);
 if d[heap[i]]>=d[heap[j]] then
  begin
   doicho(heap[i],heap[j]);
   doicho(pos[heap[i]],pos[heap[j]]);
   downheap(j);
  end;
end;
procedure push(x:longint);
begin
 inc(nheap);
 heap[nheap]:=x;
 pos[x]:=nheap;
 upheap(nheap);
end;
function pop:longint;
begin
 pop:=heap[1];
 heap[1]:=heap[nheap];
 pos[heap[1]]:=1;
 dec(nheap);
 downheap(1);
end;
procedure truyvet(u:longint);
begin
 inc(kq);
 pack[kq]:=u;
 if u=s then exit;
 truyvet(trace[u]);
end;
procedure xuli;
var l,r,mid,res,u,j,v,i:longint;
begin
 l:=0;
 r:=oo;
 while l<=r do
  begin
   mid:=(l+r) div 2;
   if check(mid) then
    begin
     res:=mid;
     l:=mid+1;
    end
   else r:=mid-1;
  end;
 khoitao;
 nheap:=0;
 push(s);
 repeat
  u:=pop;
  j:=head[u];
  while j<>0 do
   begin
    v:=ke[j];
    if t1[j]>=res then
    if (d[v]>d[u]+ts[j]) then
     begin
      d[v]:=d[u]+ts[j];
      trace[v]:=u;
      if pos[v]=0 then push(v)
      else upheap(pos[v]);
     end;
    j:=next[j];
   end;
 until nheap=0;
 truyvet(t);
 writeln(kq);
 for i:=kq downto 1 do write(pack[i],' ');
end;
begin
 assign(input,'tunnel.inp');reset(input);
 assign(output,'tunnel.out');rewrite(output);
 nhap;
 xuli;
 close(input);
 close(output);
end.
