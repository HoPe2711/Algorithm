const base=1000000007;
type matrix=array[1..2,1..2] of int64;
var m,m1,c:matrix;
    n:longint;
operator *(m1,m2:matrix)m:matrix;
var i,j,t:longint;
begin
 for i:=1 to 2 do
  for j:=1 to 2 do
   begin
    m[i,j]:=0;
    for t:=1 to 2 do m[i,j]:=(m[i,j] mod base + (m1[i,t]*m2[t,j]) mod base) mod base;
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
 assign(input,'f237.in');reset(input);
 assign(output,'f237.out');rewrite(output);
 read(n);
 m[1,1]:=7;
 m[1,2]:=3;
 m[2,1]:=1;
 m[2,2]:=0;
 m1[1,1]:=3;
 m1[1,2]:=2;
 m1[2,1]:=1;
 m1[2,2]:=0;
 c:=m*m1;
 if n>=3 then
  begin
   if n mod 2=1 then
    begin
     c:=luythua(c,n div 2);
     write((c[1,1]+c[1,2]) mod base);
    end
   else
    begin
     c:=m1*luythua(c,(n-1) div 2);
     write((c[1,1]+c[1,2]) mod base);
    end;
  end
 else if n=0 then write(1)
   else if n=2 then write(5)
    else write(1);
 close(input);
 close(output);
end.