uses math;
var l1,n,res,limit:longint;
    t,v,a,b,pos,tt:array[0..200000] of longint;
procedure nhap;
var i:longint;
begin
 read(l1,n);
 for i:=1 to n do read(t[i],v[i]);
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
 mid:=t[l+random(r-l+1)];
 repeat
  while t[i]<mid do inc(i);
  while t[j]>mid do dec(j);
  if i<=j then
   begin
    doicho(v[i],v[j]);
    doicho(t[i],t[j]);
    inc(i);
    dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure qsort1(l,r:longint);
var i,j:longint; mid,key,key1:longint;
begin
 i:=l;
 j:=r;
 mid:=l+random(r-l+1);
 key:=a[mid]; key1:=b[mid];
 repeat
  while (int64(l1)*key1-int64(l1)*b[i]>int64(key)*key1*b[i]-int64(a[i])*b[i]*key1) do inc(i);
  while (int64(l1)*b[j]-int64(l1)*key1>int64(a[j])*b[j]*key1-int64(key)*key1*b[j]) do dec(j);
  if i<=j then
   begin
    doicho(a[i],a[j]);
    doicho(pos[i],pos[j]);
    doicho(b[i],b[j]);
    inc(i);
    dec(j);
   end;
 until i>j;
 if i<r then qsort1(i,r);
 if l<j then qsort1(l,j);
end;

procedure update(i,x:longint);
begin
 while i>0 do
  begin
   tt[i]:=max(tt[i],x);
   i:=i-i and (-i);
  end;
end;
function get(i:longint):longint;
begin
 get:=0;
 while i<=limit do
  begin
   get:=max(tt[i],get);
   i:=i+i and (-i);
  end;
end;
procedure xuli;
var i,tmp:longint;
begin
 qsort(1,n);
 for i:=1 to n do
  begin
   a[i]:=t[i]; b[i]:=v[i]; pos[i]:=i;
  end;
 qsort1(1,n);
 //for i:=1 to n do writeln((l1/b[i]+a[i]):0:3);
 for i:=n downto 1 do
  begin
   inc(limit);
   v[pos[i]]:=limit;
  end;
 for i:=1 to n do
  begin
   tmp:=get(v[i]+1)+1;
   res:=max(res,tmp);
   update(v[i],tmp);
  end;
 write(res);
end;
begin
 assign(input,'walking.inp');reset(input);
 assign(output,'walking.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
