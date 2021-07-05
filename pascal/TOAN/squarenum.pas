uses math;
const base=1000000007;
var n,dem:longint;   res:int64;
    nt,prime:array[0..10000000] of longint;
procedure snt(n:longint);
var i,j:longint;
begin
 for i:=2 to trunc(sqrt(n)) do
 if prime[i]=0 then
  begin
   j:=i*i;
   while j<=n do
    begin
     prime[j]:=1;
     j:=j+i;
    end;
  end;
 for i:=2 to n do
  if prime[i]=0 then
   begin
    inc(dem);
    nt[dem]:=i;
   end;
end;
function luythua(a,x:int64):int64;
var tg:int64;
begin
 if x=0 then exit(1);
 if x=1 then exit(a mod base);
 tg:=luythua(a,x div 2);
 tg:=tg*tg mod base ;
 if x mod 2=1 then exit(tg*a mod base)
 else exit(tg mod base);
end;
procedure xuli;
var j,i,demm:longint; a,a1:int64;
begin
 res:=1;
 for i:=1 to dem do
 if nt[i]<=n then
  begin
   demm:=0;
   a:=nt[i];
   a1:=a;
   while a1<=n do
    begin
     demm:=demm+n div a1;
     a1:=a1*a;
    end;
   if demm mod 2=1 then dec(demm);
   res:=(res*luythua(nt[i],demm)) mod base;
  end
 else break;
 writeln(res);
end;
begin
 assign(input,'squarenum.inp'); reset(input);
 assign(output,'squarenum.out');rewrite(output);
 snt(1000{00});
 writeln(dem);
 while not seekeof do
  begin
   read(n);
   xuli;
  end;
 close(input); close(output);
end.
