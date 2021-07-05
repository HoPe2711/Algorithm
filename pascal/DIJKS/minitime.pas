uses math;
const oo=high(int64) div 2;
var ke,next,head,heap,ts,p,pos:array[-100000..100000] of longint;
    free:array[0..100000] of boolean;
    d:array[0..100000] of int64;
    n,k,l,nheap:longint;
    res:int64;
procedure add(i,u,v,c:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 ke[-i]:=u;
 next[-i]:=head[v];
 head[v]:=-i;
 ts[i]:=c; ts[-i]:=c;
end;
procedure nhap;
var i,u,v,c:longint;
begin
 read(n,k,l);
 for i:=1 to n do
  begin
   read(p[i]);
   free[p[i]]:=true;
  end;
 for i:=1 to l do
  begin
   read(u,v,c);
   add(i,u,v,c);
  end;
end;
procedure khoitao(s:longint);
var i:longint;
begin
 for i:=1 to k do d[i]:=oo;
 d[s]:=0;
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
 if (i=1) or (d[heap[i]]>d[heap[i div 2]]) then exit;
 doicho(heap[i],heap[i div 2]);
 //doicho(pos[heap[i]],pos[heap[i div 2]]);
 upheap(i div 2);
end;
procedure downheap(i:longint);
var j:longint;
begin
 j:=2*i;
 if j>nheap then exit;
 if (j<nheap) and (d[heap[j]]>d[heap[j+1]]) then inc(j);
 if d[heap[i]]>d[heap[j]] then
  begin
   doicho(heap[i],heap[j]);
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
procedure dijks(s:longint);
var u,j,v:longint;
begin
 nheap:=0;
 push(s);
 repeat
  u:=pop;
  if d[u]>res then exit;
  if (free[u]=true) and (u<>s) then
   begin
    res:=min(res,d[u]);
    exit;
   end;
  j:=head[u];
  while j<>0 do
   begin
    v:=ke[j];
    if d[v]>d[u]+ts[j] then
     begin
      d[v]:=d[u]+ts[j];
      if pos[v]=0 then push(v)
      else upheap(pos[v]);
     end;
    j:=next[j];
   end;
 until nheap=0;
end;
procedure xuli;
var i:longint;
begin
 res:=oo;
 for i:=1 to n do
  begin
   khoitao(p[i]);
   dijks(p[i]);
  end;
 write(res*3);
end;
begin
 assign(input,'mintime.inp');reset(input);
 assign(output,'mintime.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
