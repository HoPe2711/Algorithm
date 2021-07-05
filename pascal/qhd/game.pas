uses math;
var  n:longint;
     a:array[0..700] of longint;
     f:array[0..700,0..700] of longint;
     dd:array[0..700,0..700] of boolean;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do read(a[i]);
end;
function cal(i,j:longint):longint;
var k,tg:longint;
begin
 if dd[i,j]=true then exit(f[i,j]);
 dd[i,j]:=true;
 if i>j then
  begin
   f[i,j]:=0;
   exit(0);
  end;
 tg:=0;
 for k:=i to j do tg:=max(tg,cal(i,k-1)+cal(k+1,j)+a[k]*(a[j+1]+a[i-1]));
 f[i,j]:=tg;
 exit(f[i,j]);
end;
begin
 assign(input,'game.inp');reset(input);
 assign(output,'game.out');rewrite(output);
 nhap;
 write(cal(2,n-1));
 close(input); close(output);
end.