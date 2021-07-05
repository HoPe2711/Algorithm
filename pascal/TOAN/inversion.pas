uses math;
const base=1000000007;
var  n,t,h:longint;
     m,res:int64;
     a,p,f:array[0..2000000] of int64;
procedure swap(var x,y:int64);
var tg:int64;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure build;
var i:longint;
begin
 p[1]:=1;
 for i:=2 to 1000000 do p[i]:=(p[i-1]*2) mod base;
end;
procedure nhap;
var i,j,kq,tg,dem:longint;
begin
 read(n,m);
 for i:=1 to n do f[i]:=int64((n-i))*(n-i+1) div 2;
 if f[1]<m then
  begin
   writeln(-1);
   exit;
  end;
 for i:=n downto 1 do
  if f[i]>=m then
   begin
    kq:=i; break;
   end;
 res:=0;
 for i:=1 to kq-1 do a[i]:=i;
 tg:=n-(f[kq]-m);
 a[kq]:=tg;
 dem:=n;
 while dem>tg do
  begin
   inc(kq);
   a[kq]:=dem; dec(dem);
  end;
 dec(dem);
 while kq<=n do
  begin
   inc(kq);
   a[kq]:=dem; dec(dem);
  end;
 for i:=1 to n do res:=(res+(a[i]*p[i]) mod base) mod base ;
 writeln(Res);
end;
begin
 assign(input,'inversion.inp');reset(input);
 assign(output,'inversion.out');rewrite(output);
 read(t);
 build;
 for h:=1 to t do nhap;
 close(input); close(output);
end.