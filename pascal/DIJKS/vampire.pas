uses math;
const oo=1000000000;
var s,n,m,res,nheap,x,y:longint;
    ke,next,ts,head,heap,tt,tg:array[-600000..600000] of longint;
    d,pos:array[0..10000,0..3600] of longint;
procedure add(i,u,v,c,tt:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 ts[i]:=c;
 ke[-i]:=u;
 next[-i]:=head[v];
 head[v]:=-i;
 ts[-i]:=c;
 if tt=1 then
  begin
   tg[i]:=c;
   tg[-i]:=c;
  end
 else
  begin
   tg[i]:=0;
   tg[-i]:=0;
  end;
end;
procedure nhap;
var i,u,v,c,tt:longint;
begin
 read(s);
 read(n,m);
 for i:=1 to m do
  begin
   read(u,v,c,tt);
   add(i,u+1,v+1,c,tt);
  end;
end;
procedure khoitao;
var i,j:longint;
begin
 for i:=1 to n do
  for j:=0 to s do d[i,j]:=oo;
 d[1,0]:=0;
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
procedure xuli;
var j,v,q,i,kt:longint;
begin
 res:=oo;
 nheap:=0;
 push(1,0);
 repeat
  pop;
  j:=head[x];
  if x=n then break;
  while j<>0 do
   begin
    v:=ke[j];
    kt:=y+tg[j];
    if (kt<=s) and (d[v,kt]>d[x,y]+ts[j]) then
     begin
      d[v,kt]:=d[x,y]+ts[j];
      if pos[v,kt]=0 then push(v,kt)
      else upheap(pos[v,kt]);
     end;
    j:=next[j];
   end;
 until nheap=0;
 for i:=0 to s do res:=min(res,d[n,i]);
 if res<>oo then write(res)
 else write(-1);
end;
BEGIN
  assign(input,'vampire.inp');reset(input);
  assign(output,'vampire.out');rewrite(output);
  nhap;
  khoitao;
  xuli;
  close(input);close(output);
END.
