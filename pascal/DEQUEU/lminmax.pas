uses math;
var n,delta,f,r,f1,r1,res:longint;
    a,queu,queu1:array[0..2000000] of longint;
procedure nhap;
var i:longint;
begin
 read(n,delta);
 for i:=1 to n do read(a[i]);
end;
procedure xuli;
var i,last:longint;
begin
 f:=1; r:=0;
 f1:=1; r1:=0;
 last:=1;
 for i:=1 to n do
  begin
   while (f<=r) and (a[i]<=a[queu[r]]) do dec(r);
   inc(r); queu[r]:=i;
   while (f1<=r1) and (A[i]>=a[queu1[r1]]) do dec(r1);
   inc(r1); queu1[r1]:=i;
   while (last<=i) and (a[queu1[f1]]-a[queu[f]]>delta) do
    begin
     inc(last);
     while (F<=r) and (queu[f]<last) do inc(f);
     while (f1<=r1) and (queu1[f1]<last) do inc(f1);
    end;
   res:=max(res,i-last+1);
  end;
 write(res);
end;
begin
 assign(input,'lminmax.inp');reset(input);
 assign(output,'lminmax.out');rewrite(outpuT);
 nhap;
 xuli;
 close(input); close(output);
end.