uses math;
const oo=high(int64);
var a,sum:array[0..3000] of int64;
    f:array[0..3000,0..3000] of int64;
    d,pos:array[0..3000,0..3000] of longint;
    n:longint;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do
  begin
   read(a[i]);
   sum[i]:=sum[i-1]+a[i];
  end;
 for i:=0 to n do pos[i+1,i]:=i;
end;
function cal(l,r:longint):int64;
var tg:int64; i:longint;
begin
 if d[l,r]=1 then exit(f[l,r]);
 d[l,r]:=1;
 if l>r then exit(0);
 if l=r then
  begin
   f[l,r]:=a[l];
   pos[l,r]:=l;
   exit(F[l,r]);
  end;
 tg:=oo;
 for i:=l to r  do
  if (pos[l,r-1]<=i) and (i<=pos[l+1,r]) then
  if tg>cal(l,i-1)+cal(i+1,r)+a[i]+sum[i-1]-sum[l-1]+sum[r]-sum[i] then
   begin
     tg:=cal(l,i-1)+cal(i+1,r)+a[i]+sum[i-1]-sum[l-1]+sum[r]-sum[i];
     pos[l,r]:=i;
   end;
 f[l,r]:=tg;
 exit(f[l,r]);
end;
procedure xuli;
var i,j,l,k:longint;
begin
 for i:=1 to n do
  for j:=1 to n do f[i,j]:=oo;
 for i:=0 to n do
  begin
   f[i,i]:=a[i];
   pos[i,i]:=i;
   pos[i+1,i]:=i;
   f[i+1,i]:=0;
  end;
 for l:=2 to n do
  for i:=1 to n-l+1 do
    begin
     j:=i+l-1;
     for k:=pos[i,j-1] to pos[i+1,j] do
     if f[i,j]>f[i,k-1]+f[k+1,j]+a[k]+sum[k-1]-sum[i-1]+sum[j]-sum[k] then
      begin
       f[i,j]:=f[i,k-1]+f[k+1,j]+a[k]+sum[k-1]-sum[i-1]+sum[j]-sum[k];
       pos[i,j]:=k;
      end;
    end;
 write(f[1,n]);
end;
Begin
 assign(input,'optbst.inp');reset(input);
 assign(output,'optbst.out');rewrite(output);
 nhap;
// write(cal(1,n));
 xuli;
 close(input); close(output);
end.
