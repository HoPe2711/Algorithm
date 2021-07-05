uses math;
var n,res:longint;
    sum,p,a:array[0..200000] of longint;
    f:Array[0..200,0..200000] of longint;
procedure nhap;
var  i:longint;
begin
 read(n);
 for i:=1 to n do
  begin
   read(A[i]);
   sum[i]:=sum[i-1]+a[i];
  end;
end;
procedure xuli;
var i,j,last,tg:longint;
begin
 for i:=0 to n do
  for j:=1 to sum[n] do f[i,j]:=-1;
 f[0,0]:=0;
 for i:=1 to n do
  for j:=1 to sum[n] do
   if j<>sum[i] then f[i,j]:=f[i-1,j] else f[i,j]:=i;
 for j:=1 to sum[n] do
  begin
   i:=1;      last:=-1;
   while i<=n do
    begin
     if sum[i]>=j then tg:=f[i,sum[i]-j] else tg:=-1;
     if (tg<>-1) and (tg>=last) then
      begin
       inc(p[j]);
       last:=i;
       i:=i+1;
      end
     else inc(i);
    end;
   res:=max(res,p[j]);
  end;
 writeln(reS);
 for j:=1 to sum[n] do
 if p[j]=res then write(j,' ');
end;
begin
 assign(input,'equalnum.inp');reset(input);
 assign(output,'equalnum.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
