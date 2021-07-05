var n,m,nheap:longint;
    d:array[0..5000,1..2] of longint;
    heap,pos:array[0..10000] of longint;
    ke,next,ts,head:array[-100000..100000] of longint;
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
 read(n,m);
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
 if (i=1) or (d[heap[i],1]>d[heap[i div 2],1]) or ((d[heap[i],1]=d[heap[i div 2],1]) and (d[heap[i],2]>=d[heap[i div 2],2])) then exit;
 doicho(heap[i],heap[i div 2]);
 doicho(pos[heap[i]],pos[heap[i div 2]]);
 upheap(i div 2);
end;
procedure downheap(i:longint);
var j:longint;
begin
 j:=2*i;
 if j>nheap then exit;
 if (j<nheap) and ((d[heap[j],1]>d[heap[j+1],1]) or ((d[heap[j],1]=d[heap[j+1],1]) and (d[heap[j],2]>=d[heap[j+1],2])))  then inc(j);
 if (d[heap[i],1]>d[heap[j],1]) or ((d[heap[i],1]=d[heap[j],1]) and (d[heap[i],2]>=d[heap[j],2])) then
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
 pos[heap[nheap]]:=1;
 dec(nheap);
 downheap(1);
end;
procedure khoitao;
var i:longint;
begin
 for i:=1 to n do
  begin
   d[i,1]:=10000000;
   d[i,2]:=10000000;
  end;
 d[1,1]:=0;
end;
procedure xuli;
var j,u,v:longint;
begin
 nheap:=0;
 push(1);
 repeat
  u:=pop;
  j:=head[u];
  while j<>0 do
   begin
    v:=ke[j];
    if d[v,1]>d[u,1]+ts[j] then
     begin
      d[v,2]:=d[v,1];
      d[v,1]:=d[u,1]+ts[j];
      if pos[v]=0 then push(v)
      else upheap(pos[v]);
     end ;
    if (d[v,1]=d[u,1]+ts[j]) and (d[v,2]>d[u,2]+ts[j]) then
        begin
         d[v,2]:=d[u,2]+ts[j];
         if pos[v]=0 then push(v)
         else upheap(pos[v]);
        end;
    if (d[v,1]<d[u,1]+ts[j]) and (d[v,2]>d[u,1]+ts[j]) then
      begin
       d[v,2]:=d[u,1]+ts[j];
       if pos[v]=0 then push(v)
       else upheap(pos[v]);
      end;
    pos[u]:=0;
    j:=next[j];
   end;
 until nheap=0;
 write(d[n,2]);
end;
begin
 assign(input,'roadblocks.inp');reset(input);
 assign(output,'roadblocks.out');rewrite(output);
 nhap;
 khoitao;
 xuli;
 close(input);
 close(output);
end.
