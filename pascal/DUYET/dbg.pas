uses math;
const oo=1000000000;
var n,a,b,d,kq,bb,s:longint;
    t,w,tt,x:array[0..100000] of longint;
    free:array[0..100000] of boolean;
    ts:array[0..100000] of real;
procedure nhap;
var i:longint;
begin
 read(n,a,b,d);
 for i:=1 to n do
  begin
   read(t[i],w[i]);
   s:=s+t[i];
  end;
end;
procedure inkq;
var i,res,bb1:longint;
begin
 res:=0;  bb1:=bb;
 for i:=1 to n do
  if bb1+t[tt[i]]<=b then
   begin
    res:=res+abs(bb1+t[tt[i]]-d)*w[tt[i]] ;
    bb1:=bb1+t[tt[i]];
   end
  else exit;
 kq:=min(kq,res);
end;
procedure duyet(i:longint);
var j:longint;
begin
 if i=n+1 then inkq
 else
 for j:=1 to n do
  if free[j]=false then
   begin
    x[i]:=j;
    tt[j]:=i;
    free[j]:=true;
    duyet(i+1);
    free[j]:=false;
   end;
end;
procedure xuli ;
var h:longint;
begin
 kq:=oo;
 for h:=a to b-s do
  begin
   bb:=h;
   duyet(1);
  end;
 write(kq);
end;
procedure doicho(var x,y:real);
var tg:real;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure doicho1(var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure qsort(l,r:longint);
var i,j:longint;   mid:real;
begin
 i:=l;
 j:=r;
 mid:=ts[l+random(r-l+1)];
 repeat
  while ts[i]<mid do inc(i);
  while ts[j]>mid do dec(j);
  if i<=j then
   begin
    doicho(ts[i],ts[j]);
    doicho1(w[i],w[j]);
    doicho1(t[i],t[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure xuli1;
var i:longint;
begin
 for i:=1 to n do ts[i]:=w[i]/t[i];
 qsort(1,n); bb:=a;
 for i:=n downto 1 do
  begin
   bb:=bb+t[i];
   kq:=kq+abs(bb-d)*w[i];
  end;
 write(kq);
end;
procedure xuli2;
var i:longint;
begin
 for i:=1 to n do ts[i]:=w[i]/t[i];
 qsort(1,n);  bb:=b-s;
 for i:=1 to n do
  begin
   bb:=bb+t[i];
   kq:=kq+abs(bb-d)*w[i];
  end;
 write(kq);
end;
begin
 assign(input,'dbg.inp');reset(input);
 assign(output,'dbg.out');rewrite(output);
 nhap;
 if n<=8 then xuli
 else if a=d then xuli1
 else if d=b then xuli2;
 close(input); close(output);
end.
