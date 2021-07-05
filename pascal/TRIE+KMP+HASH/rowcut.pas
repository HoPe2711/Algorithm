{$Q-}
{$H+}
uses math;
var  m,n,res:longint;
     st:array[0..3000] of string;
    // pow:array[0..3000] of int64;
     hash:Array[0..3000,0..3000] of int64;
procedure nhap;
var i,j:longint;
begin
 readln(m,n);
 for i:=1 to m do readln(St[i]);
 for j:=1 to n do
  begin
   hash[j,0]:=0;
   for i:=1 to m do hash[j,i]:=26*hash[j,i-1]+ord(st[i][j])-ord('a') ;
  end;
end;
function check(x:longint):boolean;
var i,j,kk:longint;
begin
 kk:=m-x;
 for i:=1 to n-1 do
  for j:=i+1 to n do
   if hash[i,kk]=hash[j,kk] then exit(false);
 exit(true);
end;
procedure xuli;
var l,r,mid:longint;
begin
 res:=m+1;
 l:=0;
 r:= m;
 while  l<=r do
  begin
   mid:=(l+r) div 2;
   if check(mid) then
    begin
     res:=mid;
     l:=mid+1;
    end
   else r:=mid-1;
  end;
 if res=m+1 then res:=-1;
 write(res);
end;
begin
 assign(input,'rowcut.inp');reset(input);
 assign(output,'rowcut.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.