uses math;
var n:longint;
    res:int64;
    a,b:array[0..500000] of int64;
function check(x:int64):boolean;
var i,j:longint; t:int64;
begin
 t:=0;
 for i:=1 to n-1 do
  begin
   t:=t+b[i]-x;
   if (t>a[i+1]-a[i]) or (t<0) then
    t:=t+a[i]-a[i+1]
   else if t>0 then t:=0;
  end;
 if b[n]+t>=x then exit(true);
 exit(false);
end;
procedure nhap;
var  i:longint; l,r,mid:int64;
begin
 read(N);
 for i:=1 to n do read(a[i],b[i]);
 l:=0;
 r:=10**9;
 while l<=r do
  begin
   mid:=(l+r) div 2;
   if check(mid) then
    begin
     reS:=mid;
     l:=mid+1;
    end
   else r:=mid-1;
  end;
 write(REs);
end;
begin
 assign(input,'ants.inp');reseT(input);
 assign(output,'ants.out');rewrite(output);
 nhap;
 close(input); close(output);
end.