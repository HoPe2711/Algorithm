uses math;
const oo=maxlongint;
var n,res:longint;
    l,r,sum,a:array[0..200000] of longint;
procedure nhap;
var i,ans:longint;
begin
 read(n);
 l[0]:=oo;
 for i:=1 to n do
  begin
   read(a[i]);
   sum[i]:=sum[i-1]+a[i];
   l[i]:=min(l[i-1],sum[i]);
  end;
 r[n+1]:=oo;
 for i:=n downto 1 do r[i]:=min(r[i+1],sum[i]);
 for i:=1 to n do
  begin
   ans:=sum[n]-sum[i-1];
   if (r[i]-sum[i-1]>0) and (ans+l[i-1]>0) then inc(Res);
  end;
 write(res);
end;
begin
 assign(input,'nkseq.inp');reset(input);
 assign(output,'nkseq.out');rewrite(output);
 nhap;
 close(input); close(output);
end.