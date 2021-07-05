uses math;
const oo=1000000000;
var ke,next,head,ts:array[-200000..200000] of longint;
    pos,a,heap,d:array[0..10000] of longint;
    res,res1,p,f,c,nheap:longint;
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
procedure doicho(var x,y:longint);
var tg:longint;
begin
 tG:=x;
 x:=y;
 y:=tg;
end;
procedure nhap;
var i,u,v,q:longint;
begin
 read(p,f,c);
 for i:=1 to f do read(a[i]);
 for i:=1 to c do
  begin
   read(u,v,q);
   add(i,u,v,q);
  end;
end;
procedure khoitao(i:longint);
var t:longint;
begin
 for t:=1 to p do d[t]:=oo;
 d[i]:=0;
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
procedure dijks(i:longint);
var u,v,j:longint;
    sum:int64;
begin
 nheap:=0;
 for j:=1 to p do pos[j]:=0;
 khoitao(i);
 push(i);
 repeat
  u:=pop;
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
 sum:=0;
 for j:=1 to f do
  if d[a[j]]<>oo then sum:=sum+d[a[j]]
  else exit;
 if (sum<res) then
  begin
   res:=sum;
   res1:=i;
  end;
end;
procedure xuli;
var i:longint;
begin
 res:=oo;
 for i:=1 to p do dijks(i);
 write(res1);
end;
begin
// assign(input,'bestspot.inp');reset(input);
// assign(output,'bestspot.out'); rewrite(output);
 nhap;
 xuli;
// close(input);     close(output);
end.
