uses math;
type matrix=array[1..3,1..3] of int64;
var  n:int64;
     base:longint;
     m,f,trans:matrix;
operator *(a,b:matrix)c:matrix;
var i,j,k:longint;
begin
 for i:=1 to 3 do
  for j:=1 to 3 do
   begin
    c[i,j]:=0;
    for k:=1 to 3 do c[i,j]:=(c[i,j]+a[i,k]*b[k,j] mod base) mod base;
   end;
end;
function pow(a:matrix;x:int64):matrix;
var tg:matrix;
begin
 if x=1 then exit(a);
 tg:=pow(a,x div 2);
 tg:=tg*tg;
 if x mod 2=0 then exit(tg) else exit(tg*a);
end;
procedure nhap;
begin
 read(n,base);
 m[1,1]:=1; m[1,2]:=1; m[1,3]:=1;
 m[2,1]:=1; m[3,2]:=1;
 f[1,1]:=4;
 f[2,1]:=2;
 f[3,1]:=1;
 if n=0 then writeln(0);
 if n=1 then writeln(1);
 if n=2 then writeln(2);
 if n=3 then writeln(4);
 if n>3 then
  begin
   trans:=pow(m,n-3);
   trans:=trans*f;
   writeln(trans[1,1]);
  end;
end;
begin
 assign(input,'dhloco.inp');reset(input);
 assign(output,'dhloco.out');rewrite(output);
 nhap;
 close(input); close(output);
end.