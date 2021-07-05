var n:longint;
    f:array[1..101,1..101] of longint;
    a,sum:array[0..101] of longint;
    dd:array[1..100,1..100] of boolean;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do read(a[i]);
 sum[0]:=0;
 for i:=1 to n do sum[i]:=sum[i-1]+a[i];
end;
function tinh2(i,j:longint):longint;
var h,tg1:longint;
begin
 tg1:=sum[j]-sum[i-1];
 exit(tg1 mod 100);
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
 tg:=10000000;
 for h:=i to j-1 do
  if tg>tinh(i,h)+tinh(h+1,j)+tinh2(i,h)*tinh2(h+1,j) then tg:=tinh(i,h)+tinh(h+1,j)+tinh2(i,h)*tinh2(h+1,j);
 f[i,j]:=tg;
 exit(f[i,j]);
end;
BEGIN
  assign(input,'mix.inp');reset(input);
  assign(output,'mix.out');rewrite(output);
  nhap;
  write(tinh(1,n));
  close(input);close(output);
END.
