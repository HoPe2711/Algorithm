uses math;
var n,k,res:longint;
    a:array[0..16000] of longint;
procedure nhap;
var i:longint;
begin
 read(n,k);
 for i:=1 to n do read(a[i]);
end;
function check(x:longint):boolean;
var  i,sum,tt:longint;
begin
 for i:=1 to n do
  if a[i]>x then exit(false);
 sum:=0;   tt:=1;
 for i:=1 to n do
  if sum+a[i]>x then
   begin
    sum:=a[i];
    inc(tt);
    if tt>k then exit(false);
   end
  else sum:=sum+a[i];
  exit(true);
end;
procedure xuli;
var l,r,mid:longint;
begin
 l:=0;
 r:=1600**2;
 while l<=r do
  begin
   mid:=(l+r) div 2;
   if check(mid) then
    begin
     res:=mid;
     r:=mid-1;
    end
   else l:=mid+1;
  end;
 write(res);
end;
begin
 assign(input,'transport.inp'); reset(input);
 assign(output,'transport.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
