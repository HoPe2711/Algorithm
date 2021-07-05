{$H+}
uses math;
const base=1000000007;
var  st:string;
     n:longint;
     pow,hash:array[0..5001] of longint;
     f,s,h:array[0..5001,0..5001] of longint;
procedure nhap;
var i:longint;
begin
 readln(n);
 readln(st);
 pow[0]:=1;
 for i:=1 to n do pow[i]:=(int64(pow[i-1])*11) mod base;
 for i:=1 to n do hash[i]:=(int64(11)*hash[i-1]+ord(st[i])-48) mod base;
end;
function gethash(i,j:longint):longint;
begin
 exit((hash[j]-int64(hash[i-1])*pow[j-i+1] mod base +base) mod base);
end;
function check(i,j,l,r:longint):boolean;
var l1,r1,mid,kq:longint;
begin
 l1:=l; r1:=r;     kq:=l-1;
 while l<=r do
  begin
   mid:=(l+r) div 2;
   if h[l1,mid]=h[i,i+mid-l1] then
    begin
     kq:=mid;
     l:=mid+1;
    end
   else r:=mid-1;
  end;
 if kq=r1 then exit(false);
 if ord(st[kq+1])<ord(st[i+kq-l1+1]) then exit(false);
 exit(true);
end;
procedure xuli;
var i,j,k:longint;
begin
 f[1,1]:=1;      s[1,1]:=1;
 for i:=1 to n do
  for j:=1 to i do h[j,i]:=gethash(j,i);
 for i:=2 to n do
  for j:=1 to i do
  begin
  if st[j]<>'0' then
   begin
    k:=2*j-i-1;
    if j=1 then f[j,i]:=1
    else
     begin
      if k>0 then f[j,i]:=(f[j,i]+(s[j-1,j-1]-s[k,j-1]+base) mod base) mod base
      else f[j,i]:=(f[j,i]+(s[j-1,j-1]-s[0,j-1]+base) mod base) mod base;
      if (k<=j-1) and (k>0) then
      if check(k,j-1,j,i) then f[j,i]:=(f[j,i]+f[k,j-1]) mod base;
     end;
   end;
  s[j,i]:=(s[j-1,i]+f[j,i]) mod base;
  end;
 writeln(s[n,n]);
end;
begin
 //assign(input,'D611.inp');reset(input);
 nhap;
 xuli;
 //close(input);
end.
