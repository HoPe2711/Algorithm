uses math;
var a,base,k,res:qword;
function nhan(a,b:qword):qword;
var tg:qword;
begin
 if b=0 then exit(0);
 if b=1 then exit(a mod base);
 tg:=nhan(a,b div 2);
 tg:=2*tg mod base;
 if b mod 2 =1 then exit((Tg+a) mod base)
 else exit(tg mod base);
end;
function pow(a,x:qword):qword;
var tg:qword;
begin
 if x=0 then exit(1 mod base);
 if x=1 then exit(a mod base);
 tg:=pow(a,x div 2);
 tg:=nhan(tg,tg) mod base;
 if x mod 2=0 then exit(tg)
 else exit(nhan(tg,a) mod base);
end;
procedure nhap;
var trans:qword;
begin
 read(a,base,k);
 trans:=pow(10,k-1);
 trans:=nhan(a,trans);
 res:=trans*10 div base;
 write(Res);
end;
begin
 assign(input,'digit.inp');reset(input);
 assign(output,'digit.out');rewrite(output);
 nhap;
 close(input); close(output);
end.
