uses math;
var m,n,p,q,res:longint;
    pp:array[0..2000000] of longint;
    a,f,b:array[0..2000,0..2000] of longint;
procedure nhap;
var i,j,dem:longint;
begin
 read(m,n,p,q);
 for i:=1 to m do
  for j:=1 to n do
   begin
    read(A[i,j]);
   end;
end;

function check(x:longint):boolean;
var i,j,point,tmp,tmp1:longint;
begin
 for i:=1 to m do
  for j:=1 to n do
   begin
    f[i,j]:=0; b[i,j]:=0;
   end;
 for i:=1 to m do
  for j:=1 to n do
   begin
    if a[i,j]<=x then b[i,j]:=1;
    f[i,j]:=f[i,j-1]+f[i-1,j]-f[i-1,j-1]+b[i,j];
   end;
 point:=(p*q+1) div 2;
 for i:=1 to m do
  for j:=1 to n do
   if (i>=p) and (j>=q) then
    begin
     tmp:=f[i,j]-f[i-p,j]-f[i,j-q]+f[i-p,j-q];
     if (tmp>=point) then exit(true);
    end;
  exit(False);
end;
procedure xuli;
var l,r,mid:longint;
begin
 l:=1;
 r:=10**9;
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
 assign(input,'median.inp');reset(input);
 assign(output,'median.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);;
end.
