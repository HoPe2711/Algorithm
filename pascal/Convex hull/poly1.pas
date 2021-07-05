uses math;
type node=record
     x,y:longint;
end;
const oo=10000000000000000;
var n,k,top,nheap,x1,y1:longint;
    canh:int64;
    a:array[0..300] of node;
    stack,heap,heap1:array[0..500] of longint;
    d,ts1:Array[0..500,0..500] of int64;
    pos:array[0..500,0..500] of longint;
    ke,next,head:array[0..500000] of longint;
    ts:array[0..500000] of int64;
    res:int64;
    res1:int64;
procedure nhap;
var  i:longint;
begin
 read(n,k);
 for i:=1 to n do read(a[i].x,a[i].y);
end;
procedure doicho1(var x,y:node);
var tg:node;
begin
 tG:=x;
 x:=y;
 y:=tg;
end;
procedure doicho(var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
function ccw(p,p1,p2:node):longint;
var a1,b1,a2,b2,t:int64;
begin
 a1:=p1.x-p.x;
 b1:=p1.y-p.y;
 a2:=p2.x-p.x;
 b2:=p2.y-p.y;
 t:=a1*b2-a2*b1;
 if t>0 then exit(1)
 else  if (t<0) then exit(-1);
 exit(0);
end;
function ss(p,p1,p2:node):longint;
var ans:longint;
begin
 ans:=ccw(p,p1,p2);
 if ans>0 then exit(1)
 else if (Ans=0) and ((p1.x<p2.x) or ((p1.x=p2.x) and (p1.y<p2.y))) then exit(1);
 exit(0);
end;
procedure qsort(l,r:longint);
var i,j:longint; mid :node;
begin
 i:=l;
 j:=r;
 mid:=a[l+random(r-l+1)];
 repeat
  while ss(a[1],a[i],mid)=1 do inc(i);
  while ss(A[1],mid,a[j])=1 do dec(j);
  if i<=j then
   begin
    doicho1(a[i],a[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
function tinh(u,v:node):int64;
begin
 exit(int64(u.x)*v.y-int64(u.y)*v.x);
end;
procedure xuli;
var i,kq,c,c1:longint;
begin
 c:=1000001;
 for i:=1 to n do
  if a[i].y<c then
   begin
    kq:=i; c:=a[i].y; c1:=a[i].x;
   end
  else if (A[i].y=c) and (a[i].x<c1) then
   begin
    kq:=i; c1:=a[i].x;
   end;
  doicho1(a[1],a[kq]);
  qsort(2,n);
  a[n+1]:=a[1];
  top:=2; stack[1]:=1; stack[2]:=2;
  for i:=3 to n+1 do
   begin
    while (top>1) and (ccw(a[stack[top-1]],a[stack[top]],a[i])<>1) do dec(top);
    inc(top); stack[top]:=i;
   end;
  for i:=1 to top-1 do
   begin
    res1:=res1+tinh(a[stack[i]],a[stack[i+1]]);
   end;
end;







procedure add(i,u,v:longint;c:int64);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 ts[i]:=c;
end;
procedure upheap(i:longint);
begin
 if (i=1) or (d[heap[i],heap1[i]]>d[heap[i div 2],heap1[i div 2]]) then exit;
 doicho(heap[i],heap[i div 2]);
 doicho(heap1[i],heap1[i div 2]);
 doicho(pos[heap[i],heap1[i]],pos[heap[i div 2],heap1[i div 2]]);
 upheap(i div 2);
end;
procedure downheap(i:longint);
var j:longint;
begin
 j:=2*i;
 if j>nheap then exit;
 if (j<nheap) and (d[heap[j],heap1[j]]>d[heap[j+1],heap1[j+1]]) then inc(j);
 if d[heap[i],heap1[i]]>d[heap[j],heap1[j]] then
  begin
   doicho(heap[i],heap[j]);
   doicho(heap1[i],heap1[j]);
   doicho(pos[heap[i],heap1[i]],pos[heap[j],heap1[j]]);
   downheap(j);
  end;
end;
procedure push(x,y:longint);
begin
 inc(nheap);
 heap[nheap]:=x;
 heap1[nheap]:=y;
 pos[x,y]:=nheap;
 upheap(nheap);
end;
procedure pop;
begin
 x1:=heap[1];
 y1:=heap1[1];
 heap[1]:=heap[nheap];
 heap1[1]:=heap1[nheap];
 pos[heap[1],heap1[1]]:=1;
 dec(nheap);
 downheap(1);
end;
procedure Dijks(s:longint);
var i,j,v:longint;
begin
 for i:=1 to top do
  for j:=1 to k do
   begin
    d[i,j]:=oo;       pos[i,j]:=0;
   end;
 d[s,1]:=0;  nheap:=0;
 push(s,1);
 repeat
  pop;
  j:=head[x1];
  while j<>0 do
   begin
    v:=ke[j];
    if (y1<k) then
    if d[v,y1+1]>d[x1,y1]+ts[j] then
     begin
      d[v,y1+1]:=d[x1,y1]+ts[j];
      if pos[v,y1+1]=0 then push(v,y1+1)
      else upheap(pos[v,y1+1]);
     end;
    j:=next[j];
   end;
 until nheap=0;
 for i:=1 to top do
 if i<>s then
  for j:=3 to k do
   if (d[i,j]<>oo) then res:=max(Res,res1-d[i,j]-ts1[i,s]);
end;
procedure xuli1;
var i,j:longint; c,tmp:int64;
begin
 dec(top);
 for i:=1 to top do
 begin
  c:=0;
  for j:=i+1 to top do
   begin
    inc(canh);
    c:=tinh(a[stack[j-1]],a[stack[j]])+c;
    tmp:=c+tinh(a[stack[j]],a[stack[i]]);
    add(canh,i,j,tmp);
    ts1[i,j]:=tmp;
   end;
  for j:=1 to i-1 do
   begin
    c:=tinh(a[stack[j-1]],a[stack[j]])+c;
    tmp:=c+tinh(a[stack[j]],a[stack[i]]);
    ts1[i,j]:=tmp;
   end;
 end;
 for j:=1 to top do Dijks(j);
 if res mod 2=0 then
  begin
   res:=res div 2;
   write(REs,'.00');
  end
 else
  begin
   res:=res div 2;
   write(res,'.50');
  end;
end;


begin
 assign(input,'poly.inp');reset(input);
 assign(output,'poly.out');rewrite(output);
 nhap;
 xuli;
 xuli1;
 close(input); close(output);
end.
