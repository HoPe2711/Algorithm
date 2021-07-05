uses math;
type matrix=array[1..4,1..4] of int64;
var base,n:longint;   a2:int64;
    m,f,trans:matrix;
operator *(a,b:matrix)c:matrix;
var i,j,k:longint;
begin
 for i:=1 to 4 do
  for j:=1 to 4 do
   begin
    c[i,j]:=0;
    for k:=1 to 4 do c[i,j]:=(c[i,j]+(a[i,k]*b[k,j]) mod base) mod base;
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
procedure xuli;
var ans,ans1:int64;
begin
 fillchar(m,sizeof(m),0);
 ans:=((4*a2)mod base *a2) mod base;
 ans1:=(-4*a2) mod base ;
 m[1,1]:=1 ; m[1,2]:=ans; m[1,3]:=1 ; m[1,4]:=ans1;
 m[2,2]:=ans; m[2,3]:=1; m[2,4]:=ans1;
 m[3,2]:=1 ; m[4,2]:=(2*a2) mod base ; m[4,4]:=-1;
 f[1,1]:=(1+(a2*a2) mod base ) mod base;
 f[2,1]:=(a2*a2) mod base;
 f[3,1]:=1 ;
 f[4,1]:=a2 mod base ;
 if n=1 then writeln(1);
 if n=2 then writeln(f[1,1]);
 if n>2 then
  begin
   trans:=pow(m,n-2);
   trans:=trans*f;
   writeln((trans[1,1]+base) mod base);
  end;
end;
procedure nhap;
var i,k,j:longint;
begin
 read(k);
 for i:=1 to k do
  begin
   read(a2,n,base);
   xuli;
  end;
end;
begin
// assign(input,'fbrick.inp');reset(input);
// assign(output,'fbrick.out');rewrite(output);
 nhap;
// close(input); close(output);
end.