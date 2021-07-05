var res,n:longint;
    a:array[0..1001,0..1001] of longint;
    sum:array[0..1001] of longint;
    ok:boolean;
procedure nhap;
var i,j:longint;
begin
 read(n);
 for i:=1 to n do
  for j:=1 to n do
   begin
    read(a[i,j]);
    sum[i]:=sum[i]+a[i,j];
   end;
end;
procedure xuli;
var i:longint;
begin
  for i:=1 to  n do
   if a[i,i]<sum[i]-a[i,i] then ok:=true;
  for i:=1 to n do
   if (a[i,i]>sum[i]-a[i,i]) then inc(res);
  if (res>0) and (ok=false) then
   begin
    writeln('YES');
    writeln(res);
   end
  else writeln('NO');
end;
begin
 assign(input,'diagonal.inp');reset(input);
 assign(output,'diagonal.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.