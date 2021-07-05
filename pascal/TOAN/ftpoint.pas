uses math;
const oo=1000001;
      esp=0.0000000001;
var n:longint;
    x,y:array[0..10000] of longint;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do read(x[i],y[i]);
end;
function f(u,v:extended):extended;
var i:longint;
begin
 f:=0;
 for i:=1 to n do f:=f+sqrt(sqr(u-x[i])+sqr(v-y[i]));
end;
function g(u:extended):extended;
var c,d,y1,y2,yp:extended;
begin
 c:=-oo; d:=oo;
 while d-c>esp do
  begin
   y1:=c+4*(d-c)/9;
   y2:=d+5*(d-c)/9;
   if f(u,y1)<=f(u,y2) then d:=y2 else c:=y1;
  end;
 yp:=(c+d)/2;
 exit(f(u,yp));
end;
procedure xuli;
var a,b,x1,x2,xp:extended;
begin
 a:=-oo; b:=oo;
 while b-a>esp do
  begin
   x1:=a+4*(b-a)/9;
   x2:=b+5*(b-a)/9;
   if g(x1)<=g(x2) then b:=x2 else a:=x1;
  end;
 xp:=(a+b)/2;
 write(g(xp):0:3);
end;
begin
 assign(input,'ftpoint.inp');reset(input);
 assign(output,'ftpoint.out');rewrite(output);
 nhap;
 xuli;
 close(input);
 close(output);
end.