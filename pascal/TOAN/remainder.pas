{$Q-}
uses math;
var t,h:longint;
    so,n,m:int64;
function mul(x,y:int64):int64;
var q:int64; t:extended;  r:int64;
begin
 x:=x mod m;
 y:=y mod m;
 t:=extended(x)*y/m;
 q:=trunc(t);
 r:=(int64(x)*y-int64(q)*m) mod int64(m);
 if r<0 then r:=(r+m) mod m;
 exit(r);
end;
function pow(a,x:int64):int64;
var tg,trans:int64;
begin
 if x=0 then exit(0);
 if x=1 then exit(1 mod m);
 if x mod 2=1 then
  begin
   tg:=pow(a,x-1);
   tg:=(1+mul(a,tg)) mod m;
   exit(tg);
  end
 else
  begin
   tg:=pow(a,x div 2);
   trans:=(mul(tg,a-1)+2) mod m;
   tg:=mul(trans,tg);
   exit(tg);
  end;
end;
procedure nhap;
var pp:qword;
    trans,tg:int64;
begin
 read(so,n,m);
 pp:=1;    tg:=so;
 while so>0 do
  begin
   pp:=(pp*10) mod m;
   so:=so div 10;
  end;
 tg:=tg mod m;
 trans:=pow(pp,n);
 trans:=mul(trans,tg);
 writeln(trans);
end;
begin
 assign(input,'remainder.inp');reset(input);
 assign(output,'remainder.out');rewrite(output);
 read(t);
 for h:=1 to t do
  begin
   nhap;
  end;
 close(input); close(output);
end.
