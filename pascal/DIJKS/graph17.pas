uses math;
const oo=1000000000000000;
var  n,m,nheap:longint;
     d,d1,d2:Array[0..200000] of int64;
     res,point:int64;
     ke,next,head,ts,heap,pos:array[-200000..200000] of longint;
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
var  u,j,v,tg:longint;
begin
 DIJKS(1);
 d1:=d;
 point:=d1[n];
 DIJKS(n);
 d2:=d;
 for u:=1 to n do
  begin
   j:=head[u];
   while j<>0 do
    begin
     v:=ke[j];
     if d1[u]+d2[v]+ts[j]=d1[n] then
      begin
       tg:=ts[j];
       ts[j]:=ts[j]*2;
       DIJKS(1);
       res:=max(res,d[n]-point);
       ts[j]:=tg;
      end;
     j:=next[j];
    end;
  end;
 write(res);
end;
begin
 assign(input,'graph17.inp');reset(input);
 assign(output,'graph17.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.