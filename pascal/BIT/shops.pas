uses math;
const oo=maxlongint;
var n,s,limit,res,res1:longint;
    sum,b:array[0..2000000] of int64;
    a,pos,t,c,f,g:array[0..2000000] of longint;
procedure nhap;
var i:longint;
begin
 read(n,s);
 for i:=1 to n do
  begin
   read(a[i]);
   sum[i]:=sum[i-1]+a[i];
   b[i]:=sum[i];   pos[i]:=i;
  end;
 for i:=n+1 to 2*n do
  begin
   b[i]:=sum[i-n]-s;
   pos[i]:=i;
  end;
end;
procedure doicho(Var x,y:int64);
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
 mid:=b[l+random(r-l+1)];
 repeat
  while b[i]<mid do inc(i);
  while b[j]>mid do dec(j);
  if i<=j then
   begin
    doicho(b[i],b[j]);
    tg:=pos[i];
    pos[i]:=pos[j];
    pos[j]:=tg;
    inc(i);
    dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure update(i,x:longint);
begin
 while i>0 do
  begin
   t[i]:=min(t[i],x);
   i:=i-i and (-i);
  end;
end;
function get(i:longint):longint;
begin
 get:=oo;
 while i<=limit do
  begin
   get:=min(get,t[i]);
   i:=i+i and (-i);
  end;
end;
procedure xuli;
var i:longint;
begin
 qsort(0,2*n);
 limit:=1;
 c[pos[0]]:=1;
 for i:=1 to 2*n do
 begin
  if b[i]<>b[i-1] then inc(limit);
  c[pos[i]]:=limit;
 end;
 for i:=1 to limit do t[i]:=oo;
 update(c[0],0);
 for i:=1 to n do
  begin
   f[i]:=i-get(c[i+n]);
   g[i]:=get(C[i+n])+1;
   update(c[i],i);
  end;
 res:=0;
 for i:=1 to n do
 if f[i]>res then
  begin
   res:=f[i];
   res1:=g[i];
  end
 else if f[i]=res then res1:=min(res1,g[i]);
 write(Res,' ',res1);
end;
begin
 assign(input,'shops.inp');reset(input);
 assign(output,'shops.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
