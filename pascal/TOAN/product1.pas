uses math;
const oo=maxlongint;
var next,sum,dot,pp,a:Array[0..200000] of longint;
    res,n:longint;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do read(A[i]);
 next[0]:=0;
 for i:=1 to n do
  if a[i]=0 then next[i]:=i
  else next[i]:=next[i-1];
 for i:=1 to n do
  if a[i]<0 then sum[i]:=sum[i-1]+1 else sum[i]:=sum[i-1];
 for i:=1 to n do
  if abs(a[i])=2 then dot[i]:=dot[i-1]+1 else dot[i]:=dot[i-1];
 for i:=n downto 1 do
  if a[i]<0 then pp[next[i]]:=i;
end;
procedure xuli;
var i,j,kq1,kq,tt,tt1:longint;
begin
 res:=-oo;
 for i:=1 to n do
  begin
   j:=next[i]+1;
   if j>i then continue;
   if (sum[i]-sum[j-1]) mod 2=0 then
    begin
     tt:=dot[i]-dot[j-1];
     if tt>res then
      begin
       res:=tt;
       kq1:=j; kq:=i;
      end;
    end
   else
    begin
     tt1:=pp[j-1]+1;
     if tt1>i then continue;
     tt:=dot[i]-dot[tt1-1];
     if tt>res then
      begin
       res:=tt;
       kq1:=tt1;
       kq:=i;
      end;
    end;
  end;
 if res=-oo then
  for i:=1 to n do
   if a[i]=0 then
    begin
     kq1:=i; kq:=i; break;
    end;
 write(kq1,' ',kq);
end;
begin
 assign(input,'product.inp');reset(input);
 assign(output,'product.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
