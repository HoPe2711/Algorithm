uses math;
var n,m,res,res1,f,r,t,h:longint;
    sum,a,queu:array[0..500000] of longint;
procedure nhap;
var i:longint;
begin
 read(n,m);  res:=0; res1:=100001;
 for i:=1 to n do
  begin
   read(a[i]);
   sum[i]:=sum[i-1]+a[i];
  end;
end;
procedure push(i:longint);
begin
 while (f<=r) and (a[i]<=a[queu[r]]) do dec(r);
 inc(r);
 queu[r]:=i;
end;
procedure xuli;
var i,l:longint;
begin
 l:=1; f:=1; r:=0;
 for i:=1 to n do
  begin
   push(i);
   while sum[i]-sum[l-1]-a[queu[f]]*(i-l+1)>m do
    begin
     inc(l);
     while queu[f]<l do inc(f);
    end;
   if res<i-l+1 then
    begin
     res:=i-l+1;
     res1:=sum[i]-sum[l-1]-a[queu[f]]*(i-l+1);
    end
   else if res=i-l+1 then res1:=min(res1,sum[i]-sum[l-1]-a[queu[f]]*(i-l+1));
  end;
 writeln(res,' ',res1);
end;
begin
 assign(input,'nails.inp'); reset(input);
 assign(output,'nails.out');rewrite(output);
 read(t);
 for h:=1 to t do
  begin
   nhap;
   xuli;
  end;
 close(input); close(output);
end.
