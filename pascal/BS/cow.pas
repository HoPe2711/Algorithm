uses math;
var  maxx,n,c,res,t,h:longint;
     a:array[0..200000] of longint;
procedure nhap;
var i:longint;
begin
 read(n,c); maxx:=0;
 for i:=1 to n do
  begin
   read(a[i]);
   maxx:=max(a[i],maxx);
  end;
end;

procedure doicho(Var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure qsort(l,r:longint);
var i,j:longint; mid:longint;
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
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
function check(X:longint):boolean;
var last,dem,i:longint;
begin
 last:=1; dem:=1;
 for i:=2 to n do
  if a[i]-a[last]>=x then
   begin
    inc(dem);
    last:=i;
   end;
 if dem>=c then exit(true);
 exit(falsE);
end;
procedure xuli;
var  l,r,mid:longint;
begin
 qsort(1,n);
 l:=1; r:=maxx;
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
 writeln(res);
end;
begin
 assign(input,'cow.inp'); reset(input);
 assign(output,'cow.out');rewrite(output);
 read(t);
 for h:=1 to t do
  begin
   nhap;
   xuli;
  end;
 close(input); close(output);
end.
