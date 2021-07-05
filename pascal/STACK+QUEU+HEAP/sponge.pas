var a,heap:array[1..100000] of longint;
    n,nheap:longint;
    res:int64;
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
{procedure pop;
begin
 pop:=heap[1];
 heap[1]:=heap[nheap];
 dec(nheap);
 downheap(1);
end;  }
procedure xuli;
var i:longint;
begin
 push(a[1]);
 for i:=2 to n do
  begin
   res:=heap[1]+res;
   heap[1]:=heap[1]*2;
   downheap(1);
   push(a[i]);
  end;
 write(res);
end;
BEGIN
  assign(input,'sponge.in');reset(input);
  assign(output,'sponge.out');rewrite(output);
  nhap;
  xuli;
  close(input);close(output);
END.