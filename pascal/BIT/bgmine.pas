uses math;
const oo=high(int64);
var n,limit:longint;
    res:int64;
    x,g,r:Array[0..400000] of longint;
    a,pos,sum,gold,t,b:array[0..400000] of int64;
procedure nhap;
var i:longint;
begin
 read(n);
 sum[0]:=0;
 for i:=1 to n do
  begin
   read(x[i],g[i],r[i]);
   gold[i]:=gold[i-1]+g[i];
   sum[i]:=sum[i-1]+r[i];
  end;
 for i:=1 to n do
  begin
   a[i]:=sum[i]-x[i];
   pos[i]:=i;
  end;
 for i:=1 to n do
  begin
   a[i+n]:=sum[i-1]-x[i];
   pos[i+n]:=i+n;
  end;
end;
procedure swap(var x,y:int64);
var tg:int64;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure qsort(l,r:longint);
var  i,j:longint;    mid:int64;
begin
 i:=l;
 j:=r;
 mid:=a[l+random(r-l+1)];
 repeat
  while a[i]<mid do inc(i);
  while a[j]>mid do dec(j);
  if i<=j then
   begin
    swap(a[i],a[j]);
    swap(pos[i],pos[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure update(i,x:int64);
begin
 while i<=limit do
  begin
   t[i]:=min(t[i],x);
   i:=i+i and (-i);
  end;
end;
function get(i:longint):int64;
begin
 get:=oo;
 while i>0 do
  begin
   get:=min(get,t[i]);
   i:=i-i and (-i);
  end;
end;
procedure xuli;
var i:longint;
begin
 qsort(1,2*n);
 limit:=1;
 b[pos[1]]:=limit;
 for i:=2 to 2*n do
  if a[i]>a[i-1] then
   begin
    inc(limit);
    b[pos[i]]:=limit;
   end
  else b[pos[i]]:=limit;
 for i:=1 to 2*limit do t[i]:=oo;
 update(b[n+1],0);
 for i:=1 to n do
  begin
   res:=max(res,gold[i]-get(b[i]));
   if i<n then update(b[i+n+1],gold[i]);
  end;
 write(res);
end;
begin
 assign(input,'bgmine.inp');reset(input);
 assign(output,'bgmine.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
