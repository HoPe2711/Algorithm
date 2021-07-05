var n,nheap,t:longint;
    res,sum:int64;
    r,p,heap:array[1..100001] of longint;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do read(r[i],p[i]);
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
Procedure Qsort(l,h:longint);
Var
  i,j:longint;
  key,key1:longint;
  Begin
    i:=l;
    j:=h;
    key:=l+random(h-l+1);
    key1:=r[key];
    repeat
      while (r[i] < key1)  do inc(i);
      while (r[j] > key1)  do dec(j);
      if i <= j then
      Begin
        doicho(r[i],r[j]);
        doicho(p[i],p[j]);
        inc(i);
        dec(j);
      End;
    until i > j;
    if l < j then Qsort(l,j);
    if i < h then Qsort(i,h);
  End;
procedure xuli;
var i,x:longint;
begin
 sum:=r[1];
 push(p[1]);
 for i:=2 to n do
  begin
   t:=r[i]-r[i-1];
   while (nheap>0) and (t>0) do
    begin
     x:=pop;
     if x<=t then
      begin
       t:=t-x;
       sum:=sum+x;
       res:=res+sum;
      end
     else
      begin
       push(x-t);
       t:=0;
      end;
     end;
    push(p[i]);
    sum:=r[i];
  end;
 while nheap>0 do
  begin
   x:=pop;
   sum:=sum+x;
   res:=res+sum;
  end;
 write(res);
end;
BEGIN
  assign(input,'pulp.inp');reset(input);
  assign(output,'pulp.out');rewrite(output);
  nhap;
  qsort(1,n);
  xuli;
  close(input);close(output);
END.