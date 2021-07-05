uses math;
const base=123456789;
type matrix=array[0..100,0..100] of int64;
var f,a,trans:matrix;
    n,m:int64;
operator *(a,b:matrix)c:matrix;
var i,j,k:longint;
begin
 for i:=1 to m do
  for j:=1 to m do
  begin
   c[i,j]:=0;
   for k:=1 to m do c[i,j]:=c[i,j]+(a[i,k]*b[k,j]);
   c[i,j]:=c[i,j] mod base;
  end;
end;
function pow(a:matrix;x:int64):matrix;
var tg:matrix;
begin
 if x=1 then exit(A);
 tg:=pow(a,x div 2);
 tg:=tg*tg;
 if x mod 2=1 then exit(tg*a)
 else exit(tg);
end;
procedure nhap;
var i,j:longint;  sum:int64;
begin
 read(n,m);
 sum:=1;
 for i:=1 to m do
  begin
   f[i,1]:=sum;
   sum:=(sum+f[i,1]) mod base;
  end;
 if n<=m then
  begin
   write(f[i,1]);
   exit;
  end;
 j:=2;
 for i:=1 to m-1 do
  begin
   a[i,j]:=1;
   inc(j);
  end;
 for i:=1 to m do a[m,i]:=1;
 trans:=pow(a,n-m);
 trans:=trans*f;
 write(trans[m,1]);
end;

begin
 assign(input,'loco.inp');reset(input);
 assign(output,'loco.out');rewrite(output);
 nhap;
 close(input); close(output);
end.
