uses math;
var n:longint;
    f:array[1..201,1..201] of longint;
    a:array[1..200] of longint;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do read(a[i]);
end;
function tinh(i,j:longint):longint;
var k,tg:longint;
begin
 if f[i,j]<>0 then exit(f[i,j]);
 if i>j then
  begin
   f[i,j]:=0;
   exit(f[i,j]);
  end;
 if i=j then
  begin
   f[i,j]:=1;
   exit(f[i,j]);
  end;
 f[i,j]:=tinh(i,j-1)+1;
 tg:=f[i,j];
 for k:=i to j-1 do
  if a[k]=a[j] then tg:=min(tinh(i,k)+tinh(k+1,j-1),tg);
 f[i,j]:=tg;
 exit(f[i,j]);
end;
BEGIN
  assign(input,'email.inp');reset(input);
  assign(output,'email.out');rewrite(output);
  nhap;
  write(tinh(1,n));
  close(input);close(output);
END.

