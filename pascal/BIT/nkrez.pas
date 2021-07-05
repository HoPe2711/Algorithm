uses math;
var  n,limit,res:longint;
     a,b,t,f:array[0..500000] of longint;
procedure nhap;
var  i:longint;
begin
 read(n);
 for i:=1 to n do
  begin
   read(a[i],b[i]);
   inc(a[i]);
   inc(b[i]);
   limit:=max(limit,b[i]);
  end;
end;
procedure update(i,x:longint);
begin
 while i<=limit do
  begin
   t[i]:=max(t[i],x);
   i:=i+(i and (-i));
  end;
end;
function get(i:longint):longint;
var x:longint;
begin
 x:=0;
 while i>0 do
  begin
   x:=max(x,t[i]);
   i:=i - (i and (-i));
  end;
 exit(x);
end;
procedure doicho(var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure qsort(l,r:longint);
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
    doicho(b[i],b[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure xuli;
var i:longint;
begin
 qsort(1,n);
 for i:=1 to n do
  begin
   f[i]:=get(a[i])+b[i]-a[i];
   update(b[i],f[i]);
  end;
 for i:=1 to n do res:=max(res,f[i]);
 write(res);
end;
begin
 //assign(input,'nkrez.inp'); reset(input);
 nhap;
 xuli;
 //close(input);
end.