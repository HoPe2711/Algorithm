uses math;
var n,m:longint;
    a,val,sl,cp:array[0..200000] of longint;
    sum:array[0..200000] of longint;
    kq,res,dem:int64;
procedure nhap;
var i:longint;
begin
 read(n,m);
 for i:=1 to n do
  begin
   read(A[i]);
   a[i]:=(A[i] mod m+m ) mod m;
   if a[i]=0 then a[i]:=m;
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
procedure xuli;
var last,i,j:longint; tmp:int64;
begin
 qsort(1,n);
 a[n+1]:=maxlongint;
 last:=1;
 for i:=2 to n+1 do
  if a[i]<>a[i-1] then
   begin
    inc(dem);
    val[dem]:=a[i-1];
    sl[dem]:=i-last;
    last:=i;
   end;
 //last:=0;
 for i:=dem downto 1 do
  begin
   res:=res+int64(sl[i])*(abs(val[i]-val[dem]));
  // inc(last);
   cp[i]:=val[dem]-val[dem-1];
  end;
 for i:=1 to dem do sum[i]:=sum[i-1]+sl[i];
 kq:=res;    j:=dem-1;
 while j>0 do
  begin
   tmp:=res;
   tmp:=tmp-(sum[dem]-sum[j+1])*cp[j+1]-sum[j]*cp[j+1]+(val[j]+dem-val[j+1])*sl[j+1];
   res:=tmp;
   dec(j);
   kq:=min(kq,tmp);
  end;
 write(kq);
end;
begin
 assign(input,'rolls1.in');reset(input);
 assign(output,'rolls1.out');rewrite(output);
 nhap;
 xuli ;
 close(input); close(output);
end.
