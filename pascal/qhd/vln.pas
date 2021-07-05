uses math;
var n,h,t:longint;
    res,g,g1:int64;
    a:array[1..100] of longint;
    sum:array[0..100] of int64;
procedure nhap;
var i:longint;
begin
 read(n,h);
 for i:=1 to n do
  begin
   read(a[i]);
   sum[i]:=sum[i-1]+a[i];
  end;
end;
procedure xuli;
var i,j:longint;
    kq:int64;
begin
 res:=0;
 for i:=1 to n do
 begin
  if i+h div 3>n then g:=n else g:=i+h div 3;
  if i-h div 3-1<1 then g1:=0 else g1:=i-h div 3-1;
  kq:=sum[g]-sum[g1];
  res:=max(res,kq);
 end;
 write(res);
end;
begin
 assign(input,'vln.inp'); reset(input);
 assign(output,'vln.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
