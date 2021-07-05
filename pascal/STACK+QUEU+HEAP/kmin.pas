type
 node=record
 s,vt1,vt2:longint;
end;
var  m,n,k,nheap,x,y:longint;
     a,b:array[1..50000] of longint;
     heap:array[1..50000] of node;
procedure nhap;
var i:longint;
begin
 read(m,n,k);
 for i:=1 to m do read(a[i]);
 for i:=1 to n do read(b[i]);
end;
procedure doicho1(var x,y:node);
var
 tg:node;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure doicho(var x,y:longint);
var
 tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure sort1(l,r:longint);
var i,j,mid:longint;
begin
        i:=l;
        j:=r;
        mid:=a[l+random(r-l+1)];
        repeat
         while a[i]<mid do inc(i);
         while a[j]>mid do dec(j);
         if i<=j then
          begin
           doicho(a[i],a[j]);
           inc(i);
           dec(j);
          end;
        until i>j;
        if l<j then sort1(l,j);
        if i<r then sort1(i,r);
end;
procedure sort2(l,r:longint);
var i,j,mid:longint;
begin
        i:=l;
        j:=r;
        mid:=b[l+random(r-l+1)];
        repeat
         while b[i]<mid do inc(i);
         while b[j]>mid do dec(j);
         if i<=j then
          begin
           doicho(b[i],b[j]);
           inc(i);
           dec(j);
          end;
        until i>j;
        if l<j then sort2(l,j);
        if i<r then sort2(i,r);
end;
procedure upheap(i:longint);
begin
 if (i=1) or (heap[i].s>=heap[i div 2].s) then exit;
 doicho1(heap[i],heap[i div 2]);
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
   doicho1(heap[i],heap[j]);
   downheap(j);
  end;
end;
procedure push(h,i,j:longint);
begin
 inc(nheap);
 heap[nheap].s:=h;
 heap[nheap].vt1:=i;
 heap[nheap].vt2:=j;
 upheap(nheap);
end;
function pop:longint;
begin
 pop:=heap[1].s;
 x:=heap[1].vt1;
 y:=heap[1].vt2;
 heap[1]:=heap[nheap];
 dec(nheap);
 downheap(1);
end;
procedure xuli;
var i:longint;
begin
 for i:=1 to n do push(a[1]+b[i],1,i);
 for i:=1 to k do
  begin
   writeln(pop);
   if x<m then push(a[x+1]+b[y],x+1,y);
 end;
end;
begin
 assign(input,'kmin.inp');reset(input);
 assign(output,'kmin.out');rewrite(output);
 nhap;
 sort1(1,m);
 sort2(1,n);
 xuli;
 close(input);
 close(output);
end.
