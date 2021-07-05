uses math;
const oo=1000000000;
type node=record
     l,r:longint;
end;
var  n,dem,nheap:longint;
     a,b,h,pos,trace,vt,heap,b1,a1,pos2,h1:array[0..1000000] of longint;
     pos1:array[0..1000000] of node;
     f:Array[0..1000000] of int64;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do
  begin
   read(a[i],b[i],h[i]);
   pos[i]:=i;
  end;
end;
procedure doicho(var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure qsort(l,r:longint);
var i,j,key:longint;
begin
 i:=l;
 j:=r;
 key:=b[(l+r) div 2];
 repeat
  while (b[i]<key) do inc(i);
  while (b[j]>key) do dec(j);
  if i<=j then
   begin
    doicho(a[i],a[j]);
    doicho(b[i],b[j]);
    doicho(h[i],h[j]);
    doicho(pos[i],pos[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if l < j then Qsort(l,j);
 if i < r then Qsort(i,r);
end;
procedure xuli;
var i,j,kq,x:longint;
begin
 qsort(1,n);
 f[0]:=0;
 for i:=1 to n do pos1[b[i]].l:=oo;
 for i:=1 to n do
  begin
   pos1[b[i]].l:=min(pos1[b[i]].l,i);
   pos1[b[i]].r:=max(pos1[b[i]].r,i);
  end;
 for x:=1 to b[n] do
  begin
   f[x]:=f[x-1];
   trace[x]:=x-1;
   if (pos1[x].l<>oo) and (pos1[x].r<>0) then
   for i:=pos1[x].l to pos1[x].r do
    if f[x]<= f[a[i]]+h[i]then
     begin
      f[x]:=f[a[i]]+h[i];
      trace[x]:=a[i];
      vt[x]:=i;
     end;
  end;
 writeln(f[b[n]]);
 kq:=b[n];
 while kq>0 do
  begin
   if vt[kq]<>0 then write(pos[vt[kq]],' ');
   kq:=trace[kq];
  end;
end;
begin
 assign(input,'tower.inp');reset(input);
 assign(output,'tower.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.

{procedure upheap(i:longint);
begin
 if (i=1) or (b[heap[i]]>=b[heap[i div 2]]) then exit;
 doicho(heap[i],heap[i div 2]);
 upheap(i div 2);
end;
procedure downheap(i:longint);
var j:longint;
begin
 j:=2*i;
 if j>nheap then exit;
 if (j<nheap) and (b[heap[j]]>b[heap[j+1]]) then inc(j);
 if b[heap[i]]>b[heap[j]] then
  begin
   doicho(heap[i],heap[j]);
   downheap(j);
  end;
end;
function pop:longint;
begin
 pop:=heap[1];
 heap[1]:=heap[nheap];
 dec(nheap);
 downheap(1);
end;
procedure push(x:longint);
begin
 inc(nheap);
 heap[nheap]:=x;
 upheap(nheap);
end;
procedure qsort;
var i,t:longint;
begin
 for i:=1 to n do push(i);
 for i:=1 to n do
  begin
   t:=pop;
   b1[i]:=b[t];
   a1[i]:=a[t];
   pos2[i]:=pos[t];
   h1[i]:=h[t];
  end;
 b:=b1; a:=a1; pos:=pos2; h:=h1;
end; }
