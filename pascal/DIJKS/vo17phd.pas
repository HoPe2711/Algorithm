uses math;
const oo=high(int64) div 2;
var  n,m,nheap:longint;
     ke,next,head,ts,p,heap,pos:array[-200000..200000] of longint;
     val,d:array[0..200000] of int64;
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
var  i,u,v,c:longint;
begin
 read(n);
 for i:=1 to n do read(p[i]);
 read(m);
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
procedure xuli;
var i,u,v,j:longint;
begin
 for i:=1 to n do d[i]:=oo;
 d[1]:=0;
 val[1]:=p[1];
 push(1);
 repeat
  u:=pop;
  j:=head[u];
  while j<>0 do
   begin
    v:=ke[j];
    if d[v]>d[u]+ts[j] then
     begin
      d[v]:=d[u]+ts[j];
      val[v]:=val[u]+p[v];
      if pos[v]=0 then push(v)
      else upheap(pos[v]);
     end
    else if (d[v]=d[u]+ts[j]) and (val[v]<val[u]+p[v]) then val[v]:=val[u]+p[v];
    j:=next[j];
   end;
 until nheap=0;
 if d[n]=oo then
  begin
   write('impossible');
   exit;
  end;
 writeln(d[n],' ',val[n]);
end;
begin
 assign(input,'vo17phd.inp');reset(input);
 assign(output,'vo17phd.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
