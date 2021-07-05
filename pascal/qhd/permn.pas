uses math;
var x,res:int64;
    n,m:longint;
    p:array[0..20] of int64;
    t,dem:array[0..20] of longint;
    f:array[0..99,0..1000000] of int64;
function getbit(i,x:longint):longint;
begin
 exit(1 and (x shr i));
end;
procedure nhap;
var i:longint;
begin
 read(x,m);
 p[0]:=1;
 for i:=1 to 17 do p[i]:=p[i-1]*i;
 while x<>0 do
  begin
   inc(n);
   t[n]:=x mod 10;
   x:=x div 10;
  end;
 for i:=1 to n do inc(dem[t[i]]);
end;
procedure xuli;
var i,j,k,kk,tt:longint;
begin
 f[0,0]:=1;
 for j:=0 to 2**n-1 do
  for i:=1 to n do
  begin
   if (t[i]=0) and (j=0) then continue;
   if getbit(i-1,j)=0 then
    begin
     tt:=j or (1 shl (i-1));
     for k:=0 to m-1 do
      begin
       kk:=(k*10+t[i]) mod m;
       f[kk,tt]:=f[kk,tt]+f[k,j];
      end;
    end;
  end;
 res:=f[0,2**n-1];
 for i:=0 to 9 do res:=res div p[dem[i]];
 write(res);
end;
begin
 assign(input,'permn.inp');reset(input);
 assign(output,'permn.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
