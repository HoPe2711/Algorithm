uses math;
var n,res:longint;
    a,b,c:array[0..2000000] of longint;
procedure doicho(Var x,y:longint);
var tg:longint;
begin
 tG:=x;
 X:=y;
 y:=tg;
end;
procedure qsort(l,r:longint);
var i,j,mid:longint;
begin
 i:=l;
 j:=r;
 mid:=c[l+random(r-l+1)];
 repeat
  while c[i]<mid do inc(i);
  while c[j]>mid do dec(j);
  if i<=j then
   begin
    doicho(a[i],a[j]);
    doicho(b[i],b[j]);
    doicho(c[i],c[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to 2*n do
  begin
   read(a[i],b[i]);
   c[i]:=a[i]-b[i];
  end;
end;
procedure xuli;
var i:longint;
begin
 qsort(1,2*n);
 for i:=1 to n do res:=res+a[i];
 for i:=n+1 to 2*n do res:=res+b[i];
 write(reS);
end;
begin
 assign(input,'acm.inp');reset(input);
 assign(output,'acm.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.