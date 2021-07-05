uses math;
var a,b,f,x,k:array[1..400] of longint;
    c,n,kq:longint;
    free:array[1..4] of boolean;
procedure nhap;
var i:longint;
begin
 read(c,n);
 kq:=10000;
 for i:=1 to c*n do read(a[i],b[i]);
end;
procedure inkq;
var i,j,res:longint;
begin
 res:=0;
 for i:=1 to c*n do k[i]:=x[a[i]]*1000+b[i];
 f[1]:=1;
 for i:=2 to n*c do
  begin
   f[i]:=1;
   for j:=1 to i-1 do
    if (f[i]<f[j]+1) and (k[j]<k[i]) then f[i]:=f[j]+1;
  end;
 for i:=1 to n*c do
  if res<f[i] then res:=f[i];
 kq:=min(kq,c*n-res);
end;
procedure duyet(i:longint);
var j:longint;
begin
 if i=c+1 then inkq
 else
  for j:=1 to c do
  if free[j] then
   begin
    x[i]:=j;
    free[j]:=false;
    duyet(i+1);
    free[j]:=true;
   end;
end;
BEGIN
  assign(input,'card.in');reset(input);
  assign(output,'card.out');rewrite(output);
  fillchar(free,sizeof(free),true);
  nhap;
  duyet(1);
  write(kq);
  close(input);close(output);
END.
