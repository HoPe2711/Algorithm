uses math;
const base=1000000000;
var n,l,tt:longint;
    res:int64;
    a:Array[0..200,0..20001] of longint;
procedure nhap;
var i,j:longint;
begin
 read(n,l);
 for i:=1 to n do
   for j:=1 to l do read(a[i,j]);
 for i:=1 to n do
  begin
   a[i,l+1]:=base+1;
   a[i,0]:=-base-1;
  end;
end;
function find(x,y:longint):longint;
var kq,le,ri,mid:longint;
begin
 kq:=base+1;
 le:=1;
 ri:=l;
 while le<=ri do
  begin
   mid:=(le+ri) div 2;
   if (a[x,mid]>=a[y,l-mid]) and (a[x,mid]<=a[y,l-mid+1]) then
    begin
     kq:=a[x,mid];
     break;
    end
   else
   if (a[x,mid]>a[y,l-mid+1])  then ri:=mid-1
   else le:=mid+1;
  end;
 exit(kq);
end;
procedure xuli;
var  i,j:longint;
begin
 for i:=1 to n-1 do
  for j:=i+1 to n do
   begin
    tt:=find(i,j);
    if tt=base+1 then tt:=find(j,i);
    if res+tt>0 then res:=(res+tt) mod base
    else res:=(Res+tt+base) mod base;
   end;
 write(res);
end;
begin
 assign(input,'medsum.inp');reset(input);
 assign(output,'medsum.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.

