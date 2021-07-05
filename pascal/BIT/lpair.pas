var a,b,t,k,pos:array[0..2000000] of longint;
    n,limit:longint;
    res:int64;
procedure update(i,x:longint);
begin
 while i<=limit do
  begin
   t[i]:=t[i]+x;
   i:=i+(i and (-i));
  end;
end;
function get(i:longint):longint;
begin
 get:=0;
 while i>0 do
  begin
   get:=get+t[i];
   i:=i-(i and (-i));
  end;
end;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do read(a[i],b[i]);
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
procedure qsort1(l,r:longint);
var i,j,mid:longint;
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
    doicho(pos[i],pos[j]);
    inc(i); dec(j);
   end;
  until i>j;
 if i<r then qsort1(i,r);
 if l<j then qsort1(l,j);
end;
procedure xuli;
var i:longint;
begin
 qsort(1,n);
 for i:=1 to n do pos[i]:=i;
 qsort1(1,n);
 limit:=1;
 k[pos[1]]:=limit;
 for i:=2 to n do
 begin
  if b[i]<>b[i-1] then inc(limit);
  k[pos[i]]:=limit;
 end;
 for i:=n downto 1 do
  begin
   res:=res+get(k[i]);
   update(k[i],1);
  end;
 write(res);
end;
begin
 assign(input,'lpair.inp');reset(input);
 assign(output,'lpair.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
