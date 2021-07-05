uses math;
type matrix=array[1..60,1..60] of int64;
const base=1000000007;
var n,k:longint;
    m,f,trans:matrix;
    cp:array[0..60,0..60] of int64;
operator *(a,b:matrix)c:matrix;
var i,j,t:longint;
begin
 for i:=1 to k+2 do
  for j:=1 to k+2 do
   begin
    c[i,j]:=0;
    for t:=1 to k+2 do c[i,j]:=(c[i,j]+a[i,t]*b[t,j] mod base) mod base;
   end;
end;
function pow(a:matrix;x:longint):matrix;
var tg:matrix;
begin
 if x=1 then exit(a);
 tg:=pow(a,x div 2);
 tg:=tg*tg;
 if x mod 2=0 then exit(tg) else exit(tg*a);
end;
procedure nhap;
var i,j:longint;
begin
 read(n,k);
 cp[0,0]:=1;
 for i:=1 to k do
  begin
   cp[i,0]:=1; cp[i,i]:=1;
   for j:=1 to i-1 do cp[i,j]:=(cp[i-1,j-1]+cp[i-1,j]) mod base;
  end;
 m[1,1]:=1;
 for i:=2 to k+2 do m[1,i]:=cp[k,i-2];
 for i:=2 to k+2 do
  for j:=2 to i do m[i,j]:=cp[i-2,j-2];
end;
procedure xuli;
begin
 f[2,1]:=1;
 trans:=pow(m,n);
 trans:=trans*f;
 writeln(trans[1,1]);
end;
begin
 assign(input,'c11cal.inp');reset(input);
 assign(output,'c11cal.out');rewrite(output);
 while not seekeof do
  begin
   nhap;
   xuli;
  end;
 close(input); close(output);
end.