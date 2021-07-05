uses math;
var n,m,k,kq,nheap:longint;
    res:real;
    free,free1:array[0..100000] of boolean;
    ke,next,head,pos,heap:array[-100000..100000] of longint;
    node,full:array[-100000..100000] of longint;
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
var i,u,x,v:longint;
begin
 read(n,m,k);
 for i:=1 to k do
  begin
   read(x);
   free[x]:=true;
   free1[x]:=true;
  end;
 for i:=1 to m do
  begin
   read(u,v);
   add(i,u,v);
  end;
end;


procedure build;
var i,j,u,v:longint;
begin
 fillchar(full,sizeof(full),0);
 for i:=1 to n do
 if free[i]=false then
  begin
   j:=head[i];
   while j<>0 do
    begin
     v:=ke[j];
     if free[v]=false then inc(node[i]);
     inc(full[i]);
     j:=next[j];
    end;
  end;
end;
procedure build1;
var i,j,u,v:longint;
begin
 fillchar(full,sizeof(full),0);
 fillchar(node,sizeof(node),0);
 for i:=1 to n do
 if free1[i]=false then
  begin
   j:=head[i];
   while j<>0 do
    begin
     v:=ke[j];
     if free1[v]=false then inc(node[i]);
     inc(full[i]);
     j:=next[j];
    end;
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
 if (i=1) or (node[heap[i]]/full[heap[i]]>node[heap[i div 2]]/full[heap[i div 2]]) then exit;
 doicho(heap[i],heap[i div 2]);
 doicho(pos[heap[i]],pos[heap[i div 2]]);
 upheap(i div 2);
end;
procedure downheap(i:longint);
var j:longint;
begin
 j:=2*i;
 if j>nheap then exit;
 if (j<nheap) and (node[heap[j]]/full[heap[j]]>node[heap[j+1]]/full[heap[j+1]]) then inc(j);
 if (node[heap[i]]/full[heap[i]])>(node[heap[j]]/full[heap[j]]) then
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


procedure xuli;
var i,u,v,j:longint;
begin
 for i:=1 to n do
  if free[i]=false then push(i);
 repeat
  u:=pop;
  if res<node[u]/full[u] then
   begin
    res:=node[u]/full[u];
    kq:=nheap+1;
   end;
  free[u]:=true;
  j:=head[u];
  while j<>0 do
   begin
    v:=ke[j];
    if free[v]=false then
     begin
      dec(node[v]);
      upheap(pos[v]);
     end;
    j:=next[j];
   end;
 until nheap=0;
 writeln(kq);
end;


procedure truyvet;
var i,j,v,u:longint;
begin
 fillchar(pos,sizeof(pos),0);
 nheap:=0;
 for i:=1 to n do
 if free1[i]=false then push(i);
 repeat
  u:=pop;
  if kq=nheap+1 then
   begin
    write(u,' ');
    for i:=1 to nheap do write(heap[i],' ');
    exit;
   end;
  j:=head[u];
  free1[u]:=true;
  while j<>0 do
   begin
    v:=ke[j];
    if free1[v]=false then
     begin
      dec(node[v]);
      upheap(pos[v]);
     end;
    j:=next[j];
   end;
 until nheap=0;
end;


begin
 assign(input,'teminator.inp');reset(input);
 assign(output,'teminator.out');rewrite(output);
 nhap;
 build;
 xuli;
 build1;
 truyvet;
 close(input); close(output);
end.
