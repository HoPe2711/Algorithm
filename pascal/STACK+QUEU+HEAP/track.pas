type
 node=record
 s,p:longint;
end;
var n,k,nheap,y,dem:longint;
    a,b,pp:array[1..500000] of longint;
    heap:array[1..500000] of node;
procedure nhap;
var i:longint;
begin
 read(k,n);
 for i:=1 to n do read(a[i],b[i]);
end;
procedure doicho(var x,y:node);
var tg:node;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure upheap(i:longint);
begin
 if (i=1) or (heap[i].s>=heap[i div 2].s) then exit;
 doicho(heap[i],heap[i div 2]);
 upheap(i div 2);
end;
procedure downheap(i:longint);
var j:longint;
begin
 j:=2*i;
 if j>nheap then exit;
 if (j<nheap) and (heap[j].s>heap[j+1].s) then inc(j);
 if heap[i].s>heap[j].s then
  begin
   doicho(heap[i],heap[j]);
   downheap(1);
  end;
end;
procedure push(x,k1:longint);
begin
 inc(nheap);
 heap[nheap].s:=x;
 heap[nheap].p:=k1;
 upheap(nheap);
end;
function pop:longint;
begin
 pop:=heap[1].s;
 y:=heap[1].p;
 heap[1]:=heap[nheap];
 dec(nheap);
 downheap(1);
end;
procedure xuli;
var i,y1,kq,kq1,j:longint;
begin
 for i:=1 to n do
  if i<=k then
   begin
    push(b[i],i);
    inc(dem);
    pp[dem]:=i;
   end
  else
   begin
    if heap[1].s>a[i] then
     begin
      writeln(0,' ',i);
      halt;
     end
    else
     if heap[1].s=a[i] then
      begin
       writeln(0,' ',i);
       kq:=pop;
       halt;
      end
     else
      begin
       kq:=pop;
       y1:=y;
       inc(dem);
       pp[dem]:=y;
       for j:=1 to nheap do
        if heap[j].s<=a[i] then kq1:=pop;
       push(b[i],y1);
      end;
   end;
  for i:=1 to dem do writeln(pp[i]);
end;
begin
 assign(input,'track.inp');reset(input);
 assign(output,'track.out');rewrite(output);
 nhap;
 xuli;
 close(input);
 close(output);
end.
