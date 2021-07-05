{$H+}
{$Q-}
uses math;
var n,res:longint;
    st,st1:string;
    pow,hash,hash1:array[0..2000001] of int64;
procedure nhap;
var i:longint;
begin
 readln(n);
 readln(st);
 readln(St1);
 st1:=st1+st1;
 pow[0]:=1;
 for i:=1 to n * 2 do pow[i]:=27*pow[i-1] ;
 hash[0]:=0;
 for i:=1 to n do hash[i]:=27*hash[i-1]+ord(st[i])-ord('a') ;
 hash1[0]:=0;
 for i:=1 to 2*n do hash1[i]:=27*hash1[i-1]+ord(st1[i])-ord('a') ;
end;
function gethash(i,j:longint):int64;
begin
 exit(hash[j]-hash[i-1]*pow[j-i+1]);
end;
function gethash1(i,j:longint):int64;
begin
 exit(hash1[j]-hash1[i-1]*pow[j-i+1]);
end;
function check(x:longint):longint;
var i:longint;
begin
 for i:=1 to n do
  if gethash(1,x)=gethash1(i,i+x-1) then exit(i-1);
 exit(-1);
end;
procedure xuli;
var l,r,mid,tt:longint;
begin
 res := - 1 ;
 l:=1;
 r:=n;
 while l<=r do
  begin
   mid:=(l+r) div 2;
   tt:=check(mid);
   if tt<>-1 then
    begin
     res:=tt;
     l:=mid+1;
    end
   else r:=mid-1;
  end;
 write(res);
end;
begin
 assign(input,'shift.inp');reset(input);
 assign(output,'shift.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.