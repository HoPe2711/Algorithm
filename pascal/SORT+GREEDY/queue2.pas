uses math;
type arr=array[0..100000] of longint;
var   res,res1:int64;
      n:longint;
      x,y,z,p,t,pp:arr;
procedure nhap;
var  i:longint;
begin
 read(n);
 for i:=1 to n do read(x[i],y[i]);
end;
procedure doicho(Var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure qsort(l,r:longint;var A:Arr);
var i,j,mid:longint;
begin
 i:=l;
 j:=r;
 mid:=a[l+random(r-l+1)];
 repeat
  while (a[i]<mid) do inc(i);
  while (a[j]>mid) do deC(j);
  if i<=j then
   begin
    doicho(a[i],a[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r,A);
 if l<j then qsort(l,j,A);
end;

procedure qsort1(l,r:longint;var A,b:Arr);
var i,j,mid:longint;
begin
 i:=l;
 j:=r;
 mid:=a[l+random(r-l+1)];
 repeat
  while (a[i]<mid) do inc(i);
  while (a[j]>mid) do deC(j);
  if i<=j then
   begin
    doicho(a[i],a[j]);
    doicho(b[i],b[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort1(i,r,A,b);
 if l<j then qsort1(l,j,A,b);
end;

procedure xuli;
var i,p,q,j,latdot:longint;
begin
 res:=high(int64);
 qsort1(1,n,y,x);
 for i:=1 to n do
  if n mod i=0 then
   begin
    p:=i; q:=n div p;
    latdot:=1;  res1:=0;
    for j:=1 to n do
     begin
      t[j]:=y[j]-latdot+1;  pp[j]:=x[j];
      if j mod q=0 then inc(latdot);
     end;
    qsort1(1,n,t,pp);
    for j:=1 to n do
     begin
      res1:=res1+abs(t[n div 2+1]-t[j]);
      if j mod q=0 then z[j]:=pp[j]-q+1
      else z[j]:=pp[j]-j mod q+1;
     end;
    qsort(1,n,z);
    for j:=1 to n do res1:=res1+abs(z[n div 2+1]-z[j]);
    res:=min(res,res1);
   end;
 write(Res);
end;
begin
 assign(input,'queue.inp');reset(input);
 assign(output,'queue.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.