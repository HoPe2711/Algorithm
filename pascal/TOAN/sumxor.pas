uses math;
var dem,res:longint;
    n:int64;
function getbit(i:longint;x:int64):longint;
begin
 exit(1 and (x shr i));
end;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=60 downto 1 do
  if (getbit(i-1,n)=0) and (dem=1) then inc(res)
  else if (dem<1) and (getbit(i-1,n)=1) then inc(dem);
 write(2**res);
end;
begin
 assign(input,'sumxor.inp');reset(input);
 assign(output,'sumxor.out');rewrite(output);
 nhap;
 close(input); close(output);
end.