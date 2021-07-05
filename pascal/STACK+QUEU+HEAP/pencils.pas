uses math;
const oo=1000000000;
var  n,k,nheap:longint;
     heap,a,b:array[1..100000] of longint;
procedure nhap;
var  i,m,x,j:longint;
begin
 read(n,k);
 for i:=1 to n do
  begin
   read(m); a[i]:=oo; b[i]:=0;
   for j:=1 to m do
    begin
     read(x);
     a[i]:=min(a[i],x);
     b[i]:=max(b[i],x);
    end;
  end;
end;
procedure doicho(var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
Procedure Qsort(l,r:longint);
Var
  i,j,key:longint;
  Begin
    i:=l;
    j:=r;
    key:=a[l+random(r-l+1)];
    repeat
      while a[i] < key do inc(i);
      while a[j] > key do dec(j);
      if i <= j then
      Begin
      doicho(a[i],a[j]);
      doicho(b[i],b[j]);
      inc(i);
      dec(j);
      End;
    until i > j;
    if l < j then Qsort(l,j);
    if i < r then Qsort(i,r);
  End;
procedure upheap(i:longint);
begin
 if (i=1) or (heap[i]<heap[i div 2]) then exit;
 doicho(heap[i],heap[i div 2]);
 upheap(i div 2);
end;
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
begin
 pop:=heap[1];
 heap[1]:=heap[nheap];
 dec(nheap);
 downheap(1);
end;
procedure xuli;
var  i,res:longint;
begin
 qsort(1,n);  res:=oo;
 for i:=n downto 1 do
  begin
   if nheap<k then
    begin
     push(b[i]);
     res:=heap[1]-a[i];
    end
   else
   if heap[1]>b[i] then
    begin
     pop;
     push(b[i]);
     res:=min(res,heap[1]-a[i]);
    end;
  end;
 write(res);
end;
begin
 assign(input,'pencils.inp');reset(input);
 assign(output,'pencils.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
