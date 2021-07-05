uses math;
const base=1000000007;
var n,k,res,t,h:longint;
    f,p:array[0..100000] of longint;
procedure build;
var i:longint;
begin
 p[0]:=1;
 for i:=1 to n do P[i]:=(int64(k)*p[i-1]) mod base;
end;
procedure nhap;
var i,j:longint;
begin
 read(n,k);
 build;
 f[1]:=p[1];
// res:=f[n];
 for i:=2 to n do
 if n mod i=0 then
  begin
   f[i]:=(p[i]-k+base) mod base;
  end;
   for i:=2 to n div 2 do
  begin
   j:=i+i;
   while j<=n do
    begin
     f[j]:=(f[j]-f[i]+base) mod base;
     j:=j+i;
    end;
  end;
 res:=f[n] div n;
 for i:=1 to trunc(sqrt(n)) do
 if n mod i=0 then res:=(res+f[i] div i) mod base;
 writeln(res);
end;
begin
 assign(input,'necklace.inp');reset(input);
 assign(output,'necklace.out');rewrite(output);
 read(t);
 for h:=1 to t do nhap;
 close(input); close(output);
end.
