uses math;
const oo=high(int64);
var n,m,k,x,y,nheap:longint;   res:int64;
    ke,next,head,ts,heap,heap1:array[-2000000..2000000] of longint;
    pos:array[0..100000,0..20] of longint;
    d:array[0..100000,0..20] of int64;
procedure add(i,u,v,c:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 ke[-i]:=u;
 next[-i]:=head[v];
 head[v]:=-i;
 ts[i]:=c;
 ts[-i]:=c;
end;
procedure nhap;
var  i,u,v,c:longint;
begin
 read(n,m,k);
 for i:=1 to m do
  begin
   read(u,v,c);
   add(i,u,v,c);
  end;
end;
procedure khoitao;
var  i,j:longint;
begin
 for i:=1 to n do
  for j:=0 to k do d[i,j]:=oo;
 d[1,k]:=0;
end;
procedure doicho(var x,y:longint);
var tG:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure upheap(i:longint);
begin
 if (i=1) or (d[heap[i],heap1[i]]>d[heap[i div 2],heap1[i div 2]]) then exit;
 doicho(heap[i],heap[i div 2]);
 doicho(heap1[i],heap1[i div 2]);
 doicho(pos[heap[i],heap1[i]],pos[heap[i div 2],heap1[i div 2]]);
 upheap(i div 2);
end;
procedure downheap(i:longint);
var j:longint;
begin
 j:=2*i;
 if j>nheap then exit;
 if (j<nheap) and (d[heap[j],heap1[j]]>d[heap[j+1],heap1[j+1]]) then inc(j);
 if d[heap[i],heap1[i]]>d[heap[j],heap1[j]] then
  begin
   doicho(heap[i],heap[j]);
   doicho(heap1[i],heap1[j]);
   doicho(pos[heap[i],heap1[i]],pos[heap[j],heap1[j]]);
   downheap(j);
  end;
end;
procedure push(x,y:longint);
begin
 inc(nheap);
 heap[nheap]:=x;
 heap1[nheap]:=y;
 pos[x,y]:=nheap;
 upheap(nheap);
end;
procedure pop;
begin
 x:=heap[1];
 y:=heap1[1];
 heap[1]:=heap[nheap];
 heap1[1]:=heap1[nheap];
 pos[heap[1],heap1[1]]:=1;
 dec(nheap);
 downheap(1);
end;

procedure xuli;
var j,v,i:longint;
begin
 khoitao;
 push(1,k);
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
    if y>=1 then
    if d[v,y-1]>d[x,y] then
     begin
      d[v,y-1]:=d[x,y];
      if pos[v,y-1]=0 then push(v,y-1)
      else upheap(pos[v,y-1]);
     end;
    j:=next[j];
   end;
 until nheap=0;
 res:=oo;
 for i:=0 to k do res:=min(Res,d[n,i]);
 write(res);
end;
begin
 assign(input,'revamp.inp');reset(input);
 assign(output,'revamp.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.