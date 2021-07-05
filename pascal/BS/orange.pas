uses math;
var n,res,k:longint;
    a:array[0..200000] of longint;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do read(A[i]);
 read(k);
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
function find(l,r,x:longint):longint;
var mid,kq:longint;
begin
 kq:=0;
 while l<=r do
  begin
   mid:=(l+r) div 2;
   if a[mid]<x then
    begin
     kq:=mid;
     l:=mid+1;
    end
   else  r:=mid-1;
  end;
 exit(kq);
end;
procedure xuli;
var  i,tmp:longint;
begin
 qsort(1,n);
 for i:=1 to n do
  begin
   tmp:=find(1,i,a[i]-k);
   res:=max(res,i-tmp);
  end;
 write(res);
end;
begin
 assign(input,'orange.inp');reset(input);
 assign(output,'orange.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
