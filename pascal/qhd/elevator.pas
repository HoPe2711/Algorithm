var   n,res:longint;
      h,a,c:array[0..400] of longint;
      f:array[0..400,0..40000] of boolean;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do read(h[i],a[i],c[i]);
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
  while (a[i]<mid) do inc(i);
  while (a[j]>mid) do dec(j);
  if i<=j then
   begin
    doicho(a[i],a[j]);
    doicho(c[i],c[j]);
    doicho(h[i],h[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure xuli;
var  i,k,j:longint;
begin
 qsort(1,n);
 f[0,0]:=true;
 for i:=1 to n do
  for k:=0 to a[i-1] do
   if f[i-1,k]=true then
   for j:=0 to c[i] do
    if k+h[i]*j<=a[i] then f[i,k+h[i]*j]:=true;
 for i:=a[n] downto 0 do
  if f[n,i] then
   begin
    res:=i;
    break;
   end;
 write(res);
end;
begin
// assign(input,'elevator.inp'); reset(input);
// assign(output,'elevator.out'); rewrite(output);
 nhap;
 xuli;
// close(input); close(output);
end.