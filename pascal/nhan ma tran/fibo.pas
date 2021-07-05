uses math;
const base = 1000000007;
type matrix=array[1..2,1..2] of int64;
var n:longint;
    m:matrix;
operator *(m1,m2:matrix)m:matrix;
var i,j,t:longint;
 begin
  for i:=1 to 2 do
   for j:=1 to 2 do
    begin
     m[i,j]:=0;
     for t:=1 to 2 do m[i,j]:=(m[i,j] mod base +  (m1[i,t]*m2[t,j]) mod base) mod base;
    end;
 end;
function luythua(a:matrix;x:longint):matrix;
var tg:matrix;
begin
 if x=1 then exit(a);
 tg:=luythua(a,x div 2);
 tg:=tg*tg;
 if x mod 2=1 then exit(tg*a)
 else exit(tg);
end;
begin
 assign(input,'fibo.in');reset(input);
 assign(output,'fibo.out');rewrite(output);
 read(n);
 m[1,1]:=1;
 m[1,2]:=1;
 m[2,1]:=1;
 m[2,2]:=0;
 if n>=2 then
  begin
   m:=luythua(m,n-1);
   write(m[1,1]);
  end
  else if n=0 then write(0)
   else write(1);
 close(input);
 close(output);
end.