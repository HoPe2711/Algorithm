uses math;
const oo=100000000;
var ke,next,head,c,t:array[-10000..10000] of longint;
    HEAP,tt:array[0..25000000] of longint;
    d,pos:array[0..5000,0..5000] of longint;
    nheap,x,y,n,k,res:longint;
procedure add(i,u,v:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 ke[-i]:=u;
 next[-i]:=head[v];
 head[v]:=-i;
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
 if (d[heap[i],tt[i]]>d[heap[j],tt[j]]) then
  begin
   doicho(heap[i],heap[j]);
   doicho(tt[i],tt[j]);
   doicho(pos[heap[i],tt[i]],pos[heap[j],tt[j]]);
   downheap(j);
  end;
end;
procedure push(x,i:longint);
begin
 inc(nheap);
 heap[nheap]:=x;
 tt[nheap]:=i;
 pos[x,i]:=nheap;
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
procedure nhap;
var i,u,v:longint;
begin
 read(n,k);
 for i:=1 to n do read(c[i],t[i]);
 for i:=1 to k do
  begin
   read(u,v);
   add(i,u,v);
  end;
end;
procedure xuli;
var i,j,v:longint;
begin
 nheap:=0;
 for i:=1 to n do
  for j:=0 to n do d[i,j]:=oo;
 push(1,t[1]);
 d[1,t[1]]:=c[1];
 repeat
  pop;
  if x=n then
   begin
    res:=d[x,y];
    break;
   end;
  if y=0 then continue;
  j:=head[x];
  while j<>0 do
   begin
    v:=ke[j];
    if d[v,y-1]>d[x,y] then
     begin
      d[v,y-1]:=d[x,y];
      if pos[v,y-1]=0 then push(v,y-1)
      else upheap(pos[v,y-1]);
     end;
    if d[v,t[v]]>d[x,y]+c[v] then
     begin
      d[v,t[v]]:=d[x,y]+c[v];
      if pos[v,t[v]]=0 then push(v,t[v])
      else upheap(pos[v,t[v]]);
     end;
    j:=next[j];
   end;
 until nheap=0;
 write(res);
end;
begin
 assign(input,'icbus.inp');reset(input);
 assign(output,'icbus.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.