uses math;
const oo=maxlongint;
var  ke,next,head,ts,d,heap,pos:array[-100000..100000] of longint;
     n,m,nheap:longint;
     f:array[0..10000] of int64;
procedure add(i,u,v,c:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 ts[i]:=c;
end;
procedure nhap;
var k,u,v,l,i:longint;
begin
 read(n,m);
 for i:=1 to m do
  begin
   read(k,u,v,l);
   if k=1 then add(i,u,v,l)
   else
    begin
     add(i,u,v,l);
     add(-i,v,u,l);
    end;
  end;
end;
procedure khoitao;
var  i:longint;
begin
 for i:=1 to n do d[i]:=oo;
 d[1]:=0;
 f[1]:=1;
end;
procedure swap(var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure upheap(i:longint);
begin
 if (i=1) or (d[heap[i]]>d[heap[i div 2]]) then exit;
 swap(heap[i],heap[i div 2]);
 swap(pos[heap[i]],pos[heap[i div 2]]);
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
   swap(heap[i],heap[j]);
   swap(pos[heap[i]],pos[heap[j]]);
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
var u,j,v:longint;
begin
 khoitao;
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
      f[v]:=f[u];
      if pos[v]=0 then push(v)
      else upheap(pos[v]);
     end
    else if d[v]=d[u]+ts[j] then f[v]:=f[v]+f[u];
    j:=next[j];
   end;
 until nheap=0;
 write(d[n],'  ',f[n]);
end;
begin
 assign(input,'qbschool.inp');reset(input);
 assign(output,'qbschool.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.