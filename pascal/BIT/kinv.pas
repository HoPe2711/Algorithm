uses math;
const base=1000000000;
var n,k,res,limit:longint;
    x,a,b,pos:array[0..20000] of longint;
    g,f:array[0..20000,0..10] of longint;
procedure nhap;
var i:longint;
begin
 read(n,k);
 for i:=1 to n do
 begin
  read(x[i]);
  a[n-i+1]:=x[i];
  pos[n-i+1]:=n-i+1;
 end;
end;
procedure swap(var x,y:longint);
var tg:longint;
begin
 tG:=x;
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
    swap(A[i],a[j]);
    swap(pos[i],pos[j]);
    inc(I); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure update(i,x,j:longint);
begin
 while i<=limit do
  begin
   g[i,j]:=(g[i,j]+x) mod base;
   i:=i+i and (-i);
  end;
end;
function get(i,j:longint):longint;
begin
 get:=0;
 while i>0 do
  begin
   get:=(get+g[i,j]) mod base;
   i:=i- i and (-i);
  end;
end;
procedure xuli;
var i,j:longint;
begin
 qsort(1,n);
 limit:=1;   b[pos[1]]:=limit;
 for i:=2 to n do
  if a[i]>a[i-1] then
   begin
    inc(limit);
    b[pos[i]]:=limit;
   end
  else b[pos[i]]:=limit;
 for i:=1 to n do
  for j:=1 to k do
   begin
    if j>1 then f[i,j]:=(get(b[i]-1,j-1)+f[i,j]) mod base
    else f[i,j]:=1;
    update(b[i],f[i,j],j);
   end;
 for i:=1 to n do res:=(res+f[i,k]) mod base;
 write(res);
end;
begin
 assign(input,'kinv.inp');reset(input);
 assign(output,'kinv.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.