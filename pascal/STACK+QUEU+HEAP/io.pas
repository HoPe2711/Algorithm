var ch:char;
    k,nheap,h:longint;
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
var i,kq:longint;
begin
  if ch='+' then
   begin
    push(k);
   end
  else
   begin
    for i:=1 to nheap do
     begin
      if pop<kq then push(pop);
      kq:=pop;
     end;
   end;
end;
begin
 assign(input,'io.inp');reset(input);
 assign(output,'io.out');rewrite(output);
 while not seekeof do
  begin
   readln(ch);
   readln(k);
   xuli;
  end;
 writeln(nheap);
 for h:=1 to nheap do write(heap[i],' ');
 close(input);close(output);
end.