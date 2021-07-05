uses math;
const base=1000000007;
var r,c,n,p,p1,p2,p3,ok,dem:longint;
    res,tmp1:int64;
    gt:array[0..5000] of int64;
    cc,f:array[0..4000,0..4000] of int64;
procedure nhap;
var i,j,tmp,x,y:longint;
begin
 read(r,c);
 read(n);
 p:=r; p1:=1; p2:=c; p3:=1;
 for i:=1 to n do
  begin
   read(x,y);
   if (x<=0) or (x>r) or (y<=0) or (y>c) then continue;
   inc(dem);
   p:=min(p,x);
   p1:=max(p1,x);
   p2:=min(p2,y);
   p3:=max(p3,y);
  end;
 n:=dem;
 if r*c-n=0 then ok:=1;
 tmp:=(p1-p+1)*(p3-p2+1)-n;
 res:=1;
 for i:=1 to tmp do res:=(res*i) mod base;
 gt[0]:=1;
 for i:=1 to max(r,c) do gt[i]:=(gt[i-1]*i) mod base;
 cc[0,0]:=1;
 for i:=1 to 4000 do
   begin
    cc[i,0]:=1;
    cc[i,i]:=1;
    for j:=1 to i-1 do cc[i,j]:=(cc[i-1,j]+cc[i-1,j-1]) mod base;
   end;
end;
procedure xuli  ;
var i,j:longint; tmp:int64;
begin
 f[r,c]:=1;
 for i:=r downto 1 do
  for j:=c downto 1 do
   begin
    if i<>r then f[i,j]:=f[i+1,j]*gt[j] mod base;
    if j<>c then f[i,j]:=(f[i,j+1]*gt[i] mod base +f[i,j]) mod base;
   end;
 tmp:=cC[r-p1+p-1,p-1]*Cc[c-p3+p2-1,p2-1] mod base;
 tmp:=tmp*f[p1-p+1,p3-p2+1] mod base;
 res:=(res*tmp) mod base;
 if ok=1 then res:=0;
 write(Res);
end;
begin
 assign(input,'lands.inp');reset(input);
 assign(output,'lands.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.