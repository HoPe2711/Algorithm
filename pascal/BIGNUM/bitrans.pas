{$H+}
uses math;
type  bignum=string;
var //tt:array[0..1000] of qword;
    f01,f1,f00:array[0..1000] of string;
    n:longint;
function add(a,b:bignum):bignum;
var x,y,i:longint;
    sum,nho:qword;
    c:bignum;
begin
 c:='';
 nho:=0;
 while length(a)<length(b) do a:='0'+a;
 while length(b)<length(a) do b:='0'+b;
 for i:=length(a) downto 1 do
  begin
   x:=ord(a[i])-ord('0');
   y:=ord(b[i])-ord('0');
   sum:=x+y+nho;
   nho:=sum div 10;
   c:=chr(sum mod 10 +48)+c;
  end;
 if nho>0 then c:='1'+c;
 exit(c);
end;
procedure big;
var i:longint;
begin
 f01[0]:='0';
 f1[0]:='1';
 f00[0]:='0';
 f01[1]:='1';
 f1[1]:='1';
 f00[1]:='0';
 for i:=2 to 1000 do
  begin
   f01[i]:=add(f1[i-1],f00[i-1]);
   f1[i]:=add(f1[i-1],f1[i-1]);
   f00[i]:=f01[i-1];
  end;
end;
{procedure xuli;
var i:longint;
begin
 tt[0]:=0; tt[1]:=1; tt[2]:=1;
 for i:=3 to 50 do
  if i mod 2=1 then tt[i]:=tt[i-1]*2-1
  else tt[i]:=tt[i-1]*2+1;
end;   }
begin
 assign(input,'bitrans.inp'); reset(input);
 assign(output,'bitrans.out');rewrite(output);
 big;
 while not seekeof do
  begin
   read(n);
   writeln(f00[n]);
 {  if n<=50 then writeln(tt[n])
   else}
  end;
 close(input); close(output);
end.
