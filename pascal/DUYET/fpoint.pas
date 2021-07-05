uses math;
const esp=0.0000000001;
      oo=1000001;
var n:longint;
    x,y:array[0..20000] of extended;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do read(x[i],y[i]);
end;
function cal(point:extended):extended;
var i:longint;
begin
 cal:=0;
 for i:=1 to n do cal:=cal+sqrt( sqr(x[i]-point) + sqr(y[i]) );
end;
procedure xuli;
var l,r,x1,x2,xp:extended;
begin
 l:=-oo; r:=oo;
 while r-l>esp do
  begin
   x1:=l+4*(r-l)/9;
   x2:=l+5*(r-l)/9;
   if cal(x1)<=cal(x2) then r:=x2 else l:=x1;
  end;
 xp:=(l+r)/2;
 write(cal(xp):0:6);
end;
begin
 assign(input,'fpoint.inp');reset(input);
 assign(output,'fpoint.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
