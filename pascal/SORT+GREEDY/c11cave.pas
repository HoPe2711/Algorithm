uses math;
type arr=array[0..500000] of longint;
var  n,h,first,res,res1,dem,dem1,last:longint;
     c,a,c1,dd,dd1:arr;
procedure nhap;
var i:longint;
begin
 read(n,h);
 for i:=1 to n do read(a[i]);
end;
procedure doicho(var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure qsort(var x:arr;l,r:longint);
var i,j,mid:longint;
begin
 i:=l;
 j:=r;
 mid:=x[l+random(r-l+1)];
 repeat
  while x[i]<mid do inc(i);
  while x[j]>mid do dec(j);
  if i<=j then
   begin
    doicho(x[i],x[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(x,i,r);
 if l<j then qsort(x,l,j);
end;
procedure xuli;
var i:longint;
begin
 for i:=1 to n do
  if i mod 2=1 then
   begin
    inc(dem);
    c[dem]:=a[i];
   end
 else
  begin
   inc(dem1);
   c1[dem1]:=h-a[i];
  end;
 for i:=1 to h do dd[i]:=-1;
 for i:=1 to h do dd1[i]:=-1;
 qsort(c,1,dem);
 qsort(c1,1,dem1);


 for i:=dem1 downto 1 do
  if c1[i]<>c1[i-1] then dd[c1[i]]:=i-1;
 last:=dem1;
 for i:=h downto 1 do
  if dd[i]=-1 then dd[i]:=last
  else last:=dd[i];

 first:=1;
 for i:=1 to dem  do
  if c[i]<>c[i+1] then
   begin
    dd1[c[i]]:=dem-first+1;
    first:=i+1;
  end;
 last:=0;
 for i:=h downto 1 do
   if dd1[i]=-1 then dd1[i]:=last
   else last:=dd1[i];
 res:=200000;
 for i:=1 to h do
  if dd[i]+dd1[i]<res then
   begin
    res:=dd[i]+dd1[i];
    res1:=1;
   end
  else if dd[i]+dd1[i]=res then inc(res1);
 write(res,' ',res1);
end;
begin
// assign(input,'c11cave.inp');reset(input);
 nhap;
 xuli;
// close(input);
end.