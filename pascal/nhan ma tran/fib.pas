type matrix=array[1..20,1..20] of int64;
const base=111539786;
var k,n:longint;
    res:int64;
    m:matrix;
operator *(m1,m2:matrix)m:matrix;
var i,j,t:longint;
begin
 for i:=1 to k do
  for j:=1 to k do
   begin
    m[i,j]:=0;
    for t:=1 to k do m[i,j]:=(m[i,j] mod base + (m1[i,t]*m2[t,j]) mod base) mod base;
   end;
end;
function luythua(a:matrix;x:longint):matrix;
var tg:matrix;
begin
 if x=1 then exit(a);
 tg:=luythua(a,x div 2);
 tg :=tg*tg;
 if x mod 2 = 1 then exit(tg*a)
 else exit(tg);
end;
procedure nhap;
var i:longint;
begin
 res:=0;
 fillchar(m,sizeof(m),0);
 read(n,k);
 for i:=1 to k do m[1,i]:=1;
 for i:=2 to k do m[i,i-1]:=1;
 m:=luythua(m,n-k);
 for i:=1 to k do res:=res+m[1,i];
 writeln(res mod base);
end;
begin
 assign(input,'fib.inp');reset(input);
 assign(output,'fib.out');rewrite(output);
 while not seekeof do
  begin
   nhap;
  end;
 close(input);
 close(output);
end.
