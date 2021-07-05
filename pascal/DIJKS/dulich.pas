uses math;
const oo=1000000000;
var  ke,next,head,ts,ke1,head1,ts1,next1,heap,heap1,d,pos:array[-400000..400000] of longint;
     dd,free:array[0..22,0..50000] of longint;
     pos1,d1:array[0..22,0..2000000] of longint;
     n,m,k,res,nheap,x,y,g:longint;
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
procedure add1(i,u,v,c:longint);
begin
 ke1[i]:=v;
 next1[i]:=head1[u];
 head1[u]:=i;
 ts1[i]:=c;
end;
procedure nhap;
var i,u,v,c:longint;
begin
 read(n,m,k);
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
 doicho(pos[heap[i]],pos[heap[i div 2]]);
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


procedure upheap1(i:longint);
begin
 if (i=1) or (d1[heap[i],heap1[i]]>d1[heap[i div 2],heap1[i div 2]]) then exit;
 doicho(heap[i],heap[i div 2]);
 doicho(heap1[i],heap1[i div 2]);
 doicho(pos1[heap[i],heap1[i]],pos1[heap[i div 2],heap1[i div 2]]);
 upheap1(i div 2);
end;
procedure downheap1(i:longint);
var j:longint;
begin
 j:=2*i;
 if j>nheap then exit;
 if (j<nheap) and (d1[heap[j],heap1[j]]>d1[heap[j+1],heap1[j+1]]) then inc(j);
 if d1[heap[i],heap1[i]]>d1[heap[j],heap1[j]] then
  begin
   doicho(heap[i],heap[j]);
   doicho(heap1[i],heap1[j]);
   doicho(pos1[heap[i],heap1[i]],pos1[heap[j],heap1[j]]);
   downheap1(j);
  end;
end;
procedure push1(x,y:longint);
begin
 inc(nheap);
 heap1[nheap]:=y;
 heap[nheap]:=x;
 pos1[x,y]:=nheap;
 upheap1(nheap);
end;
procedure pop1;
begin
 x:=heap[1];   y:=heap1[1];
 heap[1]:=heap[nheap];
 heap1[1]:=heap1[nheap];
 pos1[heap[1],heap1[1]]:=1;
 dec(nheap);
 downheap1(1);
end;
procedure dijks(s:longint);
var u,j,v,i:longint;
begin
 nheap:=0;
 for i:=1 to n do
  begin
   d[i]:=oo;
   pos[i]:=0;
  end;
 d[s]:=0;
 push(s);
 repeat
  u:=pop;
  j:=head[u];
  while j<>0 do
   begin
    v:=ke[j];
    if (d[v]>d[u]+ts[j]) then
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
var i,j,u,v,canh:longint;
begin
 for i:=1 to k+1 do
  begin
   DIjks(i);
   for j:=1 to n do dd[i,j]:=d[j];
  end;
 read(g);
 for i:=1 to g do
  begin
   read(u,v);
   free[u,v]:=1;
   add1(i,u,v,dd[u,v]);
  end;
 canh:=g;
 for i:=1 to k do
 begin
  for j:=i+1 to k+1 do
   if (free[i,j]=0) and (Free[j,i]=0) then
     begin
      inc(canh);
      add1(canh,i,j,dd[i,j]);
      add1(-canh,j,i,dd[i,j]);
     end;
 end;
end;

function getbit(i,x:longint):longint;
begin
 exit(1 and (x shr i));
end;
function batbit(i,x:longint):longint;
begin
 exit(x or (1 shl i));
end;
procedure xuli1;
var i,j,v,l,yy:longint;
begin
 l:=2**k;
 for i:=1 to k+1 do
  for j:=0 to l do d1[i,j]:=oo;
 nheap:=0;
 d1[1,0]:=0;
 push1(1,0);
 repeat
  pop1;
  j:=head1[x];
  while j<>0 do
   begin
    v:=ke1[j];
    if getbit(v-1,y)=0 then
     begin
      yy:=batbit(v-1,y);
      if d1[v,yy]>d1[x,y]+ts1[j] then
       begin
        d1[v,yy]:=d1[x,y]+ts[j];
        if pos1[v,yy]=0 then push1(v,yy)
        else upheap1(pos1[v,yy]);
       end;
     end;
    j:=next1[j];
   end;
 until nheap=0;
 res:=oo;
 for i:=1 to k+1 do
  if d1[i,l]<>oo then res:=min(res,d1[i,l]+dd[i,n]);
 write(res);
end;
begin
 assign(input,'dulich.inp');reset(input);
 assign(output,'dulich.out');rewrite(output);
 nhap;
 xuli;
 xuli1;
 close(input); close(output);
end.
