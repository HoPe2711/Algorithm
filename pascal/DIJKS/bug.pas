const oo=2000000000;
var n,m,x,y,nheap:longint;
    ke,next,head,ts:array[-500000..500000] of longint;
    d,pos:array[0..500000,0..1] of longint;
    heap,tt:array[0..500000] of longint;
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
var i:longint;
begin
 for i:=1 to n do
  begin
   d[i,0]:=oo;
   d[i,1]:=oo;
  end;
 d[1,0]:=0;
end;
procedure xuli;
var j,v,res:longint;
begin
 nheap:=0;
 push(1,0);
 repeat
  pop;
  if (x=n) and (y=1) then break;
  j:=head[x];
  while j<>0 do
   begin
    v:=ke[j];
    res:=(y+ts[j]) mod 2;
    if d[v,res]>d[x,y]+ts[j] then
      begin
       d[v,res]:=d[x,y]+ts[j];
       if pos[v,res]=0 then push(v,res)
       else upheap(pos[v,res]);
      end;
    pos[x,y]:=0;
    j:=next[j];
   end;
 until nheap=0;
 if d[n,1]=oo then write(0) else write(d[n,1]);
end;
begin
 assign(input,'bug.inp');reset(input);
 assign(output,'bug.out');rewrite(output);
 nhap;
 khoitao;
 xuli;
 close(input);
 close(output);
end.
