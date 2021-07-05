uses math;
var n,m,res:longint;
    a:array[0..1000000] of longint;
function check(x:longint):boolean;
var  hailong,i:longint;
begin
 hailong:=0;
 for i:=1 to n do
  if a[i]>x then hailong:=hailong+a[i]-x;
  exit(hailong>=m);
end;
procedure nhap;
var i,l,r,mid:longint;
begin
 read(n,m);
 for i:=1 to n do read(a[i]);
 l:=1;
 r:=10**9;
 while l<=r do
  begin
   mid:=(l+r) div 2;
   if check(mid) then
    begin
     res:=mid;
     l:=mid+1;
    end
   else r:=mid-1;
  end;
 write(Res);
end;
begin
 assign(input,'blade.inp');reset(input);
 assign(output,'blade.out');rewrite(output);
 nhap;
// xuli;
 close(input); close(output);
end.