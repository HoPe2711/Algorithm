uses math;
const o:array[1..5] of longint=(2,3,5,7,11);
var n,limit:longint;
    a:array[0..200000] of int64;
    b,pos,tt,f:array[0..200000] of longint;
    g:array[0..35,0..200000] of longint;
function batbit(i,x:longint):longint;
begin
 exit(x or (1 shl i));
end;
procedure nhap;
var i,j:longint;
begin
 read(n);
 for i:=1 to n do
  begin
   read(a[i]);
   pos[i]:=i;
   for j:=1 to 5 do
    if a[i] mod o[j]=0 then tt[i]:=batbit(j-1,tt[i]);
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
var i,j,tg:longint; mid:int64;
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
    tg:=pos[i];
    pos[i]:=pos[j];
    pos[j]:=tg;
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure update(i,j,x:longint);
begin
 while j<=limit do
  begin
   g[i,j]:=max(g[i,j],x);
   j:=j+j and (-j);
  end;
end;
function get(i,j:longint):longint;
begin
 get:=0;
 while j>0 do
  begin
   get:=max(g[i,j],get);
   j:=j-j and (-j);
  end;
end;
procedure xuli;
var i,j,res:longint;
begin
 qsort(1,n);
 b[pos[1]]:=1;
 limit:=1;
 for i:=2 to n do
  begin
   if a[i]<>a[i-1] then inc(limit);
   b[pos[i]]:=limit;
  end;
 //a:=b;
 for i:=1 to n do a[i]:=b[i];
 res:=1;
 for i:=1 to n do
  for j:=0 to 31 do
   if (tt[i] and j)=0 then
    begin
     f[i]:=max(f[i],get(j,a[i]-1)+1);
     res:=max(res,f[i]);
     update(tt[i],a[i],f[i]);
    end;
 write(Res);
end;
begin
 assign(input,'coprime.inp');reset(input);
 assign(output,'coprime.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.