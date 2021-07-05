{$H+}
const base=1000000007;
var st,s:Array[0..800] of string;
    pow:array[0..400] of longint;
    hash:array[0..800,0..400] of longint;
    n,m:longint;
    res:int64;
procedure nhap;
var i,j,tt:longint;
begin
 readln(n,m);
 for i:=1 to n do readln(st[i]);
 for j:=1 to m do
 for i:=1 to n do
   s[j]:=s[j]+st[i][j];
 for i:=1 to m do
  begin
   tt:=i+m;
   for j:=n downto 1 do s[tt]:=s[tt]+s[i][j];
  end;
 pow[0]:=1;
  for i:=1 to n do pow[i]:=(int64(2)*pow[i-1]) mod base;
 for j:=1 to 2*m do
  begin
   hash[j,0]:=0;
   for i:=1 to n do hash[j,i]:=(int64(2)*hash[j,i-1]+ord(s[j][i])-ord('0')) mod base;
  end;
end;
function gethash(i,j,x:longint):longint;
begin
 exit((hash[x,j]-hash[x,i-1]*int64(pow[j-i+1]) mod base+base) mod base);
end;
function check(x,y:longint):longint;
var i,j,last:longint;
    res1:int64;
begin
 last:=0; res1:=0;
 for i:=1 to m do
  begin
   if gethash(x,y,i)=gethash(n-y+1,n-x+1,i+m) then res1:=res1+i-last
   else
    if i<m then
    if gethash(x,y,i+1)=gethash(n-y+1,n-x+1,i+m+1) then last:=i;
  end;
 exit(res1);
end;
procedure xuli;
var i,j:longint;
begin
 for i:=1 to n-1 do
  for j:=i+1 to n do res:=res+check(i,j);
 write(res);
end;
BEGIN
  assign(input,'matrix.inp');reset(input);
  assign(output,'matrix.out');rewrite(output);
  nhap;
  xuli;
  close(input);close(output);
END.
