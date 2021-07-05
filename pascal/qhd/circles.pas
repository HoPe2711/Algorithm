uses math;
var n,k,q:longint;
    a,b:array[1..1000] of longint;
    c,f:array[-200..200,-200..200] of longint;
    dd:array[-200..200,-200..200] of boolean;
procedure nhap;
var i:longint;
begin
 read(n);
 q:=100000;
 for i:=1 to n do
  begin
   read(a[i],b[i]);
   k:=max(a[i]+b[i],k);
   q:=min(a[i]-b[i],q);
  end;
 for i:=1 to n do c[a[i]-b[i],a[i]+b[i]]:=1;
end;
function tinh(i,j:longint):longint;
var h,tg:longint;
begin
 if dd[i,j] then exit(f[i,j]);
 dd[i,j]:=true;
 if i=j then
 begin
  f[i,j]:=0;
  exit(f[i,j]);
 end;
 tg:=0;
 for h:=i to j do
  if tg<tinh(i,h)+tinh(h,j)+c[i,j] then tg:=tinh(i,h)+tinh(h,j)+c[i,j];
 f[i,j]:=tg;
 exit(f[i,j]);
end;
BEGIN
  assign(input,'circles.inp');reset(input);
  assign(output,'circles.out');rewrite(output);
  nhap;
  write(n-tinh(q,k));
  close(input);close(output);
END.
