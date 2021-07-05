{$H+}
type bignum=array[0..100000] of longint;
var st1,st2:string;
    a,b,res:bignum;
procedure nhap;
var i,x,y:longint;
begin
 readln(st1);
 readln(st2);
 a[0]:=length(st1);
 b[0]:=length(st2);
 for i:=1 to a[0] do
  begin
   val(st1[i],x,y);
   a[i]:=x;
  end;
 for i:=1 to b[0] do
  begin
   val(st2[i],x,y);
   b[i]:=x;
  end;
end;
function nhan(a,b:bignum):bignum;
var c:bignum;
    i,m,n,j,x,nho:longint;
begin
 fillchar(c,sizeof(c),0);
 m:=a[0];
 n:=b[0];
 for i:=m downto 1 do
  for j:=n downto 1 do c[i+j-1]:=c[i+j-1]+a[i]*b[j];
 nho:=0;
 for i:=m+n-1 downto 1 do
  begin
   x:=c[i]+nho;
   nho:=x div 10;
   x:=x mod 10;
   c[i]:=x;
  end;
 c[0]:=nho;
 exit(c);
end;
procedure xuli;
var i,l:longint;
begin
 res:=nhan(a,b);
 if res[0]<>0 then write(res[0]);
 for i:=1 to a[0]+b[0]-1 do write(res[i]);
end;
begin
  assign(input,'nhan.inp');reset(input);
  assign(output,'nhan.out');rewrite(output);
  nhap;
  xuli;
  close(input);close(output);
end.
