uses math;
const base=12345678;
type matrix=array[1..2,1..2] of int64;
var n,res:int64;
    m,f:matrix;
operator *(m1,m2:matrix)m:matrix;
var i,j,t:longint;
begin
 for i:=1 to 2 do
  for j:=1 to 2 do
   begin
    m[i,j]:=0;
    for t:=1 to 2 do m[i,j]:=((m[i,j] mod base + (m1[i,t]*m2[t,j]) mod base)) mod base;
   end;
end;
function pow(a:matrix;x:int64):matrix;
var tg:matrix;
begin
 if x=1 then exit(a);
 tg:=pow(a,x div 2);
 tg:=tg*tg;
 if x mod 2=1 then exit(tg*a)
 else exit(tg);
end;
procedure nhap;
begin
 read(n);
 f[1,1]:=7;
 f[1,2]:=3;
 m[1,1]:=2;
 m[1,2]:=1;
 m[2,1]:=1;
 m[2,2]:=0;
 if n>2 then
  begin
   m:=f*pow(m,n-2);
   write((m[1,1]-1) mod base);
  end
 else if n=2 then write(6)
 else write(2);
end;
begin
 assign(input,'table.inp');reset(input);
 assign(output,'table.out');rewrite(output);
 nhap;
 close(input); close(output);
end.
