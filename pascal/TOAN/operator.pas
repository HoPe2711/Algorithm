uses math;
var
     n,s,t,h:longint;
procedure nhap;
var ans:longint;
begin
 read(n,s);
 ans:=(n*(n+1) div 2-s) ;
 if ans mod 2=1 then
  begin
   writeln(0);
   exit;
  end;
 writeln(1);
end;
begin
 assign(input,'operator.inp');reset(input);
 assign(output,'operator.out');rewrite(output);
 read(t);
 for h:=1 to t do nhap;
 close(input);close(output);
end.
