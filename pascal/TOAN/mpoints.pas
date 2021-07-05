
uses math;
const oo=1000000000000000000;
type node=record
     x,y:int64;
end;
var ke,next,head,ts,pos,heap,stack,stack1:Array[0..300000] of longint;
    d,d1:array[0..200000] of int64;
    a:array[0..200000] of node;
    n,m,k,top,dem,nheap:longint;
procedure add(i,u,v,c:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 ts[i]:=c;
end;
procedure nhap;
var i,u,v,c:longint;
begin
 read(n,m,k);
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
procedure DIJKS(s:longint);
var  i,u,j,v:longint;
begin
 for i:=1 to n do
  begin
   d[i]:=oo;
   pos[i]:=0;
  end;
 d[s]:=0;
 nheap:=0;
 push(s);
 repeat
  u:=pop;
  j:=head[u];
  while j<>0 do
   begin
    v:=ke[j];
    if d[v]>d[u]+ts[j] then
     begin
      d[v]:=d[u]+ts[j];
      if pos[v]=0 then push(v) else upheap(pos[v]);
     end;
    j:=next[j];
   end;
 until nheap=0;
end;
procedure setup;
var  i:longint;
begin
 Dijks(1);
 d1:=d;
 Dijks(n);      dem:=0;
 for i:=1 to n do
 if (d1[i]<>oo) and (d[i]<>oo) then
  begin
   inc(dem);
   a[dem].x:=d1[i]; a[dem].y:=d[i];
  end;
 n:=dem;
end;


procedure swap(var x,y:node);
var tg:node;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
function ccw(p,p1,p2:node):longint;
var a1,a2,b1,b2,t:int64;
begin
 a1:=p1.x-p.x;
 b1:=p1.y-p.y;
 a2:=p2.x-p.x;
 b2:=p2.y-p.y;
 t:=a1*b2-a2*b1;
 if t>0 then exit(1)
 else if t<0 then exit(-1);
 exit(0);
end;
function ss(p,p1,p2:node):longint;
var ans:longint;
begin
 ans:=ccw(p,p1,p2);
 if ans>0 then exit(1)
 else if (ans=0) and ((p1.x<p2.x) or ((p1.x=p2.x) and (p1.y<p2.y))) then exit(1);
 exit(0);
end;
procedure qsort(l,r:longint);
var i,j,mid1:longint; mid:node;
begin
 i:=l;
 j:=r;
 mid1:=l+random(r-l+1);
 mid:=a[mid1];
 repeat
  while  (ss(a[1],a[i],mid)=1) do inc(i);
  while  (ss(a[1],mid,a[j])=1) do dec(j);
  if i<=j then
   begin
    swap(a[i],a[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure convex;
var i,kq,kq1:longint;     c,c1:int64;
begin
 c:=oo;
 for i:=1 to n do
  if a[i].y<c then
   begin
    kq:=i; c:=a[i].y; c1:=a[i].x;
   end
  else if (a[i].y=c) and (a[i].x<c1) then
   begin
    kq:=i; c1:=a[i].x;
   end;
 swap(a[1],a[kq]);
 qsort(2,n);
 top:=1; stack[1]:=1;
 if n>=2 then
  begin
   inc(top);
   stack[2]:=2;
  end;
 for i:=3 to n do
  begin
   while (top>1) and (ccw(a[stack[top-1]],a[stack[top]],a[i])<>1) do dec(top);
   inc(top); stack[top]:=i;
  end;
 if (n>2) and (top=2) then
  begin
   dem:=0;
   c:=oo;
   for i:=1 to n do
   if a[i].y<c then
   begin
    kq:=i; c:=a[i].y;
   end ;
   inc(dem);
   stack[dem]:=kq;
   c:=-oo;
   for i:=1 to n do
   if a[i].y>c then
   begin
    kq:=i; c:=a[i].y;
   end ;
   inc(dem);
   stack[dem]:=kq;
   exit;
  end;
 c:=-oo; c1:=-oo;
 for i:=1 to top do
  if a[stack[i]].y>c then
   begin
    kq1:=i; c:=a[stack[i]].y; c1:=a[stack[i]].x;
   end
  else if (a[stack[i]].y=c) and (a[stack[i]].x>c1) then
   begin
    kq1:=i; c1:=a[stack[i]].x;
   end;
 kq:=1;
 dem:=0;
 stack1:=stack;
 for i:=kq downto 1 do
 begin
  inc(dem);
  stack[dem]:=stack1[i];
 end;
 for i:=top downto kq1 do
  begin
   inc(dem);
   stack[dem]:=stack1[i];
  end;
end;

function dot(u,v:node):int64;
begin
 exit(u.x*v.x+u.y*v.y);
end;

procedure xuli;
var  i,u,v,l,r,mid:longint; trace:node; t,t1,res:int64;
begin
 for i:=1 to k do
  begin
   read(u,v);
   trace.x:=u;
   trace.y:=v;
   res:=dot(a[stack[1]],trace);
   l:=2; r:=dem;
   while l<=r do
    begin
     mid:=(l+r) div 2;
     t:=dot(a[stack[mid]],trace);
     t1:=dot(a[stack[mid-1]],trace);
     if t<t1 then
      begin
       res:=t;
       l:=mid+1;
      end
     else r:=mid-1;
    end;
    writeln(Res);
  end;
end;
begin
 assign(input,'mpoints.inp');reseT(input);
 assign(output,'mpoints.out');rewrite(output);
 nhap;
 setup;
 convex;
 xuli;
 close(input); close(output);
end.
