uses math;
const
 oo=1000000000;
var n,c,hmax,res:longint;
    a:array[1..100000] of longint;
    f:array[0..100000,0..100] of longint;
procedure nhap;
var h,i:longint;
begin
 read(n,c);
 res:=oo;
 for i:=1 to n do
  begin
   readln(a[i]);
   hmax:=max(hmax,a[i]);
  end;
 for i:=1 to n do
  for h:=1 to hmax do f[i,h]:=oo;
end;
procedure xuli;
var i,h,tg:longint;
begin
 for h := a[1] to hmax do f[1,h]:=(a[i]-h)**2;
 for i:=2 to n do
  begin
   tg:=oo;
   for h:=1 to hmax do
     begin
      tg:=min(f[i-1,h]-c*h,tg);
      if h<a[i] then f[i,h]:=oo
      else f[i,h]:=min(tg+c*h+(a[i]-h)**2,f[i,h]);
     end;
   tg:=oo;
   for h:=hmax downto a[i] do
    begin
     tg:=min(f[i-1,h]+c*h,tg);
     f[i,h]:=min(tg-c*h+(a[i]-h)**2,f[i,h]);
    end;
  end;
 for h:=a[n] to hmax do res:=min(res,f[n,h]);
 write(res);
end;
BEGIN
  assign(input,'telewire.inp');reset(input);
  assign(output,'telewire.out');rewrite(output);
  nhap;
  xuli;
  close(input);close(output);
END.
