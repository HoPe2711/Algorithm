uses math;
var
     n,res,k:longint;
     a:array[0..1000] of longint;
     vt:array[0..1000,0..1000,1..8] of longint;
     f:array[0..1000,0..1000] of longint;
function batbit(i,x:longint):longint;
begin
 exit(x or (1 shl i));
end;
function getbit(i,x:longint):longint;
begin
 exit(1 and (x shr i));
end;
procedure nhap;
var i,j,t,cnt:longint;
begin
 read(n);
 for i:=1 to n do read(a[i]);
 k:=2**8-1;
 for j:=1 to 8 do
 for i:=1 to n do
   begin
    cnt:=0;
    for t:=i to n do
     if a[t]=j then
      begin
       inc(cnt);
       vt[i,cnt,j]:=t;
      end;
   end;
end;
function check(x:longint):longint;
var i,j,colour,p,tt,kq:longint;
begin
 kq:=-1;
 for i:=1 to n do
  for j:=0 to k do f[i,j]:=-1;
 f[1,0]:=0;
 for i:=1 to n do
  for j:=0 to k do
  if f[i,j]<>-1 then
  for colour:=1 to 8 do
  if (getbit(colour-1,j)=0) then
   begin
    tt:=batbit(colour-1,j);
    if x=0 then  f[i,tt]:=max(f[i,tt],f[i,j])
    else
     begin
      p:=vt[i,x,colour];
      if p<>0 then f[p,tt]:=max(f[p,tt],f[i,j]);
     end;
    p:=vt[i,x+1,colour];
    if p<>0 then f[p,tt]:=max(f[p,tt],f[i,j]+1);
   end;
 for i:=1 to n do kq:=max(kq,f[i,k]);
 exit(kq);
end;
procedure xuli;
var  l,r,mid,tt:longint;
begin
 l:=0; r:=n;
 while l<=r do
  begin
   mid:=(l+r) div 2;
   tt:=check(mid);
   if tt>=0 then
    begin
     res:=max(Res,8*mid+tt);
     l:=mid+1;
    end
   else r:=mid-1;
  end;
 write(res);
end;
begin
 //assign(input,'e743.inp');reset(input);
 //assign(output,'e743.out');rewrite(output);
 nhap;
 xuli;
 //close(input); close(output);
end.
