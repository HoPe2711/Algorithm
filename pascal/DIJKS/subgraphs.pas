uses math;
const oo=1000000000;
var ke,next,head,ts,d,heap,pos,free:array[-2000000..2000000] of longint;
    n,m,canh,res,t,nheap,q:longint;
procedure doicho(var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure add(i,u,v,c:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 ts[i]:=c;
end;
procedure nhap;
var i,u,v:longint;
begin
 read(n,m);
 for i:=1 to m do
  begin
   read(u,v);
   add(i,u,v,2);
   add(-i,v,u,2);
  end;
end;

procedure init(s,l,r,p,x:longint);
var  mid:longint;
begin
 if l>r then exit;
 if l=r then
  begin
   inc(Canh);
   if x=2 then add(canh,p+s,l,0) else  add(canh,l,p+s,0);
   exit;
  end;
 mid:=(l+r) div 2;
 init(2*s,l,mid,p,x);
 init(2*s+1,mid+1,r,p,x);
 inc(canh);
 if x=2 then add(canh,p+s,p+2*s,0) else add(Canh,p+2*s,p+s,0);
 inc(Canh);
 if x=2 then add(canh,p+s,p+2*s+1,0) else add(canh,p+2*s+1,p+s,0);
end;

procedure get(s,l,r,u,v,p,x:longint);
var mid:longint;
begin
 if (u>R) or (v<l) then exit;
 if (u<=l) and (r<=v) then
  begin
   inc(canh);
   if x=1 then add(Canh,s+p,t,1) else add(canh,t,s+p,1);
   exit;
  end;
 mid:=(l+r) div 2;
 get(2*s,l,mid,u,v,p,x);
 get(2*s+1,mid+1,r,u,v,p,x);
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

procedure dijks(s,s1:longint);
var u,j,v,i:longint;
begin
 nheap:=0;
 for i:=1 to t do
  begin
   d[i]:=oo;
   pos[i]:=0;
  end;
 d[s]:=0;
 push(s);
 repeat
  u:=pop;
  if u=s1 then exit;
  j:=head[u];
  while j<>0 do
   begin
    v:=ke[j];
    if free[v]<>1 then
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
var i,x,l,r,u,v:longint;
begin
 canh:=m;
 init(1,1,n,n,1);
 init(1,1,n,5*n,2);
 read(q);
 t:=9*n;
 for i:=1 to  q do
  begin
   read(X);
   if x=1 then
    begin
     read(l,r);
     inc(t);
     get(1,1,n,l,r,5*n,2);
     get(1,1,n,l,r,n,1);
    end;
   if x=2 then
    begin
     read(l);
     free[9*n+l]:=1;
    end;
   if x=3 then
    begin
     read(u,v);
     dijks(u,v);
     if d[v]=oo then res:=-1 else res:=d[v] div 2;
     writeln(res);
    end;
  end;
end;
begin
 assign(input,'subgraphs.inp');reset(input);
 assign(output,'subgraphs.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
