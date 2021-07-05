var n,m,s,t,nheap:longint;
    ke,next,head,ts:array[-500000..500000] of longint;
    pos,heap:array[0..500000] of longint;
    d:array[0..500000] of int64;
    free:array[0..500000] of boolean;
procedure add(i,u,v,c:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 ts[i]:=c;
 ke[-i]:=u;
 next[-i]:=head[v];
 head[v]:=-i;
 ts[-i]:=c;
end;
procedure doicho(var x,y:longint);
var tmp:longint;
begin
 tmp := x;
 x := y;
 y := tmp;
end;
procedure nhap;
var i,u,v,c:longint;
begin
 fillchar(free,sizeof(free),true);
 read(n,m,s,t);
 for i:=1 to m do
  begin
   read(u,v,c);
   add(i,u,v,c);
  end;
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
 dec(nheap);
 downheap(1);
end;
procedure khoitao;
var i:longint;
begin
 d[s]:=0;
 for i:=1 to n do
  if i<>s then d[i]:=high(int64);
end;
procedure xuli;
var u,j,v:longint;
begin
 nheap:=0;
 push(s);
 repeat
  u:=pop;
  free[u]:=false;
  if u=t then break;
  j:=head[u];
  while j<>0 do
   begin
    v:=ke[j];
    if free[v] and (d[v]>d[u]+ts[j]) then
     begin
      d[v]:=d[u]+ts[j];
      if pos[v]=0 then push(v)
      else upheap(pos[v]);
     end;
    j:=next[j];
   end;
 until nheap=0;
 write(d[t]);
end;
BEGIN
  assign(input,'dijkstra.inp');reset(input);
  assign(output,'dijkstra.out');rewrite(output);
  nhap;
  khoitao;
  xuli;
  close(input);close(output);
END.

