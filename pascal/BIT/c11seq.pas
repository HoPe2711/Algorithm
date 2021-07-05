var n,l,r,res,limit:longint;
    a,b,t:array[0..500000] of longint;
    sum,pos:array[0..500000] of int64;
procedure nhap;
var i:longint;
begin
 read(n,l,r);
 sum[0]:=0; pos[0]:=0;
 for i:=1 to n do
  begin
   read(a[i]);
   sum[i]:=sum[i-1]+a[i];
   pos[i]:=i;
  end;
 for i:=n+1 to 2*n do
  begin
   sum[i]:=sum[i-n]-l;
   pos[i]:=i;
  end;
 for i:=2*n+1 to 3*n do
  begin
   sum[i]:=sum[i-2*n]-r;
   pos[i]:=i;
  end;
end;
procedure doicho(var x,y:int64);
var tg:int64;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure qsort(l,r:longint);
var i,j:longint;
    mid:int64;
begin
 i:=l;
 j:=r;
 mid:=sum[l+random(r-l+1)];
 repeat
  while sum[i]<mid do inc(i);
  while sum[j]>mid do dec(j);
  if i<=j then
   begin
    doicho(sum[i],sum[j]);
    doicho(pos[i],pos[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure update(i,x:longint);
begin
 while i<=limit do
  begin
   t[i]:=t[i]+x;
   i:=i + (i and (-i));
  end;
end;
function get(i:longint):longint;
var x:longint;
begin
 x:=0;
 while i>0 do
  begin
   x:=x+t[i];
   i:=i-(i and (-i));
  end;
 exit(x);
end;
procedure xuli;
var i:longint;
begin
 qsort(0,3*n);
 limit:=1;
 b[pos[0]]:=1;
 for i:=1 to 3*n do
 begin
  if sum[i]<>sum[i-1] then inc(limit);
  b[pos[i]]:=limit;
 end;
 update(b[0],1);
 for i:=1 to n do
  begin
   res:=res+get(b[i+n])-get(b[i+2*n]-1);
   update(b[i],1);
  end;
 write(res);
end;
begin
// assign(input,'c11seq.inp'); reset(input);
 nhap;
 xuli;
// close(input);
end.
