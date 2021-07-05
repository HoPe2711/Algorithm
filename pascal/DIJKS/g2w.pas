uses math;
const oo=high(longint) div 2;
var ke,next,head,ts,d,pos,heap:array[0..200000] of longint;
    free,free1:array[0..100000] of boolean;
    n,m,p,q,nheap:longint;
procedure add(i,u,v,c:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 ts[i]:=c;
end;
procedure nhap;
var i,u,v,c,x:longint;
begin
 read(n,m,p,q);
 for i:=1 to p do
  begin
   read(x);
   free[x]:=true;
  end;
 for i:=1 to q do
  begin
   read(x);
   free1[x]:=true;
  end;
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
 if (i=1) or (d[heap[i]]>d[heap[i div 2]]) then exit;
 doicho(heap[i],heap[i div 2]);
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
procedure push(i:longint);
begin
 inc(nheap);
 heap[nheap]:=i;
 pos[i]:=nheap;
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
procedure khoitao(s:longint);
var i:longint;
begin
 for i:=1 to n do d[i]:=oo;
 d[s]:=0;
end;
procedure xuli;
var u,v,j:longint;
begin
 fillchar(pos,sizeof(pos),0);
 nheap:=0;
 khoitao(1);
 push(1);
 repeat
  u:=pop;
  j:=head[u];
  while j<>0 do
   begin
    v:=ke[j];
    if free[v]=false then
     if d[v]>d[u]+ts[j] then
      begin
       d[v]:=d[u]+ts[j];
       if pos[v]=0 then push(v)
       else upheap(pos[v]);
      end;
    j:=next[j];
   end;
 until nheap=0;
 write(d[n],' ');
end;
procedure xuli1;
var u,v,j:longint;
begin
 fillchar(pos,sizeof(pos),0);
 nheap:=0;
 khoitao(n);
 push(n);
 repeat
  u:=pop;
  j:=head[u];
  while j<>0 do
   begin
    v:=ke[j];
    if free1[v]=false then
     if d[v]>d[u]+ts[j] then
      begin
       d[v]:=d[u]+ts[j];
       if pos[v]=0 then push(v)
       else upheap(pos[v]);
      end;
    j:=next[j];
   end;
 until nheap=0;
 write(d[1]);
end;
begin
 assign(input,'g2w.inp');reset(input);
 assign(output,'g2w.out');rewrite(output);
 nhap;
 xuli;
 xuli1;
 close(input); close(output);
end.
