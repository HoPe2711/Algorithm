uses math;
const oo=1000000000;
var ke,next,head,ts,tp,heap,tt,queu,queu1:array[-200000..200000] of longint;
    d,pos,d1:array[0..200000,0..1] of longint;
    n,s,t,m,res,m1,nheap,x,y,f,r:longint;
procedure add(i,u,v,c,l:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 ts[i]:=c;
 tp[i]:=l;
 ke[-i]:=u;
 next[-i]:=head[v];
 head[v]:=-i;
 ts[-i]:=c;
 tp[-i]:=l;
end;
procedure nhap;
var i,u,v,c:longint;
begin
 read(n,s,t);
 read(m);
 for i:=1 to m do
  begin
   read(u,v,c);
   add(i,u,v,c,0);

  end;
 read(m1);
 for i:=1 to m1 do
  begin
   read(u,v,c);
   add(i+m,u,v,c,1);
  end;
end;


procedure khoitao;
var i,j:longint;
begin
 for i:=1 to n do
 for j:=0 to 1 do d[i,j]:=oo;
 d[t,0]:=0;   d[t,1]:=0;
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


procedure push1(x,y:longint);
begin
 inc(r);
 queu[r]:=x;
 queu1[r]:=y;
end;
procedure pop1;
begin
 x:=queu[f];
 y:=queu1[f];
 inc(f);
end;
procedure bfs(s,s1:longint);
var j,v:longint;
begin
 f:=1; r:=0;
 push1(s,1-s1);
 d1[s,1-s1]:=0;
 while f<=r do
  begin
   pop1;
   j:=head[x];
   while j<>0 do
    begin
     v:=ke[j];
     if tp[j]=1-y then
      if (d1[x,y]+ts[j]>d1[v,1-y]) and (d[x,1-y]>d[v,1-y]) then
       begin
        d1[v,1-y]:=d1[x,y]+ts[j];
        push1(v,1-y);
       end;
     j:=next[j];
    end;
  end;
end;



procedure xuli;
var j,v,i:longint;
begin
 push(t,0);
 push(t,1);
 repeat
  pop;
  j:=head[x];
  while j<>0 do
   begin
    v:=ke[j];
    if tp[j]=y then
    if d[v,y]>=d[x,y]+ts[j] then
     begin
      d[v,y]:=d[x,y]+ts[j];
      if pos[v,y]=0 then push(v,y)
      else upheap(pos[v,y]);
     end;
    j:=next[j];
   end;
 until nheap=0;
 bfs(s,0);
 for i:=0 to 1 do res:=max(d1[t,i],res);
 write(res);
end;
BEGIN
  assign(input,'journey.inp');reset(input);
  assign(output,'journey.out');rewrite(output);
  nhap;
  khoitao;
  xuli;
  close(input);close(output);
END.