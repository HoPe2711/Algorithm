uses math;
const base=111539786;
type  matrix=array[1..2,1..2] of int64;
var  x:longint;
     m,m1,c:matrix;
operator *(a,b:matrix)c:matrix;
var i,j,k:longint;
begin
 for i:=1 to 2 do
  for j:=1 to 2 do
  begin
   c[i,j]:=0;
   for k:=1 to 2 do
    c[i,j]:=(c[i,j]+(a[i,k]*b[k,j]) mod base) mod base;
  end;
end;
function pow(a:matrix;p:longint):matrix;
var tg:matrix;
begin
 if p=1 then exit(a);
 tg:=pow(a,p div 2);
 tg:=tg*tg;
 if p mod 2=0 then exit(tg) else exit(tg*a);
end;
procedure xuli;
begin
 fillchar(m,sizeof(m),0);
 m[1,1]:=1;
 m[1,2]:=1;
 m[2,1]:=1;
 m[2,2]:=0;
 if x>=2 then m1:=pow(m,x) else
  begin
   writeln(1); exit;
  end;
 writeln(m1[1,1]);
end;
procedure nhap;
var t,i:longint;
begin
 read(T);
 for i:=1 to t do
  begin
   read(x);
   xuli;
  end;
end;
begin
 //assign(input,'latgach4.inp');reset(input);
 //assign(output,'latgach4.out');rewrite(output);
 nhap;
 //close(input); close(output);
end.