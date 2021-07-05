uses math;
const oo=1000000000;
var n,m,res,kq,nheap:longint;
    ke,next,head,heap:array[-25000..25000] of longint;
    trace,pos,d:array[-25000..25000] of longint;
    dd:Array[0..250,0..250] of longint;
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
var i,u,v,c,j:longint;
begin
 read(n,m);
 for i:=1 to n do
  for j:=1 to n do
   if i<>j then dd[i,j]:=oo;
 for i:=1 to m do
  begin
   read(u,v,c);
   add(i,u,v);
   dd[u,v]:=c;
   dd[v,u]:=c;
  end;
end;
procedure doicho(var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
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
 for i:=1 to n do d[i]:=oo;
 d[1]:=0;
end;
procedure xuli;
var u,j,v:longint;
begin
 nheap:=0;
 push(1);
 repeat
  u:=pop;
  j:=head[u];
  while j<>0 do
   begin
    v:=ke[j];
    if (d[v]>d[u]+dd[u,v]) then
     begin
      d[v]:=d[u]+dd[u,v];
      trace[v]:=u;
      if pos[v]=0 then push(v)
      else upheap(pos[v]);
     end;
    j:=next[j];
   end;
 until nheap=0;
 kq:=d[n];
end;
procedure xuli1;
var u,j,v:longint;
begin
 fillchar(pos,sizeof(pos),0);
 nheap:=0;
 push(1);
 repeat
  u:=pop;
  j:=head[u];
  while j<>0 do
   begin
    v:=ke[j];
    if (d[v]>d[u]+dd[u,v]) then
     begin
      d[v]:=d[u]+dd[u,v];
      if pos[v]=0 then push(v)
      else upheap(pos[v]);
     end;
    j:=next[j];
   end;
 until nheap=0;
end;
procedure duyet(u,v:longint);
var tg:longint;
begin
 tg:=dd[u,v];
 dd[u,v]:=dd[u,v]*2;
 dd[v,u]:=dd[u,v];
 khoitao;
 xuli1;
 dd[u,v]:=tg;
 dd[v,u]:=tg;
 res:=max(res,d[n]-kq);
end;
procedure truyvet;
var s:longint;
begin
 s:=n;
 while s<>1 do
  begin
   duyet(s,trace[s]);
   s:=trace[s];
  end;
 write(res);
end;
begin
 assign(input,'incpath.inp');reset(input);
 assign(output,'incpath.out');rewrite(output);
 nhap;
 khoitao;
 xuli;
 truyvet;
 close(input);close(output);
end.

