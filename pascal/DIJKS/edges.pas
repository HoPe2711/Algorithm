uses math;
const oo=1000000000000000;
var ke,next,head,ts,ke1,next1,head1,stack,num,low,lab,pos,heap,deg:array[0..500000] of longint;
    d:array[0..500000] of int64;
    n,m,m1,canh,dem,top,nheap,t,s,ltm:longint;  res:int64;
procedure doicho(Var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure add(i,u,v:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
end;
procedure nhap;
var  i,u,v:longint;
begin
 read(n);
 read(m);
 for i:=1 to m do
  begin
   read(u,v);
   add(i,u,v);
  end;
end;

procedure push(x:longint);
begin
 inc(top);
 stack[top]:=x;
end;
function pop:longint;
begin
 pop:=stack[top];
 dec(top);
end;
procedure DFS(u,p:longint);
var  j,v:longint;
begin
 inc(dem); push(u);
 num[u]:=dem; low[u]:=dem;
 j:=head[u];
 while j<>0 do
  begin
   v:=ke[j];
   if (v<>p) and (lab[v]=0) then
    if num[v]=0 then
     begin
      DFS(v,u);
      low[u]:=min(low[u],low[v]);
     end
    else low[u]:=min(low[u],num[v]);
   j:=next[j];
  end;
 if low[u]=num[u] then
  begin
   inc(ltm);
   repeat
    v:=pop; lab[v]:=ltm;
   until v=u;
  end;
end;

procedure add1(i,u,v,c:longint);
begin
 ke1[i]:=v;
 next1[i]:=head1[u];
 head1[u]:=i;
 ts[i]:=c;
end;
procedure buildtree;
var  u,j,v,kq,c,i:longint;
begin
 for i:=1 to n do
 if num[i]=0 then DFS(i,-1);
 for u:=1 to n do
  begin
   j:=head[u];
   while j<>0 do
    begin
     v:=ke[j];
     if lab[v]<>lab[u] then
      begin
       inc(Canh);
       add1(canh,lab[u],lab[v],0);
      end;
     j:=next[j];
    end;
  end;
 for i:=1 to ltm do
  begin
   j:=head1[i];
   while j<>0 do
    begin
     v:=ke1[j];
     inc(Deg[v]);
     j:=next1[j];
    end;
  end;
 s:=ltm;
 t:=1;
 read(m1);
 for i:=1 to m1 do
  begin
   read(u,v,c);
   if c<0 then
    begin
     res:=res+c; c:=0;
    end;
   inc(Canh);
   add1(canh,lab[u],lab[v],c);
  end;
end;


procedure khoitao;
var i:longint;
begin
 for i:=0 to ltm do d[i]:=oo;
 d[t]:=0;
end;
procedure upheap(i:longint);
begin
 if (i=1) or (d[heap[i]]>=d[heap[i div 2]]) then exit;
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
 if d[heap[i]]>=d[heap[j]] then
  begin
   doicho(heap[i],heap[j]);
   doicho(pos[heap[i]],pos[heap[j]]);
   downheap(j);
  end;
end;
procedure push1(x:longint);
begin
 inc(nheap);
 heap[nheap]:=x;
 pos[x]:=nheap;
 upheap(nheap);
end;
function pop1:longint;
begin
 pop1:=heap[1];
 heap[1]:=heap[nheap];
 pos[heap[1]]:=1;
 dec(nheap);
 downheap(1);
end;
procedure xuli;
var u,j,v:longint;
begin
 khoitao;
 push1(t);
 repeat
  u:=pop1;
  j:=head1[u];
  while j<>0 do
   begin
    v:=ke1[j];
    if d[v]>d[u]+ts[j] then
     begin
      d[v]:=d[u]+ts[j];
      if pos[v]=0 then push1(v)
      else upheap(pos[v]);
     end;
    j:=next1[j];
   end;
 until nheap=0;
 if d[s]=oo then writeln('NO') else
  begin
   writeln('YES');
   writeln(d[s]+res);
  end;
end;
begin
 assign(input,'edges.inp');reset(input);
 assign(output,'edges.out');rewrite(output);
 nhap;
 buildtree;
 xuli;
 close(input); close(output);
end.
