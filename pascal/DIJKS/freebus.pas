uses math;
const oo=100000000000;
var n,m,k,s,t,nheap,x,y:longint;
    res:int64;
    ke,next,head,ts,tt,heap:array[-600000..600000] of longint;
    pos:array[0..600000,0..5] of longint;
    d:array[0..600000,0..5] of int64;
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
procedure nhap;
var i,u,v,c:longint;
begin
 read(n,m,k,s,t);
 for i:=1 to m do
  begin
   read(u,v,c);
   add(i,u,v,c);
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
 if (i=1) or (d[heap[i],tt[i]]>d[heap[i div 2],tt[i div 2]]) then exit;
 doicho(heap[i],heap[i div 2]);
 doicho(tt[i],tt[i div 2]);
 doicho(pos[heap[i],tt[i]],pos[heap[i div 2],tt[i div 2]]);
 upheap(i div 2);
end;
procedure downheap(i:longint);
var j:longint;
begin
 j:=2*i;
 if j>nheap then exit;
 if (j<nheap) and (d[heap[j],tt[j]]>d[heap[j+1],tt[j+1]]) then inc(j);
 if d[heap[i],tt[i]]>=d[heap[j],tt[j]] then
  begin
   doicho(heap[i],heap[j]);
   doicho(tt[i],tt[j]);
   doicho(pos[heap[i],tt[i]],pos[heap[j],tt[j]]);
   downheap(j);
  end;
end;
procedure push(x,y:longint);
begin
 inc(nheap);
 heap[nheap]:=x;
 tt[nheap]:=y;
 pos[x,y]:=nheap;
 upheap(nheap);
end;
procedure pop;
begin
 x:=heap[1];
 y:=tt[1];
 heap[1]:=heap[nheap];
 tt[1]:=tt[nheap];
 pos[heap[nheap],tt[nheap]]:=1;
 dec(nheap);
 downheap(1);
end;
procedure khoitao;
var i,j:longint;
begin
 for i:=1 to n do
  for j:=0 to k do d[i,j]:=oo;
 d[s,0]:=0;
end;
procedure dijkstra;
var j,v,i:longint;
begin
 khoitao;
 nheap:=0;
 push(s,0);
 repeat
  pop;
  j:=head[x];
  while j<>0 do
   begin
    v:=ke[j];
    if d[v,y]>d[x,y]+ts[j] then
     begin
      d[v,y]:=d[x,y]+ts[j];
      if pos[v,y]=0 then push(v,y)
      else upheap(pos[v,y]);
     end;
    if y<k then
     if d[v,y+1]>d[x,y] then
      begin
       d[v,y+1]:=d[x,y];
       if pos[v,y+1]=0 then push(v,y+1)
      else upheap(pos[v,y+1]);
      end;
    j:=next[j];
   end;
 until nheap=0;
 for i:=0 to k do res:=min(res,d[t,i]);
end;
procedure xuli;
begin
 res:=oo;
 dijkstra;
 write(res);
end;
begin
 assign(input,'freebus.inp');reset(input);
 assign(output,'freebus.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
