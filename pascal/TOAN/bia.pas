uses math;
const rad=180/pi;
var a,b,s,m,n:int64;
procedure nhap;
begin
 read(a,b,s,m,n);
 if a=0 then halt;
 writeln(arctan((n*b)/(m*a))*rad:0:2,' ',sqrt(sqr(n*b)+sqr(m*a))/s:0:2);
end;
begin
 assign(input,'bia.inp');reset(input);
 assign(output,'bia.out');rewrite(output);
 while not seekeof do
  begin
   nhap;
  end;
 close(input); close(outpuT);
end.