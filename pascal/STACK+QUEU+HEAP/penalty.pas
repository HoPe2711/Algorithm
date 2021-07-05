uses math;
var n,a,b,nheap:longint;
    res1:int64;
    t,p,heap:array[0..100001] of longint;
procedure doicho(var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure upheap(i:longint);
begin
 if (i=1) or (heap[i]<heap[i div 2]) then exit;
 doicho(heap[i],heap[i div 2]);
 upheap(i div 2);
End;
procedure downheap(i:longint);
var j:longint;
begin
 j:=2*i;
 if j>nheap then exit;
 if (j<nheap) and (heap[j]<heap[j+1]) then inc(j);
 if heap[i]<heap[j] then
  begin
   doicho(heap[i],heap[j]);
   downheap(j);
  end;
end;
procedure push(x:longint);
begin
 inc(nheap);
 heap[nheap]:=x;
 upheap(nheap);
end;
function pop:longint;
var j:longint;
begin
 pop:=heap[1];
 heap[1]:=heap[nheap];
 dec(nheap);
 downheap(1);
end;
Procedure Qsort(l,r:longint);
Var
  i,j,key:longint;
  Begin
    i:=l;
    j:=r;
    key:=t[(l+r) div 2];
    repeat
      while t[i] > key do inc(i);
      while t[j] < key do dec(j);
      if i <= j then
      Begin
      doicho(t[i],t[j]);
      doicho(p[i],p[j]);
      inc(i);
      dec(j);
      End;
    until i > j;
    if l < j then Qsort(l,j);
    if i < r then Qsort(i,r);
  End;
procedure nhap;
var i:longint;
begin
 read(n,a,b);
 for i:=1 to n do
  begin
   read(t[i],p[i]);
   res1:=res1+p[i];
  end;
 t[n+1]:=-1;
 qsort(1,n);
end;
procedure xuli;
var i,td,k,x,j:longint;
begin
 td:=b;
 k:=1;
 while t[k]>b do
  begin
   push(p[k]);
   inc(k);
  end;
 for i:=k to n+1 do
 if td>a then
  begin
   x:=t[i-1]-t[i];
   for j:=1 to min(x,nheap) do
    if td>a then
     begin
      dec(td);
      res1:=res1-pop;
     end;
   td:=t[i];
   push(p[i]);
  end;
 write(res1);
end;
begin
 assign(input,'penalty.inp');reset(input);
 assign(output,'penalty.out');rewrite(output);
 nhap;
 xuli;
 close(input);
 close(output);
end.
