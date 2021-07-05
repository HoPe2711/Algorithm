uses math;
type arr=array[0..20] of longint;
var k,a,tt:arr;
    res,n,dem:longint;
procedure nhap;
var i:longint;
begin
 read(n);        res:=1;
 for i:=1 to n do
  begin
   read(k[i]);
   res:=k[i]*res;
  end;
 writeln(res-1);        dem:=0;
 for i:=1 to n do a[i]:=0;
end;
procedure cal(a:arr);
var i:longint;
begin
 if dem=res-1 then exit;
 inc(dem);
 for i:=n downto 1 do
  if tt[i]<(k[i]-1) then
   begin
    a[i]:=(a[i]+1) mod k[i];
    inc(tt[i]);
    break;
   end
  else tt[i]:=0;
 for i:=1 to n do write(a[i],' ');
 writeln;
 cal(a);
end;
begin
 assign(input,'uss.inp');reset(input);
 ASSign(output,'uss.out');rewrite(output);
 nhap;
 cal(a);
 close(input); close(output);
end.