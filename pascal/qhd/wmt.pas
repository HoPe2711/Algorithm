uses math;
var a:array[0..1000,0..1000] of longint;
    s:array[0..1000,0..1000] of int64;
    n,m:longint; res:int64;
procedure doicho(Var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure qsort(l,r,p:longint);
var i,j:longint; mid:longint;
begin
 i:=l;
 j:=r;
 mid:=a[p,l+random(r-l+1)];
 repeat
  while a[p,i]<mid do inc(i);
  while a[p,j]>mid do dec(j);
  if i<=j then
   begin
    doicho(a[p,i],a[p,j]);
    inc(i);
    dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r,p);
 if l<j then qsort(l,j,p);
end;
procedure nhap;
var i,j:longint;
begin
 read(m,n);
 for i:=1 to m do
  begin
   for j:=1 to n do read(a[i,j]);
   qsort(1,n,i);
  end;
end;
function find(l,r,p,q:longint):longint;
var kq,mid:longint;
begin
 kq:=0;
 while l<=r do
  begin
   mid:=(l+r) div 2;
   if a[q,n-mid]<=a[p,mid] then
    begin
     kq:=mid;
     r:=mid-1;
    end
   else l:=mid+1;
  end;
 exit(kq);
end;
function tinh(x,i,tg:longint):int64;
begin
 exit(x*tg-s[i,tg]+s[i,n]-s[i,tg]-x*(n-tg));
end;
procedure xuli;
var   i,j,tg:longint;
begin
 for i:=1 to m do
  for j:=1 to n do s[i,j]:=s[i,j-1]+a[i,j];
 for i:=1 to m-1 do
  for j:=i+1 to m do
   begin
    tg:=find(1,n,i,j);
    if a[i,tg]>a[j,n-tg+1] then
     begin
      tg:=find(1,n,j,i);
      res:=res+tinh(a[j,tg],i,n-tg)+tinh(a[j,tg],j,tg);
     end
    else res:=res+tinh(a[i,tg],i,tg)+tinh(a[i,tg],j,n-tg);
   end;
 write(RES);
end;
begin
 assign(input,'wmt.inp');reset(input);
 assign(output,'wmt.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
