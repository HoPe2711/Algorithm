var n,k,p,res,nheap:longint;
    a,next:array [0..500000] of longint;
    d,pos,heap,vt:array [0..100000] of longint;
    free:array [0..100000] of boolean;
procedure nhap;
  var i:longint;
   begin
    read(n,k,p);
    for i := 1 to p do read(a[i]);
    for i := 1 to n do vt[i] := p+1;
    for i := p downto 1 do
     begin
      next[i] := vt[a[i]];
      vt[a[i]] := i;
     end;
   end;
procedure doicho(var x,y:longint);
  var tmp:longint;
   begin
    tmp := x;
    x := y;
    y := tmp;
   end;

procedure upheap(i:longint);
  begin
   if (i = 1) or (d[heap[i]] <= d[heap[i div 2]]) then exit;
   doicho(heap[i],heap[i div 2]);
   doicho(pos[heap[i]],pos[heap[i div 2]]);
   upheap(i div 2);
  end;
procedure downheap(i:longint);
  var j:longint;
   begin
    j := 2*i;
    if j > nheap then exit;
    if (j < nheap) and (d[heap[j]] < d[heap[j+1]]) then inc(j);
    if d[heap[i]] < d[heap[j]] then
     begin
      doicho(heap[i],heap[j]);
      doicho(pos[heap[i]],pos[heap[j]]);
      downheap(j);
     end;
   end;
procedure push(x,i:longint);
  begin
   inc(nheap);
   heap[nheap] := x;
   pos[x] := nheap;
   d[x] := next[i];
   upheap(nheap);
  end;
function pop:longint;
  begin
   pop := heap[1];
   heap[1] := heap[nheap];
   dec(nheap);
   downheap(1);
  end;
procedure xuly;
var i,x:longint;
   begin
    fillchar(free,sizeof(free),true);
    for i := 1 to p do
     if free[a[i]] = false then
      begin
       d[a[i]] := next[i];
       upheap(pos[a[i]]);
      end
     else
      begin
       inc(res);
       if nheap = k then
        begin
         x := pop;
         free[x] := true;
        end;
       push(a[i],i);
       free[a[i]] := false;
      end;
    write(res);
   end;
begin
 assign(input,'toycars.inp');reset(input);
 assign(output,'toycars.out');rewrite(output);
 nhap;
 xuly;
 close(input);close(output);
end.
