uses math;
var n:longint;
    a:array[0..2000] of longint;
    f:array[0..2000,0..2000] of int64;
    dd:Array[0..2000,0..2000] of boolean;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do read(A[i]);
end;
function cal(l,r:longint):int64;
var tg:int64;
begin
 if dd[l,r] then exit(F[l,r]);
 dd[l,r]:=true;
 if l>r then
  begin
   f[l,r]:=0;
   exit(0);
  end;
 tg:=cal(l,r-1)+a[r];
 if l<r then tg:=max(tg,cal(l,r-2)+int64(a[r])*a[r-1]);
 tg:=max(tg,cal(l+1,r)+a[l]);
 if l<r then tg:=max(tg,cal(l+2,r)+int64(a[l])*a[l+1]);
 f[l,r]:=tg;
 exit(f[l,r]);
end;
begin
 assign(input,'maxsum.inp');reseT(input);
 assign(output,'maxsum.out');rewrite(output);
 nhap;
 write(cal(1,n));
 close(input); close(output);
end.