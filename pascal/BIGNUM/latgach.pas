{$H+}
var f:array[0..100] of string;
    n,t,h:longint;
function add(x,y:string):string;
var c,pp:string;
    nho,sum,i:longint;
begin
 c:='';
 while length(x)<length(y) do x:='0'+x;
 while length(y)<length(x) do y:='0'+y;
 nho:=0;
 for i:=length(x) downto 1 do
  begin
   sum:=ord(x[i])-48+ord(y[i])-48+nho;
   nho:=sum div 10;
   sum:=sum mod 10;
   str(sum,pp);
   c:=pp+c;
  end;
 if nho>0 then c:='1'+c;
 exit(c);
end;
procedure xuli;
var i:longint;
begin
 f[1]:='1';
 f[2]:='2';
 for i:=3 to 100 do f[i]:=add(f[i-1],f[i-2]);
end;
begin
 //assign(input,'latgach.inp');reset(input);
 xuli;
 read(t);
 for h:=1 to t do
  begin
   read(n);
   writeln(f[n]);
  end;
// close(input);
end.