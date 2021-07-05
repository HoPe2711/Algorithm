uses math;
const oo=1000000000;
      esp=0.000000000001;
var  res:real;
     u,v,s,t,hailong,tungduong:longint;
     n:longint;
     q,q1:array[0..500000] of longint;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do read(q[i],q1[i]);
 read(u,v,s,t);
 hailong:=s-u;
 tungduong:=t-v;
 //esp:=10**(-6);
end;
function f(x:real):real;
var kq:real;
    i:longint;
begin
 kq:=-oo;
 for i:=1 to n do kq:=max(kq,sqrt( sqr(u-q[i]+hailong*x)+sqr(v-q1[i]+tungduong*x)) );
 exit(kq);
end;
procedure xuli;
var xmin,xmax,a,b,c,d:real;
begin
 xmin:=-oo; xmax:=oo;
 a:=xmin; b:=xmax;
 while b-a>esp do
  begin
   c:=a+4*(b-a)/9;
   d:=a+5*(b-a)/9;
   if f(c)<f(d) then b:=d else a:=c;
  end;
 res:=(a+b)/2;
 write(f(Res):0:4);
end;
begin
 assign(input,'bts.inp');reset(input);
 assign(output,'bts.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
