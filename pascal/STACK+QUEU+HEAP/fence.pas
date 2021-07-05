var n,nheap:longint;
    res:int64;
    a,heap:array[1..20001] of int64;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do read(a[i]);
end;
procedure doicho(var x,y:int64);
var
 tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure upheap(i:longint);
begin
 if (i=1) or (heap[i]>=heap[i div 2]) then exit;
 doicho(heap[i],heap[i div 2]);
 upheap(i div 2);
end;
procedure downheap(i:longint);
var j:longint;
begin
 j:=2*i;
 if j>nheap then exit;
 if (j<nheap) and (heap[j]>heap[j+1]) then inc(j);
 if heap[i]>heap[j] then
  begin
   doicho(heap[i],heap[j]);
   downheap(j);
  end;
end;
procedure push(x:int64);
begin
 inc(nheap);
 heap[nheap]:=x;
 upheap(nheap);
end;
function pop:int64;
begin
 pop:=heap[1];
 heap[1]:=heap[nheap];
 dec(nheap);
 downheap(1);
end;
procedure xuli;
var i:longint;
    x,y,k:int64;
begin
 for i:=1 to n do push(a[i]);
 for i:=1 to n-1 do
  begin
   x:=pop;
   res:=res+x;
   y:=pop;
   res:=res+y;
   push(x+y);
  end;
 write(res);
end;
begin
 assign(input,'fence.inp');reset(input);
 assign(output,'fence.out');rewrite(output);
 nhap;
 xuli;
 close(input);
 close(output);
end.
