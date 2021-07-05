uses math;
var n,vt:longint;
    t:int64;
    s:array[0..15] of int64;
    f:array [0..100] of longint;
procedure nhap;
var i:longint;
    k:int64;
begin
 read(n,t);
 for i:=0 to 100 do f[i]:=-1;
 k:=9;
 for i:=1 to 15 do
  begin
   s[i]:=s[i-1]+k*i;
   k:=k*10;
  end;
end;
function cal1(x:int64):longint;
var n1:longint;
begin
 n1:=0;
 while x>0 do
  begin
   x:=x div 10;
   inc(n1);
  end;
 exit(n1);
end;
function cal(x:int64):int64;
begin
 exit(s[cal1(x)-1]+(x-10**(cal1(x)-1)+1)*cal1(x));
end;
function lay(x,i:int64):longint;
var k:longint;
begin
 k:=cal1(x);
 while k>i do
  begin
   x:=x div 10;
   dec(k);
  end;
 exit(x mod 10);
end;
procedure xuli2(x,kq:int64);
var i,j:longint;
begin
 j:=n;
 kq:=kq-t;
 for i:=cal1(x)-kq downto 1 do
  begin
   f[j]:=lay(x,i);
   dec(j);
   if j=0 then break;
  end;
 dec(x);
 while (j>0) and (x>0) do
 begin
  for i:=cal1(x) downto 1 do
   begin
    f[j]:=lay(x,i);
    dec(j);
    if j=0 then break;
   end;
  dec(x);
 end;
 for i:=1 to n do
  if f[i]>-1 then write(f[i])
  else write(' ');
end;
procedure xuli;
var l,r,mid,a:int64;
    j,i:longint;
begin
 l:=1;
 r:=10**15;
 while l<=r do
  begin
   mid:=(l+r) div 2;
   a:=cal(mid);
   if a=t then
    begin
     xuli2(mid,a);
     exit;
    end;
   if a<t then l:=mid+1
   else if a-cal1(mid)+1>t then r:=mid-1
    else
    begin
     xuli2(mid,a);
     exit;
    end;
   end;
end;
begin
 nhap;
 xuli;
end.
