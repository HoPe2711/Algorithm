uses math;
var n,nheap:longint;
    t,c,left,right,heap:array[0..20000] of longint;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do read(c[i],t[i]);
end;

procedure swap(var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;

procedure qsort(l,r:longint);
var  i,j,mid,key,key1:longint;
begin
 i:=l;
 j:=r;
 mid:=random(r-l+1)+l;
 key:=left[mid]; key1:=right[mid];
 repeat
  while (left[i]<key) or ((left[i]=key) and (right[i]<key1)) do inc(i);
  while (left[j]>key) or ((left[j]=key) and (right[j]>key1)) do dec(j);
  if i<=j then
   begin
    swap(left[i],left[j]);
    swap(right[i],right[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;

procedure upheap(i:longint);
begin
 if (i=1) or (right[heap[i]]>right[heap[i div 2]]) then exit;
 swap(heap[i],heap[i div 2]);
 upheap(i div 2);
end;
procedure downheap(i:longint);
var j:longint;
begin
 j:=2*i;
 if j>nheap then exit;
 if (j<nheap) and (right[heap[j]]>right[heap[j+1]]) then inc(j);
 if right[heap[i]]>right[heap[j]] then
  begin
   swap(heap[i],heap[j]);
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
var i,j,u:longint;
begin
 for i:=1 to n do
  begin
   left[i]:=max(c[i]-x div t[i],1);
   right[i]:=min(c[i]+x div t[i],n);
  end;
 qsort(1,n);
 nheap:=0;
 //for i:=1 to n do heap[i]:=0;
 j:=1;
 for i:=1 to n do
  begin
   while (j<=n) and (left[j]<=i) do
    begin
     push(j);
     inc(j);
    end;
   if nheap=0 then exit(false);
   u:=pop;
   if right[u]<i then exit(false);
  end;
 exit(true);
end;
procedure xuli;
var l,r,mid,res:longint;
begin
 l:=0;
 r:=100000000;
 while l<=r do
  begin
   mid:=(l+r) div 2;
   if check(mid) then
    begin
     res:=mid;
     r:=mid-1;
    end
   else l:=mid+1;
  end;
 write(res);
end;
begin
 assign(input,'move12.inp'); reset(input);
 assign(output,'move12.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.