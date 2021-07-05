uses math;
var n,t,res,nheap:longint;
    heap,d,a,res1,tt:array[0..200003] of longint;
procedure nhap;
var i:longint;
begin
 read(n,t);
 for i:=1 to n do read(a[i],d[i]);
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
 if (i=1) or (d[heap[i]]>=d[heap[i div 2]]) then exit;
 doicho(heap[i],heap[i div 2]);
 upheap(i div 2);
end;
procedure downheap(i:longint);
var j:longint;
begin
 j:=2*i;
 if j>nheap then exit;
 if (j<nheap) and (d[heap[j]]>d[heap[j+1]]) then inc(j);
 if d[heap[i]]>=d[heap[j]] then
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
function check(x:longint):boolean;
var  i,dem,sum,u:longint;
begin
 nheap:=0;
 fillchar(heap,sizeof(heap),0);
 for i:=1 to n do
  if a[i]>=x then push(i);
 dem:=0; sum:=0;
 if nheap<x then exit(False);
 for i:=1 to x do
  begin
   u:=pop;
   sum:=sum+d[u];
   inc(dem); tt[dem]:=u;
  end;
 if sum<=t then
  begin
   for i:=1 to dem do res1[i]:=tt[i];
   exit(true);
  end;
 exit(falsE);
end;
procedure xuli;
var l,r,mid,i:longint;
begin
 l:=0;
 r:=n;
 while l<=r do
  begin
   mid:=(l+r) div 2;
   if check(mid) then
    begin
     res:=mid;
     l:=mid+1;
    end
   else r:=mid-1;
  end;
 writeln(reS);
 writeln(res);
 for i:=1 to res do write(res1[i],' ');
end;
begin
// assign(input,'d913.inp');reset(input);
// assign(output,'d913.out');rewrite(output);
 nhap;
 xuli;
// close(input); close(output);
end.