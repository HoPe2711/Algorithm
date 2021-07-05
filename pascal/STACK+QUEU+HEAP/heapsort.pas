var a,heap:array[1..100000] of longint;
    n,nheap:longint;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do read(a[i]);
end;
Procedure doicho(var x,y:longint);
Var
  tg:longint;
  Begin
    tg:=x;
    x:=y;
    y:=tg;
  End;
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
var i:longint;
begin
 for i:=1 to n do push(a[i]);
 for i:=1 to n do write(pop,' ');
end;
BEGIN
  assign(input,'heapsort.inp');reset(input);
  assign(output,'heapsort.out');rewrite(output);
  nhap;
  xuli;
  close(input);close(output);
END.

