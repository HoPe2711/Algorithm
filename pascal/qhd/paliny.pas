{$H+}
uses math;
const base=1000000007;
var st:string;
    n,res:longint;
    pow,hash,hash1:array[0..100000] of longint;
procedure nhap;
var i:longint;
begin
 readln(n);
 readln(st);
 pow[0]:=1;
 for i:=1 to n do pow[i]:=(int64(pow[i-1])*27) mod base;
 for i:=1 to n do hash[i]:=((int64(hash[i-1])*27) mod base+ord(St[i])-ord('a')) mod base;
 //for i:=1 to n do st1:=st1+st[n-i+1];
 for i:=n downto 1 do hash1[i]:=((int64(hash1[i+1])*27) mod base+ord(St[i])-ord('a')) mod base;
end;
function gethash(i,j:longint):longint;
begin
 exit((hash[j]-int64(hash[i-1])*pow[j-i+1] mod base +base) mod base);
end;
function gethash1(i,j:longint):longint;
begin
 exit((hash1[i]-int64(hash1[j+1])*pow[j-i+1] mod base+base) mod base);
end;
function kt(leng:longint):boolean;
var  i:longint;
begin
 for i:=1 to n-leng+1 do
    if gethash(i,i+leng-1)=gethash1(i,i+leng-1) then exit(true);
 exit(false);
end;
function check1:longint;
var  l,r,kq,mid:longint;
begin
 kq:=0;
 l:=1;
 r:=n div 2;
 while l<=r do
  begin
   mid:=(l+r) div 2;
   if kt(2*mid) then
    begin
     kq:=2*mid;
     l:=mid+1;
    end
   else r:=mid-1;
  end;
 exit(kq);
end;
function check2:longint;
var  l,r,kq,mid:longint;
begin
 kq:=0;
 l:=1;
 r:=n-n div 2;
 while l<=r do
  begin
   mid:=(l+r) div 2;
   if kt(2*mid-1) then
    begin
     kq:=2*mid-1;
     l:=mid+1;
    end
   else r:=mid-1;
  end;
 exit(kq);
end;
procedure xuli;
begin
 res:=max(check1,check2);
 write(res);
end;
begin
 assign(input,'paliny.inp');reset(input);
 assign(output,'paliny.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
