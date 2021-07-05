type
 node=record
 vt,ss:longint;
end;
var next,ke:array[-10000..10000] of longint;
    head,deg,d:array[0..10000] of longint;
    n,k,res,nheap:longint;
    heap:array[0..10000] of node;
    free:array[0..10000] of boolean;
procedure add(i,u,v:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 ke[-i]:=u;
 next[-i]:=head[v];
 head[v]:=-i;
end;
procedure doicho(var x,y:node);
var
tg:node;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure upheap(i:longint);
begin
 if (i=1) or (heap[i].ss>=heap[i div 2].ss) then exit;
 doicho(heap[i],heap[i div 2]);
 upheap(i div 2);
end;
procedure downheap(i:longint);
var j:longint;
begin
 j:=2*i;
 if j>nheap then exit;
 if (j<nheap) and (heap[j].ss>heap[j+1].ss) then inc(j);
 if heap[i].ss>heap[j].ss then
  begin
   doicho(heap[i],heap[j]);
   downheap(j);
  end;
end;
procedure push(x:longint);
begin
 inc(nheap);
 heap[nheap].vt:=x;
 heap[nheap].ss:=d[x];
 upheap(nheap);
end;
function pop:longint;
begin
 pop:=heap[1].vt;
 heap[1]:=heap[nheap];
 dec(nheap);
 downheap(1);
end;
procedure nhap;
var i,u,v:longint;
begin
 read(n,k);
 for i:=1 to n-1 do
  begin
   read(u,v);
   inc(deg[u]);
   inc(deg[v]);
   add(i,u,v);
  end;
end;
procedure xuli;
var i,j,u,v:longint;
begin
 fillchar(free,sizeof(free),true);
 for i:=1 to n do d[i]:=1;
 for i:=1 to n do if deg[i]=1 then push(i);
 for i:=1 to n-k-1 do
  begin
   u:=pop;
   inc(res,d[u]);
   free[u]:=false;
   j:=head[u];
   while j<>0 do
    begin
     v:=ke[j];
     if free[v] then
      begin
       dec(deg[v]);
       d[v]:=d[v]+d[u];
       if deg[v]=1 then push(v);
      end;
     j:=next[j] ;
    end;
  end;
 write(res);
end;
begin
 assign(input,'cezar.inp');reset(input);
 assign(output,'cezar.out');rewrite(output);
 nhap;
 xuli;
 close(input);
 close(output);
end.
