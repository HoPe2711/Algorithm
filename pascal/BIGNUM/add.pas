{$H+}
uses math;
type bignum=array[0..100000] of longint;
var st1,st2:string;
procedure nhap;
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
function cong(a,b:bignum):bignum;
var nho,x,y,sum,i:longint;
    c:bignum;
begin
{ while length(a)<length(b) do a:='0'+a;
 while length(b)<length(a) do b:='0'+b; }
 c:=0;
 nho:=0;
 for i:=1 to max(a[0],b[0]) do
  begin
   x:=a[i]+b[i]+nho;
   nho:=c[i] div 10;
   c[i]:=c[i] mod 10;
  end;
 if nho=1 then c[i+1]:=1;
 exit(c);
end;
BEGIN
  assign(input,'add.inp');reset(input);
  assign(output,'add.out');rewrite(output);
  nhap;
  write(cong(st1,st2));
  close(input);close(output);
END.
