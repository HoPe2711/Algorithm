uses math;
var a,d,tt:array[0..1000000] of longint;
    n,p,dem:longint;
procedure nhap;
var i,k,j,a1:longint;
begin
 read(n,p);
 for i:=1 to n do
  begin
   read(a[i]);
   inc(tt[a[i]]);
  end;
 d[1]:=n;
 for i:=2 to 1000000 do
   begin
    j:=i;
    while j<=1000000 do
     begin
      d[i]:=d[i]+tt[j];
      j:=j+i;
     end;
   end;
 for k:=1000000 downto 1  do
  if d[k]>=p then
   begin
    writeln(k);
    break;
   end;
end;
begin
 assign(input,'kgcd.inp');reset(input);
 assign(output,'kgcd.out');rewrite(output);
 nhap;
 close(input); close(output);
end.