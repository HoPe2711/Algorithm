uses math;
var n,k,res,f,f1,r,r1:longint;
    a,queu,queu1,first,tt:array[0..500000] of longint;
procedure nhap;
var i:longint;
begin
 read(n,k);
 for i:=1 to n do read(a[i]);
end;
procedure xuli;
var i,last,tmp:longint;
begin
 f:=1; r:=0; f1:=1; r1:=0;   last:=1;
 for i:=1 to n do
  begin
   while (f<=r) and (a[i]<=a[queu[r]]) do dec(r);
   inc(r); queu[r]:=i;
   while (f1<=r1) and (a[i]>=a[queu1[r1]]) do dec(r1);
   inc(r1); queu1[r1]:=i;
   while (last<i) and (a[queu1[f1]]-a[queu[f]]>k) do
    begin
     inc(last);
     while (f<=r) and (queu[f]<last) do inc(f);
     while (f1<=r1) and (queu1[f1]<last) do inc(f1);
    end;
   first[i]:=last;
  end;
 for i:=1 to n do tt[i]:=max(tt[i-1],i-first[i]+1);
 for i:=1 to n do
  begin
   tmp:=i-first[i]+1;
   res:=max(Res,tmp+tt[first[i]-1]);
  end;
 write(Res);
end;
begin
 assign(input,'kdiff.inp');reset(input);
 assign(output,'kdiff.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.