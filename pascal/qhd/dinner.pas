{$H+}
uses math;
const oo=1000000000;
var f:Array[0..101,0..101,0..10] of longint;
    a:Array[0..101] of longint;
    st:String;
    n,k,latdot:longint;
function cal(l,r,x:longint):longint;
var  i,res:longint;
begin
 if f[l,r,x]>-1 then exit(f[l,r,x]);
 res:=oo;
 if l>r then
 begin
 f[l,r,x]:=0;
 exit(0);
 end;
 if (l=r) and (x=1) then
  begin
   f[l,r,x]:=1;
   exit(1);
  end;
 if x=1 then res:=1+cal(l+1,r,k);
 for i:=l+1 to r do
  if a[l]=a[i] then res:=min(res,cal(l+1,i-1,k)+cal(i,r,max(1,x-1)));
 f[l,r,x]:=res;
 exit(res);
end;
procedure nhap;
var i,j,h:longint;
begin
 readln(n,k);
 readln(st);
 for i:=1 to length(st) do
 begin
  if st[i]='H' then a[i]:=1 else a[i]:=0;
 end;
 for i:=1 to n do
 for j:=1 to n do
  for h:=1 to k do f[i,j,h]:=-1;
 latdot:=cal(1,n,k);
 if latdot=oo then latdot:=-1;
 write(latdot);
end;
begin
 assign(input,'dinner.inp');reset(input);
 assign(output,'dinner.out');rewrite(output);
 nhap;
 close(input); close(output);
end.