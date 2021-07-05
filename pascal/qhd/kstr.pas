uses math;
const base=123457;
var k,n,res:longint;
    t,tt:array[0..100000] of longint;
    f:array[0..50001,0..1025] of longint;
function batbit(i,x:longint):longint;
 begin
  exit(x or (1 shl i));
 end;
function getbit(i,x:longint):longint;
begin
 exit(1 and (x shr i));
end;
procedure nhap;
var i,j,x:longint;
begin
 read(k,n);
 for i:=1 to n do
  begin
   read(t[i]);
   for j:=1 to t[i] do
    begin
     read(x);
     tt[i]:=batbit(x,tt[i]);
    end;
  end;
end;
procedure xuli;
var i,j,dem,kk:longint;
begin
 f[n+1,0]:=1;
 for i:=n+1 downto 2 do
 for j:=0 to 2**10-1 do
 if f[i,j]<>0 then
  begin
   f[i-1,j]:=(f[i,j]+f[i-1,j]) mod base;
   kk:= tt[i-1] xor (tt[i-1] and j);
   f[i-1,kk]:=(f[i-1,kk]+f[i,j]) mod base;
  end;
 for j:=0 to 2**10-1 do
 begin
  dem:=0;
  for i:=0 to 9 do if getbit(i,j)=1 then inc(dem);
  if dem>=k then res:=(res+f[1,j]) mod base;
 end;
 write(Res);
end;
begin
 assign(input,'kstr.inp');reset(input);
 assign(output,'kstr.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.