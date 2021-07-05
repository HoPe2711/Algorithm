var a:array[0..4000] of longint;
    f:array[0..4001,0..4,0..1024] of int64;
    dd:array[0..4001,0..4,0..1024] of boolean;
    n,l,r:longint;
procedure nhap;
var i:longint;
begin
 read(n,l,r);
 for i:=1 to n do read(a[i]);
end;
function cal(i,k,gt:longint):int64;
begin
 if i=n+1 then exit(0);
 if k=4 then
  begin
   if (gt>=l) and (gt<=r) then  exit(1)
   else exit(0);
  end;
 if dd[i,k,gt] then exit(f[i,k,gt]);
 dd[i,k,gt]:=true;
 f[i,k,gt]:=cal(i+1,k,gt);
 if k=0 then f[i,k,gt]:=f[i,k,gt]+cal(i+1,k+1,a[i+1]);
 if k=1 then f[i,k,gt]:=f[i,k,gt]+cal(i+1,k+1,gt and a[i+1]);
 if k=2 then f[i,k,gt]:=f[i,k,gt]+cal(i+1,k+1,gt or a[i+1]);
 if k=3 then f[i,k,gt]:=f[i,k,gt]+cal(i+1,k+1,gt xor a[i+1]);
 exit(f[i,k,gt]);
end;
BEGIN
  assign(input,'bit.inp');reset(input);
  assign(output,'bit.out');rewrite(output);
  nhap;
  write(cal(0,0,0));
  close(input);close(output);
END.
