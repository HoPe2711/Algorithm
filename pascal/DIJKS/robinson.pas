uses math;
const oo=1000000007;
var k,n,m,s,t,res,nheap,x,y:longint;
    ke,next,head,ts,h,heap,tt:array[-200000..200000] of longint;
    d,pos:array[0..2000,0..200] of longint;
procedure add(i,u,v,c,t1:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 ts[i]:=c;
 ke[-i]:=u;
 next[-i]:=head[v];
 head[v]:=-i;
 ts[-i]:=c;
 h[i]:=t1;
 h[-i]:=t1;
end;
procedure nhap;
var i,u,v,c,t1:longint;
begin
 read(k,n,m);
 for i:=1 to m do
  begin
   read(u,v,c,t1);
   add(i,u,v,c,t1);
  end;
 read(s,t);
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
 if (i=1) or (d[heap[i],tt[i]]>d[heap[i div 2],tt[i div 2]]) then exit;
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
 if (j<nheap) and (d[heap[j],tt[j]]>d[heap[j+1],tt[j+1]]) then inc(j);
 if (d[heap[i],tt[i]]>d[heap[j],tt[j]]) then
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
procedure khoitao;
var i,j:longint;
begin
 for i:=1 to n do
  for j:=0 to k-1 do d[i,j]:=oo;
 d[s,0]:=0;
end;
procedure xuli;
var u,j,v,i:longint;
begin
 nheap:=0;
 push(s,0);
 repeat
  pop;
  j:=head[x];
  while j<>0 do
   begin
    v:=ke[j];
    if y+h[j]< k then
     if d[v,y+h[j]]>d[x,y]+ts[j] then
      begin
       d[v,y+h[j]]:=d[x,y]+ts[j];
       if pos[v,y+h[j]]=0 then push(v,y+h[j])
       else upheap(pos[v,y+h[j]]);
      end;
    j:=next[j];
   end;
 until nheap=0;
 res:=oo;
 for i:=0 to k-1 do res:=min(res,d[t,i]);
 if res=oo then write(-1) else write(res);
end;
BEGIN
  assign(input,'robinson.inp');reset(input);
  assign(output,'robinson.out');rewrite(output);
  nhap;
  khoitao;
  xuli;
  close(input);close(output);
END.
