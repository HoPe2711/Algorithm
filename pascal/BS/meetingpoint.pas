uses math;
const oo=1000000000000000;
var n,m,k,nheap:longint;
    pos:array[0..200000] of longint;
    d,d1,left,right:array[0..200000] of int64;
    b:array[0..200000] of real;
    ke,next,head,ts,heap:array[-300000..300000] of longint;
procedure doicho(var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end ;
procedure swap(var x,y:int64);
var tg:int64;
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
 ke[-i]:=u;
 next[-i]:=head[v];
 head[v]:=-i;
 ts[-i]:=c;
end;
procedure nhap;
var i,u,c,v:longint;
begin
 read(n,m,k);
 for i:=1 to m do
  begin
   read(u,v,c);
   add(i,u,v,c);
  end;
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
begin
 Dijks(n);
 d1:=d;
 dijks(1);
end;
procedure doicho1(var x,y:real);
var tg:real;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure qsort(l,r:longint);
var i,j:longint; mid:real;
begin
 i:=l;
 j:=r;
 mid:=b[l+random(r-l+1)];
 repeat
  while b[i]<mid do inc(I);
  while b[j]>mid do dec(j);
  if i<=j then
   begin
    doicho1(b[i],b[j]);
    swap(d[i],d[j]);
    swap(d1[i],d1[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
function find(l,r:longint; x :real):longint;
var kq,mid:longint;
begin
 kq:=0;
 while l<=r do
  begin
   mid:=(l+r) div 2;
   if b[mid]<=x then
    begin
     kq:=mid;
     l:=mid+1;
    end
   else r:=mid-1;
  end;
 exit(kq);
end;
function find1(l,r:longint; x :real):longint;
var  kq,mid:longint;
begin
 kq:=0;
 while l<=r do
  begin
   mid:=(l+r) div 2;
   if b[mid]>=x then
    begin
     kq:=mid;
     r:=mid-1;
    end
   else l:=mid+1;
  end;
 exit(kq);
end;
procedure xuli2;
var  i,trans,p,q:longint;   ans:real; res:int64;
begin

 for i:=1 to n-1 do b[i]:=d[i]/d1[i];
 qsort(1,n-1);
 b[n]:=oo;
 left[0]:=oo;
 for i:=1 to n do left[i]:=min(left[i-1],d1[i]);
 right[n+1]:=oo;
 for i:=n downto 1 do right[i]:=min(right[i+1],d[i]);
 for i:=1 to k do
  begin
   read(p,q);
   ans:=q/p;
   trans:=find(1,n,ans);
   res:=q*left[trans];
   trans:=find1(1,n,ans);
   res:=min(res,p*right[trans]);
   writeln(res);
  end;
end;
begin
 assign(input,'meetingpoint.inp');reset(input);
 assign(output,'meetingpoint.out');rewrite(output);
 nhap;
 xuli;
 xuli2;
 closE(input); close(output);
end.