const oo=1000000;
var du:array[0..10000000] of int64;
    n,m,l,res,a,b,tt,gt,x,dem:int64;
    h,t:longint;
procedure nhap;
begin
 read(n,m,l);
end;
function check(x,a,b:int64):boolean;
var tdx,tdy:int64;
begin
 if x<0 then exit(false);
 if x>n*m-1 then exit(false);
 tdx:=x div m;
 tdy:=x mod m;
 if tdx+a-1>n-1 then exit(false);
 if tdy+b-1>m-1 then exit(false);
 exit(true);
end;
procedure xuli;
var i,j:longint;
begin
 dem:=0;
 res:=oo;
 for i:=1 to trunc(sqrt(2*l)) do
  if 2*l mod i=0 then
   begin
    inc(dem);
    du[dem]:=i;
   end;
 for i:=trunc(sqrt(2*l)) downto 1 do
  if (2*l mod i=0) and (sqrt(2*l)<>i)  then
   begin
    inc(dem);
    du[dem]:=2*l div i;
   end;
 for i:=1 to dem do
  for j:=i downto 1 do
  if du[i] mod du[j]=0 then
   begin
    a:=du[j];
    b:=du[i] div du[j];
    tt:=2*l div du[i];
    gt:=tt-(a-1)*m+1-b;
    if gt mod 2=0 then
     begin
      x:=gt div 2;
      if check(x,a,b) then
       begin
        res:=a*b;
        exit;
       end;
     end;
   end;
end;
begin
 assign(input,'hcn.inp');reset(input);
 assign(output,'hcn.out');rewrite(output);
 read(t);
 for h:=1 to t do
  begin
   nhap;
   if l<>0 then xuli
   else res:=1;
   if res=oo then writeln(-1) else writeln(res);
  end;
 close(input);close(output);
end.
