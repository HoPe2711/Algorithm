var n,nheap:longint;
    res,tg,tg1:int64;
    a,c,dd,heap:array[1..10000] of longint;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do
  begin
   read(a[i],c[i]);
   dd[i]:=a[i]-c[i];
  end;
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
 if (i=1) or (heap[i]<=heap[i div 2]) then exit;
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
var i:longint;
begin
 for i:=1 to n do
  begin
   push(dd[i]);
   if i mod 2=1 then tg:=tg+pop;
  end;
 for i:=1 to n do tg1:=tg1+a[i];
 res:=tg1-tg;
 write(res);
end;
BEGIN
  assign(input,'pilot.inp');reset(input);
  assign(output,'pilot.out');rewrite(output);
  nhap;
  xuli;
  close(input);close(output);
END.

