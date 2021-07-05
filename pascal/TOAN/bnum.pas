uses math;
const base=1000000007;
var a,b,n,res:longint;
   // f:array[0..1000,0..9000] of longint;
    gt:array[0..1000000] of longint;
function check(x:longint):boolean;
var k:longint;
begin
 while x<>0 do
  begin
   k:=x mod 10;
   if (k<>a) and (k<>b) then exit(false);
   x:=x div 10;
  end;
 exit(true);
end;
function pow(a,x:int64):int64;
var tg:int64;
begin
 if x=0 then exit(1);
 tg:=pow(a,x div 2);
 tg:=(int64(tg)*tg) mod base;
 if x mod 2=1 then exit((int64(tg)*a) mod base)
 else exit(tg);
end;
function c(k:longint):longint;
var pp,tt:int64;
begin
 pp:=(int64(gt[k])*gt[n-k]) mod base;
 tt:=pow(pp,base-2);
 exit((int64(gt[n])*tt) mod base) ;
end;
procedure nhap;
var i:longint;
begin
 read(a,b,n);
 gt[0]:=1;
 for i:=1 to n do gt[i]:=(int64(i)*gt[i-1]) mod base;
 for i:=0 to n do
  if check(a*i+b*(n-i)) then res:=(res+c(i)) mod base;
 write(res);
end;
begin
 assign(input,'bnum.inp');reset(input);
 assign(output,'bnum.out');rewrite(output);
 nhap;
 close(input); close(output);
end.