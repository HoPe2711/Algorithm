uses math;
type node=record
     ans,val:longint;
end;
var x,y,a,b,n,res,t:longint;
    f:Array[0..2000,0..2000] of node;
function check(point:longint):boolean;
var i,j:longint;
begin
 for i:=0 to x do
  for j:=0 to y do
   begin
    f[i,j].ans:=0;
    f[i,j].val:=0;
   end;
 for i:=0 to x do
  for j:=0 to y do
   begin
    if i<x then
    if f[i,j].val+a<point then
     begin
      if f[i+1,j].ans<f[i,j].ans then
       begin
        f[i+1,j].val:=f[i,j].val+a ;
        f[i+1,j].ans:=f[i,j].ans;
       end
      else if f[i+1,j].ans=f[i,j].ans then f[i+1,j].val:=max(f[i,j].val+a,f[i+1,j].val);
     end
    else
    if f[i+1,j].ans<f[i,j].ans+1 then
     begin
      f[i+1,j].val:=0;
      f[i+1,j].ans:=f[i,j].ans+1;
     end;
   if j<y then
   if f[i,j].val+b<point then
    begin
     if f[i,j+1].ans<f[i,j].ans then
      begin
       f[i,j+1].val:=f[i,j].val+b ;
       f[i,j+1].ans:=f[i,j].ans;
      end
     else if f[i,j+1].ans=f[i,j].ans then f[i,j+1].val:=max(f[i,j].val+b,f[i,j+1].val);
    end
    else
    if f[i,j+1].ans<f[i,j].ans+1 then
     begin
      f[i,j+1].val:=0;
      f[i,j+1].ans:=f[i,j].ans+1;
     end;
   end;
 if (f[x,y].ans>=n) then exit(true);
 exit(false);
end;
procedure nhap;
var l,r,mid:longint;
begin
 read(x,a,y,b,n);
 res:=0;
 l:=0;
 r:=x*a+y*b;
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
 writeln(res);
end;
begin
 //assign(input,'computer.inp');reset(input);
 nhap;
 nhap;
// close(input);
end.