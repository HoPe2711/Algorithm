uses math;
var n,a,b,w,h:int64;
function check(x:int64):int64;
var res1:int64;
begin
  res1:=(w div (a+int64(2)*x)) * (h div (b+int64(2)*x));
  res1:=max(res1,(h div (a+int64(2)*x)) * (w div (b+int64(2)*x)));
  exit(res1);
end;
procedure nhap;
var l,r,mid,res:int64;
begin
 read(n,a,b,w,h); res:=-1;
 l:=0;
 r:=10**18;
 while l<=r do
  begin
   mid:=(l+r) div 2;
   if check(mid)>=n then
    begin
     res:=mid;
     l:=mid+1;
    end
   else r:=mid-1;
  end;
 if res=-1 then write(0)
 else write(res);
end;
begin
 assign(input,'bbuild.inp');reset(input);
 assign(output,'bbuild.out');rewrite(output);
 nhap;
 close(input); close(output);
end.