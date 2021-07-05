uses math;
const oo=maxlongint div 2;
var ke,next,head,ts:Array[-20000..20000] of longint;
    heap,tt:array[0..20000] of longint;
    x1:array[0..200] of longint;
    n,m,k,q,nheap,x,y,res,id:longint;
    gt:int64;
    pos:array[0..20000,0..1] of longint;
    d:Array[0..200,0..200000,0..1] of longint;
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
 read(n,m,k,q);
 for i:=1 to m do
  begin
   read(u,v,c);
   add(i,u,v,c);
  end;
 for i:=1 to k do read(x1[i]);
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
 if (i=1) or (d[id,heap[i],tt[i]]>d[id,heap[i div 2],tt[i div 2]]) then exit;
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
 if (j<nheap) and (d[id,heap[j],tt[j]]>d[id,heap[j+1],tt[j+1]]) then inc(j);
 if (d[id,heap[i],tt[i]]>d[id,heap[j],tt[j]]) then
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
procedure dijkstra(s,p:longint);
var i,j,v:longint;
begin
 fillchar(pos,sizeof(pos),0);
 id:=p;
 d[id,s,1]:=0; d[id,s,0]:=0;
 nheap:=0;
 push(s,1);
 push(S,0);
 repeat
  pop;
  j:=head[x];
  while j<>0 do
   begin
    v:=ke[j];
    if (y=0) and (j>0) then
    begin
     if d[id,v,y]>d[id,x,y]+ts[j] then
      begin
       d[id,v,y]:=d[id,x,y]+ts[j];
       if pos[v,y]=0 then push(v,y)
       else upheap(pos[v,y]);
      end;
    end
    else if (y=1) and (j<0) then
     if d[id,v,y]>d[id,x,y]+ts[j] then
      begin
       d[id,v,y]:=d[id,x,y]+ts[j];
       if pos[v,y]=0 then push(v,y)
       else upheap(pos[v,y]);
      end;
    j:=next[j];
   end;
 until nheap=0;
end;

procedure xuli;
var i,a,b,j,t,kq:longint;
begin
 for i:=1 to n do
  for j:=1 to k do
   for t:=0 to 1 do d[j,i,t]:=oo;
 for i:=1 to k do
  begin
   dijkstra(x1[i],i);
  end;
 for i:=1 to q do
  begin
   read(A,b); kq:=oo;
   for j:=1 to k do
   if (d[j,a,1]<>oo) and (d[j,b,0]<>oo) then
    if d[j,a,1]+d[j,b,0]<kq then kq:=d[j,a,1]+d[j,b,0];
   if kq<oo then
    begin
     inc(res);
     gt:=gt+kq;
    end;
  end;
 writeln(res);
 writeln(gt);
end;
begin
 assign(input,'abcair.inp');reset(input);
 assign(output,'abcair.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
